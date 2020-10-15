<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

//品牌验证操作
class Article extends Validate{
    //定义验证规则
    protected $rule =   [
        'title'  => 'require|unique:article',
        'cate_id'  => 'require',
        'email' => 'email',
        'link_url' => 'url'

    ];

    //错误提示信息
    protected $message  =   [
        'title.require' => '文章标题不能为空',
        'title.unique'  => '文章标题不能重复',
        'cate_id.require'  => '所属栏目不能为空'

    ];

    //添加验证场景
    // protected $scene = [
    //     'add'  =>  ['brand_name','brand_url','brand_description'],
    //     'edit' =>  ['brand_name','brand_url','brand_description']
    // ];



}
