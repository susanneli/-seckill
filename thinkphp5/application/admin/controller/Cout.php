<?php


namespace app\admin\controller;

use think\Request;
use think\Db;


class Cout extends Common {

    /**
     * 
     */
      public function list() {
      $lists = db('m_order')->select();
        //var_dump($lists);
        $this->assign("lists", $lists);
        return $this->fetch();
       
       
    }
public function select()
    {
        $this->view->engine->layout(false);

        return $this->fetch();
    }
public function sresult()
    {
        $this->view->engine->layout(false);
        
        $order_id = input('order_id');
         $adee=db('m_order')->where('order_id',$order_id)->find();
          $this->assign("adee",$adee);
         if (!$adee) {
                  $this->error('查找失败');
                } 
        return $this->fetch();
    }
   public function info() {
       $this->view->engine->layout(false);
        $lists = db('m_order')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
    }
       public function add() {
       $order_id=$_REQUEST["order_id"];
       $goods_id=$_REQUEST["goods_id"];
       $username=$_REQUEST["username"];
       $price=$_REQUEST["price"];
       $create_time=$_REQUEST["create_time"];
       $count = db('m_order')->where('order_id', $order_id)->count();
        if ($count) {
           $this->error('该订单号已存在');
        }
    else{
    $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
    if (!$con) { 
      die('数据库连接失败'.$mysql_error()); 
    } 
       mysqli_select_db($con,"test");
        $sql="INSERT INTO m_order (order_id,username,goods_id,price,create_time)
          VALUE('$order_id','$username','$goods_id','$price','$create_time')";

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

        $id = input('order_id');
        $res = db('m_order')->where(['order_id' => $id])->delete();
        if ($res) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }


        public function dee_edit() {
         $this->view->engine->layout(false);
         $adee=db('m_order')->where('order_id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
        public function do_dee_edit() {
            $oldid=input('param.order_id');
            $username=input('param.username');
            $goods_id=input('param.goods_id');
            $price=input('param.price');
            $create_time=input('param.create_time');
            $res=db('m_order')->where('order_id',$oldid)->update(['username' =>$username,'goods_id' => $goods_id,'price'=>$price,'create_time'=>$create_time]);
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