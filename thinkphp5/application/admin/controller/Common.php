<?php

/**
 * 后台公共文件 
 * @file   Common.php  
 * @date   2016-8-24 18:28:34 
 * @author Zhenxun Du<5552123@qq.com>  
 * @version    SVN:$Id:$ 
 */

namespace app\admin\controller;

use think\Controller;
use think\Session;
use think\Cookie;

class Common extends Controller {
    public function __construct(\think\Request $request = null) {

        parent::__construct($request);

        //检测session是否有效
        $username=cookie('username');
        $this->assign('username',$username);
        //7天免登录登录检查
        if(!$this->_checkAuthor())
        {
             $this->error('登录失败，请重新登录', 'nlogin/index');
        } 
        else if(!$this->_checkJur()){
             $this->error('你无权限操作');
        }
        //记录日志
        $this->_addLog();
    }
//登录检查
private function _checkAuthor() {
        if (!Cookie::has('username') || !Cookie::has('token')) {
            return false;
        }
        $username=cookie('username'); 
        $tooken=cookie('token');
        $dbusername=db('token')->where('username',$username)->value('username'); 
        $dbtooken=db('token')->where('username',$username)->value('token');
        if ($username!=$dbusername || $tooken!=$dbtooken) {
            return false;
        }
        if(!Session::has('role_id'))
        {
            $user_id = db('vipuser')->where('username',$username)->value('id');
            $role_id = db('crm_role_user')->where('user_id',$user_id)->value('role_id');
            session('role_id', $role_id);
        }
        return true;
}
//权限检查生成目录
private function _checkJur() {

        $c = strtolower(request()->controller());//所有字符转成小写
        $a = strtolower(request()->action());

        if (preg_match('/^public_/', $a)) {
            return true;
        }
        if ($c == 'index' && $a == 'index') {
            return true;
        }

        $menu = model('Menu')->getMyMenu();
        foreach ($menu as $k => $v) {
            if (strtolower($v['c']) == $c && strtolower($v['a']) == $a) {
                return true;
            }
        }

        return false;
    }       

    /**
     * 记录日志
     */
    private function _addLog() {
       
        $data = array();
        //内容插入数据库了，修改了就会有？差不多这个意思
        $data['querystring'] = request()->query()?'?'.request()->query():'';
        $data['m'] = request()->module();
        $data['c'] = request()->controller();
        $data['a'] = request()->action();
        $username= cookie('username');
        $user_id = db('vipuser')->where('username',$username)->value('user_id');
        $data['username']=$username;
        $data['userid'] = $user_id;
        $data['ip'] = ip2long(request()->ip());
        $data['time'] = time();
        $arr = array('Index/index','Log/list');
        if (!in_array($data['c'].'/'.$data['a'], $arr)) {
            db('admi_log')->insert($data);
        }
    }
}
?>