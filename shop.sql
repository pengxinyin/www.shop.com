/*
 Navicat Premium Data Transfer

 Source Server         : bbc
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 15/10/2020 18:06:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_ad
-- ----------------------------
DROP TABLE IF EXISTS `tp_ad`;
CREATE TABLE `tp_ad`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告管理id',
  `ad_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告名称',
  `on` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告类型',
  `img_scr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单图图片地址',
  `link_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单图图片链接',
  `adpos_id` smallint(6) NULL DEFAULT NULL COMMENT '所属广告位',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_ad
-- ----------------------------

-- ----------------------------
-- Table structure for tp_adpos
-- ----------------------------
DROP TABLE IF EXISTS `tp_adpos`;
CREATE TABLE `tp_adpos`  (
  `id` smallint(255) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '广告位管理id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位名称',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位宽度',
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位高度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_adpos
-- ----------------------------
INSERT INTO `tp_adpos` VALUES (1, '新闻', '400', '400');
INSERT INTO `tp_adpos` VALUES (2, '新闻2', '400', '400');

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
  `link_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章链接',
  `thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `show_top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否顶置',
  `show_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '发布状态',
  `cate_id` smallint(6) NOT NULL COMMENT '所属栏目',
  `addtime` int(10) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES (19, '沥青瓦玻纤瓦油毡瓦', '沥青瓦玻纤瓦油毡瓦', '沥青瓦玻纤瓦油毡瓦', '泽皓建材', '526315780@qq.com', 'http://www.zehaojc.com', '20190322\\561f2122759f538245af5dfdfe0b04b4.jpg', '<p>沥青瓦玻纤瓦油毡瓦沥青瓦玻纤瓦油毡瓦</p><p><img src=\"/ueditor/20190322/1553251193979618.jpg\" title=\"1553251193979618.jpg\" alt=\"007.jpg\"/></p>', 1, 1, 33, 1553246636);
INSERT INTO `tp_article` VALUES (20, '沥青瓦商品大全预览欣赏', '沥青瓦商品大全预览欣赏', '沥青瓦商品大全预览欣赏', '泽皓建材', '526315780@qq.com', 'http://www.zehaojc.com', '20190323\\dc21e42b96883ef00656d57c805a7f03.jpg', '<p>沥青瓦商品大全预览欣赏沥青瓦商品大全预览欣赏沥青瓦商品大全预览欣赏</p><p><img src=\"/ueditor/20190322/1553251207130377.jpg\" title=\"1553251207130377.jpg\" alt=\"005.jpg\"/></p>', 0, 1, 33, 1553247436);

-- ----------------------------
-- Table structure for tp_attr
-- ----------------------------
DROP TABLE IF EXISTS `tp_attr`;
CREATE TABLE `tp_attr`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `attr_type` tinyint(1) NULL DEFAULT 1 COMMENT '属性类型 1：单选属性 2：唯一属性',
  `attr_values` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `type_id` smallint(6) NULL DEFAULT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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

-- ----------------------------
-- Table structure for tp_brand
-- ----------------------------
DROP TABLE IF EXISTS `tp_brand`;
CREATE TABLE `tp_brand`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '品牌ID',
  `brand_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌名称',
  `brand_url` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌地址',
  `brand_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌logo',
  `brand_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '品牌描述',
  `sort` smallint(6) NOT NULL DEFAULT 50 COMMENT '品牌排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:显示0:隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_brand
-- ----------------------------
INSERT INTO `tp_brand` VALUES (1, '华为', 'http://www.huawei.com', '20190326\\defc5f793ea897f631e9f2ba761b7120.jpg', '华为手机、电脑', 50, 1);
INSERT INTO `tp_brand` VALUES (2, '苹果', 'http://www.pingguo.com', '20190326\\7cbe56082ad3be41aa4f683eb1dc2c88.jpg', '苹果手机、电脑', 50, 1);
INSERT INTO `tp_brand` VALUES (3, '小米', 'http://www.xiaomi.com', '20190326\\4c8831cec7c61c12ac7f8028170ae3f7.jpg', '小米手机，电脑', 50, 1);
INSERT INTO `tp_brand` VALUES (4, '微软', 'http://www.weiruan.com', '20190326\\58b9fa0681f976c0e170450e5a3b71fb.jpg', '微软手机，电脑', 50, 1);

-- ----------------------------
-- Table structure for tp_cate
-- ----------------------------
DROP TABLE IF EXISTS `tp_cate`;
CREATE TABLE `tp_cate`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `cate_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目名称',
  `cate_type` tinyint(1) NOT NULL DEFAULT 5 COMMENT '1: 系统分类 2:帮助分类 3:网店帮助 4:网店信息 5:普通分类',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目关键词',
  `description` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目描述',
  `show_nav` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示栏目 1:是  0:否',
  `allow_son` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否允许添加子分类 1：是 0：否',
  `sort` smallint(6) NOT NULL DEFAULT 50 COMMENT '栏目排序',
  `pid` smallint(6) NOT NULL DEFAULT 0 COMMENT '栏目上级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_cate
-- ----------------------------
INSERT INTO `tp_cate` VALUES (1, '系统', 1, '系统', '系统', 0, 0, 1, 0);
INSERT INTO `tp_cate` VALUES (2, '网站帮助分类', 2, '网站帮助分类', '网站帮助分类', 0, 1, 2, 1);
INSERT INTO `tp_cate` VALUES (3, '网店信息', 4, '网店信息', '网店信息', 0, 0, 1, 1);
INSERT INTO `tp_cate` VALUES (4, '新手上路', 3, '新手上路', '新手上路', 1, 0, 50, 2);
INSERT INTO `tp_cate` VALUES (32, '女装', 5, '女装', '女装', 1, 1, 3, 0);
INSERT INTO `tp_cate` VALUES (5, '配送与支付', 3, '配送与支付', '配送与支付', 1, 0, 51, 2);
INSERT INTO `tp_cate` VALUES (6, '会员信息', 3, '会员信息', '会员信息', 0, 0, 52, 2);
INSERT INTO `tp_cate` VALUES (33, '女装测试', 5, '女装测试', '女装测试', 1, 1, 3, 32);

-- ----------------------------
-- Table structure for tp_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_category`;
CREATE TABLE `tp_category`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `cate_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  `keywords` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `cate_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类缩略图',
  `sort` smallint(6) NULL DEFAULT 50 COMMENT '商品分类排序',
  `pid` smallint(6) NOT NULL DEFAULT 0 COMMENT '上级分类ID',
  `show_cate` tinyint(1) NULL DEFAULT 0 COMMENT '显示分类 1：显示 0：隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_category
-- ----------------------------
INSERT INTO `tp_category` VALUES (1, '秋季女装', '女装', '气质时尚秋季女装折扣大卖送', '20201015\\44b2fcd4b096c138057ad07ab512015b.jpg', 2, 0, 1);
INSERT INTO `tp_category` VALUES (12, '商品测试01', '', '', '', 50, 11, 1);
INSERT INTO `tp_category` VALUES (3, '童装', '童装', '童装反对发射点十分安抚阿三发射点发射点发', '20201015\\23c66459e1c9e66f8b6e800af2a2f5fd.jpg', 3, 0, 1);
INSERT INTO `tp_category` VALUES (6, '男鞋', '男鞋', '男鞋', '20190322\\4396052c66912f7f82daf540bcc3a21a.jpg', 11, 2, 1);
INSERT INTO `tp_category` VALUES (8, '女衬衫', '女衬衫', '女衬衫hhhhhhhhhhhhhhhhh', '20201015\\9042c200f9f6966c9b8432e9f1a24633.png', 23, 0, 1);
INSERT INTO `tp_category` VALUES (27, '办公桌', '大幅度反对法的', '对方对方的d\'fss 阿达fgfgfg', '20201015\\a95d59fadbb42b0acbf67843f5c2983d.jpg', 50, 21, 0);
INSERT INTO `tp_category` VALUES (14, '儿童上衣', '儿童上衣', '儿童上衣dfdfddf ', '20201015\\272d7293a4668b6c1c009e0659f78482.jpg', 50, 0, 1);
INSERT INTO `tp_category` VALUES (15, '男装', '男装', '男装打发打发士大夫士大夫撒地方', '20201015\\3799fdb36764dd15212f4200af9daba5.jpg', 50, 0, 1);
INSERT INTO `tp_category` VALUES (31, '西裤', '西裤', '西裤西库县空虚细节细节决定返回的回复', '20201015\\0f145b1f3c65894620139787eb9136eb.jpg', 50, 15, 0);
INSERT INTO `tp_category` VALUES (30, '缝纫工人工', '古风格非官方苟富贵受到广泛', '的犯得上发嘎嘎如果发给对方干的', '20201015\\8389fbda9a5bac71ad7c495d21423467.jpg', 50, 15, 0);

-- ----------------------------
-- Table structure for tp_category_brands
-- ----------------------------
DROP TABLE IF EXISTS `tp_category_brands`;
CREATE TABLE `tp_category_brands`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '栏目品牌表和广告id',
  `brands_id` smallint(255) NOT NULL COMMENT '关联品牌id',
  `pro_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推广图地址',
  `pro_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推广图链接',
  `category_id` smallint(6) NULL DEFAULT NULL COMMENT '关联栏目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_category_brands
-- ----------------------------

-- ----------------------------
-- Table structure for tp_conf
-- ----------------------------
DROP TABLE IF EXISTS `tp_conf`;
CREATE TABLE `tp_conf`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `ename` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `cname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
  `form_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'input' COMMENT '表单类型',
  `conf_type` tinyint(1) NULL DEFAULT 1 COMMENT '配置类型 1:网站配置 2：商品配置',
  `values` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `sort` smallint(6) NULL DEFAULT 50 COMMENT '配置排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_conf
-- ----------------------------
INSERT INTO `tp_conf` VALUES (5, 'site_close', '关闭站点', 'radio', 1, '开启,关闭', '关闭', 3);
INSERT INTO `tp_conf` VALUES (12, 'checkbox_test', '多选测试', 'checkbox', 1, '选项1,选项2,选项3,选项4', '选项2', 1);
INSERT INTO `tp_conf` VALUES (6, 'member_register', '会员注册', 'select', 1, '开启,关闭', '开启', 4);
INSERT INTO `tp_conf` VALUES (7, 'site_logo', '网站logo', 'file', 1, '', NULL, 2);
INSERT INTO `tp_conf` VALUES (8, 'site_name', '站点名称', 'input', 1, '', 'sitename', 7);
INSERT INTO `tp_conf` VALUES (10, 'site_description', '站点描述', 'textarea', 1, '专业沥青瓦生产厂家', '专业沥青瓦生产厂家', 5);
INSERT INTO `tp_conf` VALUES (11, 'site_keywords', '站点关键词', 'input', 1, '沥青瓦，玻纤瓦，油毡瓦', '沥青', 6);
INSERT INTO `tp_conf` VALUES (13, 'erweima', '二维码', 'file', 1, '', NULL, 2);
INSERT INTO `tp_conf` VALUES (14, 'checkbox_test01', '多选测试01', 'checkbox', 1, '选项01,选项02,选项03,选项04,选项05,选项06', '选项02', 0);
INSERT INTO `tp_conf` VALUES (15, 'goods_test', '商品测试', 'input', 2, '商品测试', '商品测试', 50);
INSERT INTO `tp_conf` VALUES (16, 'tiaoshu', '商品显示条数', 'checkbox', 2, '5,10,15,20', '5,10', 50);

-- ----------------------------
-- Table structure for tp_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods`;
CREATE TABLE `tp_goods`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `goods_code` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品编号',
  `og_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原图',
  `sm_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小缩略图',
  `mid_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中缩略图',
  `big_thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大缩略图',
  `markted_price` decimal(10, 2) NOT NULL COMMENT '市场价',
  `shop_price` decimal(10, 2) NOT NULL COMMENT '本店价',
  `on_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否在售 1：上架 0：下架',
  `category_id` mediumint(9) NOT NULL COMMENT '所属栏目',
  `brand_id` mediumint(9) NOT NULL DEFAULT 0 COMMENT '所属品牌',
  `type_id` mediumint(9) NOT NULL DEFAULT 0 COMMENT '所属类型',
  `goods_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详情',
  `goods_weight` decimal(10, 2) NOT NULL COMMENT '重量',
  `weight_unit` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'KG' COMMENT '重量单位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`, `brand_id`, `type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_goods
-- ----------------------------
INSERT INTO `tp_goods` VALUES (1, '苹果X1', '苹果X1', '苹果X1', '1553931902744303', '20190330\\71743ac29be80357ae3c261811245c75.jpg', '20190330\\sm_71743ac29be80357ae3c261811245c75.jpg', '20190330\\mid_71743ac29be80357ae3c261811245c75.jpg', '20190330\\big_71743ac29be80357ae3c261811245c75.jpg', 8000.00, 6000.00, 1, 19, 2, 1, '<p>苹果X1苹果X1苹果X1苹果X1</p>', 2000.00, 'KG');
INSERT INTO `tp_goods` VALUES (2, '华为maxbook', '华为maxbook', '华为maxbook', '1553932004132676', '20190330\\fc541407f6a3e062d6734714c4453c08.jpg', '20190330\\sm_fc541407f6a3e062d6734714c4453c08.jpg', '20190330\\mid_fc541407f6a3e062d6734714c4453c08.jpg', '20190330\\big_fc541407f6a3e062d6734714c4453c08.jpg', 8000.00, 6000.00, 1, 19, 1, 1, '<p>华为maxbook华为maxbook华为maxbook</p>', 2000.00, 'KG');

-- ----------------------------
-- Table structure for tp_goods_attr
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_attr`;
CREATE TABLE `tp_goods_attr`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attr_id` mediumint(9) NOT NULL COMMENT '属性ID',
  `attr_value` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `attr_price` decimal(10, 2) NOT NULL COMMENT '属性价格',
  `goods_id` mediumint(9) NOT NULL COMMENT '所属商品',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_goods_attr
-- ----------------------------
INSERT INTO `tp_goods_attr` VALUES (47, 11, '苹果', 0.00, 1);
INSERT INTO `tp_goods_attr` VALUES (45, 9, '500MB', 300.00, 1);
INSERT INTO `tp_goods_attr` VALUES (44, 4, '白色', 28000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (43, 4, '黑色', 26000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (42, 8, '16G', 28000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (41, 8, '8G', 25000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (40, 8, '4G', 20000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (39, 7, '15英寸', 22000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (37, 7, '13英寸', 20000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (38, 7, '14英寸', 21000.00, 1);
INSERT INTO `tp_goods_attr` VALUES (49, 14, '上海', 0.00, 1);
INSERT INTO `tp_goods_attr` VALUES (48, 13, 'i7处理器', 0.00, 1);
INSERT INTO `tp_goods_attr` VALUES (46, 9, '700MB', 500.00, 1);
INSERT INTO `tp_goods_attr` VALUES (50, 7, '13英寸', 20000.00, 2);
INSERT INTO `tp_goods_attr` VALUES (51, 7, '14英寸', 25000.00, 2);
INSERT INTO `tp_goods_attr` VALUES (52, 7, '15英寸', 28000.00, 2);
INSERT INTO `tp_goods_attr` VALUES (53, 8, '4G', 500.00, 2);
INSERT INTO `tp_goods_attr` VALUES (54, 4, '黑色', 600.00, 2);
INSERT INTO `tp_goods_attr` VALUES (55, 9, '500MB', 800.00, 2);
INSERT INTO `tp_goods_attr` VALUES (56, 11, '华为', 0.00, 2);
INSERT INTO `tp_goods_attr` VALUES (57, 13, 'i7处理器', 0.00, 2);
INSERT INTO `tp_goods_attr` VALUES (58, 14, '深圳', 0.00, 2);

-- ----------------------------
-- Table structure for tp_goods_photo
-- ----------------------------
DROP TABLE IF EXISTS `tp_goods_photo`;
CREATE TABLE `tp_goods_photo`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(9) NOT NULL COMMENT '所属商品',
  `og_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品原图',
  `sm_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品相册小图',
  `mid_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品相册中图',
  `big_photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品相册大图',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_id`(`goods_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_goods_photo
-- ----------------------------
INSERT INTO `tp_goods_photo` VALUES (27, 2, '20190330\\1002cb3566e4919d4143f241e0983909.jpg', '20190330\\sm_1002cb3566e4919d4143f241e0983909.jpg', '20190330\\mid_1002cb3566e4919d4143f241e0983909.jpg', '20190330\\big_1002cb3566e4919d4143f241e0983909.jpg');
INSERT INTO `tp_goods_photo` VALUES (25, 2, '20190330\\c81c8c123bedfc1597cf2e078b53a527.jpg', '20190330\\sm_c81c8c123bedfc1597cf2e078b53a527.jpg', '20190330\\mid_c81c8c123bedfc1597cf2e078b53a527.jpg', '20190330\\big_c81c8c123bedfc1597cf2e078b53a527.jpg');
INSERT INTO `tp_goods_photo` VALUES (26, 2, '20190330\\4d20c17aff487ffe66b69eefd89eeaf0.jpg', '20190330\\sm_4d20c17aff487ffe66b69eefd89eeaf0.jpg', '20190330\\mid_4d20c17aff487ffe66b69eefd89eeaf0.jpg', '20190330\\big_4d20c17aff487ffe66b69eefd89eeaf0.jpg');
INSERT INTO `tp_goods_photo` VALUES (24, 1, '20190330\\c0a4d8b1f6d322c9ab89f36f2c88710f.jpg', '20190330\\sm_c0a4d8b1f6d322c9ab89f36f2c88710f.jpg', '20190330\\mid_c0a4d8b1f6d322c9ab89f36f2c88710f.jpg', '20190330\\big_c0a4d8b1f6d322c9ab89f36f2c88710f.jpg');
INSERT INTO `tp_goods_photo` VALUES (23, 1, '20190330\\5ab8a476ee0faef7494d46b7adba8aa5.jpg', '20190330\\sm_5ab8a476ee0faef7494d46b7adba8aa5.jpg', '20190330\\mid_5ab8a476ee0faef7494d46b7adba8aa5.jpg', '20190330\\big_5ab8a476ee0faef7494d46b7adba8aa5.jpg');
INSERT INTO `tp_goods_photo` VALUES (22, 1, '20190330\\4a668f1ba310cd88fe5e24c0b610ed80.jpg', '20190330\\sm_4a668f1ba310cd88fe5e24c0b610ed80.jpg', '20190330\\mid_4a668f1ba310cd88fe5e24c0b610ed80.jpg', '20190330\\big_4a668f1ba310cd88fe5e24c0b610ed80.jpg');

-- ----------------------------
-- Table structure for tp_link
-- ----------------------------
DROP TABLE IF EXISTS `tp_link`;
CREATE TABLE `tp_link`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '友联ID',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `link_url` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接地址',
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接描述',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '链接类型 1：文字 2：图片',
  `sort` smallint(6) NOT NULL DEFAULT 50 COMMENT '链接排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示状态 0：启用 1：禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_link
-- ----------------------------
INSERT INTO `tp_link` VALUES (5, '搜狐网', 'http://souhu.com', '20190320\\e47663557872927742518d9ad66dd642.jpg', '搜狐网', 2, 3, 1);
INSERT INTO `tp_link` VALUES (2, '京东商城', 'http://www.jd.com', '20190320\\f7557626bf15cc78e51c9ae78faaf14c.jpg', '京东商城', 1, 55, 1);
INSERT INTO `tp_link` VALUES (3, '沥青瓦玻纤瓦油毡瓦', 'http://www.zehaojc.com', '20190320\\3c40107a825921472ac755a2a5d814dd.jpg', '沥青瓦玻纤瓦油毡瓦，沥青瓦玻纤瓦油毡瓦沥青瓦玻纤瓦油毡瓦沥青瓦玻纤瓦油毡瓦                                                                                                                   ', 2, 11, 1);
INSERT INTO `tp_link` VALUES (4, '腾讯网', 'http://www.tengxun.com', '', '腾讯网', 1, 23, 0);
INSERT INTO `tp_link` VALUES (6, '网易', 'http://wangyi.com', '20190320\\9984a67f4d18fc2e9b1041ac6cb40f9e.jpg', '网易', 1, 22, 1);
INSERT INTO `tp_link` VALUES (7, '爱奇艺', 'http://aiqiyi.com', '20190320\\b5ebc9b507e9493c54481a865cd8f826.jpg', '爱奇艺', 1, 2, 1);
INSERT INTO `tp_link` VALUES (8, '优酷网', 'http://youku.com', '20190320\\4523d128549be94811fe886466f784d9.jpg', '优酷网', 1, 34, 1);
INSERT INTO `tp_link` VALUES (9, '美图秀秀', 'http://meitu.com', '20190320\\a10bfbf89288814432c2652116a396ea.jpg', '美图秀秀', 1, 32, 1);

-- ----------------------------
-- Table structure for tp_member_level
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_level`;
CREATE TABLE `tp_member_level`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '级别名称',
  `bom_point` int(11) NOT NULL COMMENT '积分下限',
  `top_point` int(11) NOT NULL COMMENT '积分上限',
  `rate` tinyint(3) UNSIGNED NOT NULL DEFAULT 100 COMMENT '折扣率',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_member_level
-- ----------------------------
INSERT INTO `tp_member_level` VALUES (1, '注册会员', 10000, 0, 100);
INSERT INTO `tp_member_level` VALUES (2, '中级会员', 20000, 10001, 98);
INSERT INTO `tp_member_level` VALUES (3, '高级会员', 30000, 20001, 95);
INSERT INTO `tp_member_level` VALUES (6, '尊贵会员', 40000, 30001, 90);

-- ----------------------------
-- Table structure for tp_member_price
-- ----------------------------
DROP TABLE IF EXISTS `tp_member_price`;
CREATE TABLE `tp_member_price`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mprice` decimal(10, 2) NOT NULL COMMENT '会员价格',
  `mlevel_id` smallint(6) NOT NULL COMMENT '会员级别',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of tp_member_price
-- ----------------------------
INSERT INTO `tp_member_price` VALUES (37, 5400.00, 6, 2);
INSERT INTO `tp_member_price` VALUES (36, 5600.00, 3, 2);
INSERT INTO `tp_member_price` VALUES (35, 5800.00, 2, 2);
INSERT INTO `tp_member_price` VALUES (34, 6000.00, 1, 2);
INSERT INTO `tp_member_price` VALUES (33, 3000.00, 6, 1);
INSERT INTO `tp_member_price` VALUES (32, 40000.00, 3, 1);
INSERT INTO `tp_member_price` VALUES (31, 5000.00, 2, 1);
INSERT INTO `tp_member_price` VALUES (30, 6000.00, 1, 1);

-- ----------------------------
-- Table structure for tp_nav
-- ----------------------------
DROP TABLE IF EXISTS `tp_nav`;
CREATE TABLE `tp_nav`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `nav_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pos` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '50',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_nav
-- ----------------------------

-- ----------------------------
-- Table structure for tp_product
-- ----------------------------
DROP TABLE IF EXISTS `tp_product`;
CREATE TABLE `tp_product`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tp_product
-- ----------------------------

-- ----------------------------
-- Table structure for tp_recpos
-- ----------------------------
DROP TABLE IF EXISTS `tp_recpos`;
CREATE TABLE `tp_recpos`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '推荐位id',
  `rec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐位名称',
  `rec_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐位类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tp_recpos
-- ----------------------------

-- ----------------------------
-- Table structure for tp_type
-- ----------------------------
DROP TABLE IF EXISTS `tp_type`;
CREATE TABLE `tp_type`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tp_type
-- ----------------------------
INSERT INTO `tp_type` VALUES (1, '笔记本');
INSERT INTO `tp_type` VALUES (2, '手机');
INSERT INTO `tp_type` VALUES (8, '台式电脑');
INSERT INTO `tp_type` VALUES (4, '女装');
INSERT INTO `tp_type` VALUES (6, '男装秋款');
INSERT INTO `tp_type` VALUES (7, '联想电脑');

SET FOREIGN_KEY_CHECKS = 1;
