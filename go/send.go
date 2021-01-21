package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net"
	"net/rpc"
	"net/rpc/jsonrpc"
	"os"
	"strconv"

	"github.com/streadway/amqp"
)

type RpcService struct {
}

//请求数据结构体
type RequestData struct {
	ntype int
	data  string
	data2 int
}

// 响应数据结构体
type ResponseData struct {
	Status int         // 状态
	Data   interface{} //数据
	Msg    string      //说明
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

var username string
var goodid string

// 方法（必须是公有方法，且必须是两个参数）
func (this *RpcService) Order(request map[string]string, response *ResponseData) error {
	m := map[string]string{"type": "10", "msg": "hello."}
	//mjson,_ :=json.Marshal(m)
	//mString :=string(mjson)
	response.Status = 6
	fmt.Printf(request["data"])
	username = request["data"]
	goodid = request["data2"]
	fmt.Printf(request["data2"])
	fmt.Printf(request["data2"])
	fmt.Printf(username)
	fmt.Printf(goodid)
	//goodid = request.data2
	response.Data = m
	response.Msg = "success"
	return nil
}

func main() {
	rpc.Register(new(RpcService)) // 注册rpc服务
	//rpc.HandleHTTP()                                // 采用http协议作为rpc载体
	lis, err := net.Listen("tcp", "127.0.0.1:5050") //监听端口，如果监听所有客户端则去掉ip
	if err != nil {
		log.Fatalln("fatal error: ", err)
	}

	_, _ = fmt.Fprintf(os.Stdout, "%s", "jsonrpc is started\n")

	for {
		conn, err := lis.Accept() // 接收客户端连接请求
		if err != nil {
			continue
		}
		go func(conn net.Conn) { // 并发处理客户端请求
			_, _ = fmt.Fprintf(os.Stdout, "%s", "new client connect\n")
			jsonrpc.ServeConn(conn)
			conn2, err := amqp.Dial("amqp://guest:guest@localhost:5672/")
			failOnError(err, "Failed to connect to RabbitMQ")
			defer conn2.Close()
			ch, err := conn2.Channel()
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
			orderData := orderData{}
			gid, err := strconv.Atoi(goodid)
			orderData.Good_id = gid
			orderData.Username = username
			fmt.Printf(orderData.Username)
			fmt.Println(orderData.Good_id)

			stuinfor, err := json.Marshal(orderData)
			body := stuinfor
			err = ch.Publish(
				"",     // exchange
				q.Name, // routing key
				false,  // mandatory
				false,  // immediate
				amqp.Publishing{
					ContentType: "text/plain",
					Body:        []byte(body),
				})
			log.Printf(" [x] Sent %s", body)
			failOnError(err, "Failed to publish a message")
		}(conn)
	}
}
