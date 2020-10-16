<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

//商品属性验证操作
class Attr extends Validate{
    //定义验证规则
    protected $rule =   [
        'type_id' =>'require',
        'attr_name'  => 'require'

    ];

    //错误提示信息
    protected $message  =   [
        'type_id.require' => '所属分类不能为空',
        'attr_name.require' => '商品类型名称不能为空',
    ];




}