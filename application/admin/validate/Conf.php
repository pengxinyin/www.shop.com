<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

//品牌验证操作
class Conf extends Validate{
    //定义验证规则
    protected $rule =   [
        'ename'  => 'require|unique:conf',
        'cname'  => 'require|unique:conf'
    ];

    //错误提示信息
    protected $message  =   [
        'ename.require' => '英文名称不能为空',
        'ename.unique'  => '英文名称不能重复',
        'cname.require' => '中文名称不能为空',
        'cname.unique'  => '中文名称不能重复',

    ];

    //添加验证场景
    // protected $scene = [
    //     'add'  =>  ['brand_name','brand_url','brand_description'],
    //     'edit' =>  ['brand_name','brand_url','brand_description']
    // ];



}
