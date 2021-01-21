<?php


namespace app\admin\controller;

use think\Request;
use think\Db;

class Repassword extends Common {

    /**
     * 修改密码
     */
      public function repasswd() {
        //$this->view->engine->layout(false);
        $lists = db('vipuser')->select();
        //var_dump($lists);
        $this->assign("lists", $lists);
        return $this->fetch();
        
    }
      public function re() {
        //return $this->fetch();
        $md5_salt = config('md5_salt');
        $oldpasswd = input('oldpasswd');
        $newpasswd=input('newpasswd');
        $renewpasswd=input('renewpasswd');
        //安全性校验
         //验证密码格式,密码长度8-20位，且必须包括数字、字母、特殊字符中的至少两种，特殊字符的范围为 !#$%^&?*
        if(!preg_match('/^(?![\d]+$)(?![a-zA-Z]+$)(?![!#$%^&*]+$)[\da-zA-Z!#$%^&?*]{8,20}$/',$newpasswd)){
            $this->error('新密码格式错误');
        }
 
        $md5odl=md5(md5($oldpasswd).$md5_salt);
        $md5new=md5(md5($newpasswd).$md5_salt);
        $username=cookie('username');
        $old=db('vipuser')->where('username',$username)->value('passwd');
        if($newpasswd==$renewpasswd){
              if($old==$md5odl){
                $res=db('vipuser')->where('username',$username)->setField('passwd',  $md5new);
                if($res){
                    cookie('token', null);
                     session('role_id', null);
                     cookie('username', null);
                    $this->success('修改成功,请重新登录','nlogin/index');
            
                }
                else{
                     $this->error('修改失败'); 
                }
              }
          else{
               $this->error('修改失败,旧密码输入错误'); 
          }
        }
        else{
            $this->error('修改失败,两次密码输入不一致'); 
        }
      
      }

    
      



}