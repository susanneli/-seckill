<?php

/**
 *  退宿界面
 * @file    
 * @date    
 * @author  
 * @version    
 */

namespace app\admin\controller;

use think\Request;
use think\Db;

class Retring extends Common {

    /**
     * 主页面
     */
    public function list() {
         if(session('role_id')==2){
         $lists = db('stu_acclist')->select();
        //var_dump($lists);
        $this->assign("lists", $lists);
            return $this->fetch();
        
          }
        else{
          $this->success('权限错误', 'nlogin/index');
        }  
    
        
      
    }
    public function retring() {
        
        $id = input('id');
        $dorno=db('stu_acclist')->where(['stuno' => $id])->value('dorno');
        $alnum=db('dor_acclist')->where(['dorno' => $dorno])->value('alnum');
        $freenum=db('dor_acclist')->where('dorno',$dorno)->value('freenum');
        $nalnum=$alnum-1;
        $nfreenum=$freenum+1;
        db('dor_acclist')->where('dorno',$dorno)->setField('alnum',  $nalnum);
        db('dor_acclist')->where('dorno',$dorno)->setField('freenum', $nfreenum);
        $res = db('stu_acclist')->where(['stuno' => $id])->delete();
        if ($res) {
           db('stu_acclist')->where(['stuno' => $id])->delete();
            $this->success('退宿成功');
        } else {
            $this->error('退宿失败');
        }
    }

}