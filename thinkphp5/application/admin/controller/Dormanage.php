<?php

/**
 * 宿舍管理页面
 * @file   
 * @date    
 * @author   
 * @version     
 */

namespace app\admin\controller;

use think\Request;
use think\Db;


class Dormanage extends Common {

    /**
     * 
     */


public function list() {
      $lists = db('m_goods')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
 
          }
     public function info() {
        $this->view->engine->layout(false);
        $lists = db('m_goods')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
    }
       public function add() {
       $goods_id=$_REQUEST["goods_id"];
       $goods_name=$_REQUEST["goods_name"];
       $socket=$_REQUEST["socket"]; 
       $price=$_REQUEST["price"];
       $count = db('m_goods')->where('goods_id', $goods_id)->count();
        if ($count) {
           $this->error('该商品号已存在');
        }
    else{
    $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
    if (!$con) { 
      die('数据库连接失败'.$mysql_error()); 
    } 
       mysqli_select_db($con,"test");
        $sql="INSERT INTO m_goods (goods_id,goods_name,socket,price)
          VALUE('$goods_id','$goods_name','$socket','$price')";
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

public function select()
    {
        $this->view->engine->layout(false);

        return $this->fetch();
    }
public function sresult()
    {
        $this->view->engine->layout(false);
        
        $goods_id = input('goods_id');
         $adee=db('m_goods')->where('goods_id',$goods_id)->find();
          $this->assign("adee",$adee);
         if (!$adee) {
                  $this->error('查找失败');
                } 
        return $this->fetch();
    }
    public function delete() {

        $id = input('goods_id');
        $res = db('m_goods')->where(['goods_id' => $id])->delete();
        if ($res) {
            db('m_goods')->where(['goods_id' => $id])->delete();
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }


        public function dee_edit() {
         $this->view->engine->layout(false);
         $adee=db('m_goods')->where('goods_id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
        public function do_dee_edit() {
            $oldid=input('param.goods_id');
            $goods_name=input('param.goods_name');
            $socket=input('param.socket');
            $price=input('param.price');
            $res=db('m_goods')->where('goods_id',$oldid)->update(['goods_name' =>$goods_name,'socket' => $socket,'price'=>$price]);
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