/*
 Navicat Premium Data Transfer

 Source Server         : hh
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : tpshop

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/10/2020 22:50:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `keywords` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  `description` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `author` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `link_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件链接',
  `thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `show_top` tinyint(1) NOT NULL COMMENT '是否置顶',
  `show_status` tinyint(1) NOT NULL COMMENT '发布状态',
  `cate_id` smallint(6) NOT NULL COMMENT '所属栏目',
  `addtime` int(10) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES (1, '文章测试1', '文章测试1', '文章测试1', 'pxy', '1551946489@qq.com', 'http://www.baidu.com', '20201007\\33bc85fd65248fb79b2dc2f8c15b53a3.jpg', '<p>wefdfhadfjkhdakjf hfkl违法可谓将分为发</p>', 0, 0, 10, 1602041786);
INSERT INTO `tp_article` VALUES (3, 'test', 'test', 'test', 'test', '1551946489@qq.com', 'http://www.baidu.com', '20201007\\6e81c2b81016752c45775b38ff0bb292.jpg', '<p style=\"text-align:center\"><img src=\"/ueditor/20201007/1602070351577013.jpg\" title=\"1602070351577013.jpg\" alt=\"timg (3).jpg\" width=\"471\" height=\"186\"/></p><p><br/></p>', 1, 1, 10, 1602070377);

-- ----------------------------
-- Table structure for tp_attr
-- ----------------------------
DROP TABLE IF EXISTS `tp_attr`;
CREATE TABLE `tp_attr`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `attr_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '属性类型 1：单选属性 2：唯一属性',
  `attr_values` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `type_id` smallint(6) NOT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_attr
-- ----------------------------
INSERT INTO `tp_attr` VALUES (7, '尺寸', 1, '13英寸,14英寸,15英寸,16英寸,17英寸,18英寸', 1);
INSERT INTO `tp_attr` VALUES (2, '尺码', 2, '36码,37码,38码', 0);
INSERT INTO `tp_attr` VALUES (8, '内存', 1, '4G,8G,16G,32G', 1);
INSERT INTO `tp_attr` VALUES (4, '颜色', 1, '黑色,白色', 1);
INSERT INTO `tp_attr` VALUES (5, '尺码', 1, 'XL,XXL,XXXL', 6);
INSERT INTO `tp_attr` VALUES (6, '衣长', 1, '600,700,800', 4);
INSERT INTO `tp_attr` VALUES (9, '硬盘', 1, '500MB,700MB,1TB,2TB', 1);
INSERT INTO `tp_attr` VALUES (11, '厂家', 2, '', 1);
INSERT INTO `tp_attr` VALUES (13, 'cpu', 2, 'i3处理器,i5处理器,i7处理器', 1);
INSERT INTO `tp_attr` VALUES (14, '生产地', 2, '广州,上海,深圳,北京', 1);
INSERT INTO `tp_attr` VALUES (15, '颜色', 1, '黑色,白色,蓝色', 6);
INSERT INTO `tp_attr` VALUES (16, '颜色', 1, '针织衫、羊毛衫、羽绒服、雪纺、哈伦、毛呢、灯丝绒', 4);

-- ----------------------------
-- Table structure for tp_brand
-- ----------------------------
DROP TABLE IF EXISTS `tp_brand`;
CREATE TABLE `tp_brand`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `brand_url` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌官网地址',
  `brand_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `brand_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌描述',
  `sort` smallint(6) NULL DEFAULT 50 COMMENT '品牌排序',
  `status` tinyint(255) NULL DEFAULT 1 COMMENT '1：显 示 0：隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_brand
-- ----------------------------
INSERT INTO `tp_brand` VALUES (1, '淘宝网', 'http://www.taobao.com', '20200929\\5bde2f8749ed38543126427bfa3743f8.jpg', 'DFDSFASD', 50, 1);
INSERT INTO `tp_brand` VALUES (2, '植物医生', 'www.ship.com', '20200929\\bff6a953d3d50927310b501059a9acb1.jpg', '品牌的描述', 50, 1);
INSERT INTO `tp_brand` VALUES (3, '杯子', 'www.pxy.com', '20200929\\5a54d174dc007041ed1e7adb66cc5135.jpg', 'hghfsghfgh', 50, 1);
INSERT INTO `tp_brand` VALUES (4, '水果', 'http://www.shuiguo.com', '20200929\\ea8e6b26d07ae9f678e6c075f66a2a62.jpg', '各种新鲜水果', 50, 1);
INSERT INTO `tp_brand` VALUES (5, '杯子', 'http://www.baidu.com', '20200929\\1ed5fd6421b2d9fe30564e6b99e04fc3.jpg', '质量好', 50, 1);
INSERT INTO `tp_brand` VALUES (6, '新闻网', 'http://xinlang.com', '20200929\\cdc137f83654c0132b435f465cf6ffee.jpg', '新浪独家新闻网', 50, 1);
INSERT INTO `tp_brand` VALUES (7, '纸巾', 'http://www.hu.com', '20200930\\392b11cb4699570dddf61431c3bfae09.jpg', 'zhinign ', 50, 1);

-- ----------------------------
-- Table structure for tp_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_cate`;
CREATE TABLE `tp_cate`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `cate_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目名称',
  `cate_type` tinyint(1) NULL DEFAULT 5 COMMENT '栏目类型：1：系统分类 2：帮助分类 3：网店分类 4：网店信息 5：普通分类',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `show_nav` tinyint(1) NULL DEFAULT 0 COMMENT '是否显示到导航栏',
  `allow_son` tinyint(1) NULL DEFAULT 1 COMMENT '是否允许添加子分类 ',
  `sort` smallint(6) NULL DEFAULT 50 COMMENT '排序',
  `pid` smallint(6) NULL DEFAULT 0 COMMENT '上级栏目ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_cate
-- ----------------------------
INSERT INTO `tp_cate` VALUES (1, '系统', 1, '系统设置', '系统描述', 0, 0, 1, 0);
INSERT INTO `tp_cate` VALUES (2, '网店帮助分类', 2, '网店帮助分类', '网店帮助分类', 0, 1, 2, 1);
INSERT INTO `tp_cate` VALUES (3, '网店信息', 4, '网店信息', '网店信息', 0, 0, 50, 1);
INSERT INTO `tp_cate` VALUES (4, '新手上路', 3, '新手上路', '新手上路', 1, 0, 5, 2);
INSERT INTO `tp_cate` VALUES (5, '配送与支付', 3, '配送与支付', '配送与支付', 0, 0, 4, 2);
INSERT INTO `tp_cate` VALUES (9, '测试11', 5, '测试11', '测试11', 0, 1, 50, 0);
INSERT INTO `tp_cate` VALUES (10, '测试2', 5, '测试2', '测试2', 0, 1, 60, 0);

-- ----------------------------
-- Table structure for tp_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_category`;
CREATE TABLE `tp_category`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `cate_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类名称',
  `keywords` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `cate_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类缩略图',
  `sort` smallint(6) NOT NULL DEFAULT 50 COMMENT '商品分类排序',
  `pid` smallint(6) NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `show_cate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '显示分类 1：显示 0：隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_category
-- ----------------------------
INSERT INTO `tp_category` VALUES (1, '女装', '女装', '女装', '20190322\\9e1292a1b2411cd00b99771e7f0145f3.jpg', 2, 0, 1);
INSERT INTO `tp_category` VALUES (12, '商品测试01', '', '', '', 50, 11, 1);
INSERT INTO `tp_category` VALUES (3, '童装', '童装', '童装', '20190322\\a7c91cfccc80150de9a97b5f55259aa6.jpg', 3, 0, 1);
INSERT INTO `tp_category` VALUES (6, '男鞋', '男鞋', '男鞋', '20190322\\4396052c66912f7f82daf540bcc3a21a.jpg', 11, 2, 1);
INSERT INTO `tp_category` VALUES (9, '女鞋', '女鞋', '女鞋', '20190322\\cc14b9c581908f868ee68aa7c534d021.jpg', 21, 1, 1);
INSERT INTO `tp_category` VALUES (8, '女衬衫', '女衬衫', '女衬衫', '20190322\\06cf121491815b1dcdc938fa2a4d38dd.jpg', 23, 1, 1);
INSERT INTO `tp_category` VALUES (10, '高跟鞋', '高跟鞋', '高跟鞋', '20190322\\e49f375741e7652f99589f9f99db56c3.jpg', 22, 9, 1);
INSERT INTO `tp_category` VALUES (14, '儿童上衣', '儿童上衣', '儿童上衣', '20190323\\5a6974ea3e1f6b50765aa0d8c93d44b6.jpg', 50, 3, 1);
INSERT INTO `tp_category` VALUES (15, '男装', '男装', '男装', '20190323\\e2cbcecadf58875d4ce2dad993d08c7a.jpg', 50, 0, 1);
INSERT INTO `tp_category` VALUES (16, '男上衣', '男上衣', '男上衣', '20190323\\3b30a6b67fdd6bd595dd1a3ffd4eff31.jpg', 50, 15, 1);
INSERT INTO `tp_category` VALUES (17, '男衬衫', '男衬衫', '男衬衫', '20190323\\97e59fbb5974b4493f73aaed8e7d29f3.jpg', 50, 16, 1);
INSERT INTO `tp_category` VALUES (18, '男裤子', '男裤子', '男裤子', '20190323\\a76cfb659cf22746e6aa9df62e00dcf4.jpg', 50, 15, 0);
INSERT INTO `tp_category` VALUES (19, '笔记本电脑', '笔记本电脑', '笔记本电脑', '20190326\\75fee12cd7d2e1f6488bd64eeea4b00f.jpg', 50, 0, 1);
INSERT INTO `tp_category` VALUES (20, '手机', '手机', '手机', '20190326\\6d544f89d0ab05f5c009b0851fb8cd14.jpg', 50, 0, 1);
INSERT INTO `tp_category` VALUES (21, 'fgfgdfg', 'fgfgfdgdfgfdg', 'fdgfgfgfdg', 'timg (1).jpg', 50, 15, 0);

-- ----------------------------
-- Table structure for tp_conf
-- ----------------------------
DROP TABLE IF EXISTS `tp_conf`;
CREATE TABLE `tp_conf`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置英文名称',
  `cname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置中文名称',
  `form_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单类型',
  `conf_type` tinyint(1) NULL DEFAULT 1 COMMENT '配置类型1:网店配置 2:商品信息配置',
  `values` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_conf
-- ----------------------------
INSERT INTO `tp_conf` VALUES (1, 'sitename', '站点名称', 'input', 1, '', '图片配置', 0);
INSERT INTO `tp_conf` VALUES (2, 'site_keywords', '站点关键词', 'input', 1, '', '精选图片', 0);
INSERT INTO `tp_conf` VALUES (3, 'site_description', '站点描述', 'textarea', 1, '', '精选图片', 0);
INSERT INTO `tp_conf` VALUES (4, 'logo', '网站logo', 'file', 1, NULL, '', 0);
INSERT INTO `tp_conf` VALUES (5, 'close_site', '关闭站点', 'radio', 1, '是,否', '否', 0);
INSERT INTO `tp_conf` VALUES (6, 'reg', '会员注册', 'select', 1, '开启，关闭', '开启，关闭', 0);
INSERT INTO `tp_conf` VALUES (7, 'checks', '多选测试', 'checkbox', 1, '选项1，选项2，选项4，选项5', '选项1，选项2，选项4，选项5', 0);

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_num` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编号',
  `og_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品原图',
  `sm_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略小图',
  `mid_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略中图',
  `big_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品缩略大图',
  `marke_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品市场价 参考价',
  `shop_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品具体价格 本店售卖价',
  `on_sale` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '商品是否上架 1 :上架 0 ：下架',
  `category_id` mediumint(9) NOT NULL DEFAULT 0 COMMENT '商品栏目id',
  `brand_id` mediumint(9) NULL DEFAULT 0 COMMENT '商品品牌id',
  `type_id` mediumint(9) NULL DEFAULT 0 COMMENT '商品类型id',
  `goods_des` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情描述',
  `goods_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量',
  `weight_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'KG' COMMENT '商品重量单位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`, `brand_id`, `type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tp_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_link`;
CREATE TABLE `tp_link`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接id',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `link_url` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接描述',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '链接类型',
  `sort` smallint(6) NULL DEFAULT 50 COMMENT '链接排序',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '显示状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_link
-- ----------------------------
INSERT INTO `tp_link` VALUES (1, '新闻', 'http://xinlang.com', NULL, '新闻网', 1, 50, 1);
INSERT INTO `tp_link` VALUES (2, '修改配置', 'http://www.baidu.com', '20201008\\a0725f34688de72a7a9fc0cceb4deb52.jpg', 'fdfdsfsdf', 1, 50, 1);

-- ----------------------------
-- Table structure for tp_member_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_level`;
CREATE TABLE `tp_member_level`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `level_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '级别名称',
  `bom_point` int(11) NULL DEFAULT NULL COMMENT '积分下限',
  `top_point` int(11) NULL DEFAULT NULL COMMENT '积分上限',
  `rate` tinyint(255) UNSIGNED NULL DEFAULT 100 COMMENT '折扣率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_member_level
-- ----------------------------
INSERT INTO `tp_member_level` VALUES (1, '注册会员', 0, 1000, 100);
INSERT INTO `tp_member_level` VALUES (2, '中级会员', 0, 2000, 90);
INSERT INTO `tp_member_level` VALUES (3, '高级会员', 1000, 4000, 80);
INSERT INTO `tp_member_level` VALUES (4, '终身VIP', 3000, 6000, 60);

-- ----------------------------
-- Table structure for tp_member_price
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_price`;
CREATE TABLE `tp_member_price`  (
  `id` smallint(255) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员价格表',
  `mprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '对应的会员价',
  `mlevel_id` smallint(255) NULL DEFAULT NULL COMMENT '对应会员级别',
  `goods_id` int(11) NULL DEFAULT NULL COMMENT '对应商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for tp_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_type`;
CREATE TABLE `tp_type`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_type
-- ----------------------------
INSERT INTO `tp_type` VALUES (1, '笔记本');
INSERT INTO `tp_type` VALUES (2, '手机');
INSERT INTO `tp_type` VALUES (3, '电视机');
INSERT INTO `tp_type` VALUES (4, '女装');
INSERT INTO `tp_type` VALUES (6, '男装');

SET FOREIGN_KEY_CHECKS = 1;
