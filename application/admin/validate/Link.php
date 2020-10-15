<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

//品牌验证操作
class Link extends Validate{
    //定义验证规则
    protected $rule =   [
        'title'  => 'require|unique:link',
        'link_url'   => 'url',
        'description' => 'min:2'
    ];

    //错误提示信息
    protected $message  =   [
        'title.require' => '链接标题不能为空',
        'title.unique'  => '链接标题不能重复',
        'link_url.url'   => '链接网址格式不正确',
        'description.min'  => '链接描述最少为2个字符'
    ];

    //添加验证场景
    // protected $scene = [
    //     'add'  =>  ['brand_name','brand_url','brand_description'],
    //     'edit' =>  ['brand_name','brand_url','brand_description']
    // ];



}
