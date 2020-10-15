<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use catetree\Catetree;
class Link extends Controller{
    //链接列表
    public function lst(){
        //实例化友情链接类
        $linkObj = db('link');

        //获取sort提交的数据
        $data = input('post.');
        //打印测试
        // dump($data);
        // die;
        //排序功能
        if(request()->isPost()){
            //实例化cateTree
            $cateTree = new catetree();
            //执行cateTree中的排序方法
            //这里注意$data是一个二组数组，由于当前post提交中只有一个sort，所以这里提取sort的值
            $res = $cateTree->cateSort($data['sort'],$linkObj);

            //执行排序是否成功的操作
            $this->success('修改排序成功','lst');
        }


        //查询数据、按照降序排列、并且分页、并在列表中展示出来
        $data = $linkObj->order('sort DESC')->paginate(10);
        //单数据分配模板
        $this->assign('data',$data);
        // dump($data);
        // die;
        //多数据分配模板
        return $this->fetch('list');
    }

    //链接增加操作
    public function add(){
        //助手函数方法
        if(request()->isPost()){

            //获取表单信息
            $data = input('post.');

            //判断链接网址是否带有http://
            //strpos()返回的是字符串所在的位置，如果不加!==false 返回的就是0，也就是false.
            //strpos()是区分大小写的，stripos()是不区分大小写的
            if($data['link_url'] && stripos($data['link_url'],'http://')===false){
              //需要重新赋值
              $data['link_url'] = 'http://'.$data['link_url'];
            }

            //添加网址后缀
            if($data['link_url'] && strripos($data['link_url'],'.com')===false){
              //需要重新赋值
              $data['link_url'] =$data['link_url'].'.com';
            }

            //处理图片上传 主要看tmp_name下是否有值
            if($_FILES['logo']['tmp_name']){
               //如果有值，就把值赋给字段logo,并添加到数组当中
               $data['logo'] = $this->upload();
            }

            //进行验证
            $validate = validate('link');

            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }

            //执行插入数据库操作
            $res =db('link')->insert($data);

            //判断添加链接是否成功！
            if($res){
                $this->success('添加链接成功','lst');
            }else{
                $this->error('添加链接失败');
            }

            return;
        }

        return view();

    }

    public function edit($id){
        //--------------------------------------
        //这一步是做修改后重新提交，隐藏于判断提交方法
         if(request()->isPost()){

            //获取表单信息
            $data = input('post.');

            //判断链接网址是否带有http://
            //strpos()返回的是字符串所在的位置，如果不加!==false 返回的就是0，也就是false.
            //strpos()是区分大小写的，stripos()是不区分大小写的
            //如果数据存在并且没有加http://的情况下
            if($data['link_url'] && stripos($data['link_url'],'http://')===false){

              //需要重新赋值
              $data['link_url'] = 'http://'.$data['link_url'];
            }
            //添加网址后缀
            if($data['link_url'] && strripos($data['link_url'],'.com')===false){
              //需要重新赋值
              $data['link_url'] =$data['link_url'].'.com';
            }

            //这一步如果是另外上传的图片，需要把原来的图片删除掉
            //处理图片上传 主要看tmp_name下是否有值
            if($_FILES['logo']['tmp_name']){

               //查找对应id所在的logo图片的信息
               $old_img = db('link')->field('logo')->find($data['id']);

               //把找到的logo信息赋值给$oldlinkImg,并且拼接图片后台路径;
               $oldlinkImg = IMG_UPLOADS.$old_img['logo'];

               //进行文件存在判断，如果存在就删除旧图片
               if(file_exists($oldlinkImg)){
                     @unlink($oldlinkImg);
               }

               //如果有值，就把值赋给字段logo,并添加到数组当中
               $data['logo'] = $this->upload();
            }

            //进行验证
            $validate = validate('link');

            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }

            //进行更新数据库操作
            $save =db('link')->update($data);

            //判断添加链接是否成功！
            if($save!==false){
                $this->success('修改链接成功','lst');
            }else{
                $this->error('修改链接失败');
            }

            return;
        }

        //-----------------------------------
        //这一步是把原来自带的数据获取到
        //根据id获取后台的数据
        $id = input('id');
        // 查询当前id的数据
        $data = db('link')->find($id);
        //分配数据
        $this->assign('data',$data);
        //加载模板
        return view();
    }

    public function del($id){
         if(!empty($id)){

            //|删除缩略图操作
            $linkObj = db('link');
            //获取后台缩略图资源 这里拿到的是一个二位数组
            $artImg = $linkObj->field('logo')->find($id);
            //判断图片是否有值
            if($artImg['logo']){
              //拼装图片路径
              $logo = IMG_UPLOADS.$artImg['logo'];
              //进行缩略图文件存在判断，如果存在就删除图片
              if(file_exists($logo)){
                    @unlink($logo);
              }
            }

             //执行删除操作
             $res = $linkObj->delete($id);

             if($res){
                 $this->success('删除链接成功','lst');
             }else{
                $this->error('删除链接失败');
             }
         }

    }

    //上传图片操作
   public function upload(){
    // 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('logo');
    // 移动到框架应用根目录/public/static/uploads/ 目录下
    $info = $file->validate(['size'=>800600,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS .'static'. DS . 'uploads');

    if($info){
        //上传成功返回保存的文件名称
        return $info->getSaveName();
    }else{
        // 上传失败获取错误信息,并终止上传程序
        echo $file->getError();
        die;
    }
}



}
