/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-04-12 14:08:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '3', '文章标题标题标题标题', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('10', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('11', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('12', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('13', '5', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('14', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('15', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('16', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('17', '7', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('18', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('19', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('2', '3', '文章标题标题标题标题', null, 'red', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('20', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('21', '8', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('22', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('23', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('24', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('25', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('26', '9', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('27', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('28', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('29', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('3', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('30', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('31', '11', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('32', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('33', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('34', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('35', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('36', '12', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('37', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('38', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('39', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('4', '3', '文章标题标题标题标题', null, 'green', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('40', '13', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('41', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('42', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('43', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('44', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('45', '14', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('46', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('47', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('48', '15', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('49', '16', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('5', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('50', '17', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('51', '17', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('52', '26', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('53', '26', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('6', '3', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('7', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('8', '4', '文章标题标题标题标题', null, 'blue', null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_article` VALUES ('9', '4', '文章标题标题标题标题', null, null, null, '关键字1,关键字2', null, '0', null, '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data`;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `content` text COLLATE utf8_bin COMMENT '文章内容',
  `copyfrom` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章详表';

-- ----------------------------
-- Records of cms_article_data
-- ----------------------------
INSERT INTO `cms_article_data` VALUES ('1', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('10', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('11', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('12', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('13', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('14', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('15', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('16', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('17', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('18', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('19', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('2', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('20', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('21', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('22', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('23', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('24', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('25', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('26', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('27', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('28', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('29', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('3', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('30', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('31', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('32', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('33', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('34', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('35', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('36', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('37', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('38', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('39', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('4', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('40', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('41', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('42', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('43', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('44', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('45', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('46', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('47', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('48', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('49', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('5', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('50', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('51', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('52', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('53', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('6', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('7', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('8', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');
INSERT INTO `cms_article_data` VALUES ('9', 0xE69687E7ABA0E58685E5AEB9E58685E5AEB9E58685E5AEB9E58685E5AEB9, '来源', '1,2,3', '1');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) COLLATE utf8_bin DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
  `target` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COLLATE utf8_bin COMMENT '视图配置',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '0', '0,', '0', '1', null, '顶级栏目', null, null, null, null, null, '0', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('10', '1', '0,1,', '1', '4', 'article', '软件介绍', null, null, null, null, null, '20', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('11', '10', '0,1,10,', '1', '4', 'article', '网络工具', null, null, null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('12', '10', '0,1,10,', '1', '4', 'article', '浏览工具', null, null, null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('13', '10', '0,1,10,', '1', '4', 'article', '浏览辅助', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('14', '10', '0,1,10,', '1', '4', 'article', '网络优化', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('15', '10', '0,1,10,', '1', '4', 'article', '邮件处理', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('16', '10', '0,1,10,', '1', '4', 'article', '下载工具', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('17', '10', '0,1,10,', '1', '4', 'article', '搜索工具', null, null, null, null, null, '50', '1', '1', '2', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('18', '1', '0,1,', '1', '5', 'link', '友情链接', null, null, null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('19', '18', '0,1,18,', '1', '5', 'link', '常用网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('2', '1', '0,1,', '1', '3', 'article', '组织机构', null, null, null, null, null, '10', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('20', '18', '0,1,18,', '1', '5', 'link', '门户网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('21', '18', '0,1,18,', '1', '5', 'link', '购物网站', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('22', '18', '0,1,18,', '1', '5', 'link', '交友社区', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('23', '18', '0,1,18,', '1', '5', 'link', '音乐视频', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('24', '1', '0,1,', '1', '6', null, '百度一下', null, 'http://www.baidu.com', '_blank', null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `cms_category` VALUES ('25', '1', '0,1,', '1', '6', null, '全文检索', null, '/search', null, null, null, '90', '0', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('26', '1', '0,1,', '2', '6', 'article', '测试栏目', null, null, null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('27', '1', '0,1,', '1', '6', null, '公共留言', null, '/guestbook', null, null, null, '90', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('3', '2', '0,1,2,', '1', '3', 'article', '网站简介', null, null, null, null, null, '30', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('4', '2', '0,1,2,', '1', '3', 'article', '内部机构', null, null, null, null, null, '40', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('5', '2', '0,1,2,', '1', '3', 'article', '地方机构', null, null, null, null, null, '50', '1', '1', '0', '0', '1', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('6', '1', '0,1,', '1', '3', 'article', '质量检验', null, null, null, null, null, '20', '1', '1', '1', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('7', '6', '0,1,6,', '1', '3', 'article', '产品质量', null, null, null, null, null, '30', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('8', '6', '0,1,6,', '1', '3', 'article', '技术质量', null, null, null, null, null, '40', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_category` VALUES ('9', '6', '0,1,6,', '1', '3', 'article', '工程质量', null, null, null, null, null, '50', '1', '1', '0', '1', '0', null, null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

-- ----------------------------
-- Records of cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '留言分类',
  `content` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '留言内容',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
  `email` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
  `phone` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '电话',
  `workunit` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '单位',
  `ip` varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `category_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
  `title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '链接名称',
  `color` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='友情链接';

-- ----------------------------
-- Records of cms_link
-- ----------------------------
INSERT INTO `cms_link` VALUES ('1', '19', 'JeeSite', null, null, 'http://thinkgem.github.com/jeesite', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('10', '22', '58同城', null, null, 'http://www.58.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('11', '23', '视频大全', null, null, 'http://v.360.cn/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('12', '23', '凤凰网', null, null, 'http://www.ifeng.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('2', '19', 'ThinkGem', null, null, 'http://thinkgem.iteye.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('3', '19', '百度一下', null, null, 'http://www.baidu.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('4', '19', '谷歌搜索', null, null, 'http://www.google.com', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('5', '20', '新浪网', null, null, 'http://www.sina.com.cn', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('6', '20', '腾讯网', null, null, 'http://www.qq.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('7', '21', '淘宝网', null, null, 'http://www.taobao.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('8', '21', '新华网', null, null, 'http://www.xinhuanet.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_link` VALUES ('9', '22', '赶集网', null, null, 'http://www.ganji.com/', '0', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for cms_site
-- ----------------------------
DROP TABLE IF EXISTS `cms_site`;
CREATE TABLE `cms_site` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
  `title` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点标题',
  `logo` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) COLLATE utf8_bin DEFAULT 'default' COMMENT '主题',
  `copyright` text COLLATE utf8_bin COMMENT '版权信息',
  `custom_index_view` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点表';

-- ----------------------------
-- Records of cms_site
-- ----------------------------
INSERT INTO `cms_site` VALUES ('1', '默认站点', 'JeeSite Web', null, null, 'JeeSite', 'JeeSite', 'basic', 0x436F707972696768742026636F70793B20323031322D32303133203C6120687265663D27687474703A2F2F7468696E6B67656D2E69746579652E636F6D27207461726765743D275F626C616E6B273E5468696E6B47656D3C2F613E202D20506F7765726564204279203C6120687265663D2768747470733A2F2F6769746875622E636F6D2F7468696E6B67656D2F6A65657369746527207461726765743D275F626C616E6B273E4A6565536974653C2F613E2056312E30, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `cms_site` VALUES ('2', '子站点测试', 'JeeSite Subsite', null, null, 'JeeSite subsite', 'JeeSite subsite', 'basic', 0x436F707972696768742026636F70793B20323031322D32303133203C6120687265663D27687474703A2F2F7468696E6B67656D2E69746579652E636F6D27207461726765743D275F626C616E6B273E5468696E6B47656D3C2F613E202D20506F7765726564204279203C6120687265663D2768747470733A2F2F6769746875622E636F6D2F7468696E6B67656D2F6A65657369746527207461726765743D275F626C616E6B273E4A6565536974653C2F613E2056312E30, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
