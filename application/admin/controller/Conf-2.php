<?php
namespace app\admin\controller;
use think\Controller;
use catetree\Catetree;
use think\Db;


class Conf extends Controller
{
    //配置项列表 这里注意如果是驼峰的，那么view视图对应的文件必须用_来隔开
//    public function confList(){
//        $conf = db('conf');
//        $ShopConfRes = $conf->where(['conf_type'=>1])->order('sort desc')->select();
//        $GoodsConfRes = $conf->where(['conf_type'=>2])->order('sort desc')->select();
//         //把数据分配出去
//         $this->assign([
//             'ShopConfRes' => $ShopConfRes,
//             'GoodsConfRes' => $GoodsConfRes,
//         ]);
//             return view();
//     }

     //配置项列表 这里注意如果是驼峰的，那么view视图对应的文件必须用_来隔开
     public function confList(){
        //实例化配置表
        $confObj = db('conf');
 
        //修改默认配置
        if(request()->isPost()){
 
           $data = input('post.');
           // dump($_FILES);
           // die;
 
           //复选框空选问题--思路拿数据库中的数据和获取得到的数据做对比，如果不同，就置空
           //数据库中提取checkbox字段的所有的数据
           $checkBoxField = $confObj->field('ename')->where('form_type','checkbox')->select();
 
           //提取出来的是二位数组，改成一维数组
           $check_fields = [];
 
           if($checkBoxField){
               foreach ($checkBoxField as $key => $value) {
               $check_fields[] = $value['ename'];
             }
        }
 
 
         //所有发送的字段组成的数组
         $all_fields = [];
 
         //处理文字数据
         foreach ($data as $k => $v) {
              //提取所有获取到的数据字段
              $all_fields[] = $k;
 
              if(is_array($v)){
                 //如果是数组，就把数组处理成字符串更新到表中,这里要用到把数组分割成字符串的php函数
                 $value = implode(',',$v);
                 $confObj->where('ename',$k)->update(['value'=>$value]);
              }else{
                  //如果不是数组，就直接更新数据到对应的字段
                  $confObj->where('ename',$k)->update(['value'=>$v]);
 
              }
         }
 
 
         //如果复选框未选中任何一个选项，则置空
         foreach ($check_fields as $k => $v) {
 
                 if(!in_array($v,$all_fields)){
                   //更新字段并置为空
                    $confObj->where('ename',$v)->update(['value'=>'']);
                 }
         }
 
         //处理图片数据
         //判断file字段有没有值
         if($_FILES){
             //打印测试
             // dump($_FILES);
             // die;
             foreach ($_FILES as $k => $v) {
               //如果是后台删除的，虽然图片删除了！但是数据库是有记录的，这个时候先要执行清空一次对应的数据值
               $confObj->where('ename',$k)->update(['value'=>'']);
 
               //然后在根据上传的图片是值在进行上传图片
               if($v['tmp_name']){
                 //修改之前删除掉老的图片
                 $oldImg = $confObj->field('value')->where('ename',$k)->find();
                 if($oldImg['value']){
                     //拼装后台图片地址
                     $oldImgSrc = IMG_UPLOADS.$oldImg['value'];
                        if(file_exists($oldImgSrc)){
                            @unlink($oldImgSrc);
                        }
                 }
                 //删除图片之后清空对应的文件值
                 // $confObj->where('ename',$k)->update(['value'=>'']);
                 //添加新的图片
                 $img_src = $this->upload($k);
                 $confObj->where('ename',$k)->update(['value'=>$img_src]);
               }
             }
 
         }
 
        //操作成功提示
        $this->success('配置变量值修改成功');
      }
 
 
      //获取店铺配置的所有项
      $shopConf =  $confObj->where('conf_type',1)->order('sort DESC')->select();
      //获取商品配置的所有项
      $goodsConf = $confObj->where('conf_type',2)->order('sort DESC')->select();
      //打印测试
      // dump($shopConf);
      // die;
      //分配上数据
      $this->assign([
            'shopConf'=>$shopConf,
            'goodsConf' =>$goodsConf
       ]);
 
      return view();
     }
     
    //品牌列表
    public function lst()
    {
        //实例化配置表
        $confObj = db('conf');
        $data = input('post.');
       // 如果提交的是post表单  排序功能
       if(request()->isPost()){
       //实例化 cateTree
           $cate =new Catetree();
           // dump($data);die;
           // 执行cateTree中的排序方法
           // 这里注意$data是一个二维数组，由于当前的post提交中只有一个sort所以这里提取sort的值

           $res=$cate->cateSort($data['sort'],$confObj);

           $this->success('修改排序成功！','lst');
       }
        //查询数据、按照降序排列、并且分页 DESC
        $confRes = $confObj ->order('id DESC')->paginate(6);
        // dump($confRes);die;
        //单数据分配模板
        $this->assign('confRes',$confRes);
        //多数据分配模板
        return view('list');
    }
    //添加品牌
    public function add()
    {
        if(request()->isPost())
        {
            $data = input('post.');
            //如果是多选，替换中文的 "，"
            if($data['form_type']=='radio' || $data['form_type']=='select' || $data['form_type']== 'checkbox'){
                $data['values']=str_repeat('，',',',$data['values']);
                $data['value']=str_repeat('，',',',$data['value']);
            }
            // 进行验证
            $validate =validate('conf');
            if(!$validate->check($data)){
                // dump($validate->getError());
                //提示错误信息
                $this->error($validate->getError());
            }
            //执行插入数据库操作
            $add = db('conf')->insert($data);
            //判断添加品牌是否成功！
            if($add)
            {
                $this->success('添加品牌成功!','lst');
            }else{
                $this->error('添加品牌失败！');
            }
            return;
        }
        return view();
    }

    //修改品牌
    public function edit()
    {
        if(request()->isPost())
        {
            //获取主键id
            $data =input('post.');
            //如果是多选，需要替换掉中文的逗号为英文的逗号
            if($data['form_type']=='radio' ||$data['form_type']=='checkbox' || $data['form_type']=='select'){
                $data['values'] = str_replace('，',',',$data['values']);
                $data['value'] = str_replace('，',',',$data['value']);
            }    
           
            //执行插入数据库操作
            $save= db('conf')->update($data);
            // 进行验证
            $validate =validate('conf');
            if(!$validate->check($data)){
                // dump($validate->getError());
                //提示错误信息
                $this->error($validate->getError());
            }
            //判断添加品牌是否成功！
            if($save!==false)
            {
                $this->success('修改品牌成功!','lst');
            }else{
                $this->error('修改品牌失败！');
            }
            return;
        }
         //获取表单信息
        $id=input('id');
         //分配数据
        $confs=db('conf')->find($id);
        $this->assign([
            'confs'=>$confs,
        ]);

        //加载模板
        return view();
    }
    //删除品牌
    public function del($id)
    {
        if(!empty($id)){
             //执行删除操作
             $del = db('conf')->delete($id);

             if($del){
                 $this->success('删除品牌成功','lst');
             }else{
                $this->error('删除品牌失败');
             }
         }
    }

    //上传图片操作
    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('conf_img');
        
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS .'static'. DS .'uploads');
            if($info){
                return $info->getSaveName();
                /*
                // 成功上传后 获取上传信息
                // 输出 jpg
                echo $info->getExtension();
                // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getSaveName();
                // 输出 42a79759f284b767dfcb2a0197904287.jpg
                echo $info->getFilename(); 
                */
            }else{
                // 上传失败获取错误信息
                echo $file->getError();
                die;
            }
        }
    }

}
