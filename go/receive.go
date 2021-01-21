package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"log"
	"math/rand"
	"time"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"

	"github.com/streadway/amqp"
)

type m_goods struct {
	Goods_id   int    `json:"goods_id"`
	Goods_name string `json:"goods_name"`
	Socket     int    `json:"socket"`
	Price      int    `json:"price"`
}
type m_order struct {
	Order_id    string `json:"order_id"`
	Username    string `json:"username"`
	Goods_id    int    `json:"goods_id"`
	Price       int    `json:"price"`
	Create_time string `json:"create_time"`
}
type orderData struct {
	Good_id  int    `json:"good_id"`
	Username string `json:"Username"`
}

func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
	}
}
func GetTimeTick64() int64 {
	return time.Now().UnixNano() / 1e6
}

func GetTimeTick32() int32 {
	return int32(time.Now().Unix())
}

func GetFormatTime(time time.Time) string {
	return time.Format("20060102")
}

// 基础做法 日期20191025时间戳1571987125435+3位随机数
func GenerateCode() string {
	date := GetFormatTime(time.Now())
	r := rand.Intn(1000)
	code := fmt.Sprintf("%s%d%03d", date, GetTimeTick64(), r)
	fmt.Println(code, " rand ID generate successed!\n")
	return code
}

func main() {
	//conn, err := amqp.Dial("amqp://admin:admin@localhost:15672/")
	conn, err := amqp.Dial("amqp://guest:guest@localhost:5672/")
	failOnError(err, "Failed to connect to RabbitMQ")
	defer conn.Close()

	ch, err := conn.Channel()
	failOnError(err, "Failed to open a channel")
	defer ch.Close()

	q, err := ch.QueueDeclare(
		"dormqueue", // name
		false,       // durable
		false,       // delete when unused
		false,       // exclusive
		false,       // no-wait
		nil,         // arguments
	)
	failOnError(err, "Failed to declare a queue")

	msgs, err := ch.Consume(
		q.Name, // queue
		"",     // consumer
		true,   // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)
	failOnError(err, "Failed to register a consumer")

	forever := make(chan bool)

	go func() {
		for d := range msgs {
			log.Printf("Received a message: %s", d.Body)

			var datas orderData
			err := json.Unmarshal([]byte(d.Body), &datas)
			if err != nil {
				fmt.Println(err)
			}
			fmt.Println("商品id为")
			fmt.Println(datas.Good_id)
			regood_id := datas.Good_id
			reusername := datas.Username
			dsn := "sql121_4_121_16:wi8AExQXiQ@tcp(121.4.121.161:3306)/test?charset=utf8mb4&parseTime=True"

			//连接数据库

			db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
			if err != nil {
				fmt.Println(err)
			}
			fmt.Println("------------连接数据库成功-----------")
			isok := 0
			m_goods := m_goods{}
			m_order := m_order{}

			errBuilding := db.Table("m_goods").Where("goods_id = ?", regood_id).First(&m_goods).Error
			if errors.Is(errBuilding, gorm.ErrRecordNotFound) {
				isok = 0
				fmt.Println("商品号不存在")
				db.Table("customer_log").Where("username = ?", reusername).Where("goods_id = ?", regood_id).Update("result", 1)
				db.Table("customer_log").Where("username = ?", reusername).Where("goods_id = ?", regood_id).Update("errormessage", "商品号不存在")
			} else {
				fmt.Println("该商品剩余数量为")
				fmt.Println(m_goods.Socket)

			}
			if m_goods.Socket > 0 {
				isok = 1
			} else {
				isok = 0
				fmt.Println("商品已被抢完")
				db.Table("customer_log").Where("username = ?", reusername).Where("goods_id = ?", regood_id).Update("result", 1)
				db.Table("customer_log").Where("username = ?", reusername).Where("goods_id = ?", regood_id).Update("errormessage", "商品已被抢完")
			}
			// 开始事务
			tx := db.Begin()

			if isok == 1 {

				//改3个表 m_goods表里regood_id商品对应的socket-1,获取一下price
				//将reuser_id，create_time,price（m_goods.Price）,good_id写入m_order表
				//将customer_log日志修改result
				db.Table("m_goods").Where("goods_id = ?", regood_id).Update("socket", m_goods.Socket-1)
				m_order.Order_id = GenerateCode()
				m_order.Goods_id = regood_id
				m_order.Username = reusername
				m_order.Price = m_goods.Price
				m_order.Create_time = time.Now().Format("2006-01-02 15:04:05")
				db.Table("m_order").Create(&m_order)
				fmt.Println("购买成功")
				//修改日志内容
				db.Table("customer_log").Where("username = ?", reusername).Where("goods_id = ?", regood_id).Update("result", 2)

			} else {

				fmt.Println("购买失败")
			}

			// 否则，提交事务
			tx.Commit()

		}
	}()

	log.Printf(" [*] Waiting for messages. To exit press CTRL+C")
	<-forever
}
