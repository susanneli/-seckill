<?php

/**
 *
 * @file   Menu.php
 * @date   2016-9-1 15:48:53
 * @author Zhenxun Du<5552123@qq.com>
 * @version    SVN:$Id:$
 */

namespace app\admin\model;

use think\Model;

class Menu extends Model {
    public function getMyMenu($display = null) {
        $where = array();
        $role_id = session('role_id');
        $res = db('crm_role')
                ->field('rules')
                ->where('role_id','in', $role_id)
                ->select();
        if (!$res) {
                return false;
        }
        $tmp = '';
        foreach ($res as $k => $v) {
            $tmp .=$v['rules'] . ',';
        }
        $menu_ids = trim($tmp, ',');//删除，
        $where['rule_id'] = ['in', $menu_ids];
        if ($display) {
            $where['display'] = $display;
        }

        $res = db('menu')->where($where)->order('listorder asc')->select();
        return $res;
    }
}