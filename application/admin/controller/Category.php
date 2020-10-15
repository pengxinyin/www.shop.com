<?php
namespace app\admin\controller;
use think\Controller;
use Catetree\Catetree;

// 商品分类

class Category extends Controller
{
    /**
     * 文章栏目列表
     *
     * @return void
     */
    public function lst()
    {
        // 获取所有的sort值,注意这个是在列表页面修改的，并不是在编辑页面修改的
        //由于提交的数据中中有sort 所以打印出来的时候虽然是二位数组，但是只有一个sort分类
        $data=input('post.');
        // 实例化数据表
        $categoryObj=db('category');
        // 如果提交的是post表单  排序功能
        if(request()->isPost()){
        //实例化 categoryTree
            $category =new Catetree();
            // dump($data);die;
            // 执行categoryTree中的排序方法
            // 这里注意$data是一个二维数组，由于当前的post提交中只有一个sort所以这里提取sort的值

            $res=$category->categorySort($data['sort'],$categoryObj);
            $this->success('修改排序成功！','lst');
        }
        //获取数据展示功能
        //查询数据、按照降序排列、并且分页
        $categoryRes=$categoryObj->order('id DESC')->select();
        //实例化类 引用无限极分类
        $category = new Catetree();
        $categoryRes = $category->Catetree($categoryRes);
        //单数据分配模板
        $this->assign([
            'categoryRes'=>$categoryRes,
        ]);
        //多数据分配模板
        return view('list');
    }
    
    /**
     *    添加栏目
     *
     * @return void
     */
    public function add()
    {
        // 实例化数据表
        $categoryObj=db('category');
         //实例化 categoryTree
         $category =new Catetree();
      

         if(request()->isPost())
         {
             $data = input('post.');
            //  dump($_FILES);
            //  dump($data);die
            //  dump($data['cate_img']);die;
             //处理图片上传
             
             if($_FILES['cate_img']['tmp_name'])
             {
                 $data['cate_img'] =$this->upload();
             }
             // 进行验证
             $validate =validate('category');
             if(!$validate->check($data)){
                 // dump($validate->getError());
                 //提示错误信息
                 $this->error($validate->getError());
             }
             //执行插入数据库操作
             $add = db('category')->insert($data);
             //判断添加品牌是否成功！
             if($add)
             {
                 $this->success('添加品牌成功!','lst');
             }else{
                 $this->error('添加品牌失败！');
             }
             return;
         }
        
        //获取数据展示功能
        //查询数据、按照降序排列、并且分页
        $categoryRes=$categoryObj->order('id DESC')->select();
        $categoryRes = $category->catetree($categoryRes);
        //数据分配模板 
        $this->assign([
            'categoryRes'=>$categoryRes,
        ]);
        return view();
    }

    /**
     * 修改商品
     *
     * @return void
     */
    public function edit()
    {
        
        // dump($_FILES);
        //   dump($data);die
        //   dump($data['cate_img']);die;
        $category =new Catetree();
        // dump($category.level);die;
        if(request()->isPost())
        {
            $data = input('post.');
            // dump($data['cate_img']);die;
            // dump($_FILES);die;
            //这一步如果是另外上传的图片，需要把原来的图片删除掉
            //处理图片上传 主要看tmp_name下是否有值
            if($_FILES['cate_img']['tmp_name'])
            {
                //查找对应id所在的brand_img图片的信息
                $oldBrands=db('category')->field('cate_img')->find($data['id']);
               //把找到的brand_img信息赋值给$oldBrandImg,并且拼接图片后台路径;
                $oldBrandImg=IMG_UPLOADS.$oldBrands['cate_img'];
                //进行文件存在判断，如果存在就删除旧图片
                if(file_exists($oldBrandImg)){     
                    @unlink($oldBrandImg);
                }

                $data['cate_img'] =$this->upload();
            }
            //执行插入数据库操作
            $save= db('category')->update($data);
            // 进行验证
            $validate =validate('Category');
            if(!$validate->check($data)){
                // dump($validate->getError());
                //提示错误信息
                $this->error($validate->getError());
            }
            //判断添加品牌是否成功！
            if($save!==false)
            {
                $this->success('修改商品成功!','lst');
            }else{
                $this->error('修改商品失败！');
            }
            return;
            
        }

        //查询所有数据
        $data = db('category')->select();
        //无极限分类分类数据操作
        $data = $category->catetree($data);;
        //查询当前栏目的信息  获取表单信息
        $categorys = db('category')->find(input('id'));
        // dump($categorys);die;
        //分配数据
        $this->assign([
            'categorys'=>$categorys,
            'data' => $data,
        ]);

        //加载模板
        return view();
    }

    /**
     * 删除栏目文章
     *
     * @param [type] $id
     * @return void
     */
    public function del($id)
    {
        
        if(!empty($id)){

            //|删除缩略图操作

            //获取后台缩略图资源 这里拿到的是一个二位数组
            $artImg = db('category')->field('cate_img')->find($id);

            //拼装图片路径
            $cate_img = IMG_UPLOADS.$artImg['cate_img'];

            //进行缩略图文件存在判断，如果存在就删除图片
            if(file_exists($cate_img)){
                     @unlink($cate_img);
            }

             //执行删除操作
             $del = db('category')->delete($id);

             if($del){
                 $this->success('删除商品成功！','lst');
             }else{
                $this->error('删除商品失败！');
             }
         }
       
    }

    //上传图片操作
    public function upload(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('cate_img');
        
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
