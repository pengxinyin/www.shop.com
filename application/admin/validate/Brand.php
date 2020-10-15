<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

// 品牌验证操作
class Brand extends Validate
{
    //定义验证规则
    protected $rule= [
        'brand_name'  => 'require|unique:brand',
        'brand_url'   => 'url',
        'brand_description' => 'min:6',    
    ];
    // 错误信息提醒
    protected $message  =   [
        'brand_name.require' => '品牌名称必须',
        'brand_name.unique' => '品牌名称不能重复',
        'brand_url.url'  => 'url格式不正确',
        'brand_description.min'  => '描述最少6个字符',  
    ];
}
