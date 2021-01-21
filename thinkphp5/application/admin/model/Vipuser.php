<?php


namespace app\admin\model;

use think\Db;

class Vipuser extends \think\Model {

    public $status = array(1 => '无效', 2 => '有效');

    /**
     * 登录时调用
     * @param String $username 用户名
     * @return Array
     */
    public function getInfoByUsername($username) {
        $res = $this->field('user_id,username,passwd,status')
            ->where(array('username' => $username,'status' => 1))
            ->find();
        if ($res) {
            $res = $res->data;
        }

        return $res;
    }

    /**
     *
     * @param int $userid 用户ID
     * @return Array
     */
    public function getUserGroups($uid) {

        $res = db('user_id')->field('role_id')->where('user_id', $uid)->select();
        $userGroups = '';
        if ($res) {
            foreach ($res as $k => $v) {
                $userGroups .= $v['role_id'] . ',';
            }
            return trim($userGroups, ',');
        } else {
            return false;
        }
    }

    /**
     * 登陆更新
  
     */
    public function editInfo( $username, $data = array()) {
        $data['lastlogintime'] = time();
        $data['lastloginip'] = ip2long(request()->ip());
        // allowField,过滤数组中的非数据表字段数据
        $res = $this->allowField(true)->save($data, ['username' => $username]);
        return $res;
    }

}
