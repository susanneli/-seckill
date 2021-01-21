<?php


namespace app\admin\controller;

use think\Request;
use think\Db;


class Stuser extends Common {


public function list() {
       $lists = db('customerlist')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
          }
     public function info() {
        $this->view->engine->layout(false);
        $lists = db('customerlist')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
        
    }
       public function add() {
       $md5_salt = config('md5_salt');
       $id=$_REQUEST["user_id"];
       $username=$_REQUEST["username"];
       $passwd=$_REQUEST["password"]; 
       $password=md5(md5($passwd).$md5_salt);
       $local=$_REQUEST["local"];
       $count = db('customerlist')->where('user_id', $id)->count();

        if ($count) {
           $this->error('该用户id已存在');
        }
    else{
    $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
    if (!$con) { 
      die('数据库连接失败'.$mysql_error()); 
    } 
       mysqli_select_db($con,"test");
        $sql="INSERT INTO customerlist (user_id,username,password,local)
          VALUE('$id','$username','$password','$local')";
         if($con->query($sql)==TRUE){
             echo "新增成功";
         }else{
             echo "Error:".$sql,"<br>".$con->error;
         }
    }
      ?>
            <script>
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            </script>
            <?php
           
    }


    public function delete() {

        $id = input('user_id');
        $res = db('Customerlist')->where(['user_id' => $id])->delete();
        if ($res) {
           db('Customerlist')->where(['user_id' => $id])->delete();
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }

public function select()
    {
        $this->view->engine->layout(false);

        return $this->fetch();
    }
public function sresult()
    {
        $this->view->engine->layout(false);
        
        $username = input('username');
         $adee=db('Customerlist')->where('username',$username)->find();
          $this->assign("adee",$adee);
         if (!$adee) {
                  $this->error('查找失败');
                } 
        return $this->fetch();
    }
        public function dee_edit() {
        $this->view->engine->layout(false);
         $adee=db('Customerlist')->where('user_id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
        public function do_dee_edit() {
            $md5_salt = config('md5_salt');
            $oldid=input('param.user_id');
            $username=input('param.username');
            $passwd=input('param.password');
            $password=md5(md5($passwd).$md5_salt);
            $local=input('param.local');
            $res=db('Customerlist')->where('user_id',$oldid)->update(['username' =>$username,'password' => $password,'local'=>$local]);
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