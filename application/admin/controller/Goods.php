<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;


class Goods extends Controller
{
    //品牌列表
    public function lst()
    {
        // 获取所有的sort值,注意这个是在列表页面修改的，并不是在编辑页面修改的
        //由于提交的数据中中有sort 所以打印出来的时候虽然是二位数组，但是只有一个sort分类
        $data=input('post.');
        // 实例化数据表
        $typeObj=db('type');
        // 如果提交的是post表单  排序功能
        //获取数据展示功能
        //查询数据、按照降序排列、并且分页
        $typeRes=$typeObj->order('id DESC')->select();
        //单数据分配模板
        $this->assign([
            'typeRes'=>$typeRes,
        ]);
        //多数据分配模板
        return view('list');
    }
    //添加品牌
    public function add()
    {   
       // 实例化数据表
       $typeObj=db('type');
      if(request()->isPost())
      {
          $data = input('post.');
          // // 进行验证
          // $validate =validate('Brand');
          // if(!$validate->check($data)){
          //     // dump($validate->getError());
          //     //提示错误信息
          //     $this->error($validate->getError());
          // }
          //执行插入数据库操作
          $add = $typeObj->insert($data);
          //判断添加品牌是否成功！
          if($add)
          {
              $this->success('添加分类成功!','lst');
          }else{
              $this->error('添加分类失败！');
          }
          return;
      }
    //   会员级别数据
      $mlRes = db('memberLevel')->field('id,level_name')->select();
      $this->assign([
          'mlRes' => $mlRes,
      ]);
      return view();
    }
    //修改品牌
    public function edit()
    {
        if(request()->isPost())
        {           
            $data = input('post.') ;  
            //执行插入数据库操作
            $save= db('type')->update($data);
            // // 进行验证
            // $validate =validate('Type');
            // if(!$validate->check($data)){
            //     // dump($validate->getError());
            //     //提示错误信息
            //     $this->error($validate->getError());
            // }
            //判断添加品牌是否成功！
            if($save!==false)
            {
                $this->success('修改商品类型成功!','lst');
            }else{
                $this->error('修改商品类型失败！');
            }
            return;
            
        }
        
         //获取表单信息
        $id=input('id');
         //分配数据
        $types=db('type')->find($id);
        $this->assign([
            'types'=>$types,
        ]);

        //加载模板
        return view();
    }
    //删除品牌
    public function del($id)
    {
        if(!empty($id)){

             //执行删除操作
             $del = db('type')->delete($id);
             //删除商品类型下面的商品属性
            $attr=db('attr')->where(['type_id'=>$id])->delete();
             if($del){
                 $this->success('删除商品类型成功','lst');
             }else{
                $this->error('删除商品类型失败');
             }
         }
    }
}
