<?php


namespace app\admin\controller;

use think\Request;
use think\Db;


class Menu extends Common {

      public function list() {
        $lists = db('menu')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
    }

   public function info() {
        $this->view->engine->layout(false);
        $lists = db('menu')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
        
    }
       public function add() {
       $rule_id=$_REQUEST["rule_id"];
       $parentid=$_REQUEST["parentid"];
       $name=$_REQUEST["name"];
       $icon=$_REQUEST["icon"];
       $c=$_REQUEST["c"];
       $a=$_REQUEST["a"];
       $display=$_REQUEST["display"];
       $listorder=$_REQUEST["listorder"];
       $count = db('menu')->where('rule_id', $rule_id)->count();
        if ($count) {
           $this->error('该功能id已存在');
        }
    else{
    $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
    if (!$con) { 
      die('数据库连接失败'.$mysql_error()); 
    } 
       mysqli_select_db($con,"test");
        $sql="INSERT INTO menu (rule_id,parentid,name,icon,c,a,display,listorder)
          VALUE('$rule_id','$parentid','$name','$icon','$c','$a','$display','$listorder')";
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
        
        $rule_id = input('rule_id');
         $adee=db('menu')->where('rule_id',$rule_id)->find();
          $this->assign("adee",$adee);
         if (!$adee) {
                  $this->error('查找失败');
                } 
        return $this->fetch();
    }
    public function delete() {

        $id = input('rule_id');
    
        $res = db('menu')->where(['rule_id' => $id])->delete();
        if ($res) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }


        public function dee_edit() {
         $this->view->engine->layout(false);
         $adee=db('menu')->where('rule_id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
        public function do_dee_edit() {
            $rule_id=input('param.rule_id');
            $parentid=input('param.parentid');
            $name=input('param.name');
            $icon=input('param.icon');
            $display=input('param.display');
            $c=input('param.c');
            $a=input('param.a');
            $listorder=input('param.listorder');
            $res=db('menu')->where('rule_id',$rule_id)->update(['parentid' =>$parentid,
            'name' =>$name,'icon' =>$icon,'c' =>$c,'a' =>$a,'display' => $display,'listorder'=>$listorder]);
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