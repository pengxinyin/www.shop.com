<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
//图片资源处理函数

function my_scandir($dir=UEDITOR){
   // $dir= str_replace("\\",'/',$dir);
   // dump($dir);die;
   //准备一个空数组，存储获取到的文件
   $files = [];
   //scandir($dir,1) 读取文件夹下的文件两个参数，第一个是路径，第二个是升序或者降序，
   //默认是升序排列，如果是降序排列的话，第二个参数是1
   // scandir() 函数返回指定目录中的文件和目录的数组。
   $dir_list = scandir($dir);
   // dump($dir_list);die;
   foreach($dir_list as $file){
       //排除读取到的是空文件夹
      if($file != '.' && $file !='..'){
         //判断是文件还是文件夹
         if(is_dir($dir.'/'.$file)){
            //读取到的是文件夹，存储到准备好的空数组当中，递归继续向下读取
              //这里读取到的是一个二位数组，必须有下标，下标就是$file;
           $files[$file] =my_scandir($dir.'/'.$file);
         }else{
            //读取直接读取的是图片文件，拼接路径之后直接存储到空数组当中
            $files[]=$dir.'/'.$file;
         }
      }
   }
   //把得到的结果返回
   return $files;

}

//字符串截图
function cut_str($sourcestr,$cutlength){
    $returnstr='';
    $i=0;
    $n=0;
    $str_length=strlen($sourcestr);//字符串的字节数
    while (($n<$cutlength) and ($i<=$str_length))
    {
       $temp_str=substr($sourcestr,$i,1);
       $ascnum=Ord($temp_str);//得到字符串中第$i位字符的ascii码
       if ($ascnum>=224)    //如果ASCII位高与224，
       {
          $returnstr=$returnstr.substr($sourcestr,$i,3); //根据UTF-8编码规范，将3个连续的字符计为单个字符
          $i=$i+3;            //实际Byte计为3
          $n++;            //字串长度计1
       }
       elseif ($ascnum>=192) //如果ASCII位高与192，
       {
          $returnstr=$returnstr.substr($sourcestr,$i,2); //根据UTF-8编码规范，将2个连续的字符计为单个字符
          $i=$i+2;            //实际Byte计为2
          $n++;            //字串长度计1
       }
       elseif ($ascnum>=65 && $ascnum<=90) //如果是大写字母，
       {
          $returnstr=$returnstr.substr($sourcestr,$i,1);
          $i=$i+1;            //实际的Byte数仍计1个
          $n++;            //但考虑整体美观，大写字母计成一个高位字符
       }
       else                //其他情况下，包括小写字母和半角标点符号，
       {
          $returnstr=$returnstr.substr($sourcestr,$i,1);
          $i=$i+1;            //实际的Byte数计1个
          $n=$n+0.5;        //小写字母和半角标点等与半个高位字符宽…
       }
    }
          if ($str_length>$i){
           $returnstr = $returnstr . "…";//超过长度时在尾处加上省略号
       }
     return $returnstr;
 }
