<?php


namespace app\admin\controller;

use think\Request;
use think\Db;


class Log extends Common {

      public function list() {
        $lists = db('admi_log')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
    }
   public function info() {
        $this->view->engine->layout(false);
        $lists = db('admi_log')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
    }
       public function add() {
       $id=$_REQUEST["id"];
       $m=$_REQUEST["m"];
       $c=$_REQUEST["c"];
       $a=$_REQUEST["a"];
       $userid=$_REQUEST["userid"];
       $ip=$_REQUEST["ip"];
       $time=$_REQUEST["time"];
       $username=$_REQUEST["username"];
       $querystring=$_REQUEST["querystring"];
       $count = db('admi_log')->where('id', $id)->count();
        if ($count) {
           $this->error('该id号已存在');
        }
    else{
    $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
    if (!$con) { 
      die('数据库连接失败'.$mysql_error()); 
    } 
       mysqli_select_db($con,"test");
        $sql="INSERT INTO admi_log (id,m,c,a,querystring,userid,username,ip,time)
          VALUE('$id','$m','$c','$a','$querystring','$userid','$username','$ip','$time')";

         if($con->query($sql)==TRUE){
             echo "新增成功";
         }else{
             echo "Error:".$sql,"<br>".$con->error;
         }
                        ?> 
           <script>
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            </script>
            <?php
    }
     
    }


    public function delete() {

        $id = input('id');
        $res = db('admi_log')->where(['id' => $id])->delete();
        if ($res) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }


        public function dee_edit() {
         $this->view->engine->layout(false);
         $adee=db('admi_log')->where('id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
        public function do_dee_edit() {
            $id=input('param.id');
            $m=input('param.m');
            $c=input('param.c');
            $a=input('param.a');
            $querystring=input('param.querystring');
            $userid=input('param.userid');
            $username=input('param.username');
            $ip=input('param.ip');
            $time=input('param.time');
            $res=db('admi_log')->where('id',$id)->update(['m' =>$m,'c' =>$c,'a' =>$a,
            'userid' =>$userid,'querystring'=>$querystring,'username' =>$username,'ip' => $ip,'time'=>$time]);
              if ($res) {
             echo "修改成功";
                } else {
             echo"修改失败";
              }
                   ?> 
           <script>
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            </script>
            <?php
        }

}
?>