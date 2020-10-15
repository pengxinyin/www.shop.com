<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

// 品牌验证操作
class Category extends Validate
{
    //定义验证规则
    protected $rule= [
        'cate_name'  => 'require|unique:cate|min:2',
        'description' => 'min:6',    
    ];
    // 错误信息提醒
    protected $message  =   [
        'cate_name.require' => '品牌名称必须',
        'cate_name.unique' => '品牌名称不能重复',
        'cate_name.min'  => '分类名称过短，不能少于两个字符！',
        'description.min'  => '描述最少6个字符', 
    ];
}
