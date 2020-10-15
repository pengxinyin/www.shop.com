<?php

namespace app\admin\controller;

use think\Controller;

use think\Cache;

class Index extends Controller{

    public function index(){

        return view();

    }

    //清空缓存操作
    public function clearCache()
    {
       if(Cache::clear()){
         $this->success('缓存清理成功！');
       }else{
         $this->error('缓存清理失败！');
       }
       
    }

}
