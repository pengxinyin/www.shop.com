<?php
namespace app\admin\validate;
use think\Validate;


//商品验证操作
class Adpos extends Validate{
    //定义验证规则
    protected $rule =   [
        'name'  => 'require|unique:adpos',
        'width' =>'require|number',
        'height' =>'require|number'
    ];

    //错误提示信息
    protected $message  =   [
        'name.require' => '广告位名称不能为空',
        'name.unique' => '广告位名称不能重复',
        'width.require' => '广告位宽度不能为空',
        'width.number' => '广告位宽度必须是数字',
        'height.require' => '商品本店价不能为空',
        'height.number' => '商品本店价必须是数字'


    ];



}
