<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]

// 定义应用目录,也就是根目录
define('APP_PATH', __DIR__ . '/../application/');

//绑定后台入口文件
define('BIND_MODULE','admin');

//后台文件模板文件根路径
define('__PUBLIC__',__DIR__.'/../public');

//后台文件模板公共路径
define('__STATIC__',__DIR__.'/../public/static');

// 定义后台php文件上传图片的位置，必须定义在后台入口文件当中
define('IMG_UPLOADS', __DIR__ . '/../public/static/uploads/');

//公共函数中定义ueditor上传图片的位置
define('UEDITOR',__DIR__ . '/ueditor');
//公共函数中后台展示ueditor中的图片
define('HTTP_UEDITOR', __DIR__ . '/ueditor');

// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
