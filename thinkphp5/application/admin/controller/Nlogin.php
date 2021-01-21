<?php

namespace app\admin\controller;

use think\Controller;
use think\Loader;

class nlogin extends Controller {

    /**
     * 登入
     */
    public function index() {
     $this->view->engine->layout(false);
            return $this->fetch();
        
    }
    
    /**
     * 处理登录
     */
   public function dologin() {
        $username=input('post.username');
        $password=input('post.password');
        $verifycode = trim(input('post.verifycode'));
        //验证用户名格式，用户名只能由数字或字母、汉字、下划线组成！
        if(!preg_match('/^[A-Za-z0-9_\x{4e00}-\x{9fa5}]+$/u',$username)){
            $this->error('用户名或密码格式错误');
        }
        //验证密码格式,密码包括数字、字母、特殊字符中的至少两种，且特殊字符的范围为 !#$%^?&*
        if(!preg_match('/^(?![\d]+$)(?![a-zA-Z]+$)(?![!#$%^&*]+$)[\da-zA-Z!#$%^&?*]{8,20}$/',$password)){
             $this->error('用户名或密码格式错误');
       }
        if(!captcha_check($verifycode)){
          $this->success('验证码输入错误', 'nlogin/index');
        }
        $md5_salt = config('md5_salt');
        $password=md5(md5($password).$md5_salt);
        $admin = model('Vipuser');
        $info = $admin->getInfoByUsername($username);
        $dbusername=db('vipuser')->where('username',$username)->value('username'); 
        $dbpassword=db('vipuser')->where('username',$username)->value('passwd');
        if (is_null($dbusername)||$dbpassword!=$password) {
                $this->error('用户名或密码错误');
        
        } 
        else { 
            $token=md5(time() . $username);
            $data = ['username' => $username, 'token' =>  $token];
            $count = db('token')->where('username', $data['username'])->count();
            if ($count) {
                 db('token')->where('username',$username)->update(['username' => $username, 'token' => $token]);
            }
            else{
              $res= db('token')->insert($data);
              $admin->editInfo($info['user_id']);
            }
              cookie('username', $username, 604800);
              cookie('token', $token, 604800);
              $user_id = db('vipuser')->where('username',$username)->value('user_id');
              $role_id = db('crm_role_user')->where('user_id',$user_id)->value('role_id');
              session('role_id', $role_id);
              //记录登录信息
              $admin->editInfo($info['username']);
              $this->success('登入成功', 'index/index');
        }
     }
    
    /**
     * 登出
     */
  public function logout()
    {
        session('role_id', null);
        $this->success('退出成功', 'nlogin/index');
    }
   

}
?>
