<?php
namespace app\admin\validate;
use think\Validate;
//广告验证操作
class Ad extends Validate{
    //定义验证规则
    protected $rule =   [
        'ad_name'  => 'require|unique:ad',
        'adpos_id'=> 'require|number',
        'type'=> 'require|number',
        'on'=> 'require|number',
       
    ];

    //错误提示信息
    protected $message  =   [
        'ad_name.require' => '广告名称不能为空',
        'ad_name.unique'  => '广告名称不能重复',
        'adpos_id.require' => '所属广告位不能为空',
        'adpos_id.number' => '所属广告位id必须是数字',
        'type.require' => '广告类型不能为空',
        'type.number' => '广告类型值必须是数字',
        'on.require' => '广告状态不能为空',
        'on.number' => '广告状态值必须是数字',

    ];

    //验证场景
    protected $scene = [
        'add'  =>  [ 'ad_name', 'adpos_id', 'type','on'],
        'edit'  =>  [ 'ad_name', 'adpos_id', 'type','on'],
    ];

}
