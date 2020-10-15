<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;


class Brand extends Controller
{
    //品牌列表
    public function lst()
    {
        //查询数据、按照降序排列、并且分页 DESC
        $brandRes = db('brand')->order('id DESC')->paginate(4);
        // dump($brandRes);die;
        //单数据分配模板
        $this->assign('brandRes',$brandRes);
        //多数据分配模板
        return view('list');
    }
    //添加品牌
    public function add()
    {
        if(request()->isPost())
        {
            $data = input('post.');
            // dump($_FILES);die;
            // dump($data);die;
            // $data['brand_url']; http://
            //判断品牌网址是否带有http://
            //strpos()返回的是字符串所在的位置，如果不加!==false 返回的就是0，也就是false.
            //strpos()是区分大小写的，stripos()是不区分大小写的
            if($data['brand_url'] && stripos($data['brand_url'],'http://')===false){
                //需要重新赋值
                $data['brand_url'] = 'http://'.$data['brand_url'];
              }
            //添加网址后缀
            if($data['brand_url'] && strripos($data['brand_url'],'.com')===false){
                //需要重新赋值
                $data['brand_url'] =$data['brand_url'].'.com';
            }
        
            
            //处理图片上传
            if($_FILES['brand_img']['tmp_name'])
            {
                $data['brand_img'] =$this->upload();
            }
            // 进行验证
            $validate =validate('Brand');
            if(!$validate->check($data)){
                // dump($validate->getError());
                //提示错误信息
                $this->error($validate->getError());
            }
            //执行插入数据库操作
            $add = db('brand')->insert($data);
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
            if($data['brand_url'] && stripos($data['brand_url'],'http://')===false){
                //需要重新赋值
                $data['brand_url'] = 'http://'.$data['brand_url'];
            }
             //添加网址后缀
             if($data['brand_url'] && strripos($data['brand_url'],'.com')===false){
                //需要重新赋值
                $data['brand_url'] =$data['brand_url'].'.com';
            }
        
            
            //这一步如果是另外上传的图片，需要把原来的图片删除掉
            //处理图片上传 主要看tmp_name下是否有值
            if($_FILES['brand_img']['tmp_name'])
            {
                //查找对应id所在的brand_img图片的信息
                $oldBrands=db('brand')->field('brand_img')->find($data['id']);
               //把找到的brand_img信息赋值给$oldBrandImg,并且拼接图片后台路径;
                $oldBrandImg=IMG_UPLOADS.$oldBrands['brand_img'];
                //进行文件存在判断，如果存在就删除旧图片
                if(file_exists($oldBrandImg)){     
                    @unlink($oldBrandImg);
                }

                $data['brand_img'] =$this->upload();
            }
            //执行插入数据库操作
            $save= db('brand')->update($data);
            // 进行验证
            $validate =validate('Brand');
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
        $brands=db('brand')->find($id);
        $this->assign([
            'brands'=>$brands,
        ]);

        //加载模板
        return view();
    }
    //删除品牌
    public function del($id)
    {
        if(!empty($id)){

            //|删除缩略图操作

            //获取后台缩略图资源 这里拿到的是一个二位数组
            $artImg = db('brand')->field('brand_img')->find($id);

            //拼装图片路径
            $brand_img = IMG_UPLOADS.$artImg['brand_img'];

            //进行缩略图文件存在判断，如果存在就删除图片
            if(file_exists($brand_img)){
                     @unlink($brand_img);
            }

             //执行删除操作
             $del = db('brand')->delete($id);

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
        $file = request()->file('brand_img');
        
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
