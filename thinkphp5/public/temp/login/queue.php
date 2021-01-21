<?php
/* 设置响应数据的内容格式，和字符集*/
header('Content-type:text/html;charset=utf-8');
   
 class JsonRPC
{
    private $conn;

    function __construct($host, $port) {
        $this->conn = fsockopen($host, $port, $errno, $errstr, 3);
        if (!$this->conn) {
            return false;
        }
    }

    public function Call($method, $params) {
        if ( !$this->conn ) {
            return false;
        }
        echo"传输";
        echo $params["ntype"];
        echo"结果";
        $err = fwrite($this->conn, json_encode(array(
                'method' => $method,
                'params' => $params,
                'id'     => 0,
            ))."\n");
        if ($err === false)
            return false;
        stream_set_timeout($this->conn, 0, 3000);
        $line = fgets($this->conn);
        if ($line === false) {
            return NULL;
        }
        return json_decode($line,true);
    }
}



/**
 * PHP实现jwt
 */
class Jwt {

    //头部
    private static $header=array(
        'alg'=>'HS256', //生成signature的算法
        'typ'=>'JWT'    //类型
    );

    //使用HMAC生成信息摘要时所使用的密钥
    private static $key='123456';


    public static function getToken($payload)
    {
        if(is_array($payload))
        {
            $base64header=self::base64UrlEncode(json_encode(self::$header,JSON_UNESCAPED_UNICODE));
            $base64payload=self::base64UrlEncode(json_encode($payload,JSON_UNESCAPED_UNICODE));
            $token=$base64header.'.'.$base64payload.'.'.self::signature($base64header.'.'.$base64payload,self::$key,self::$header['alg']);
            return $token;
        }else{
            return false;
        }
    }



    public static function verifyToken($Token)
    {
        $tokens = explode('.', $Token);
        if (count($tokens) != 3)
            return false;

        list($base64header, $base64payload, $sign) = $tokens;

        //获取jwt算法
        $base64decodeheader = json_decode(self::base64UrlDecode($base64header), JSON_OBJECT_AS_ARRAY);
        if (empty($base64decodeheader['alg']))
            return false;

        //签名验证
        if (self::signature($base64header . '.' . $base64payload, self::$key, $base64decodeheader['alg']) !== $sign)
            return false;

        $payload = json_decode(self::base64UrlDecode($base64payload), JSON_OBJECT_AS_ARRAY);

        //签发时间大于当前服务器时间验证失败
        if (isset($payload['iat']) && $payload['iat'] > time())
            return false;

        //过期时间小宇当前服务器时间验证失败
        if (isset($payload['exp']) && $payload['exp'] < time())
            return false;

        //该nbf时间之前不接收处理该Token
        if (isset($payload['nbf']) && $payload['nbf'] > time())
            return false;

        return $payload;
    }




    /**
     * base64UrlEncode   https://jwt.io/  中base64UrlEncode编码实现
     * @param string $input 需要编码的字符串
     * @return string
     */
    private static function base64UrlEncode($input)
    {
        return str_replace('=', '', strtr(base64_encode($input), '+/', '-_'));
    }

    /**
     * base64UrlEncode  https://jwt.io/  中base64UrlEncode解码实现
     * @param string $input 需要解码的字符串
     * @return bool|string
     */
    private static function base64UrlDecode($input)
    {
        $remainder = strlen($input) % 4;
        if ($remainder) {
            $addlen = 4 - $remainder;
            $input .= str_repeat('=', $addlen);
        }
        return base64_decode(strtr($input, '-_', '+/'));
    }

    /**
     * HMACSHA256签名   https://jwt.io/  中HMACSHA256签名实现
     * @param string $input 为base64UrlEncode(header).".".base64UrlEncode(payload)
     * @param string $key
     * @param string $alg   算法方式
     * @return mixed
     */
    private static function signature($input, $key, $alg = 'HS256')
    {
        $alg_config=array(
            'HS256'=>'sha256'
        );
        return self::base64UrlEncode(hash_hmac($alg_config[$alg], $input, $key,true));
    }
   }

//与go链接
    $m=1;
    $token = $_POST['token'];
    $goods_id =$_POST['goods_id'];
    $redis = new Redis();
    $redis -> connect('127.0.0.1','6379');
    $jwt=new jwt;
    $getPayload=$jwt->verifyToken($token);
    if($getPayload==false){
        echo "1";
        exit;
    }
    else{
        $username=$getPayload['username'];
         $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
        if (!$con) { 
        die('数据库连接失败'.$mysql_error()); 
         } 
        else{
         mysqli_select_db($con,"test");
         //轮询开始
          ignore_user_abort(); //即使Client断开(如关掉浏览器)，PHP脚本也可以继续执行.  
          set_time_limit(0); // 执行时间为无限制，php默认执行时间是30秒，可以让程序无限制的执行下去  
          $interval=1*5; // 每隔5秒运行一次
          $mm=0;
              do{  
                 sleep($interval); // 按设置的时间等待一小时循环执行  
                 $result1=mysqli_query($con,"select*from customer_log where username='{$username}'");
                         while($row1=mysqli_fetch_array($result1)){
                          if($row1["goods_id"]==$goods_id){
                            $mm=$row1["result"];
                          }
                        }
                   }while($mm==0);
                   if($mm==2){
                        echo "2";
                          //防止重复抢购
                      $redis->set($username,$goods_id);
                          exit;
                   }
                   else if($mm==1){
                         echo "1";
                          $redis->del($username);
                          exit;
                   }
               exit;
         
         //轮询结束
        }
     }
   
?>