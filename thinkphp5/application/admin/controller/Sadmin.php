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

class Sadmin extends Common {

    /**
     * 主页面
     */
    public function index() {
        $username=cookie('username');
        $this->assign('username',$username);
        // if(session('role_id')==1){
                $lists = db('vipuser')->select();
        //var_dump($lists);
        $this->assign("lists", $lists);
            return $this->fetch();
   // }
    //else{
      //  $this->success('权限错误', 'nlogin/index');
   // }
    

      
    }
       public function repasswd() {
        $oldpasswd = input('oldpasswd');
        $newpasswd=input('newpasswd');
        $renewpasswd=input('$renewpasswd');
        $username= $_SESSION["username"];
        echo $username;
       if($newpasswd==$renewpasswd){
           $old=db('vipuser')->where(['username' => $username])->value('passwd');
           if($old==$oldpasswd){
                $res=db('vipuser')->where('username',$username)->setField('passwd',  $newpasswd);
                if(res){
                    $this->success('修改成功');
                }
                else{
                     $this->error('修改失败'); 
                }
           }
        else{
           $this->error('修改失败，旧密码输入错误'); 
           
        }
       }
      
        
    }
  
}