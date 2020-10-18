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

// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
// 定义后台php文件上传图片的位置，必须定义在后台入口文件当中
// define('IMG_UPLOADS', __DIR__ . '/../public/static/uploads/');
//公共函数中定义ueditor上传图片的位置
// define('UEDITOR',__DIR__ . '/../public/ueditor/');
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
