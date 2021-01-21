<?php


namespace app\admin\controller;

use think\Request;
use think\Db;


class Rule extends Common {

      public function list() {
        $lists = db('crm_role')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
       
       
    }

   public function info() {
       $this->view->engine->layout(false);
        $lists = db('crm_role')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
        
    }
       public function add() {
       $role_id=$_REQUEST["role_id"];
       $name=$_REQUEST["name"];
       $rules=$_REQUEST["rules"];
       $count = db('crm_role')->where('role_id', $role_id)->count();
        if ($count) {
           $this->error('该角色id已存在');
        }
    else{
    $con=mysqli_connect("localhost","sql121_4_121_16","wi8AExQXiQ");
    if (!$con) { 
      die('数据库连接失败'.$mysql_error()); 
    } 
    echo"111111";
       mysqli_select_db($con,"test");
        $sql="INSERT INTO crm_role (role_id,name,rules)
          VALUE('$role_id','$name','$rules')";
         echo"2222";
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
        $role_id = input('role_id');
        $res = db('crm_role')->where(['role_id' => $role_id])->delete();
        if ($res) {
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
        
        $role_id = input('role_id');
         $adee=db('crm_role')->where('role_id',$role_id)->find();
          $this->assign("adee",$adee);
       // $res=db('vipuser')->where(['username' => $username])->select();
        // echo"查找成功";
         if (!$adee) {
                  $this->error('查找失败');
                } 
        return $this->fetch();
    }


        public function dee_edit() {
         $this->view->engine->layout(false);
         $adee=db('crm_role')->where('role_id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
        public function do_dee_edit() {
            $role_id=input('param.role_id');
            $name=input('param.name');
            $rules=input('param.rules');
            $res=db('crm_role')->where('role_id',$role_id)->update(['name' =>$name,'rules' => $rules]);
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