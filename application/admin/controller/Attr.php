<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use catetree\Catetree;
class Attr extends Controller{
    //商品属性列表
    public function lst(){
       $attrObj = db('attr');
       //接收属性列表ID 联表查询id所属的属性类型分类
       $typeId = input('type_id');
    //    dump($typeId);die;

       //判断接收的id是否存在
       if($typeId){
             //拼接where接收的id参数
             $map['type_id'] = ['=',$typeId];
       }else{
            $map = 1;
       }
       //从数据库查询数据、按照降序排列、并且分页
       $attrData = $attrObj->alias('a')->field('a.*,t.type_name')->where($map)->join('type t',"a.type_id=t.id")->order('a.id DESC')->paginate(20);

        //数据分配模板
        $this->assign([
            'attrData'=>$attrData,

            ]);
        //多数据分配模板
        return $this->fetch('list');
    }

    //商品属性增加操作
    public function add(){

        //助手函数方法
        if(request()->isPost()){

            //获取表单信息
            $data = input('post.');
            $data['attr_values'] = str_replace('，',',',$data['attr_values']);

            //进行验证
            $validate = validate('attr');

            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }

            //执行插入数据库操作
            $res =db('attr')->insert($data);

            //判断添加商品属性是否成功！
            if($res){
                $this->success('添加商品属性成功','lst');
            }else{
                $this->error('添加商品属性失败');
            }

            return;
        }

        //顶级导航无限极分类模块
        //-----------------------------------------------------
        //获取属性
        $typeData =db('type')->order('id DESC')->select();
        // dump($typeData);die;
        //分配数据
        $this->assign([
             'typeData'=>$typeData
             ]);
        //模板展示

        return view();

    }

    public function edit($id){

        //--------------------------------------
        //这一步是做修改后重新提交，隐藏于判断提交方法
         if(request()->isPost()){

            //获取表单信息
            $data = input('post.');
            $data['attr_values'] = str_replace('，',',',$data['attr_values']);
            //进行验证
            $validate = validate('attr');

            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }

            //进行更新数据库操作
            $save =db('attr')->update($data);

            //判断添加商品属性是否成功！
            if($save!==false){
                $this->success('修改商品属性成功','lst');
            }else{
                $this->error('修改商品属性失败');
            }

            return;
        }

        //-----------------------------------
        //这一步是把原来自带的数据获取到
        //根据id获取后台的数据
        $id = input('id');
        // 查询当前id的数据
        $data = db('attr')->find($id);
        //获取属性
        $typeData =db('type')->order('id DESC')->select();
        //分配数据
        $this->assign([
            'data'=>$data,
            'typeData'=>$typeData

            ]);

        //加载模板
        return view();
    }

    public function del($id){
         if(!empty($id)){

             //执行删除操作
             $res = db('attr')->delete($id);
             if($res){
                 $this->success('删除商品属性成功','lst');
             }else{
                $this->error('删除商品属性失败');
             }
         }

    }

    //异步请求获取指定商品类型属性数据
    public function ajaxGetAttr(){
        //接收发送过来的指定的type_id
        $typeId = input('type_id');

        $attrRes = db('attr')->where('type_id',$typeId)->select();
        //这要用json转码
        echo json_encode($attrRes);

    }


}
