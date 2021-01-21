<?php
/* 设置响应数据的内容格式，和字符集*/
header('Content-type:text/html;charset=utf-8');
   
function get_real_ip()
{

    $ip=FALSE;

    //客户端IP 或 NONE

    if(!empty($_SERVER["HTTP_CLIENT_IP"])){

        $ip = $_SERVER["HTTP_CLIENT_IP"];

    }

    //多重代理服务器下的客户端真实IP地址（可能伪造）,如果没有使用代理，此字段为空

    if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {

        $ips = explode (", ", $_SERVER['HTTP_X_FORWARDED_FOR']);

        if ($ip) { array_unshift($ips, $ip); $ip = FALSE; }

        for ($i = 0; $i < count($ips); $i++) {

            if (!eregi ("^(10│172.16│192.168).", $ips[$i])) {

                $ip = $ips[$i];

                break;

            }

        }

    }

    //客户端IP 或 (最后一个)代理服务器 IP

    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);

}
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

class Jwt {

    //头部
    private static $header=array(
        'alg'=>'HS256', //生成signature的算法
        'typ'=>'JWT'    //类型
    );

    //使用HMAC生成信息摘要时所使用的密钥
    private static $key='123456';


    /**
     * 获取jwt token
     * @param array $payload jwt载荷   格式如下非必须
     * [
     *  'iss'=>'jwt_admin',  //该JWT的签发者
     *  'iat'=>time(),  //签发时间
     *  'exp'=>time()+7200,  //过期时间
     *  'nbf'=>time()+60,  //该时间之前不接收处理该Token
     *  'sub'=>'www.admin.com',  //面向的用户
     *  'jti'=>md5(uniqid('JWT').time())  //该Token唯一标识
     * ]
     * @return bool|string
     */
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


    /**
     * 验证token是否有效,默认验证exp,nbf,iat时间
     * @param string $Token 需要验证的token
     * @return bool|string
     */
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
    $token = $_POST['token'];
    $goods_id =$_POST['goods_id'];
    $ip=get_real_ip();
    $jwt=new jwt;
    $getPayload=$jwt->verifyToken($token);
    if($getPayload==false){
        echo "2";
        exit;
    }
    else{
       $time1=time();
       $time2=1610852108;
       $time3=1611975308;
       if($time1<$time2){
         echo "3";
         exit;
       }
        else if($time1>$time3){
          echo "4";
          exit;
       }
       else{
         $username=$getPayload['username'];
         $password=$getPayload['password'];
         $redis = new Redis();
         $redis -> connect('127.0.0.1','6379');
         if($redis->exists($username)){
             $num = $redis->get($username);
             if($num==$goods_id){
                 echo "6";
                 exit;
             }
             else if($num==0){
                 echo "1";
                 exit;
             }
         
         }
         $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
        if (!$con) { 
           die('数据库连接失败'.$mysql_error()); 
         } 
        else{
         mysqli_select_db($con,"test");
        }
       }
    }
    if($username){
         $redis = new Redis();
         $redis -> connect('127.0.0.1','6379');
         if($redis->exists('num')){
                $key='num';
                if($redis->decr($key)>=0){
                   //防止重复提交请求
                      $redis = new Redis();
                      $redis -> connect('127.0.0.1','6379');
                      $redis->set($username,0);
                    }
                 else{
        
                   $sql1="INSERT INTO customer_log (username, ip,goods_id, result,errormessage)
                          VALUES ('$username','$ip','$goods_id','1','商品已被抢完')";
                    if($con->query($sql1)==TRUE){
                  //echo "新增成功";
                  }else{
                echo "Error:".$sql,"<br>".$con->error;
                  }
                  echo "5";
                  exit;
                  }

           }
         else{
               $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
                  if (!$con) { 
                 die('数据库连接失败'.$mysql_error()); 
                 } 
                else{
                  mysqli_select_db($con,"test");
                  $result=mysqli_query($con,"select*from m_goods where goods_id='{$goods_id}'");
                  while($row=mysqli_fetch_array($result)){
                   $socket = $row["socket"]-1;
                  }
                  }
                    $redis->set('num',$socket);
                  }
    }
    else{
        exit;
    }
     //链接go文件
      $sql="INSERT INTO customer_log (username,goods_id,ip,result)
           VALUE('$username','$goods_id','$ip',0)";
             if($con->query($sql)==TRUE){
                  //echo "新增成功";
                  }else{
                echo "Error:".$sql,"<br>".$con->error;
             }
          $host = '127.0.0.1';
	      $port = '5050';
          $conn = fsockopen($host, $port, $errno, $errstr, 3);
          
        if (!$conn) {
         
             $redis->del($username);
             $sql2="INSERT INTO customer_log (username, ip,goods_id, result,errormessage)
                          VALUES ('$username','$ip','$goods_id','1','与go文件链接失败')";
                if($con->query($sql2)==TRUE){
                  //echo "新增成功";
                  }else{
                echo "Error:".$sql,"<br>".$con->error;
             }
            exit;
        }
        $method = 'RpcService.Order';
        $params=array('ntype'=>"123",'data'=>$username,'data2'=>$goods_id);
        $err = fwrite($conn, json_encode(array(
                'method' => $method,
                'params' =>array($params),
                'id'     => 0,
            ))."\n");
        if ($err === false){
            //var_dump('写入数据失败');
        $sql3="INSERT INTO customer_log (username, ip,goods_id, result,errormessage)
                          VALUES ('$username','$ip','$goods_id','1','写入数据失败')";
           if($con->query($sql3)==TRUE){
                  //echo "新增成功";
                  }else{
                echo "Error:".$sql,"<br>".$con->error;
          $redis->del($username);
            exit;
        }
        stream_set_timeout($conn, 0, 30000);
        $line = fgets($conn);
        if ($line === false) {
            // var_dump('获取响应数据失败');
          $sql4="INSERT INTO customer_log (username, ip,goods_id, result,errormessage)
                          VALUES ('$username','$ip','$goods_id','1','获取响应数据失败')";
        if($con->query($sql4)==TRUE){
                  //echo "新增成功";
                  }else{
                echo "Error:".$sql,"<br>".$con->error;
          $redis->del($username);
            exit;
        }
        echo "0";
        exit;
     

    }
    }
?>