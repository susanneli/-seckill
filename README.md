# 商品秒杀系统  
    Thinkphp5框架实现后台管理端，VUE框架实现用户端 
    环境：Thinkphp5、Apache、redis、php安装redis扩展、Rabbitmq
## 一、项目功能介绍
### 1.后台管理端(Thinkphp5)
    本系统后台管理端总共设立了三种角色，系统管理员、商品管理员、订单管理员，登录成功后，依据存在session中的role_id去crm_role表中查找该角色id对应的rules,根据rules去menu表中查找其对应的权限生成目录。其中系统管理员可以对后台用户表(vipuser)、顾客表(customerlist)、日志表(admi_log)、目录表(menu)、角权限管理员(crm_role)五个表进行增删改查；商品管理员可以对商品表(m_goods)进行增删改查；订单管理员可以对订单表(m_order)进行增删改查。  
    所有角色均拥有七天免登录、退出、修改密码、后台首页、欢迎界面等功能。并且所有角色的各种操作、操作时间、ip地址等内容都会被实时写入admi_log日志表。  
### 2.用户端(VUE+Redis+Rabbitmq)
    用户端用VUE框架实现，登陆后，出现抢购页面，输入商品号1，点击立即抢购按钮，服务端会首先进行登录检查，然后检查是否在规定的秒杀时间内，是否防止重复提交请求或者重复抢购。  
    抢购开始前，将商品库存读入redis缓存中，在请求数量远超于库存数量的情况下，可以将大部分流量拦截在前面，只允许少部分流量进入真正的秒杀业务处理程序，如果请求数大于redis中的库存数量，可以迅速的返回失败消息给用户，无需等待后面的秒杀业务处理完。采用decr 进行预减库存操作，作为一个原子操作判断，如果decr后库存量小于0，则直接返回秒杀失败信息，否则才会继续传递执行。多次测试后发现多余请求都会被拦截在redis处。  
    如果缓存处判断库存足够，就将信息通过发送到send.go文件中。在send.go文件中注册rpc服务，监听5050端口，接收并处理来自select.php的请求，使用rabbitmq消息队列对消息进行异步处理，receive.go文件从消息队列中主动的拉取请求消息进行业务处理。在receive.go中再次对商品号、库存等信息进行检查，防止超卖现象，然后去数据库中减库存、生成订单记录、修改日志信息。queue.php文件对日志表进行轮询，判断是否购买成功，并将结果反馈给用户。
## 二、项目安装指南
### 1.后台管理端(Thinkphp5)
    在服务器上部署好thinkphp5，运行环境为php7.2
    后台管理端的controller、model、view 等文件夹在thinkphp5\application\admin目录下，登录界面为admin/nlogin/index.三种角色的用户名密码如下:  
      系统管理员：用户名为sead，密码为sead1231  
      商品管理员：用户名为mema，密码为mema123!  
      订单管理员：用户名为orma，密码为orma123?  
### 2.用户端(VUE+Redis+Rabbitmq)
    (1)thinkphp5\public\temp\login\login.html为用户登录界面,总共设置了四个用户。  
      用户名:ll   密码:ll123?  
      用户名:ls   密码:lm123?  
      用户名:an   密码:an134?   
      用户名:deg  密码: mmere156  
    (2)thinkphp5/public/temp/login/select.html为抢购界面,其中商品号处只能输入1。  
    (3)安装redis、php安装redis扩展，抢购之前，需要在redis中创建num键，并将商品的库存值，从数据库中读取商品的库存数赋给该值。  
    (4)go文件夹下的 send.go文件通过监听5050端口，获取来自select.php文件传递的消息，如果通信成功，将接收到的消息发送到rabbitmq消息队列中; receive.go文件用于逐条处理消息队列中的消息;go文件夹下的receive和send文件为对receive.go和send.go进行交叉编译产生的结果。使用时，可将这两个文件上传到服务器上，通过./receive与./send的方法运行，注意服务器上要安装Rabbitmq  
### 3.3.数据库  
    数据库为test.sql,包括admi_log、crm_role、crm_role_user、customerlist、custormer_log、menu、m_goods、m_order、token、vipuser十个数据表  
