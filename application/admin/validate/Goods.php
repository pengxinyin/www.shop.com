<?php
namespace app\admin\validate;
use think\Validate;
use think\Db;

//商品验证操作
class Goods extends Validate{
    //定义验证规则
    protected $rule =   [
        'goods_name'  => 'require|unique:goods',
        'category_id'   =>  'require',
        'markted_price' =>'require|number',
        'shop_price' =>'require|number',
        'goods_weight' =>'require|number'
    ];

    //错误提示信息
    protected $message  =   [
        'goods_name.require' => '商品名称不能为空',
        'goods_name.unique' => '商品名称不能重复',
        'category_id.require' => '商品所属栏目不能为空',
        'markted_price.require' => '商品市场价不能为空',
        'markted_price.number' => '商品市场价必须是数字',
        'shop_price.require' => '商品本店价不能为空',
        'shop_price.number' => '商品本店价必须是数字',
        'goods_weight.require'  => '商品重量不能空',
        'goods_weight.number'  => '商品重量必须是数字'

    ];



}
