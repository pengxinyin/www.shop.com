<?php
namespace app\admin\controller;
use think\Controller;
use catetree\Catetree;
class Article extends Controller{
    //文章列表
    public function lst(){
        //连表查询数据、按照降序排列、并且分页
        //这是查询当前文章的所属栏目，所以必须连表查询
        $data = db('article')->field('a.*,c.cate_name')->alias('a')->join('cate c',"a.cate_id=c.id")->order('a.id DESC')->paginate(15);
        //连表查询测试
        // dump($data);
        // die;
        //单数据分配模板
        $this->assign('data',$data);
        //多数据分配模板
        return $this->fetch('list');
    } 

    //文章增加操作
    public function add(){

        //增加文章方法
        if(request()->isPost()){

            //获取表单信息
            $data = input('post.');
            //发布时间
            $data['addtime'] = time();
            //判断文章链接地址是否带有http://
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
            if($_FILES['thumb']['tmp_name']){
               //如果有值，就把值赋给字段thumb,并添加到数组当中
               $data['thumb'] = $this->upload();
            }
            //进行验证
            $validate = validate('article');
            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }
            //测试数据
            // dump($data);
            // die;
            //执行插入数据库操作
            $res =db('article')->insert($data);
            //判断添加文章是否成功！
            if($res){
                $this->success('添加文章成功','lst');
            }else{
                $this->error('添加文章失败');
            }

            return;
        }
        //|--提取所有文章栏目分类
        //查询所有数据
        $data = db('cate')->select();
        //实例化无限极分类
        $cate = new catetree();
        //无极限分类分类数据操作
        $data = $cate->catetree($data);
        //查询所有文章分类的父id
        $artCateId = db('article')->field('cate_id')->select();
        foreach ($artCateId as $k => $v) {
             $artCateId = $v;
        }
        // dump($artCateId);
        // die;
        //分配数据
        $this->assign([
               'data'=>$data,
               'artCateId'=>$artCateId
            ]);

        //数据展示
        return view();
    }

    //文章编辑
    public function edit($id){
        //--------------------------------------
        //这一步是做修改后重新提交，隐藏于判断提交方法
         if(request()->isPost()){

            //获取表单信息
            $data = input('post.');
            // dump($data);
            // die;
            //判断文章网址是否带有http://
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
            if($_FILES['thumb']['tmp_name']){

               //查找对应id所在的thumb图片的信息
               $old_img = db('article')->field('thumb')->find($data['id']);

               //把找到的thumb信息赋值给$oldarticleImg,并且拼接图片后台路径;
               $oldarticleImg = IMG_UPLOADS.$old_img['thumb'];

              //进行文件存在判断，如果存在就删除旧图片
               if(file_exists($oldarticleImg)){
                     @unlink($oldarticleImg);
               }

               //上传新图片的名称
               $data['thumb'] = $this->upload();

            }

            //进行验证
            $validate = validate('article');

            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }

            //进行更新数据库操作
            $save =db('article')->update($data);

            //判断修改文章是否成功！
            if($save!==false){
                $this->success('修改文章成功','lst');
            }else{
                $this->error('修改文章失败');
            }

            return;
        }

        //-----------------------------------
        //这一步是把原来自带的数据获取到
        //根据id获取后台的数据
        //查询当前id的数据

        $artCurrent = db('article')->find($id);
        //测试数据
        // dump($artCurrent);
        // die;
        //查询cate表所有数据
        $artList = db('cate')->select();
        //实例化无限极分类
        $cate = new catetree();
        //无极限分类分类数据操作
        $artList = $cate->catetree($artList);
        // //测试数据
        // dump($artList);
        // die;
        //分配数据
        $this->assign([
          'artCurrent'=>$artCurrent,
          'artList'=>$artList
          ]);
        //加载模板
        return view();
    }

    //文章删除操作
    public function del($id){

         if(!empty($id)){

            //|删除缩略图操作

            //获取后台缩略图资源 这里拿到的是一个二位数组
            $artImg = db('article')->field('thumb')->find($id);

            //拼装图片路径
            $thumbSrc = IMG_UPLOADS.$artImg['thumb'];

            //进行缩略图文件存在判断，如果存在就删除图片 删除原图
            if(file_exists($thumbSrc)){
                     @unlink($thumbSrc);
            }


             //执行删除操作
             $res = db('article')->delete($id);

             if($res){
                 $this->success('删除成功','lst');
             }else{
                $this->error('删除失败','lst');
             }
         }

    }

    //上传图片操作
    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('thumb');
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

    //ueditor图片列表管理
    public function imglist(){

        $img_list = [];
        
        //自定义函数myscandir() 放于App下的common.php
        $files = my_scandir();
        // dump($files);die;
        //把获取到的图片和文件夹下的图片合并到一个二位数组当中
        foreach ($files as $k => $v) {
             //如果获取的是一个数组，就继续循环
             if(is_array($v)){
                 foreach ($v as $k1 => $v1) {
                   //再次循环之后，获取到的不是数组，就存储到空数组当中
                   //处理路径
                   $v1 = str_replace(UEDITOR,HTTP_UEDITOR,$v1);
                   //截取ueditor第一次出现的位置
                   $v1 = strstr($v1,'ueditor');
                   $img_list[] = $v1;
                 }
             }else{
                  //如果获取到的不是数组，就把数组存储到空数组当中
                  //替换路径
                  $v = str_replace(UEDITOR,HTTP_UEDITOR,$v);
                  //截取ueditor第一次出现的位置
                  $v = strstr($v,'ueditor');
                  $img_list[] = $v;
             }
        }
        //打印测试图片路径
        // dump($img_list);die;

        //分配数据 结果
        $this->assign([
            'imgSrc' => $img_list
            ]);
        return view();
    }

   //删除后台ueditor图片操作
   public function del_img(){

    $img_src = input('img_src');
    $img_src = __PUBLIC__.$img_src;

    //进行文件存在判断，如果存在就删除旧图片
    if(file_exists($img_src)){
        //删除成功与否判断
         if(@unlink($img_src)){

            //删除成功
            echo 1;
         }else{
            //删除失败
            echo 2;
         }

    }else{
        //图片不存在提示
        echo 3;
    }
}

}
