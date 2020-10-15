<?php
namespace app\admin\controller;
use think\Controller;
use catetree\Catetree;



class Cate extends Controller
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
        $cateObj=db('cate');
        // 如果提交的是post表单  排序功能
        if(request()->isPost()){
        //实例化 cateTree
            $cate =new Catetree();
            // dump($data);die;
            // 执行cateTree中的排序方法
            // 这里注意$data是一个二维数组，由于当前的post提交中只有一个sort所以这里提取sort的值

            $res=$cate->cateSort($data['sort'],$cateObj);
            $this->success('修改排序成功！','lst');
        }
        //获取数据展示功能
        //查询数据、按照降序排列、并且分页
        $cateRes=$cateObj->order('sort DESC')->select();
        //实例化类 引用无限极分类
        $cate = new Catetree();
        $cateRes = $cate->catetree($cateRes);
        //单数据分配模板
        $this->assign([
            'cateRes'=>$cateRes,
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
        $cateObj=db('cate');
         //实例化 cateTree
         $cate =new Catetree();
        if(request()->isPost())
        {
            $data = input('post.');
            //判断是否可以添加子栏目
            if(in_array($data['pid'],['1','3'])){
                $this->error('系统分类不能作为上级栏目！');
            }
            //
            if($data['pid']==2){
                $data['cate_type']=3;
            }
            //查找pid
            $cateId=$cateObj->field('pid')->find($data['pid']);
            $cateId=$cateId['pid'];
            if($cateId==2){
                $this->error('此分类不能作为上级分类!');
            }
            // // 进行验证
            // $validate =validate('Brand');
            // if(!$validate->check($data)){
            //     // dump($validate->getError());
            //     //提示错误信息
            //     $this->error($validate->getError());
            // }
            //执行插入数据库操作
            $add = $cateObj->insert($data);
            //判断添加品牌是否成功！
            if($add)
            {
                $this->success('添加分类成功!','lst');
            }else{
                $this->error('添加分类失败！');
            }
            return;
        }
        //获取数据展示功能
        //查询数据、按照降序排列、并且分页
        $cateRes=$cateObj->order('sort DESC')->select();
        $cateRes = $cate->catetree($cateRes);
        //数据分配模板 
        $this->assign([
            'cateRes'=>$cateRes,
        ]);
        return view();
    }

    /**
     * 修改栏目
     *
     * @return void
     */
    public function edit($id){
        //--------------------------------------
        //实例化无极限分类
        $cate = new Catetree();
        //实例化数据表
        $cateObj = db('cate');

        //修改提交操作！
        //--------------------------------------
        //这一步是做修改后重新提交，隐藏于判断提交方法
         if(request()->isPost()){
            //获取表单信息，在编辑页面上添加隐藏域携带的id，提交表单的时候，id会被加上
            $data = input('post.');
            //打印测试
            // dump($data);
            // die;
            //进行验证
            $validate = validate('Cate');

            if(!$validate->check($data)){
                //提示错误信息
                $this->error($validate->getError());
            }

            //分类更新数据库操作
            $save =$cateObj->update($data);

            //判断修改分类是否成功！
            if($save!==false){
                $this->success('修改文章分类成功','lst');
            }else{
                $this->error('修改文章分类失败');
            }

            return;
        }

        //查询所有数据
        $data = $cateObj->select();
        //无极限分类分类数据操作
        $data = $cate->catetree($data);
        //查询当前栏目的信息
        $cateCurrent = $cateObj->find(input('id'));

        //分配数据
        $this->assign([
            'data'=>$data,
             'cateCurrent'=>$cateCurrent
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
             //执行删除操作
             $cate=db('cate');
            //  实例化方法
             $cateTree = new Catetree();
            //  所有子栏目的id
            $sonids= $cateTree->childrenids($id,$cate);
            // dump($sonids);die;
            // 将当前栏目的id和子栏目一起添加到数组
            $sonids[] = intval($id);

            // 系统内置不能删除的id数组
            $arrSys=[1,2,3];

            // 不能删除id的数组和我们获取的栏目id的数组做交集比较
            // 如果为空，则可以删除，如果有值，则不能删除
            // array_intersect  取两个数组的交集
            $arrRes=array_intersect($arrSys,$sonids);
            if($arrRes){
                $this->error('系统内置分类不允许删除!');
            }
            //删除分类前判断该分类下的文章和文章相关的缩略图
            $article=db('article');
            foreach($sonids as $k=>$v){
                $artRes=$article->field('id,thumb')->where(array('cate_id'=>$v))->select();
                foreach($artRes as $k1=>$v1){
                    //拼接路径
                    $thumbSrc=IMG_UPLOADS.$v1['thumb'];
                    //进行缩略图文件存在判断，如果存在就删除图片 删除原图
                    if(file_exists($thumbSrc)){
                        @unlink($thumbSrc);
                     }
                     $article->delete($v1['id']);
                }
            }
            // ---这里是删除栏目
            // 删除当前栏目以及下面所有的子栏目
             $del = $cate->delete($sonids);

             if($del){
                 $this->success('删除文章分类成功','lst');
             }else{
                $this->error('删除文章分类失败');
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
