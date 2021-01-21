<?php

/**
 *  登陆页
 * @file   
 * @date    
 * @author   
 * @version     
 */

namespace app\admin\controller;

use think\Request;
use think\Db;


class Bguser extends Common {



      public function list() {
        $lists = db('vipuser')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
        
    
        
    }
    public function dee_edit() {
       $this->view->engine->layout(false);
         $adee=db('vipuser')->where('user_id',input('param.void'))->find();
         $this->assign("adee",$adee);
         return $this->fetch();
         }
      public function do_dee_edit() {
        $md5_salt = config('md5_salt');
        $idm=input('param.user_id');
        $username=input('username');
        $passwd=input('passwd');
        $passwd2=md5(md5($passwd).$md5_salt);
        $lastloginip=input('$lastloginip');
        $lastlogintime=input('$lastlogintime');
        $status=input('$status');
        $role_id=input('$role_id');
         $data3 = ['user_id' => $idm, 'username' =>  $username,'passwd'=>$passwd2,'lastloginip'=>$lastloginip,
         'lastlogintime'=>$lastlogintime,'status'=>$status];
         //修改用户表
        $res=db('vipuser')->where('user_id',$idm)->update(['user_id' => $idm, 'username' =>  $username,'passwd'=>$passwd2,
        'lastloginip'=>$lastloginip,'lastlogintime'=>$lastlogintime,'status'=>$status]);
        //修改角色表
        $res2=db('crm_role_user')->where('user_id',$idm)->update(['role_id' => $role_id]);
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
      
            ?>
            <script>
            var index=parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
            </script>
            <?php
    }
       
           
     public function info() {
        $this->view->engine->layout(false);
        $lists = db('vipuser')->select();
        $this->assign("lists", $lists);
        return $this->fetch();
        
    }
       public function add() {
      $md5_salt = config('md5_salt');
      $user_id=$_REQUEST["user_id"]; 
      $username=$_REQUEST["username"];
      $passwd=$_REQUEST["passwd"];
      $passwd2=md5(md5($passwd).$md5_salt);
      $status=$_REQUEST["status"];
       $count = db('vipuser')->where('user_id', $user_id)->count();

        if ($count) {
           $this->error('该用户id已存在');
        }
    else{
      $data1 = ['user_id' => $user_id, 'username' => $username,'passwd' =>  $passwd2 ,'status'=>$status];
      $res= db('vipuser')->insert($data1);
      //将用户id和角色id存入crm_role_user表
      $role_id=input('role_id');
      $data2 = ['user_id' => $user_id, 'role_id' =>  $role_id];
      $res2= db('crm_role_user')->insert($data2);
       if($res&$res2)
       {
           echo"新增成功";
       }
       else{
           echo"新增失败";
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
        
        $username = input('username');
         $adee=db('vipuser')->where('username',$username)->find();
          $this->assign("adee",$adee);
         if (!$adee) {
                  $this->error('查找失败');
                } 
        return $this->fetch();
    }

    public function delete() {

        $id = input('user_id');
        //删除用户表里的
        $res=db('vipuser')->where(['user_id' => $id])->delete();
        //删除角色表里的
         $res2=db('crm_role_user')->where(['user_id' => $id])->delete();
        if ($res&$res2) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }

}