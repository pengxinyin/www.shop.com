<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

//品牌验证操作
class Cate extends Validate{
    //定义验证规则
    protected $rule =   [
        'cate_name'  => 'require|unique:cate|min:2',
    ];

    //错误提示信息
    protected $message  =   [
        'cate_name.require' => '分类名称不能为空',
        'cate_name.unique'  => '分类名称不能重复',
        'cate_name.min'  => '分类名称过短，不能少于两个字符！'
    ];

    //添加验证场景
    // protected $scene = [
    //     'add'  =>  ['brand_name','brand_url','brand_description'],
    //     'edit' =>  ['brand_name','brand_url','brand_description']
    // ];
}
