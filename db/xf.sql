/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : xf

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-23 18:16:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_scheme
-- ----------------------------
DROP TABLE IF EXISTS `gen_scheme`;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

-- ----------------------------
-- Records of gen_scheme
-- ----------------------------
INSERT INTO `gen_scheme` VALUES ('5fd1d4dc2d1947408424369274f6c9c6', '单位表', 'curd', 'com.xl.modules', 'sys', '', '单位管理', '单位管理', 'rishi', 'e420a518a0ba4db899857614d130835e', 's1', '2017-11-16 17:21:43', 's1', '2017-11-16 17:42:04', '', '0');
INSERT INTO `gen_scheme` VALUES ('dfd678176f6c4323bccfc5393d1c23b6', 'sys_user', 'curd', 'com.xl.modules', 'user', '', 'sys', 'user', 'rishi', '1045d5693efb4f63ba32364c2e8cd8c4', 's1', '2017-11-10 19:10:03', 's1', '2017-11-10 19:57:31', '', '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1045d5693efb4f63ba32364c2e8cd8c4', 'sys_user', '用户表', 'SysUser', '', '', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', '', '0');
INSERT INTO `gen_table` VALUES ('e420a518a0ba4db899857614d130835e', 'sys_unit', '单位表', 'Unit', '', '', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', '', '0');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('01fdaf7a6b4a4b6396456b444d9ae4f6', '1045d5693efb4f63ba32364c2e8cd8c4', 'phone', '电话', 'varchar(200)', 'String', 'phone', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '90', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('020914bb51c540ee995f5a546cf8fd1b', 'e420a518a0ba4db899857614d130835e', 'longitude', '经度', 'double(20,6)', 'String', 'longitude', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '90', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('031c44343ac84616bac9b9dfc136e895', 'e420a518a0ba4db899857614d130835e', 'office_id', '所属机构', 'varchar(64)', 'com.xl.modules.sys.entity.Office', 'office.id|name', '0', '1', '1', '1', '0', '0', '=', 'officeselect', '', null, '190', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('052fbcea50cc425ca939407d7036f5c6', 'e420a518a0ba4db899857614d130835e', 'update_by', '更新者', 'varchar(64)', 'com.xl.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '220', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('0ca9ac6fb3f64199b974678618f35ff5', 'e420a518a0ba4db899857614d130835e', 'code', '编码', 'varchar(100)', 'String', 'code', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '70', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('1158fd7ef9de4e5280ae08c46e85369e', '1045d5693efb4f63ba32364c2e8cd8c4', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '190', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('15933f93eecd4647ad0879278c355360', '1045d5693efb4f63ba32364c2e8cd8c4', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '200', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('20239345064a4004a1ed3e49acefb028', '1045d5693efb4f63ba32364c2e8cd8c4', 'mobile', '手机', 'varchar(200)', 'String', 'mobile', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '100', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('209a624111c145758e1b8a63ad61ae37', 'e420a518a0ba4db899857614d130835e', 'latitude', '纬度', 'double(20,6)', 'String', 'latitude', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '100', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('2e297b105e0742ab84167348e4191388', 'e420a518a0ba4db899857614d130835e', 'usable', '是否启用', 'varchar(64)', 'String', 'usable', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '170', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('2fb94f152cac49b9913f0c535726e9e2', '1045d5693efb4f63ba32364c2e8cd8c4', 'office_id', '归属部门', 'varchar(64)', 'com.xl.modules.sys.entity.Office', 'office.id|name', '0', '0', '1', '1', '0', '0', '=', 'officeselect', '', null, '30', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('4a85dd949d42472fbb250f9a5e6947d5', '1045d5693efb4f63ba32364c2e8cd8c4', 'email', '邮箱', 'varchar(200)', 'String', 'email', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '80', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('523fe843b64e45c4992e045d2bab6119', 'e420a518a0ba4db899857614d130835e', 'parent_id', '父级编号', 'varchar(64)', 'This', 'parent.id|name', '0', '0', '1', '1', '0', '0', '=', 'treeselect', '', null, '20', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('55c3873ca99041c08e89ea8174f52439', 'e420a518a0ba4db899857614d130835e', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('59297ed3e0e142088094680f02cdce89', 'e420a518a0ba4db899857614d130835e', 'email', '邮箱', 'varchar(200)', 'String', 'email', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '160', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('598831a189c842bd98261a33b344ef65', '1045d5693efb4f63ba32364c2e8cd8c4', 'login_flag', '是否可登录', 'varchar(64)', 'String', 'loginFlag', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '150', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('5c243c8cd1a6465487c1103ea72d4baf', '1045d5693efb4f63ba32364c2e8cd8c4', 'no', '工号', 'varchar(100)', 'String', 'no', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '60', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('6142116e5bd9410287aeb11854ecc055', '1045d5693efb4f63ba32364c2e8cd8c4', 'id', '编号', 'varchar(64)', 'String', 'id', '1', '0', '1', '0', '0', '0', '=', 'input', '', null, '10', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('673dec9610484b0fad00cfe2ef3a9b2c', 'e420a518a0ba4db899857614d130835e', 'fax', '传真', 'varchar(200)', 'String', 'fax', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '150', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('7b91184b7d2d48e5872f8459a2c992d1', 'e420a518a0ba4db899857614d130835e', 'point', '经纬度', 'varchar(100)', 'String', 'point', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '110', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('7ca06bdd6fbb475a8fffb11040ab1c6e', '1045d5693efb4f63ba32364c2e8cd8c4', 'login_date', '最后登陆时间', 'datetime', 'java.util.Date', 'loginDate', '0', '1', '1', '1', '0', '0', '=', 'dateselect', '', null, '140', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('92adecef414e4d84b9cd59b350dea89d', '1045d5693efb4f63ba32364c2e8cd8c4', 'update_by', '更新者', 'varchar(64)', 'com.xl.modules.sys.entity.User', 'updateBy.id', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '180', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('98875f801d1a4026b8d3969f2fab6dda', 'e420a518a0ba4db899857614d130835e', 'remarks', '备注信息', 'varchar(255)', 'String', 'remarks', '0', '1', '1', '1', '1', '0', '=', 'textarea', '', null, '240', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('a1572b6101cd4872a5994e5c0d696fae', '1045d5693efb4f63ba32364c2e8cd8c4', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '170', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('a232425e10b24a738befc634c32cbbd3', '1045d5693efb4f63ba32364c2e8cd8c4', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '210', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('ac21266194ce4f739180735e1eb51d60', 'e420a518a0ba4db899857614d130835e', 'name', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', '', null, '40', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('adbe75e1ca734d9cbd697d7ece446173', 'e420a518a0ba4db899857614d130835e', 'address', '联系地址', 'varchar(255)', 'String', 'address', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '80', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('af337a8be33b4ffb9fe762c70284263f', 'e420a518a0ba4db899857614d130835e', 'zip_code', '邮政编码', 'varchar(100)', 'String', 'zipCode', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '120', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('b0d2b1ffa20446e7b257e209ae25e533', '1045d5693efb4f63ba32364c2e8cd8c4', 'name', '姓名', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', 'like', 'input', '', null, '70', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('b3bb704d2a364ed28e28d2e4c54d881c', '1045d5693efb4f63ba32364c2e8cd8c4', 'photo', '用户头像', 'varchar(1000)', 'String', 'photo', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '120', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('b4971153b6ee4f4eb5fd178388975e65', 'e420a518a0ba4db899857614d130835e', 'create_by', '创建者', 'varchar(64)', 'com.xl.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '200', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('b96db2ed233845b5870a9f3891e37dea', '1045d5693efb4f63ba32364c2e8cd8c4', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '50', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('ba8203fc0f944722886deb43e210a305', 'e420a518a0ba4db899857614d130835e', 'phone', '电话', 'varchar(200)', 'String', 'phone', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '140', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('c0423829c5eb4c30a11e2a349fc4c7e3', '1045d5693efb4f63ba32364c2e8cd8c4', 'user_type', '用户类型', 'char(1)', 'String', 'userType', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '110', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('c0df7910d4254e0988b5f7046da1c388', '1045d5693efb4f63ba32364c2e8cd8c4', 'create_by', '创建者', 'varchar(64)', 'com.xl.modules.sys.entity.User', 'createBy.id', '0', '0', '1', '0', '0', '0', '=', 'input', '', null, '160', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('c29ccb9fc2924abf96dd8a75a2166f8f', '1045d5693efb4f63ba32364c2e8cd8c4', 'company_id', '归属公司', 'varchar(64)', 'String', 'companyId', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '20', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('c2aa3000b4c049f68a886bfb85196ffc', 'e420a518a0ba4db899857614d130835e', 'sort', '排序', 'decimal(10,0)', 'String', 'sort', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '50', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('c53eb243cc094eada9e7946e98392261', 'e420a518a0ba4db899857614d130835e', 'del_flag', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '0', '0', '0', '=', 'radiobox', 'del_flag', null, '250', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('e665c168a2ed4e7e8498ec967b4a2a59', 'e420a518a0ba4db899857614d130835e', 'area_id', '归属区域', 'varchar(64)', 'com.xl.modules.sys.entity.Area', 'area.id|name', '0', '0', '1', '1', '0', '0', '=', 'areaselect', '', null, '60', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('e6a070f9205242e9838e4ce805c60ac2', 'e420a518a0ba4db899857614d130835e', 'parent_ids', '所有父级编号', 'varchar(2000)', 'String', 'parentIds', '0', '0', '1', '1', '0', '0', 'like', 'input', '', null, '30', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('e923e26c830f434199da4c83083046fa', '1045d5693efb4f63ba32364c2e8cd8c4', 'login_name', '登录名', 'varchar(100)', 'String', 'loginName', '0', '0', '1', '1', '0', '0', '=', 'input', '', null, '40', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('eae18f2de4d640a3ae661cdd1eb24542', 'e420a518a0ba4db899857614d130835e', 'master', '负责人', 'varchar(100)', 'String', 'master', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '130', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('ec45fe4d6fc54735a0ed7871da82e2c6', 'e420a518a0ba4db899857614d130835e', 'industry', '所属行业', 'varchar(64)', 'String', 'industry', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '180', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('f20811c9927641de870817a869988b91', 'e420a518a0ba4db899857614d130835e', 'update_date', '更新时间', 'datetime', 'java.util.Date', 'updateDate', '0', '0', '1', '1', '1', '0', '=', 'dateselect', '', null, '230', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');
INSERT INTO `gen_table_column` VALUES ('f385ffd190b9497f85b6cd209522b7ba', '1045d5693efb4f63ba32364c2e8cd8c4', 'login_ip', '最后登陆IP', 'varchar(100)', 'String', 'loginIp', '0', '1', '1', '1', '0', '0', '=', 'input', '', null, '130', 's1', '2017-11-10 19:09:31', 's1', '2017-11-10 19:09:31', null, '0');
INSERT INTO `gen_table_column` VALUES ('f9600184dc0d47589fdcc2168009a704', 'e420a518a0ba4db899857614d130835e', 'create_date', '创建时间', 'datetime', 'java.util.Date', 'createDate', '0', '0', '1', '0', '0', '0', '=', 'dateselect', '', null, '210', 's1', '2017-11-16 17:20:08', 's1', '2017-11-16 17:20:08', null, '0');

-- ----------------------------
-- Table structure for gen_template
-- ----------------------------
DROP TABLE IF EXISTS `gen_template`;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

-- ----------------------------
-- Records of gen_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '1', '100000', '1', 's1', '2017-11-10 16:42:56', 's1', '2017-11-10 16:42:56', '', '0');
INSERT INTO `sys_area` VALUES ('10', '1', '0,1,', '上海市', '10', '310000', '2', 's1', '2017-11-10 16:42:56', 's1', '2017-11-10 16:42:56', '', '0');
INSERT INTO `sys_area` VALUES ('100', '9', '0,1,9,', '鹤岗市', '100', '230400', '3', 's1', '2017-11-10 16:42:56', 's1', '2017-11-10 16:42:56', '', '0');
INSERT INTO `sys_area` VALUES ('1000', '102', '0,1,9,102,', '红岗区', '1000', '230605', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1001', '102', '0,1,9,102,', '大同区', '1001', '230606', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1002', '102', '0,1,9,102,', '肇州县', '1002', '230621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1003', '102', '0,1,9,102,', '肇源县', '1003', '230622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1004', '102', '0,1,9,102,', '林甸县', '1004', '230623', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1005', '102', '0,1,9,102,', '杜尔伯特蒙古族自治县', '1005', '230624', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1006', '103', '0,1,9,103,', '伊春区', '1006', '230702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1007', '103', '0,1,9,103,', '南岔区', '1007', '230703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1008', '103', '0,1,9,103,', '友好区', '1008', '230704', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1009', '103', '0,1,9,103,', '西林区', '1009', '230705', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('101', '9', '0,1,9,', '双鸭山市', '101', '230500', '3', 's1', '2017-11-10 16:42:56', 's1', '2017-11-10 16:42:56', '', '0');
INSERT INTO `sys_area` VALUES ('1010', '103', '0,1,9,103,', '翠峦区', '1010', '230706', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1011', '103', '0,1,9,103,', '新青区', '1011', '230707', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1012', '103', '0,1,9,103,', '美溪区', '1012', '230708', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1013', '103', '0,1,9,103,', '金山屯区', '1013', '230709', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1014', '103', '0,1,9,103,', '五营区', '1014', '230710', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1015', '103', '0,1,9,103,', '乌马河区', '1015', '230711', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1016', '103', '0,1,9,103,', '汤旺河区', '1016', '230712', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1017', '103', '0,1,9,103,', '带岭区', '1017', '230713', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1018', '103', '0,1,9,103,', '乌伊岭区', '1018', '230714', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1019', '103', '0,1,9,103,', '红星区', '1019', '230715', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('102', '9', '0,1,9,', '大庆市', '102', '230600', '3', 's1', '2017-11-10 16:42:57', 's1', '2017-11-10 16:42:57', '', '0');
INSERT INTO `sys_area` VALUES ('1020', '103', '0,1,9,103,', '上甘岭区', '1020', '230716', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1021', '103', '0,1,9,103,', '嘉荫县', '1021', '230722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1022', '103', '0,1,9,103,', '铁力市', '1022', '230781', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1023', '104', '0,1,9,104,', '前进区', '1023', '230804', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1024', '104', '0,1,9,104,', '东风区', '1024', '230805', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1025', '104', '0,1,9,104,', '桦南县', '1025', '230822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1026', '104', '0,1,9,104,', '桦川县', '1026', '230826', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1027', '104', '0,1,9,104,', '汤原县', '1027', '230828', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1028', '104', '0,1,9,104,', '抚远县', '1028', '230833', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1029', '104', '0,1,9,104,', '同江市', '1029', '230881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('103', '9', '0,1,9,', '伊春市', '103', '230700', '3', 's1', '2017-11-10 16:42:57', 's1', '2017-11-10 16:42:57', '', '0');
INSERT INTO `sys_area` VALUES ('1030', '104', '0,1,9,104,', '富锦市', '1030', '230882', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1031', '105', '0,1,9,105,', '新兴区', '1031', '230902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1032', '105', '0,1,9,105,', '桃山区', '1032', '230903', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1033', '105', '0,1,9,105,', '茄子河区', '1033', '230904', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1034', '105', '0,1,9,105,', '勃利县', '1034', '230921', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1035', '106', '0,1,9,106,', '东安区', '1035', '231002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1036', '106', '0,1,9,106,', '阳明区', '1036', '231003', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1037', '106', '0,1,9,106,', '爱民区', '1037', '231004', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1038', '106', '0,1,9,106,', '东宁县', '1038', '231024', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1039', '106', '0,1,9,106,', '林口县', '1039', '231025', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('104', '9', '0,1,9,', '佳木斯市', '104', '230800', '3', 's1', '2017-11-10 16:42:57', 's1', '2017-11-10 16:42:57', '', '0');
INSERT INTO `sys_area` VALUES ('1040', '106', '0,1,9,106,', '绥芬河市', '1040', '231081', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1041', '106', '0,1,9,106,', '海林市', '1041', '231083', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1042', '106', '0,1,9,106,', '宁安市', '1042', '231084', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1043', '106', '0,1,9,106,', '穆棱市', '1043', '231085', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1044', '107', '0,1,9,107,', '爱辉区', '1044', '231102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1045', '107', '0,1,9,107,', '嫩江县', '1045', '231121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1046', '107', '0,1,9,107,', '逊克县', '1046', '231123', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1047', '107', '0,1,9,107,', '孙吴县', '1047', '231124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1048', '107', '0,1,9,107,', '北安市', '1048', '231181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1049', '107', '0,1,9,107,', '五大连池市', '1049', '231182', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('105', '9', '0,1,9,', '七台河市', '105', '230900', '3', 's1', '2017-11-10 16:42:58', 's1', '2017-11-10 16:42:58', '', '0');
INSERT INTO `sys_area` VALUES ('1050', '108', '0,1,9,108,', '北林区', '1050', '231202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1051', '108', '0,1,9,108,', '望奎县', '1051', '231221', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1052', '108', '0,1,9,108,', '兰西县', '1052', '231222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1053', '108', '0,1,9,108,', '青冈县', '1053', '231223', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1054', '108', '0,1,9,108,', '庆安县', '1054', '231224', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1055', '108', '0,1,9,108,', '明水县', '1055', '231225', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1056', '108', '0,1,9,108,', '绥棱县', '1056', '231226', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1057', '108', '0,1,9,108,', '安达市', '1057', '231281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1058', '108', '0,1,9,108,', '肇东市', '1058', '231282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1059', '108', '0,1,9,108,', '海伦市', '1059', '231283', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('106', '9', '0,1,9,', '牡丹江市', '106', '231000', '3', 's1', '2017-11-10 16:42:58', 's1', '2017-11-10 16:42:58', '', '0');
INSERT INTO `sys_area` VALUES ('1060', '109', '0,1,9,109,', '呼玛县', '1060', '232721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1061', '109', '0,1,9,109,', '塔河县', '1061', '232722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1062', '109', '0,1,9,109,', '漠河县', '1062', '232723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1063', '110', '0,1,10,110,', '黄浦区', '1063', '310101', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1064', '110', '0,1,10,110,', '徐汇区', '1064', '310104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1065', '110', '0,1,10,110,', '长宁区', '1065', '310105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1066', '110', '0,1,10,110,', '静安区', '1066', '310106', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1067', '110', '0,1,10,110,', '普陀区', '1067', '310107', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1068', '110', '0,1,10,110,', '闸北区', '1068', '310108', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1069', '110', '0,1,10,110,', '虹口区', '1069', '310109', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('107', '9', '0,1,9,', '黑河市', '107', '231100', '3', 's1', '2017-11-10 16:42:58', 's1', '2017-11-10 16:42:58', '', '0');
INSERT INTO `sys_area` VALUES ('1070', '110', '0,1,10,110,', '杨浦区', '1070', '310110', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1071', '110', '0,1,10,110,', '闵行区', '1071', '310112', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1072', '110', '0,1,10,110,', '嘉定区', '1072', '310114', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1073', '110', '0,1,10,110,', '浦东新区', '1073', '310115', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1074', '110', '0,1,10,110,', '金山区', '1074', '310116', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1075', '110', '0,1,10,110,', '松江区', '1075', '310117', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1076', '110', '0,1,10,110,', '青浦区', '1076', '310118', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1077', '110', '0,1,10,110,', '奉贤区', '1077', '310120', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1078', '111', '0,1,10,111,', '崇明县', '1078', '310230', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1079', '112', '0,1,11,112,', '玄武区', '1079', '320102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('108', '9', '0,1,9,', '绥化市', '108', '231200', '3', 's1', '2017-11-10 16:42:59', 's1', '2017-11-10 16:42:59', '', '0');
INSERT INTO `sys_area` VALUES ('1080', '112', '0,1,11,112,', '秦淮区', '1080', '320104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1081', '112', '0,1,11,112,', '建邺区', '1081', '320105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1082', '112', '0,1,11,112,', '鼓楼区', '1082', '320106', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1083', '112', '0,1,11,112,', '浦口区', '1083', '320111', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1084', '112', '0,1,11,112,', '栖霞区', '1084', '320113', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1085', '112', '0,1,11,112,', '雨花台区', '1085', '320114', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1086', '112', '0,1,11,112,', '江宁区', '1086', '320115', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1087', '112', '0,1,11,112,', '六合区', '1087', '320116', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1088', '112', '0,1,11,112,', '溧水区', '1088', '320117', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1089', '112', '0,1,11,112,', '高淳区', '1089', '320118', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('109', '9', '0,1,9,', '大兴安岭地区', '109', '232700', '3', 's1', '2017-11-10 16:42:59', 's1', '2017-11-10 16:42:59', '', '0');
INSERT INTO `sys_area` VALUES ('1090', '113', '0,1,11,113,', '崇安区', '1090', '320202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1091', '113', '0,1,11,113,', '南长区', '1091', '320203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1092', '113', '0,1,11,113,', '北塘区', '1092', '320204', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1093', '113', '0,1,11,113,', '锡山区', '1093', '320205', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1094', '113', '0,1,11,113,', '惠山区', '1094', '320206', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1095', '113', '0,1,11,113,', '滨湖区', '1095', '320211', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1096', '113', '0,1,11,113,', '江阴市', '1096', '320281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1097', '113', '0,1,11,113,', '宜兴市', '1097', '320282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1098', '114', '0,1,11,114,', '云龙区', '1098', '320303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1099', '114', '0,1,11,114,', '贾汪区', '1099', '320305', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('11', '1', '0,1,', '江苏省', '11', '320000', '2', 's1', '2017-11-10 16:42:59', 's1', '2017-11-10 16:42:59', '', '0');
INSERT INTO `sys_area` VALUES ('110', '10', '0,1,10,', '上海市', '110', '310100', '3', 's1', '2017-11-10 16:42:59', 's1', '2017-11-10 16:42:59', '', '0');
INSERT INTO `sys_area` VALUES ('1100', '114', '0,1,11,114,', '泉山区', '1100', '320311', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1101', '114', '0,1,11,114,', '铜山区', '1101', '320312', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1102', '114', '0,1,11,114,', '丰县', '1102', '320321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1103', '114', '0,1,11,114,', '沛县', '1103', '320322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1104', '114', '0,1,11,114,', '睢宁县', '1104', '320324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1105', '114', '0,1,11,114,', '新沂市', '1105', '320381', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1106', '114', '0,1,11,114,', '邳州市', '1106', '320382', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1107', '115', '0,1,11,115,', '天宁区', '1107', '320402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1108', '115', '0,1,11,115,', '钟楼区', '1108', '320404', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1109', '115', '0,1,11,115,', '戚墅堰区', '1109', '320405', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('111', '10', '0,1,10,', '上海县', '111', '310200', '3', 's1', '2017-11-10 16:43:00', 's1', '2017-11-10 16:43:00', '', '0');
INSERT INTO `sys_area` VALUES ('1110', '115', '0,1,11,115,', '新北区', '1110', '320411', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1111', '115', '0,1,11,115,', '武进区', '1111', '320412', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1112', '115', '0,1,11,115,', '溧阳市', '1112', '320481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1113', '115', '0,1,11,115,', '金坛市', '1113', '320482', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1114', '116', '0,1,11,116,', '虎丘区', '1114', '320505', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1115', '116', '0,1,11,116,', '吴中区', '1115', '320506', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1116', '116', '0,1,11,116,', '相城区', '1116', '320507', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1117', '116', '0,1,11,116,', '姑苏区', '1117', '320508', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1118', '116', '0,1,11,116,', '吴江区', '1118', '320509', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1119', '116', '0,1,11,116,', '常熟市', '1119', '320581', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('112', '11', '0,1,11,', '南京市', '112', '320100', '3', 's1', '2017-11-10 16:43:00', 's1', '2017-11-10 16:43:00', '', '0');
INSERT INTO `sys_area` VALUES ('1120', '116', '0,1,11,116,', '张家港市', '1120', '320582', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1121', '116', '0,1,11,116,', '昆山市', '1121', '320583', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1122', '116', '0,1,11,116,', '太仓市', '1122', '320585', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1123', '117', '0,1,11,117,', '崇川区', '1123', '320602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1124', '117', '0,1,11,117,', '港闸区', '1124', '320611', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1125', '117', '0,1,11,117,', '通州区', '1125', '320612', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1126', '117', '0,1,11,117,', '海安县', '1126', '320621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1127', '117', '0,1,11,117,', '如东县', '1127', '320623', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1128', '117', '0,1,11,117,', '启东市', '1128', '320681', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1129', '117', '0,1,11,117,', '如皋市', '1129', '320682', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('113', '11', '0,1,11,', '无锡市', '113', '320200', '3', 's1', '2017-11-10 16:43:00', 's1', '2017-11-10 16:43:00', '', '0');
INSERT INTO `sys_area` VALUES ('1130', '117', '0,1,11,117,', '海门市', '1130', '320684', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1131', '118', '0,1,11,118,', '连云区', '1131', '320703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1132', '118', '0,1,11,118,', '赣榆区', '1132', '320707', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1133', '118', '0,1,11,118,', '东海县', '1133', '320722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1134', '118', '0,1,11,118,', '灌云县', '1134', '320723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1135', '118', '0,1,11,118,', '灌南县', '1135', '320724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1136', '119', '0,1,11,119,', '淮安区', '1136', '320803', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1137', '119', '0,1,11,119,', '淮阴区', '1137', '320804', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1138', '119', '0,1,11,119,', '清浦区', '1138', '320811', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1139', '119', '0,1,11,119,', '涟水县', '1139', '320826', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('114', '11', '0,1,11,', '徐州市', '114', '320300', '3', 's1', '2017-11-10 16:43:01', 's1', '2017-11-10 16:43:01', '', '0');
INSERT INTO `sys_area` VALUES ('1140', '119', '0,1,11,119,', '洪泽县', '1140', '320829', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1141', '119', '0,1,11,119,', '盱眙县', '1141', '320830', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1142', '119', '0,1,11,119,', '金湖县', '1142', '320831', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1143', '120', '0,1,11,120,', '亭湖区', '1143', '320902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1144', '120', '0,1,11,120,', '盐都区', '1144', '320903', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1145', '120', '0,1,11,120,', '响水县', '1145', '320921', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1146', '120', '0,1,11,120,', '滨海县', '1146', '320922', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1147', '120', '0,1,11,120,', '阜宁县', '1147', '320923', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1148', '120', '0,1,11,120,', '射阳县', '1148', '320924', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1149', '120', '0,1,11,120,', '建湖县', '1149', '320925', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('115', '11', '0,1,11,', '常州市', '115', '320400', '3', 's1', '2017-11-10 16:43:01', 's1', '2017-11-10 16:43:01', '', '0');
INSERT INTO `sys_area` VALUES ('1150', '120', '0,1,11,120,', '东台市', '1150', '320981', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1151', '120', '0,1,11,120,', '大丰市', '1151', '320982', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1152', '121', '0,1,11,121,', '广陵区', '1152', '321002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1153', '121', '0,1,11,121,', '邗江区', '1153', '321003', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1154', '121', '0,1,11,121,', '江都区', '1154', '321012', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1155', '121', '0,1,11,121,', '宝应县', '1155', '321023', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1156', '121', '0,1,11,121,', '仪征市', '1156', '321081', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1157', '121', '0,1,11,121,', '高邮市', '1157', '321084', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1158', '122', '0,1,11,122,', '京口区', '1158', '321102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1159', '122', '0,1,11,122,', '润州区', '1159', '321111', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('116', '11', '0,1,11,', '苏州市', '116', '320500', '3', 's1', '2017-11-10 16:43:01', 's1', '2017-11-10 16:43:01', '', '0');
INSERT INTO `sys_area` VALUES ('1160', '122', '0,1,11,122,', '丹徒区', '1160', '321112', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1161', '122', '0,1,11,122,', '丹阳市', '1161', '321181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1162', '122', '0,1,11,122,', '扬中市', '1162', '321182', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1163', '122', '0,1,11,122,', '句容市', '1163', '321183', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1164', '123', '0,1,11,123,', '海陵区', '1164', '321202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1165', '123', '0,1,11,123,', '高港区', '1165', '321203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1166', '123', '0,1,11,123,', '姜堰区', '1166', '321204', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1167', '123', '0,1,11,123,', '兴化市', '1167', '321281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1168', '123', '0,1,11,123,', '靖江市', '1168', '321282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1169', '123', '0,1,11,123,', '泰兴市', '1169', '321283', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('117', '11', '0,1,11,', '南通市', '117', '320600', '3', 's1', '2017-11-10 16:43:02', 's1', '2017-11-10 16:43:02', '', '0');
INSERT INTO `sys_area` VALUES ('1170', '124', '0,1,11,124,', '宿城区', '1170', '321302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1171', '124', '0,1,11,124,', '宿豫区', '1171', '321311', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1172', '124', '0,1,11,124,', '沭阳县', '1172', '321322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1173', '124', '0,1,11,124,', '泗阳县', '1173', '321323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1174', '124', '0,1,11,124,', '泗洪县', '1174', '321324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1175', '125', '0,1,12,125,', '上城区', '1175', '330102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1176', '125', '0,1,12,125,', '下城区', '1176', '330103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1177', '125', '0,1,12,125,', '江干区', '1177', '330104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1178', '125', '0,1,12,125,', '拱墅区', '1178', '330105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1179', '125', '0,1,12,125,', '西湖区', '1179', '330106', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('118', '11', '0,1,11,', '连云港市', '118', '320700', '3', 's1', '2017-11-10 16:43:02', 's1', '2017-11-10 16:43:02', '', '0');
INSERT INTO `sys_area` VALUES ('1180', '125', '0,1,12,125,', '滨江区', '1180', '330108', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1181', '125', '0,1,12,125,', '萧山区', '1181', '330109', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1182', '125', '0,1,12,125,', '余杭区', '1182', '330110', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1183', '125', '0,1,12,125,', '桐庐县', '1183', '330122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1184', '125', '0,1,12,125,', '淳安县', '1184', '330127', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1185', '125', '0,1,12,125,', '建德市', '1185', '330182', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1186', '125', '0,1,12,125,', '富阳市', '1186', '330183', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1187', '125', '0,1,12,125,', '临安市', '1187', '330185', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1188', '126', '0,1,12,126,', '海曙区', '1188', '330203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1189', '126', '0,1,12,126,', '江东区', '1189', '330204', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('119', '11', '0,1,11,', '淮安市', '119', '320800', '3', 's1', '2017-11-10 16:43:02', 's1', '2017-11-10 16:43:02', '', '0');
INSERT INTO `sys_area` VALUES ('1190', '126', '0,1,12,126,', '江北区', '1190', '330205', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1191', '126', '0,1,12,126,', '北仑区', '1191', '330206', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1192', '126', '0,1,12,126,', '镇海区', '1192', '330211', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1193', '126', '0,1,12,126,', '鄞州区', '1193', '330212', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1194', '126', '0,1,12,126,', '象山县', '1194', '330225', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1195', '126', '0,1,12,126,', '宁海县', '1195', '330226', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1196', '126', '0,1,12,126,', '余姚市', '1196', '330281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1197', '126', '0,1,12,126,', '慈溪市', '1197', '330282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1198', '126', '0,1,12,126,', '奉化市', '1198', '330283', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1199', '127', '0,1,12,127,', '鹿城区', '1199', '330302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('12', '1', '0,1,', '浙江省', '12', '330000', '2', 's1', '2017-11-10 16:43:03', 's1', '2017-11-10 16:43:03', '', '0');
INSERT INTO `sys_area` VALUES ('120', '11', '0,1,11,', '盐城市', '120', '320900', '3', 's1', '2017-11-10 16:43:03', 's1', '2017-11-10 16:43:03', '', '0');
INSERT INTO `sys_area` VALUES ('1200', '127', '0,1,12,127,', '龙湾区', '1200', '330303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1201', '127', '0,1,12,127,', '瓯海区', '1201', '330304', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1202', '127', '0,1,12,127,', '洞头县', '1202', '330322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1203', '127', '0,1,12,127,', '永嘉县', '1203', '330324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1204', '127', '0,1,12,127,', '平阳县', '1204', '330326', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1205', '127', '0,1,12,127,', '苍南县', '1205', '330327', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1206', '127', '0,1,12,127,', '文成县', '1206', '330328', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1207', '127', '0,1,12,127,', '泰顺县', '1207', '330329', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1208', '127', '0,1,12,127,', '瑞安市', '1208', '330381', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1209', '127', '0,1,12,127,', '乐清市', '1209', '330382', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('121', '11', '0,1,11,', '扬州市', '121', '321000', '3', 's1', '2017-11-10 16:43:03', 's1', '2017-11-10 16:43:03', '', '0');
INSERT INTO `sys_area` VALUES ('1210', '128', '0,1,12,128,', '南湖区', '1210', '330402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1211', '128', '0,1,12,128,', '秀洲区', '1211', '330411', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1212', '128', '0,1,12,128,', '嘉善县', '1212', '330421', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1213', '128', '0,1,12,128,', '海盐县', '1213', '330424', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1214', '128', '0,1,12,128,', '海宁市', '1214', '330481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1215', '128', '0,1,12,128,', '平湖市', '1215', '330482', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1216', '128', '0,1,12,128,', '桐乡市', '1216', '330483', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1217', '129', '0,1,12,129,', '吴兴区', '1217', '330502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1218', '129', '0,1,12,129,', '南浔区', '1218', '330503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1219', '129', '0,1,12,129,', '德清县', '1219', '330521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('122', '11', '0,1,11,', '镇江市', '122', '321100', '3', 's1', '2017-11-10 16:43:03', 's1', '2017-11-10 16:43:03', '', '0');
INSERT INTO `sys_area` VALUES ('1220', '129', '0,1,12,129,', '长兴县', '1220', '330522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1221', '129', '0,1,12,129,', '安吉县', '1221', '330523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1222', '130', '0,1,12,130,', '越城区', '1222', '330602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1223', '130', '0,1,12,130,', '柯桥区', '1223', '330603', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1224', '130', '0,1,12,130,', '上虞区', '1224', '330604', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1225', '130', '0,1,12,130,', '新昌县', '1225', '330624', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1226', '130', '0,1,12,130,', '诸暨市', '1226', '330681', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1227', '130', '0,1,12,130,', '嵊州市', '1227', '330683', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1228', '131', '0,1,12,131,', '婺城区', '1228', '330702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1229', '131', '0,1,12,131,', '金东区', '1229', '330703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('123', '11', '0,1,11,', '泰州市', '123', '321200', '3', 's1', '2017-11-10 16:43:04', 's1', '2017-11-10 16:43:04', '', '0');
INSERT INTO `sys_area` VALUES ('1230', '131', '0,1,12,131,', '武义县', '1230', '330723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1231', '131', '0,1,12,131,', '浦江县', '1231', '330726', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1232', '131', '0,1,12,131,', '磐安县', '1232', '330727', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1233', '131', '0,1,12,131,', '兰溪市', '1233', '330781', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1234', '131', '0,1,12,131,', '义乌市', '1234', '330782', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1235', '131', '0,1,12,131,', '东阳市', '1235', '330783', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1236', '131', '0,1,12,131,', '永康市', '1236', '330784', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1237', '132', '0,1,12,132,', '柯城区', '1237', '330802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1238', '132', '0,1,12,132,', '衢江区', '1238', '330803', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1239', '132', '0,1,12,132,', '常山县', '1239', '330822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('124', '11', '0,1,11,', '宿迁市', '124', '321300', '3', 's1', '2017-11-10 16:43:04', 's1', '2017-11-10 16:43:04', '', '0');
INSERT INTO `sys_area` VALUES ('1240', '132', '0,1,12,132,', '开化县', '1240', '330824', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1241', '132', '0,1,12,132,', '龙游县', '1241', '330825', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1242', '132', '0,1,12,132,', '江山市', '1242', '330881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1243', '133', '0,1,12,133,', '定海区', '1243', '330902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1244', '133', '0,1,12,133,', '岱山县', '1244', '330921', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1245', '133', '0,1,12,133,', '嵊泗县', '1245', '330922', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1246', '134', '0,1,12,134,', '椒江区', '1246', '331002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1247', '134', '0,1,12,134,', '黄岩区', '1247', '331003', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1248', '134', '0,1,12,134,', '路桥区', '1248', '331004', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1249', '134', '0,1,12,134,', '玉环县', '1249', '331021', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('125', '12', '0,1,12,', '杭州市', '125', '330100', '3', 's1', '2017-11-10 16:43:04', 's1', '2017-11-10 16:43:04', '', '0');
INSERT INTO `sys_area` VALUES ('1250', '134', '0,1,12,134,', '三门县', '1250', '331022', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1251', '134', '0,1,12,134,', '天台县', '1251', '331023', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1252', '134', '0,1,12,134,', '仙居县', '1252', '331024', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1253', '134', '0,1,12,134,', '温岭市', '1253', '331081', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1254', '134', '0,1,12,134,', '临海市', '1254', '331082', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1255', '135', '0,1,12,135,', '莲都区', '1255', '331102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1256', '135', '0,1,12,135,', '青田县', '1256', '331121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1257', '135', '0,1,12,135,', '缙云县', '1257', '331122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1258', '135', '0,1,12,135,', '遂昌县', '1258', '331123', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1259', '135', '0,1,12,135,', '松阳县', '1259', '331124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('126', '12', '0,1,12,', '宁波市', '126', '330200', '3', 's1', '2017-11-10 16:43:05', 's1', '2017-11-10 16:43:05', '', '0');
INSERT INTO `sys_area` VALUES ('1260', '135', '0,1,12,135,', '云和县', '1260', '331125', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1261', '135', '0,1,12,135,', '庆元县', '1261', '331126', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1262', '135', '0,1,12,135,', '景宁畲族自治县', '1262', '331127', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1263', '135', '0,1,12,135,', '龙泉市', '1263', '331181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1264', '136', '0,1,13,136,', '瑶海区', '1264', '340102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1265', '136', '0,1,13,136,', '庐阳区', '1265', '340103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1266', '136', '0,1,13,136,', '蜀山区', '1266', '340104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1267', '136', '0,1,13,136,', '包河区', '1267', '340111', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1268', '136', '0,1,13,136,', '长丰县', '1268', '340121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1269', '136', '0,1,13,136,', '肥东县', '1269', '340122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('127', '12', '0,1,12,', '温州市', '127', '330300', '3', 's1', '2017-11-10 16:43:05', 's1', '2017-11-10 16:43:05', '', '0');
INSERT INTO `sys_area` VALUES ('1270', '136', '0,1,13,136,', '肥西县', '1270', '340123', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1271', '136', '0,1,13,136,', '庐江县', '1271', '340124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1272', '136', '0,1,13,136,', '巢湖市', '1272', '340181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1273', '137', '0,1,13,137,', '镜湖区', '1273', '340202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1274', '137', '0,1,13,137,', '弋江区', '1274', '340203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1275', '137', '0,1,13,137,', '鸠江区', '1275', '340207', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1276', '137', '0,1,13,137,', '三山区', '1276', '340208', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1277', '137', '0,1,13,137,', '芜湖县', '1277', '340221', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1278', '137', '0,1,13,137,', '繁昌县', '1278', '340222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1279', '137', '0,1,13,137,', '南陵县', '1279', '340223', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('128', '12', '0,1,12,', '嘉兴市', '128', '330400', '3', 's1', '2017-11-10 16:43:05', 's1', '2017-11-10 16:43:05', '', '0');
INSERT INTO `sys_area` VALUES ('1280', '137', '0,1,13,137,', '无为县', '1280', '340225', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1281', '138', '0,1,13,138,', '龙子湖区', '1281', '340302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1282', '138', '0,1,13,138,', '蚌山区', '1282', '340303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1283', '138', '0,1,13,138,', '禹会区', '1283', '340304', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1284', '138', '0,1,13,138,', '淮上区', '1284', '340311', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1285', '138', '0,1,13,138,', '怀远县', '1285', '340321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1286', '138', '0,1,13,138,', '五河县', '1286', '340322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1287', '138', '0,1,13,138,', '固镇县', '1287', '340323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1288', '139', '0,1,13,139,', '大通区', '1288', '340402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1289', '139', '0,1,13,139,', '田家庵区', '1289', '340403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('129', '12', '0,1,12,', '湖州市', '129', '330500', '3', 's1', '2017-11-10 16:43:06', 's1', '2017-11-10 16:43:06', '', '0');
INSERT INTO `sys_area` VALUES ('1290', '139', '0,1,13,139,', '谢家集区', '1290', '340404', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1291', '139', '0,1,13,139,', '八公山区', '1291', '340405', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1292', '139', '0,1,13,139,', '潘集区', '1292', '340406', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1293', '139', '0,1,13,139,', '凤台县', '1293', '340421', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1294', '140', '0,1,13,140,', '花山区', '1294', '340503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1295', '140', '0,1,13,140,', '雨山区', '1295', '340504', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1296', '140', '0,1,13,140,', '博望区', '1296', '340506', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1297', '140', '0,1,13,140,', '当涂县', '1297', '340521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1298', '140', '0,1,13,140,', '含山县', '1298', '340522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1299', '140', '0,1,13,140,', '和县', '1299', '340523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('13', '1', '0,1,', '安徽省', '13', '340000', '2', 's1', '2017-11-10 16:43:06', 's1', '2017-11-10 16:43:06', '', '0');
INSERT INTO `sys_area` VALUES ('130', '12', '0,1,12,', '绍兴市', '130', '330600', '3', 's1', '2017-11-10 16:43:06', 's1', '2017-11-10 16:43:06', '', '0');
INSERT INTO `sys_area` VALUES ('1300', '141', '0,1,13,141,', '杜集区', '1300', '340602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1301', '141', '0,1,13,141,', '相山区', '1301', '340603', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1302', '141', '0,1,13,141,', '烈山区', '1302', '340604', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1303', '141', '0,1,13,141,', '濉溪县', '1303', '340621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1304', '142', '0,1,13,142,', '铜官山区', '1304', '340702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1305', '142', '0,1,13,142,', '狮子山区', '1305', '340703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1306', '142', '0,1,13,142,', '铜陵县', '1306', '340721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1307', '143', '0,1,13,143,', '迎江区', '1307', '340802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1308', '143', '0,1,13,143,', '大观区', '1308', '340803', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1309', '143', '0,1,13,143,', '宜秀区', '1309', '340811', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('131', '12', '0,1,12,', '金华市', '131', '330700', '3', 's1', '2017-11-10 16:43:06', 's1', '2017-11-10 16:43:06', '', '0');
INSERT INTO `sys_area` VALUES ('1310', '143', '0,1,13,143,', '怀宁县', '1310', '340822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1311', '143', '0,1,13,143,', '枞阳县', '1311', '340823', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1312', '143', '0,1,13,143,', '潜山县', '1312', '340824', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1313', '143', '0,1,13,143,', '太湖县', '1313', '340825', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1314', '143', '0,1,13,143,', '宿松县', '1314', '340826', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1315', '143', '0,1,13,143,', '望江县', '1315', '340827', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1316', '143', '0,1,13,143,', '岳西县', '1316', '340828', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1317', '143', '0,1,13,143,', '桐城市', '1317', '340881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1318', '144', '0,1,13,144,', '屯溪区', '1318', '341002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1319', '144', '0,1,13,144,', '黄山区', '1319', '341003', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('132', '12', '0,1,12,', '衢州市', '132', '330800', '3', 's1', '2017-11-10 16:43:06', 's1', '2017-11-10 16:43:06', '', '0');
INSERT INTO `sys_area` VALUES ('1320', '144', '0,1,13,144,', '徽州区', '1320', '341004', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1321', '144', '0,1,13,144,', '歙县', '1321', '341021', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1322', '144', '0,1,13,144,', '休宁县', '1322', '341022', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1323', '144', '0,1,13,144,', '黟县', '1323', '341023', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1324', '144', '0,1,13,144,', '祁门县', '1324', '341024', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1325', '145', '0,1,13,145,', '琅琊区', '1325', '341102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1326', '145', '0,1,13,145,', '南谯区', '1326', '341103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1327', '145', '0,1,13,145,', '来安县', '1327', '341122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1328', '145', '0,1,13,145,', '全椒县', '1328', '341124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1329', '145', '0,1,13,145,', '定远县', '1329', '341125', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('133', '12', '0,1,12,', '舟山市', '133', '330900', '3', 's1', '2017-11-10 16:43:07', 's1', '2017-11-10 16:43:07', '', '0');
INSERT INTO `sys_area` VALUES ('1330', '145', '0,1,13,145,', '凤阳县', '1330', '341126', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1331', '145', '0,1,13,145,', '天长市', '1331', '341181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1332', '145', '0,1,13,145,', '明光市', '1332', '341182', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1333', '146', '0,1,13,146,', '颍州区', '1333', '341202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1334', '146', '0,1,13,146,', '颍东区', '1334', '341203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1335', '146', '0,1,13,146,', '颍泉区', '1335', '341204', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1336', '146', '0,1,13,146,', '临泉县', '1336', '341221', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1337', '146', '0,1,13,146,', '太和县', '1337', '341222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1338', '146', '0,1,13,146,', '阜南县', '1338', '341225', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1339', '146', '0,1,13,146,', '颍上县', '1339', '341226', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('134', '12', '0,1,12,', '台州市', '134', '331000', '3', 's1', '2017-11-10 16:43:07', 's1', '2017-11-10 16:43:07', '', '0');
INSERT INTO `sys_area` VALUES ('1340', '146', '0,1,13,146,', '界首市', '1340', '341282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1341', '147', '0,1,13,147,', '？', '1341', '341302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1342', '147', '0,1,13,147,', '砀山县', '1342', '341321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1343', '147', '0,1,13,147,', '萧县', '1343', '341322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1344', '147', '0,1,13,147,', '灵璧县', '1344', '341323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1345', '147', '0,1,13,147,', '泗县', '1345', '341324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1346', '148', '0,1,13,148,', '金安区', '1346', '341502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1347', '148', '0,1,13,148,', '裕安区', '1347', '341503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1348', '148', '0,1,13,148,', '寿县', '1348', '341521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1349', '148', '0,1,13,148,', '霍邱县', '1349', '341522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('135', '12', '0,1,12,', '丽水市', '135', '331100', '3', 's1', '2017-11-10 16:43:08', 's1', '2017-11-10 16:43:08', '', '0');
INSERT INTO `sys_area` VALUES ('1350', '148', '0,1,13,148,', '舒城县', '1350', '341523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1351', '148', '0,1,13,148,', '金寨县', '1351', '341524', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1352', '148', '0,1,13,148,', '霍山县', '1352', '341525', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1353', '149', '0,1,13,149,', '谯城区', '1353', '341602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1354', '149', '0,1,13,149,', '涡阳县', '1354', '341621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1355', '149', '0,1,13,149,', '蒙城县', '1355', '341622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1356', '149', '0,1,13,149,', '利辛县', '1356', '341623', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1357', '150', '0,1,13,150,', '贵池区', '1357', '341702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1358', '150', '0,1,13,150,', '东至县', '1358', '341721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1359', '150', '0,1,13,150,', '石台县', '1359', '341722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('136', '13', '0,1,13,', '合肥市', '136', '340100', '3', 's1', '2017-11-10 16:43:08', 's1', '2017-11-10 16:43:08', '', '0');
INSERT INTO `sys_area` VALUES ('1360', '150', '0,1,13,150,', '青阳县', '1360', '341723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1361', '151', '0,1,13,151,', '宣州区', '1361', '341802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1362', '151', '0,1,13,151,', '郎溪县', '1362', '341821', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1363', '151', '0,1,13,151,', '广德县', '1363', '341822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1364', '151', '0,1,13,151,', '泾县', '1364', '341823', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1365', '151', '0,1,13,151,', '绩溪县', '1365', '341824', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1366', '151', '0,1,13,151,', '旌德县', '1366', '341825', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1367', '151', '0,1,13,151,', '宁国市', '1367', '341881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1368', '152', '0,1,14,152,', '台江区', '1368', '350103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1369', '152', '0,1,14,152,', '仓山区', '1369', '350104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('137', '13', '0,1,13,', '芜湖市', '137', '340200', '3', 's1', '2017-11-10 16:43:08', 's1', '2017-11-10 16:43:08', '', '0');
INSERT INTO `sys_area` VALUES ('1370', '152', '0,1,14,152,', '马尾区', '1370', '350105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1371', '152', '0,1,14,152,', '晋安区', '1371', '350111', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1372', '152', '0,1,14,152,', '闽侯县', '1372', '350121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1373', '152', '0,1,14,152,', '连江县', '1373', '350122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1374', '152', '0,1,14,152,', '罗源县', '1374', '350123', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1375', '152', '0,1,14,152,', '闽清县', '1375', '350124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1376', '152', '0,1,14,152,', '永泰县', '1376', '350125', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1377', '152', '0,1,14,152,', '平潭县', '1377', '350128', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1378', '152', '0,1,14,152,', '福清市', '1378', '350181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1379', '152', '0,1,14,152,', '长乐市', '1379', '350182', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('138', '13', '0,1,13,', '蚌埠市', '138', '340300', '3', 's1', '2017-11-10 16:43:09', 's1', '2017-11-10 16:43:09', '', '0');
INSERT INTO `sys_area` VALUES ('1380', '153', '0,1,14,153,', '思明区', '1380', '350203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1381', '153', '0,1,14,153,', '海沧区', '1381', '350205', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1382', '153', '0,1,14,153,', '湖里区', '1382', '350206', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1383', '153', '0,1,14,153,', '集美区', '1383', '350211', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1384', '153', '0,1,14,153,', '同安区', '1384', '350212', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1385', '153', '0,1,14,153,', '翔安区', '1385', '350213', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1386', '154', '0,1,14,154,', '城厢区', '1386', '350302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1387', '154', '0,1,14,154,', '涵江区', '1387', '350303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1388', '154', '0,1,14,154,', '荔城区', '1388', '350304', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1389', '154', '0,1,14,154,', '秀屿区', '1389', '350305', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('139', '13', '0,1,13,', '淮南市', '139', '340400', '3', 's1', '2017-11-10 16:43:09', 's1', '2017-11-10 16:43:09', '', '0');
INSERT INTO `sys_area` VALUES ('1390', '154', '0,1,14,154,', '仙游县', '1390', '350322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1391', '155', '0,1,14,155,', '梅列区', '1391', '350402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1392', '155', '0,1,14,155,', '三元区', '1392', '350403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1393', '155', '0,1,14,155,', '明溪县', '1393', '350421', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1394', '155', '0,1,14,155,', '清流县', '1394', '350423', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1395', '155', '0,1,14,155,', '宁化县', '1395', '350424', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1396', '155', '0,1,14,155,', '大田县', '1396', '350425', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1397', '155', '0,1,14,155,', '尤溪县', '1397', '350426', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1398', '155', '0,1,14,155,', '沙县', '1398', '350427', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1399', '155', '0,1,14,155,', '将乐县', '1399', '350428', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('14', '1', '0,1,', '福建省', '14', '350000', '2', 's1', '2017-11-10 16:43:09', 's1', '2017-11-10 16:43:09', '', '0');
INSERT INTO `sys_area` VALUES ('140', '13', '0,1,13,', '马鞍山市', '140', '340500', '3', 's1', '2017-11-10 16:43:09', 's1', '2017-11-10 16:43:09', '', '0');
INSERT INTO `sys_area` VALUES ('1400', '155', '0,1,14,155,', '泰宁县', '1400', '350429', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1401', '155', '0,1,14,155,', '建宁县', '1401', '350430', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1402', '155', '0,1,14,155,', '永安市', '1402', '350481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1403', '156', '0,1,14,156,', '鲤城区', '1403', '350502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1404', '156', '0,1,14,156,', '丰泽区', '1404', '350503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1405', '156', '0,1,14,156,', '洛江区', '1405', '350504', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1406', '156', '0,1,14,156,', '泉港区', '1406', '350505', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1407', '156', '0,1,14,156,', '惠安县', '1407', '350521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1408', '156', '0,1,14,156,', '安溪县', '1408', '350524', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1409', '156', '0,1,14,156,', '永春县', '1409', '350525', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('141', '13', '0,1,13,', '淮北市', '141', '340600', '3', 's1', '2017-11-10 16:43:10', 's1', '2017-11-10 16:43:10', '', '0');
INSERT INTO `sys_area` VALUES ('1410', '156', '0,1,14,156,', '德化县', '1410', '350526', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1411', '156', '0,1,14,156,', '金门县', '1411', '350527', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1412', '156', '0,1,14,156,', '石狮市', '1412', '350581', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1413', '156', '0,1,14,156,', '晋江市', '1413', '350582', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1414', '156', '0,1,14,156,', '南安市', '1414', '350583', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1415', '157', '0,1,14,157,', '芗城区', '1415', '350602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1416', '157', '0,1,14,157,', '龙文区', '1416', '350603', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1417', '157', '0,1,14,157,', '云霄县', '1417', '350622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1418', '157', '0,1,14,157,', '漳浦县', '1418', '350623', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1419', '157', '0,1,14,157,', '诏安县', '1419', '350624', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('142', '13', '0,1,13,', '铜陵市', '142', '340700', '3', 's1', '2017-11-10 16:43:10', 's1', '2017-11-10 16:43:10', '', '0');
INSERT INTO `sys_area` VALUES ('1420', '157', '0,1,14,157,', '长泰县', '1420', '350625', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1421', '157', '0,1,14,157,', '东山县', '1421', '350626', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1422', '157', '0,1,14,157,', '南靖县', '1422', '350627', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1423', '157', '0,1,14,157,', '平和县', '1423', '350628', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1424', '157', '0,1,14,157,', '华安县', '1424', '350629', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1425', '157', '0,1,14,157,', '龙海市', '1425', '350681', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1426', '158', '0,1,14,158,', '延平区', '1426', '350702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1427', '158', '0,1,14,158,', '顺昌县', '1427', '350721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1428', '158', '0,1,14,158,', '浦城县', '1428', '350722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1429', '158', '0,1,14,158,', '光泽县', '1429', '350723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('143', '13', '0,1,13,', '安庆市', '143', '340800', '3', 's1', '2017-11-10 16:43:10', 's1', '2017-11-10 16:43:10', '', '0');
INSERT INTO `sys_area` VALUES ('1430', '158', '0,1,14,158,', '松溪县', '1430', '350724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1431', '158', '0,1,14,158,', '政和县', '1431', '350725', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1432', '158', '0,1,14,158,', '邵武市', '1432', '350781', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1433', '158', '0,1,14,158,', '武夷山市', '1433', '350782', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1434', '158', '0,1,14,158,', '建瓯市', '1434', '350783', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1435', '158', '0,1,14,158,', '建阳市', '1435', '350784', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1436', '159', '0,1,14,159,', '新罗区', '1436', '350802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1437', '159', '0,1,14,159,', '长汀县', '1437', '350821', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1438', '159', '0,1,14,159,', '永定县', '1438', '350822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1439', '159', '0,1,14,159,', '上杭县', '1439', '350823', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('144', '13', '0,1,13,', '黄山市', '144', '341000', '3', 's1', '2017-11-10 16:43:11', 's1', '2017-11-10 16:43:11', '', '0');
INSERT INTO `sys_area` VALUES ('1440', '159', '0,1,14,159,', '武平县', '1440', '350824', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1441', '159', '0,1,14,159,', '连城县', '1441', '350825', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1442', '159', '0,1,14,159,', '漳平市', '1442', '350881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1443', '160', '0,1,14,160,', '蕉城区', '1443', '350902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1444', '160', '0,1,14,160,', '霞浦县', '1444', '350921', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1445', '160', '0,1,14,160,', '古田县', '1445', '350922', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1446', '160', '0,1,14,160,', '屏南县', '1446', '350923', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1447', '160', '0,1,14,160,', '寿宁县', '1447', '350924', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1448', '160', '0,1,14,160,', '周宁县', '1448', '350925', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1449', '160', '0,1,14,160,', '柘荣县', '1449', '350926', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('145', '13', '0,1,13,', '滁州市', '145', '341100', '3', 's1', '2017-11-10 16:43:11', 's1', '2017-11-10 16:43:11', '', '0');
INSERT INTO `sys_area` VALUES ('1450', '160', '0,1,14,160,', '福安市', '1450', '350981', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1451', '160', '0,1,14,160,', '福鼎市', '1451', '350982', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1452', '161', '0,1,15,161,', '东湖区', '1452', '360102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1453', '161', '0,1,15,161,', '青云谱区', '1453', '360104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1454', '161', '0,1,15,161,', '湾里区', '1454', '360105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1455', '161', '0,1,15,161,', '青山湖区', '1455', '360111', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1456', '161', '0,1,15,161,', '南昌县', '1456', '360121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1457', '161', '0,1,15,161,', '新建县', '1457', '360122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1458', '161', '0,1,15,161,', '安义县', '1458', '360123', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1459', '161', '0,1,15,161,', '进贤县', '1459', '360124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('146', '13', '0,1,13,', '阜阳市', '146', '341200', '3', 's1', '2017-11-10 16:43:11', 's1', '2017-11-10 16:43:11', '', '0');
INSERT INTO `sys_area` VALUES ('1460', '162', '0,1,15,162,', '昌江区', '1460', '360202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1461', '162', '0,1,15,162,', '珠山区', '1461', '360203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1462', '162', '0,1,15,162,', '浮梁县', '1462', '360222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1463', '162', '0,1,15,162,', '乐平市', '1463', '360281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1464', '163', '0,1,15,163,', '安源区', '1464', '360302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1465', '163', '0,1,15,163,', '湘东区', '1465', '360313', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1466', '163', '0,1,15,163,', '莲花县', '1466', '360321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1467', '163', '0,1,15,163,', '上栗县', '1467', '360322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1468', '163', '0,1,15,163,', '芦溪县', '1468', '360323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1469', '164', '0,1,15,164,', '庐山区', '1469', '360402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('147', '13', '0,1,13,', '宿州市', '147', '341300', '3', 's1', '2017-11-10 16:43:11', 's1', '2017-11-10 16:43:11', '', '0');
INSERT INTO `sys_area` VALUES ('1470', '164', '0,1,15,164,', '浔阳区', '1470', '360403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1471', '164', '0,1,15,164,', '九江县', '1471', '360421', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1472', '164', '0,1,15,164,', '武宁县', '1472', '360423', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1473', '164', '0,1,15,164,', '修水县', '1473', '360424', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1474', '164', '0,1,15,164,', '永修县', '1474', '360425', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1475', '164', '0,1,15,164,', '德安县', '1475', '360426', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1476', '164', '0,1,15,164,', '星子县', '1476', '360427', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1477', '164', '0,1,15,164,', '都昌县', '1477', '360428', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1478', '164', '0,1,15,164,', '湖口县', '1478', '360429', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1479', '164', '0,1,15,164,', '彭泽县', '1479', '360430', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('148', '13', '0,1,13,', '六安市', '148', '341500', '3', 's1', '2017-11-10 16:43:12', 's1', '2017-11-10 16:43:12', '', '0');
INSERT INTO `sys_area` VALUES ('1480', '164', '0,1,15,164,', '瑞昌市', '1480', '360481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1481', '164', '0,1,15,164,', '共青城市', '1481', '360482', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1482', '165', '0,1,15,165,', '渝水区', '1482', '360502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1483', '165', '0,1,15,165,', '分宜县', '1483', '360521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1484', '166', '0,1,15,166,', '月湖区', '1484', '360602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1485', '166', '0,1,15,166,', '余江县', '1485', '360622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1486', '166', '0,1,15,166,', '贵溪市', '1486', '360681', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1487', '167', '0,1,15,167,', '章贡区', '1487', '360702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1488', '167', '0,1,15,167,', '南康区', '1488', '360703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1489', '167', '0,1,15,167,', '赣县', '1489', '360721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('149', '13', '0,1,13,', '亳州市', '149', '341600', '3', 's1', '2017-11-10 16:43:12', 's1', '2017-11-10 16:43:12', '', '0');
INSERT INTO `sys_area` VALUES ('1490', '167', '0,1,15,167,', '信丰县', '1490', '360722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1491', '167', '0,1,15,167,', '大余县', '1491', '360723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1492', '167', '0,1,15,167,', '上犹县', '1492', '360724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1493', '167', '0,1,15,167,', '崇义县', '1493', '360725', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1494', '167', '0,1,15,167,', '安远县', '1494', '360726', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1495', '167', '0,1,15,167,', '龙南县', '1495', '360727', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1496', '167', '0,1,15,167,', '定南县', '1496', '360728', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1497', '167', '0,1,15,167,', '全南县', '1497', '360729', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1498', '167', '0,1,15,167,', '宁都县', '1498', '360730', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1499', '167', '0,1,15,167,', '于都县', '1499', '360731', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('15', '1', '0,1,', '江西省', '15', '360000', '2', 's1', '2017-11-10 16:43:13', 's1', '2017-11-10 16:43:13', '', '0');
INSERT INTO `sys_area` VALUES ('150', '13', '0,1,13,', '池州市', '150', '341700', '3', 's1', '2017-11-10 16:43:13', 's1', '2017-11-10 16:43:13', '', '0');
INSERT INTO `sys_area` VALUES ('1500', '167', '0,1,15,167,', '兴国县', '1500', '360732', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1501', '167', '0,1,15,167,', '会昌县', '1501', '360733', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1502', '167', '0,1,15,167,', '寻乌县', '1502', '360734', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1503', '167', '0,1,15,167,', '石城县', '1503', '360735', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1504', '167', '0,1,15,167,', '瑞金市', '1504', '360781', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1505', '168', '0,1,15,168,', '吉州区', '1505', '360802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1506', '168', '0,1,15,168,', '青原区', '1506', '360803', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1507', '168', '0,1,15,168,', '吉安县', '1507', '360821', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1508', '168', '0,1,15,168,', '吉水县', '1508', '360822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1509', '168', '0,1,15,168,', '峡江县', '1509', '360823', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('151', '13', '0,1,13,', '宣城市', '151', '341800', '3', 's1', '2017-11-10 16:43:13', 's1', '2017-11-10 16:43:13', '', '0');
INSERT INTO `sys_area` VALUES ('1510', '168', '0,1,15,168,', '新干县', '1510', '360824', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1511', '168', '0,1,15,168,', '永丰县', '1511', '360825', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1512', '168', '0,1,15,168,', '泰和县', '1512', '360826', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1513', '168', '0,1,15,168,', '遂川县', '1513', '360827', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1514', '168', '0,1,15,168,', '万安县', '1514', '360828', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1515', '168', '0,1,15,168,', '安福县', '1515', '360829', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1516', '168', '0,1,15,168,', '永新县', '1516', '360830', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1517', '168', '0,1,15,168,', '井冈山市', '1517', '360881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1518', '169', '0,1,15,169,', '袁州区', '1518', '360902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1519', '169', '0,1,15,169,', '奉新县', '1519', '360921', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('152', '14', '0,1,14,', '福州市', '152', '350100', '3', 's1', '2017-11-10 16:43:13', 's1', '2017-11-10 16:43:13', '', '0');
INSERT INTO `sys_area` VALUES ('1520', '169', '0,1,15,169,', '万载县', '1520', '360922', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1521', '169', '0,1,15,169,', '上高县', '1521', '360923', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1522', '169', '0,1,15,169,', '宜丰县', '1522', '360924', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1523', '169', '0,1,15,169,', '靖安县', '1523', '360925', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1524', '169', '0,1,15,169,', '铜鼓县', '1524', '360926', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1525', '169', '0,1,15,169,', '丰城市', '1525', '360981', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1526', '169', '0,1,15,169,', '樟树市', '1526', '360982', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1527', '169', '0,1,15,169,', '高安市', '1527', '360983', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1528', '170', '0,1,15,170,', '临川区', '1528', '361002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1529', '170', '0,1,15,170,', '南城县', '1529', '361021', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('153', '14', '0,1,14,', '厦门市', '153', '350200', '3', 's1', '2017-11-10 16:43:13', 's1', '2017-11-10 16:43:13', '', '0');
INSERT INTO `sys_area` VALUES ('1530', '170', '0,1,15,170,', '黎川县', '1530', '361022', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1531', '170', '0,1,15,170,', '南丰县', '1531', '361023', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1532', '170', '0,1,15,170,', '崇仁县', '1532', '361024', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1533', '170', '0,1,15,170,', '乐安县', '1533', '361025', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1534', '170', '0,1,15,170,', '宜黄县', '1534', '361026', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1535', '170', '0,1,15,170,', '金溪县', '1535', '361027', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1536', '170', '0,1,15,170,', '资溪县', '1536', '361028', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1537', '170', '0,1,15,170,', '东乡县', '1537', '361029', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1538', '170', '0,1,15,170,', '广昌县', '1538', '361030', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1539', '171', '0,1,15,171,', '信州区', '1539', '361102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('154', '14', '0,1,14,', '莆田市', '154', '350300', '3', 's1', '2017-11-10 16:43:14', 's1', '2017-11-10 16:43:14', '', '0');
INSERT INTO `sys_area` VALUES ('1540', '171', '0,1,15,171,', '上饶县', '1540', '361121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1541', '171', '0,1,15,171,', '广丰县', '1541', '361122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1542', '171', '0,1,15,171,', '玉山县', '1542', '361123', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1543', '171', '0,1,15,171,', '铅山县', '1543', '361124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1544', '171', '0,1,15,171,', '横峰县', '1544', '361125', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1545', '171', '0,1,15,171,', '弋阳县', '1545', '361126', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1546', '171', '0,1,15,171,', '余干县', '1546', '361127', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1547', '171', '0,1,15,171,', '鄱阳县', '1547', '361128', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1548', '171', '0,1,15,171,', '万年县', '1548', '361129', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1549', '171', '0,1,15,171,', '婺源县', '1549', '361130', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('155', '14', '0,1,14,', '三明市', '155', '350400', '3', 's1', '2017-11-10 16:43:14', 's1', '2017-11-10 16:43:14', '', '0');
INSERT INTO `sys_area` VALUES ('1550', '171', '0,1,15,171,', '德兴市', '1550', '361181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1551', '172', '0,1,16,172,', '历下区', '1551', '370102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1552', '172', '0,1,16,172,', '市中区', '1552', '370103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1553', '172', '0,1,16,172,', '槐荫区', '1553', '370104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1554', '172', '0,1,16,172,', '天桥区', '1554', '370105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1555', '172', '0,1,16,172,', '历城区', '1555', '370112', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1556', '172', '0,1,16,172,', '长清区', '1556', '370113', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1557', '172', '0,1,16,172,', '平阴县', '1557', '370124', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1558', '172', '0,1,16,172,', '济阳县', '1558', '370125', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1559', '172', '0,1,16,172,', '商河县', '1559', '370126', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('156', '14', '0,1,14,', '泉州市', '156', '350500', '3', 's1', '2017-11-10 16:43:14', 's1', '2017-11-10 16:43:14', '', '0');
INSERT INTO `sys_area` VALUES ('1560', '172', '0,1,16,172,', '章丘市', '1560', '370181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1561', '173', '0,1,16,173,', '市南区', '1561', '370202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1562', '173', '0,1,16,173,', '市北区', '1562', '370203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1563', '173', '0,1,16,173,', '黄岛区', '1563', '370211', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1564', '173', '0,1,16,173,', '崂山区', '1564', '370212', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1565', '173', '0,1,16,173,', '李沧区', '1565', '370213', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1566', '173', '0,1,16,173,', '城阳区', '1566', '370214', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1567', '173', '0,1,16,173,', '胶州市', '1567', '370281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1568', '173', '0,1,16,173,', '即墨市', '1568', '370282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1569', '173', '0,1,16,173,', '平度市', '1569', '370283', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('157', '14', '0,1,14,', '漳州市', '157', '350600', '3', 's1', '2017-11-10 16:43:15', 's1', '2017-11-10 16:43:15', '', '0');
INSERT INTO `sys_area` VALUES ('1570', '173', '0,1,16,173,', '莱西市', '1570', '370285', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1571', '174', '0,1,16,174,', '淄川区', '1571', '370302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1572', '174', '0,1,16,174,', '张店区', '1572', '370303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1573', '174', '0,1,16,174,', '博山区', '1573', '370304', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1574', '174', '0,1,16,174,', '临淄区', '1574', '370305', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1575', '174', '0,1,16,174,', '周村区', '1575', '370306', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1576', '174', '0,1,16,174,', '桓台县', '1576', '370321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1577', '174', '0,1,16,174,', '高青县', '1577', '370322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1578', '174', '0,1,16,174,', '沂源县', '1578', '370323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1579', '175', '0,1,16,175,', '薛城区', '1579', '370403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('158', '14', '0,1,14,', '南平市', '158', '350700', '3', 's1', '2017-11-10 16:43:15', 's1', '2017-11-10 16:43:15', '', '0');
INSERT INTO `sys_area` VALUES ('1580', '175', '0,1,16,175,', '峄城区', '1580', '370404', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1581', '175', '0,1,16,175,', '台儿庄区', '1581', '370405', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1582', '175', '0,1,16,175,', '山亭区', '1582', '370406', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1583', '175', '0,1,16,175,', '滕州市', '1583', '370481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1584', '176', '0,1,16,176,', '东营区', '1584', '370502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1585', '176', '0,1,16,176,', '河口区', '1585', '370503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1586', '176', '0,1,16,176,', '垦利县', '1586', '370521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1587', '176', '0,1,16,176,', '利津县', '1587', '370522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1588', '176', '0,1,16,176,', '广饶县', '1588', '370523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1589', '177', '0,1,16,177,', '芝罘区', '1589', '370602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('159', '14', '0,1,14,', '龙岩市', '159', '350800', '3', 's1', '2017-11-10 16:43:16', 's1', '2017-11-10 16:43:16', '', '0');
INSERT INTO `sys_area` VALUES ('1590', '177', '0,1,16,177,', '福山区', '1590', '370611', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1591', '177', '0,1,16,177,', '牟平区', '1591', '370612', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1592', '177', '0,1,16,177,', '莱山区', '1592', '370613', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1593', '177', '0,1,16,177,', '长岛县', '1593', '370634', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1594', '177', '0,1,16,177,', '龙口市', '1594', '370681', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1595', '177', '0,1,16,177,', '莱阳市', '1595', '370682', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1596', '177', '0,1,16,177,', '莱州市', '1596', '370683', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1597', '177', '0,1,16,177,', '蓬莱市', '1597', '370684', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1598', '177', '0,1,16,177,', '招远市', '1598', '370685', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1599', '177', '0,1,16,177,', '栖霞市', '1599', '370686', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('16', '1', '0,1,', '山东省', '16', '370000', '2', 's1', '2017-11-10 16:43:16', 's1', '2017-11-10 16:43:16', '', '0');
INSERT INTO `sys_area` VALUES ('160', '14', '0,1,14,', '宁德市', '160', '350900', '3', 's1', '2017-11-10 16:43:16', 's1', '2017-11-10 16:43:16', '', '0');
INSERT INTO `sys_area` VALUES ('1600', '177', '0,1,16,177,', '海阳市', '1600', '370687', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1601', '178', '0,1,16,178,', '潍城区', '1601', '370702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1602', '178', '0,1,16,178,', '寒亭区', '1602', '370703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1603', '178', '0,1,16,178,', '坊子区', '1603', '370704', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1604', '178', '0,1,16,178,', '奎文区', '1604', '370705', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1605', '178', '0,1,16,178,', '临朐县', '1605', '370724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1606', '178', '0,1,16,178,', '昌乐县', '1606', '370725', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1607', '178', '0,1,16,178,', '青州市', '1607', '370781', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1608', '178', '0,1,16,178,', '诸城市', '1608', '370782', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1609', '178', '0,1,16,178,', '寿光市', '1609', '370783', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('161', '15', '0,1,15,', '南昌市', '161', '360100', '3', 's1', '2017-11-10 16:43:16', 's1', '2017-11-10 16:43:16', '', '0');
INSERT INTO `sys_area` VALUES ('1610', '178', '0,1,16,178,', '安丘市', '1610', '370784', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1611', '178', '0,1,16,178,', '高密市', '1611', '370785', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1612', '178', '0,1,16,178,', '昌邑市', '1612', '370786', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1613', '179', '0,1,16,179,', '任城区', '1613', '370811', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1614', '179', '0,1,16,179,', '兖州区', '1614', '370812', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1615', '179', '0,1,16,179,', '微山县', '1615', '370826', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1616', '179', '0,1,16,179,', '鱼台县', '1616', '370827', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1617', '179', '0,1,16,179,', '金乡县', '1617', '370828', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1618', '179', '0,1,16,179,', '嘉祥县', '1618', '370829', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1619', '179', '0,1,16,179,', '汶上县', '1619', '370830', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('162', '15', '0,1,15,', '景德镇市', '162', '360200', '3', 's1', '2017-11-10 16:43:17', 's1', '2017-11-10 16:43:17', '', '0');
INSERT INTO `sys_area` VALUES ('1620', '179', '0,1,16,179,', '泗水县', '1620', '370831', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1621', '179', '0,1,16,179,', '梁山县', '1621', '370832', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1622', '179', '0,1,16,179,', '曲阜市', '1622', '370881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1623', '179', '0,1,16,179,', '邹城市', '1623', '370883', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1624', '180', '0,1,16,180,', '泰山区', '1624', '370902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1625', '180', '0,1,16,180,', '岱岳区', '1625', '370911', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1626', '180', '0,1,16,180,', '宁阳县', '1626', '370921', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1627', '180', '0,1,16,180,', '东平县', '1627', '370923', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1628', '180', '0,1,16,180,', '新泰市', '1628', '370982', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1629', '180', '0,1,16,180,', '肥城市', '1629', '370983', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('163', '15', '0,1,15,', '萍乡市', '163', '360300', '3', 's1', '2017-11-10 16:43:17', 's1', '2017-11-10 16:43:17', '', '0');
INSERT INTO `sys_area` VALUES ('1630', '181', '0,1,16,181,', '环翠区', '1630', '371002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1631', '181', '0,1,16,181,', '文登区', '1631', '371003', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1632', '181', '0,1,16,181,', '荣成市', '1632', '371082', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1633', '181', '0,1,16,181,', '乳山市', '1633', '371083', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1634', '182', '0,1,16,182,', '东港区', '1634', '371102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1635', '182', '0,1,16,182,', '岚山区', '1635', '371103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1636', '182', '0,1,16,182,', '五莲县', '1636', '371121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1637', '182', '0,1,16,182,', '莒县', '1637', '371122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1638', '183', '0,1,16,183,', '莱城区', '1638', '371202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1639', '183', '0,1,16,183,', '钢城区', '1639', '371203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('164', '15', '0,1,15,', '九江市', '164', '360400', '3', 's1', '2017-11-10 16:43:17', 's1', '2017-11-10 16:43:17', '', '0');
INSERT INTO `sys_area` VALUES ('1640', '184', '0,1,16,184,', '兰山区', '1640', '371302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1641', '184', '0,1,16,184,', '罗庄区', '1641', '371311', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1642', '184', '0,1,16,184,', '沂南县', '1642', '371321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1643', '184', '0,1,16,184,', '郯城县', '1643', '371322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1644', '184', '0,1,16,184,', '沂水县', '1644', '371323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1645', '184', '0,1,16,184,', '兰陵县', '1645', '371324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1646', '184', '0,1,16,184,', '费县', '1646', '371325', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1647', '184', '0,1,16,184,', '平邑县', '1647', '371326', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1648', '184', '0,1,16,184,', '莒南县', '1648', '371327', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1649', '184', '0,1,16,184,', '蒙阴县', '1649', '371328', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('165', '15', '0,1,15,', '新余市', '165', '360500', '3', 's1', '2017-11-10 16:43:18', 's1', '2017-11-10 16:43:18', '', '0');
INSERT INTO `sys_area` VALUES ('1650', '184', '0,1,16,184,', '临沭县', '1650', '371329', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1651', '185', '0,1,16,185,', '德城区', '1651', '371402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1652', '185', '0,1,16,185,', '陵城区', '1652', '371403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1653', '185', '0,1,16,185,', '宁津县', '1653', '371422', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1654', '185', '0,1,16,185,', '庆云县', '1654', '371423', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1655', '185', '0,1,16,185,', '临邑县', '1655', '371424', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1656', '185', '0,1,16,185,', '齐河县', '1656', '371425', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1657', '185', '0,1,16,185,', '平原县', '1657', '371426', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1658', '185', '0,1,16,185,', '夏津县', '1658', '371427', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1659', '185', '0,1,16,185,', '武城县', '1659', '371428', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('166', '15', '0,1,15,', '鹰潭市', '166', '360600', '3', 's1', '2017-11-10 16:43:18', 's1', '2017-11-10 16:43:18', '', '0');
INSERT INTO `sys_area` VALUES ('1660', '185', '0,1,16,185,', '乐陵市', '1660', '371481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1661', '185', '0,1,16,185,', '禹城市', '1661', '371482', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1662', '186', '0,1,16,186,', '东昌府区', '1662', '371502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1663', '186', '0,1,16,186,', '阳谷县', '1663', '371521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1664', '186', '0,1,16,186,', '莘县', '1664', '371522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1665', '186', '0,1,16,186,', '茌平县', '1665', '371523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1666', '186', '0,1,16,186,', '东阿县', '1666', '371524', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1667', '186', '0,1,16,186,', '冠县', '1667', '371525', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1668', '186', '0,1,16,186,', '高唐县', '1668', '371526', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1669', '186', '0,1,16,186,', '临清市', '1669', '371581', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('167', '15', '0,1,15,', '赣州市', '167', '360700', '3', 's1', '2017-11-10 16:43:18', 's1', '2017-11-10 16:43:18', '', '0');
INSERT INTO `sys_area` VALUES ('1670', '187', '0,1,16,187,', '滨城区', '1670', '371602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1671', '187', '0,1,16,187,', '沾化区', '1671', '371603', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1672', '187', '0,1,16,187,', '惠民县', '1672', '371621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1673', '187', '0,1,16,187,', '阳信县', '1673', '371622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1674', '187', '0,1,16,187,', '无棣县', '1674', '371623', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1675', '187', '0,1,16,187,', '博兴县', '1675', '371625', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1676', '187', '0,1,16,187,', '邹平县', '1676', '371626', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1677', '188', '0,1,16,188,', '牡丹区', '1677', '371702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1678', '188', '0,1,16,188,', '曹县', '1678', '371721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1679', '188', '0,1,16,188,', '单县', '1679', '371722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('168', '15', '0,1,15,', '吉安市', '168', '360800', '3', 's1', '2017-11-10 16:43:19', 's1', '2017-11-10 16:43:19', '', '0');
INSERT INTO `sys_area` VALUES ('1680', '188', '0,1,16,188,', '成武县', '1680', '371723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1681', '188', '0,1,16,188,', '巨野县', '1681', '371724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1682', '188', '0,1,16,188,', '郓城县', '1682', '371725', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1683', '188', '0,1,16,188,', '鄄城县', '1683', '371726', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1684', '188', '0,1,16,188,', '定陶县', '1684', '371727', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1685', '188', '0,1,16,188,', '东明县', '1685', '371728', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1686', '189', '0,1,17,189,', '中原区', '1686', '410102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1687', '189', '0,1,17,189,', '二七区', '1687', '410103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1688', '189', '0,1,17,189,', '管城回族区', '1688', '410104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1689', '189', '0,1,17,189,', '金水区', '1689', '410105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('169', '15', '0,1,15,', '宜春市', '169', '360900', '3', 's1', '2017-11-10 16:43:19', 's1', '2017-11-10 16:43:19', '', '0');
INSERT INTO `sys_area` VALUES ('1690', '189', '0,1,17,189,', '上街区', '1690', '410106', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1691', '189', '0,1,17,189,', '惠济区', '1691', '410108', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1692', '189', '0,1,17,189,', '中牟县', '1692', '410122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1693', '189', '0,1,17,189,', '巩义市', '1693', '410181', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1694', '189', '0,1,17,189,', '荥阳市', '1694', '410182', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1695', '189', '0,1,17,189,', '新密市', '1695', '410183', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1696', '189', '0,1,17,189,', '新郑市', '1696', '410184', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1697', '189', '0,1,17,189,', '登封市', '1697', '410185', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1698', '190', '0,1,17,190,', '龙亭区', '1698', '410202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1699', '190', '0,1,17,190,', '顺河回族区', '1699', '410203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('17', '1', '0,1,', '河南省', '17', '410000', '2', 's1', '2017-11-10 16:43:19', 's1', '2017-11-10 16:43:19', '', '0');
INSERT INTO `sys_area` VALUES ('170', '15', '0,1,15,', '抚州市', '170', '361000', '3', 's1', '2017-11-10 16:43:19', 's1', '2017-11-10 16:43:19', '', '0');
INSERT INTO `sys_area` VALUES ('1700', '190', '0,1,17,190,', '禹王台区', '1700', '410205', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1701', '190', '0,1,17,190,', '金明区', '1701', '410211', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1702', '190', '0,1,17,190,', '杞县', '1702', '410221', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1703', '190', '0,1,17,190,', '通许县', '1703', '410222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1704', '190', '0,1,17,190,', '尉氏县', '1704', '410223', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1705', '190', '0,1,17,190,', '开封县', '1705', '410224', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1706', '190', '0,1,17,190,', '兰考县', '1706', '410225', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1707', '191', '0,1,17,191,', '老城区', '1707', '410302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1708', '191', '0,1,17,191,', '西工区', '1708', '410303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1709', '191', '0,1,17,191,', '？e河回族区', '1709', '410304', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('171', '15', '0,1,15,', '上饶市', '171', '361100', '3', 's1', '2017-11-10 16:43:20', 's1', '2017-11-10 16:43:20', '', '0');
INSERT INTO `sys_area` VALUES ('1710', '191', '0,1,17,191,', '涧西区', '1710', '410305', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1711', '191', '0,1,17,191,', '吉利区', '1711', '410306', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1712', '191', '0,1,17,191,', '洛龙区', '1712', '410311', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1713', '191', '0,1,17,191,', '孟津县', '1713', '410322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1714', '191', '0,1,17,191,', '新安县', '1714', '410323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1715', '191', '0,1,17,191,', '栾川县', '1715', '410324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1716', '191', '0,1,17,191,', '嵩县', '1716', '410325', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1717', '191', '0,1,17,191,', '汝阳县', '1717', '410326', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1718', '191', '0,1,17,191,', '宜阳县', '1718', '410327', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1719', '191', '0,1,17,191,', '洛宁县', '1719', '410328', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('172', '16', '0,1,16,', '济南市', '172', '370100', '3', 's1', '2017-11-10 16:43:20', 's1', '2017-11-10 16:43:20', '', '0');
INSERT INTO `sys_area` VALUES ('1720', '191', '0,1,17,191,', '伊川县', '1720', '410329', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1721', '191', '0,1,17,191,', '偃师市', '1721', '410381', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1722', '192', '0,1,17,192,', '卫东区', '1722', '410403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1723', '192', '0,1,17,192,', '石龙区', '1723', '410404', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1724', '192', '0,1,17,192,', '湛河区', '1724', '410411', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1725', '192', '0,1,17,192,', '宝丰县', '1725', '410421', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1726', '192', '0,1,17,192,', '叶县', '1726', '410422', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1727', '192', '0,1,17,192,', '鲁山县', '1727', '410423', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1728', '192', '0,1,17,192,', '郏县', '1728', '410425', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1729', '192', '0,1,17,192,', '舞钢市', '1729', '410481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('173', '16', '0,1,16,', '青岛市', '173', '370200', '3', 's1', '2017-11-10 16:43:20', 's1', '2017-11-10 16:43:20', '', '0');
INSERT INTO `sys_area` VALUES ('1730', '192', '0,1,17,192,', '汝州市', '1730', '410482', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1731', '193', '0,1,17,193,', '文峰区', '1731', '410502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1732', '193', '0,1,17,193,', '北关区', '1732', '410503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1733', '193', '0,1,17,193,', '殷都区', '1733', '410505', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1734', '193', '0,1,17,193,', '龙安区', '1734', '410506', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1735', '193', '0,1,17,193,', '安阳县', '1735', '410522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1736', '193', '0,1,17,193,', '汤阴县', '1736', '410523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1737', '193', '0,1,17,193,', '滑县', '1737', '410526', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1738', '193', '0,1,17,193,', '内黄县', '1738', '410527', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1739', '193', '0,1,17,193,', '林州市', '1739', '410581', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('174', '16', '0,1,16,', '淄博市', '174', '370300', '3', 's1', '2017-11-10 16:43:21', 's1', '2017-11-10 16:43:21', '', '0');
INSERT INTO `sys_area` VALUES ('1740', '194', '0,1,17,194,', '鹤山区', '1740', '410602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1741', '194', '0,1,17,194,', '山城区', '1741', '410603', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1742', '194', '0,1,17,194,', '淇滨区', '1742', '410611', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1743', '194', '0,1,17,194,', '浚县', '1743', '410621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1744', '194', '0,1,17,194,', '淇县', '1744', '410622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1745', '195', '0,1,17,195,', '红旗区', '1745', '410702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1746', '195', '0,1,17,195,', '卫滨区', '1746', '410703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1747', '195', '0,1,17,195,', '凤泉区', '1747', '410704', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1748', '195', '0,1,17,195,', '牧野区', '1748', '410711', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1749', '195', '0,1,17,195,', '新乡县', '1749', '410721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('175', '16', '0,1,16,', '枣庄市', '175', '370400', '3', 's1', '2017-11-10 16:43:21', 's1', '2017-11-10 16:43:21', '', '0');
INSERT INTO `sys_area` VALUES ('1750', '195', '0,1,17,195,', '获嘉县', '1750', '410724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1751', '195', '0,1,17,195,', '原阳县', '1751', '410725', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1752', '195', '0,1,17,195,', '延津县', '1752', '410726', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1753', '195', '0,1,17,195,', '封丘县', '1753', '410727', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1754', '195', '0,1,17,195,', '长垣县', '1754', '410728', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1755', '195', '0,1,17,195,', '卫辉市', '1755', '410781', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1756', '195', '0,1,17,195,', '辉县市', '1756', '410782', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1757', '196', '0,1,17,196,', '解放区', '1757', '410802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1758', '196', '0,1,17,196,', '中站区', '1758', '410803', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1759', '196', '0,1,17,196,', '马村区', '1759', '410804', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('176', '16', '0,1,16,', '东营市', '176', '370500', '3', 's1', '2017-11-10 16:43:22', 's1', '2017-11-10 16:43:22', '', '0');
INSERT INTO `sys_area` VALUES ('1760', '196', '0,1,17,196,', '山阳区', '1760', '410811', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1761', '196', '0,1,17,196,', '修武县', '1761', '410821', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1762', '196', '0,1,17,196,', '博爱县', '1762', '410822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1763', '196', '0,1,17,196,', '武陟县', '1763', '410823', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1764', '196', '0,1,17,196,', '温县', '1764', '410825', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1765', '196', '0,1,17,196,', '沁阳市', '1765', '410882', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1766', '196', '0,1,17,196,', '孟州市', '1766', '410883', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1767', '197', '0,1,17,197,', '华龙区', '1767', '410902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1768', '197', '0,1,17,197,', '清丰县', '1768', '410922', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1769', '197', '0,1,17,197,', '南乐县', '1769', '410923', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('177', '16', '0,1,16,', '烟台市', '177', '370600', '3', 's1', '2017-11-10 16:43:22', 's1', '2017-11-10 16:43:22', '', '0');
INSERT INTO `sys_area` VALUES ('1770', '197', '0,1,17,197,', '范县', '1770', '410926', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1771', '197', '0,1,17,197,', '台前县', '1771', '410927', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1772', '197', '0,1,17,197,', '濮阳县', '1772', '410928', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1773', '198', '0,1,17,198,', '魏都区', '1773', '411002', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1774', '198', '0,1,17,198,', '许昌县', '1774', '411023', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1775', '198', '0,1,17,198,', '鄢陵县', '1775', '411024', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1776', '198', '0,1,17,198,', '襄城县', '1776', '411025', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1777', '198', '0,1,17,198,', '禹州市', '1777', '411081', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1778', '198', '0,1,17,198,', '长葛市', '1778', '411082', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1779', '199', '0,1,17,199,', '源汇区', '1779', '411102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('178', '16', '0,1,16,', '潍坊市', '178', '370700', '3', 's1', '2017-11-10 16:43:23', 's1', '2017-11-10 16:43:23', '', '0');
INSERT INTO `sys_area` VALUES ('1780', '199', '0,1,17,199,', '郾城区', '1780', '411103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1781', '199', '0,1,17,199,', '召陵区', '1781', '411104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1782', '199', '0,1,17,199,', '舞阳县', '1782', '411121', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1783', '199', '0,1,17,199,', '临颍县', '1783', '411122', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1784', '200', '0,1,17,200,', '湖滨区', '1784', '411202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1785', '200', '0,1,17,200,', '渑池县', '1785', '411221', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1786', '200', '0,1,17,200,', '陕县', '1786', '411222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1787', '200', '0,1,17,200,', '卢氏县', '1787', '411224', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1788', '200', '0,1,17,200,', '义马市', '1788', '411281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1789', '200', '0,1,17,200,', '灵宝市', '1789', '411282', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('179', '16', '0,1,16,', '济宁市', '179', '370800', '3', 's1', '2017-11-10 16:43:23', 's1', '2017-11-10 16:43:23', '', '0');
INSERT INTO `sys_area` VALUES ('1790', '201', '0,1,17,201,', '宛城区', '1790', '411302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1791', '201', '0,1,17,201,', '卧龙区', '1791', '411303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1792', '201', '0,1,17,201,', '南召县', '1792', '411321', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1793', '201', '0,1,17,201,', '方城县', '1793', '411322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1794', '201', '0,1,17,201,', '西峡县', '1794', '411323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1795', '201', '0,1,17,201,', '镇平县', '1795', '411324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1796', '201', '0,1,17,201,', '内乡县', '1796', '411325', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1797', '201', '0,1,17,201,', '淅川县', '1797', '411326', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1798', '201', '0,1,17,201,', '社旗县', '1798', '411327', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1799', '201', '0,1,17,201,', '唐河县', '1799', '411328', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('18', '1', '0,1,', '湖北省', '18', '420000', '2', 's1', '2017-11-10 16:43:23', 's1', '2017-11-10 16:43:23', '', '0');
INSERT INTO `sys_area` VALUES ('180', '16', '0,1,16,', '泰安市', '180', '370900', '3', 's1', '2017-11-10 16:43:23', 's1', '2017-11-10 16:43:23', '', '0');
INSERT INTO `sys_area` VALUES ('1800', '201', '0,1,17,201,', '新野县', '1800', '411329', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1801', '201', '0,1,17,201,', '桐柏县', '1801', '411330', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1802', '201', '0,1,17,201,', '邓州市', '1802', '411381', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1803', '202', '0,1,17,202,', '梁园区', '1803', '411402', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1804', '202', '0,1,17,202,', '睢阳区', '1804', '411403', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1805', '202', '0,1,17,202,', '民权县', '1805', '411421', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1806', '202', '0,1,17,202,', '睢县', '1806', '411422', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1807', '202', '0,1,17,202,', '宁陵县', '1807', '411423', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1808', '202', '0,1,17,202,', '柘城县', '1808', '411424', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1809', '202', '0,1,17,202,', '虞城县', '1809', '411425', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('181', '16', '0,1,16,', '威海市', '181', '371000', '3', 's1', '2017-11-10 16:43:24', 's1', '2017-11-10 16:43:24', '', '0');
INSERT INTO `sys_area` VALUES ('1810', '202', '0,1,17,202,', '夏邑县', '1810', '411426', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1811', '202', '0,1,17,202,', '永城市', '1811', '411481', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1812', '203', '0,1,17,203,', '？负忧？', '1812', '411502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1813', '203', '0,1,17,203,', '平桥区', '1813', '411503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1814', '203', '0,1,17,203,', '罗山县', '1814', '411521', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1815', '203', '0,1,17,203,', '光山县', '1815', '411522', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1816', '203', '0,1,17,203,', '新县', '1816', '411523', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1817', '203', '0,1,17,203,', '商城县', '1817', '411524', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1818', '203', '0,1,17,203,', '固始县', '1818', '411525', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1819', '203', '0,1,17,203,', '潢川县', '1819', '411526', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('182', '16', '0,1,16,', '日照市', '182', '371100', '3', 's1', '2017-11-10 16:43:24', 's1', '2017-11-10 16:43:24', '', '0');
INSERT INTO `sys_area` VALUES ('1820', '203', '0,1,17,203,', '淮滨县', '1820', '411527', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1821', '203', '0,1,17,203,', '息县', '1821', '411528', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1822', '204', '0,1,17,204,', '川汇区', '1822', '411602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1823', '204', '0,1,17,204,', '扶沟县', '1823', '411621', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1824', '204', '0,1,17,204,', '西华县', '1824', '411622', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1825', '204', '0,1,17,204,', '商水县', '1825', '411623', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1826', '204', '0,1,17,204,', '沈丘县', '1826', '411624', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1827', '204', '0,1,17,204,', '郸城县', '1827', '411625', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1828', '204', '0,1,17,204,', '淮阳县', '1828', '411626', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1829', '204', '0,1,17,204,', '太康县', '1829', '411627', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('183', '16', '0,1,16,', '莱芜市', '183', '371200', '3', 's1', '2017-11-10 16:43:24', 's1', '2017-11-10 16:43:24', '', '0');
INSERT INTO `sys_area` VALUES ('1830', '204', '0,1,17,204,', '鹿邑县', '1830', '411628', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1831', '204', '0,1,17,204,', '项城市', '1831', '411681', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1832', '205', '0,1,17,205,', '驿城区', '1832', '411702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1833', '205', '0,1,17,205,', '西平县', '1833', '411721', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1834', '205', '0,1,17,205,', '上蔡县', '1834', '411722', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1835', '205', '0,1,17,205,', '平舆县', '1835', '411723', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1836', '205', '0,1,17,205,', '正阳县', '1836', '411724', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1837', '205', '0,1,17,205,', '确山县', '1837', '411725', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1838', '205', '0,1,17,205,', '泌阳县', '1838', '411726', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1839', '205', '0,1,17,205,', '汝南县', '1839', '411727', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('184', '16', '0,1,16,', '临沂市', '184', '371300', '3', 's1', '2017-11-10 16:43:25', 's1', '2017-11-10 16:43:25', '', '0');
INSERT INTO `sys_area` VALUES ('1840', '205', '0,1,17,205,', '遂平县', '1840', '411728', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1841', '205', '0,1,17,205,', '新蔡县', '1841', '411729', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1842', '206', '0,1,17,206,', '济源市', '1842', '419001', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1843', '207', '0,1,18,207,', '江岸区', '1843', '420102', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1844', '207', '0,1,18,207,', '江汉区', '1844', '420103', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1845', '207', '0,1,18,207,', '?口区', '1845', '420104', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1846', '207', '0,1,18,207,', '汉阳区', '1846', '420105', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1847', '207', '0,1,18,207,', '武昌区', '1847', '420106', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1848', '207', '0,1,18,207,', '洪山区', '1848', '420111', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1849', '207', '0,1,18,207,', '东西湖区', '1849', '420112', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('185', '16', '0,1,16,', '德州市', '185', '371400', '3', 's1', '2017-11-10 16:43:25', 's1', '2017-11-10 16:43:25', '', '0');
INSERT INTO `sys_area` VALUES ('1850', '207', '0,1,18,207,', '汉南区', '1850', '420113', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1851', '207', '0,1,18,207,', '蔡甸区', '1851', '420114', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1852', '207', '0,1,18,207,', '江夏区', '1852', '420115', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1853', '207', '0,1,18,207,', '黄陂区', '1853', '420116', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1854', '207', '0,1,18,207,', '新洲区', '1854', '420117', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1855', '208', '0,1,18,208,', '黄石港区', '1855', '420202', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1856', '208', '0,1,18,208,', '西塞山区', '1856', '420203', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1857', '208', '0,1,18,208,', '下陆区', '1857', '420204', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1858', '208', '0,1,18,208,', '铁山区', '1858', '420205', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1859', '208', '0,1,18,208,', '阳新县', '1859', '420222', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('186', '16', '0,1,16,', '聊城市', '186', '371500', '3', 's1', '2017-11-10 16:43:25', 's1', '2017-11-10 16:43:25', '', '0');
INSERT INTO `sys_area` VALUES ('1860', '208', '0,1,18,208,', '大冶市', '1860', '420281', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1861', '209', '0,1,18,209,', '茅箭区', '1861', '420302', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1862', '209', '0,1,18,209,', '张湾区', '1862', '420303', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1863', '209', '0,1,18,209,', '郧阳区', '1863', '420304', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1864', '209', '0,1,18,209,', '郧西县', '1864', '420322', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1865', '209', '0,1,18,209,', '竹山县', '1865', '420323', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1866', '209', '0,1,18,209,', '竹溪县', '1866', '420324', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1867', '209', '0,1,18,209,', '房县', '1867', '420325', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1868', '209', '0,1,18,209,', '丹江口市', '1868', '420381', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1869', '210', '0,1,18,210,', '西陵区', '1869', '420502', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('187', '16', '0,1,16,', '滨州市', '187', '371600', '3', 's1', '2017-11-10 16:43:26', 's1', '2017-11-10 16:43:26', '', '0');
INSERT INTO `sys_area` VALUES ('1870', '210', '0,1,18,210,', '伍家岗区', '1870', '420503', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1871', '210', '0,1,18,210,', '点军区', '1871', '420504', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1872', '210', '0,1,18,210,', '猇亭区', '1872', '420505', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1873', '210', '0,1,18,210,', '夷陵区', '1873', '420506', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1874', '210', '0,1,18,210,', '远安县', '1874', '420525', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1875', '210', '0,1,18,210,', '兴山县', '1875', '420526', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1876', '210', '0,1,18,210,', '秭归县', '1876', '420527', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1877', '210', '0,1,18,210,', '长阳土家族自治县', '1877', '420528', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1878', '210', '0,1,18,210,', '五峰土家族自治县', '1878', '420529', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1879', '210', '0,1,18,210,', '宜都市', '1879', '420581', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('188', '16', '0,1,16,', '菏泽市', '188', '371700', '3', 's1', '2017-11-10 16:43:26', 's1', '2017-11-10 16:43:26', '', '0');
INSERT INTO `sys_area` VALUES ('1880', '210', '0,1,18,210,', '当阳市', '1880', '420582', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1881', '210', '0,1,18,210,', '枝江市', '1881', '420583', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1882', '211', '0,1,18,211,', '襄城区', '1882', '420602', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1883', '211', '0,1,18,211,', '樊城区', '1883', '420606', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1884', '211', '0,1,18,211,', '襄州区', '1884', '420607', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1885', '211', '0,1,18,211,', '南漳县', '1885', '420624', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1886', '211', '0,1,18,211,', '谷城县', '1886', '420625', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1887', '211', '0,1,18,211,', '保康县', '1887', '420626', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1888', '211', '0,1,18,211,', '老河口市', '1888', '420682', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1889', '211', '0,1,18,211,', '枣阳市', '1889', '420683', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('189', '17', '0,1,17,', '郑州市', '189', '410100', '3', 's1', '2017-11-10 16:43:26', 's1', '2017-11-10 16:43:26', '', '0');
INSERT INTO `sys_area` VALUES ('1890', '211', '0,1,18,211,', '宜城市', '1890', '420684', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1891', '212', '0,1,18,212,', '梁子湖区', '1891', '420702', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1892', '212', '0,1,18,212,', '华容区', '1892', '420703', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1893', '212', '0,1,18,212,', '鄂城区', '1893', '420704', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1894', '213', '0,1,18,213,', '东宝区', '1894', '420802', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1895', '213', '0,1,18,213,', '掇刀区', '1895', '420804', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1896', '213', '0,1,18,213,', '京山县', '1896', '420821', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1897', '213', '0,1,18,213,', '沙洋县', '1897', '420822', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1898', '213', '0,1,18,213,', '钟祥市', '1898', '420881', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1899', '214', '0,1,18,214,', '孝南区', '1899', '420902', '4', 's1', '2017-11-10 16:46:36', 's1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('19', '1', '0,1,', '湖南省', '19', '430000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('190', '17', '0,1,17,', '开封市', '190', '410200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1900', '214', '0,1,18,214,', '孝昌县', '1900', '420921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1901', '214', '0,1,18,214,', '大悟县', '1901', '420922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1902', '214', '0,1,18,214,', '云梦县', '1902', '420923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1903', '214', '0,1,18,214,', '应城市', '1903', '420981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1904', '214', '0,1,18,214,', '安陆市', '1904', '420982', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1905', '214', '0,1,18,214,', '汉川市', '1905', '420984', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1906', '215', '0,1,18,215,', '沙市区', '1906', '421002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1907', '215', '0,1,18,215,', '荆州区', '1907', '421003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1908', '215', '0,1,18,215,', '公安县', '1908', '421022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1909', '215', '0,1,18,215,', '监利县', '1909', '421023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('191', '17', '0,1,17,', '洛阳市', '191', '410300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1910', '215', '0,1,18,215,', '江陵县', '1910', '421024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1911', '215', '0,1,18,215,', '石首市', '1911', '421081', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1912', '215', '0,1,18,215,', '洪湖市', '1912', '421083', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1913', '215', '0,1,18,215,', '松滋市', '1913', '421087', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1914', '216', '0,1,18,216,', '黄州区', '1914', '421102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1915', '216', '0,1,18,216,', '团风县', '1915', '421121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1916', '216', '0,1,18,216,', '红安县', '1916', '421122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1917', '216', '0,1,18,216,', '罗田县', '1917', '421123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1918', '216', '0,1,18,216,', '英山县', '1918', '421124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1919', '216', '0,1,18,216,', '浠水县', '1919', '421125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('192', '17', '0,1,17,', '平顶山市', '192', '410400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1920', '216', '0,1,18,216,', '蕲春县', '1920', '421126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1921', '216', '0,1,18,216,', '黄梅县', '1921', '421127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1922', '216', '0,1,18,216,', '麻城市', '1922', '421181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1923', '216', '0,1,18,216,', '武穴市', '1923', '421182', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1924', '217', '0,1,18,217,', '咸安区', '1924', '421202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1925', '217', '0,1,18,217,', '嘉鱼县', '1925', '421221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1926', '217', '0,1,18,217,', '通城县', '1926', '421222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1927', '217', '0,1,18,217,', '崇阳县', '1927', '421223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1928', '217', '0,1,18,217,', '通山县', '1928', '421224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1929', '217', '0,1,18,217,', '赤壁市', '1929', '421281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('193', '17', '0,1,17,', '安阳市', '193', '410500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1930', '218', '0,1,18,218,', '曾都区', '1930', '421303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1931', '218', '0,1,18,218,', '随县', '1931', '421321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1932', '218', '0,1,18,218,', '广水市', '1932', '421381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1933', '219', '0,1,18,219,', '恩施市', '1933', '422801', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1934', '219', '0,1,18,219,', '利川市', '1934', '422802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1935', '219', '0,1,18,219,', '建始县', '1935', '422822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1936', '219', '0,1,18,219,', '巴东县', '1936', '422823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1937', '219', '0,1,18,219,', '宣恩县', '1937', '422825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1938', '219', '0,1,18,219,', '咸丰县', '1938', '422826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1939', '219', '0,1,18,219,', '来凤县', '1939', '422827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('194', '17', '0,1,17,', '鹤壁市', '194', '410600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1940', '219', '0,1,18,219,', '鹤峰县', '1940', '422828', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1941', '220', '0,1,18,220,', '仙桃市', '1941', '429004', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1942', '220', '0,1,18,220,', '潜江市', '1942', '429005', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1943', '220', '0,1,18,220,', '天门市', '1943', '429006', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1944', '220', '0,1,18,220,', '神农架林区', '1944', '429021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1945', '221', '0,1,19,221,', '芙蓉区', '1945', '430102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1946', '221', '0,1,19,221,', '天心区', '1946', '430103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1947', '221', '0,1,19,221,', '岳麓区', '1947', '430104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1948', '221', '0,1,19,221,', '开福区', '1948', '430105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1949', '221', '0,1,19,221,', '雨花区', '1949', '430111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('195', '17', '0,1,17,', '新乡市', '195', '410700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1950', '221', '0,1,19,221,', '望城区', '1950', '430112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1951', '221', '0,1,19,221,', '长沙县', '1951', '430121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1952', '221', '0,1,19,221,', '宁乡县', '1952', '430124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1953', '221', '0,1,19,221,', '浏阳市', '1953', '430181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1954', '222', '0,1,19,222,', '荷塘区', '1954', '430202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1955', '222', '0,1,19,222,', '芦淞区', '1955', '430203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1956', '222', '0,1,19,222,', '石峰区', '1956', '430204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1957', '222', '0,1,19,222,', '天元区', '1957', '430211', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1958', '222', '0,1,19,222,', '株洲县', '1958', '430221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1959', '222', '0,1,19,222,', '攸县', '1959', '430223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('196', '17', '0,1,17,', '焦作市', '196', '410800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1960', '222', '0,1,19,222,', '茶陵县', '1960', '430224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1961', '222', '0,1,19,222,', '炎陵县', '1961', '430225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1962', '222', '0,1,19,222,', '醴陵市', '1962', '430281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1963', '223', '0,1,19,223,', '雨湖区', '1963', '430302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1964', '223', '0,1,19,223,', '岳塘区', '1964', '430304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1965', '223', '0,1,19,223,', '湘潭县', '1965', '430321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1966', '223', '0,1,19,223,', '湘乡市', '1966', '430381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1967', '223', '0,1,19,223,', '韶山市', '1967', '430382', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1968', '224', '0,1,19,224,', '珠晖区', '1968', '430405', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1969', '224', '0,1,19,224,', '雁峰区', '1969', '430406', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('197', '17', '0,1,17,', '濮阳市', '197', '410900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1970', '224', '0,1,19,224,', '石鼓区', '1970', '430407', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1971', '224', '0,1,19,224,', '蒸湘区', '1971', '430408', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1972', '224', '0,1,19,224,', '南岳区', '1972', '430412', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1973', '224', '0,1,19,224,', '衡阳县', '1973', '430421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1974', '224', '0,1,19,224,', '衡南县', '1974', '430422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1975', '224', '0,1,19,224,', '衡山县', '1975', '430423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1976', '224', '0,1,19,224,', '衡东县', '1976', '430424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1977', '224', '0,1,19,224,', '祁东县', '1977', '430426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1978', '224', '0,1,19,224,', '耒阳市', '1978', '430481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1979', '224', '0,1,19,224,', '常宁市', '1979', '430482', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('198', '17', '0,1,17,', '许昌市', '198', '411000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1980', '225', '0,1,19,225,', '双清区', '1980', '430502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1981', '225', '0,1,19,225,', '大祥区', '1981', '430503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1982', '225', '0,1,19,225,', '北塔区', '1982', '430511', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1983', '225', '0,1,19,225,', '邵东县', '1983', '430521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1984', '225', '0,1,19,225,', '新邵县', '1984', '430522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1985', '225', '0,1,19,225,', '邵阳县', '1985', '430523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1986', '225', '0,1,19,225,', '隆回县', '1986', '430524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1987', '225', '0,1,19,225,', '洞口县', '1987', '430525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1988', '225', '0,1,19,225,', '绥宁县', '1988', '430527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1989', '225', '0,1,19,225,', '新宁县', '1989', '430528', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('199', '17', '0,1,17,', '漯河市', '199', '411100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('1990', '225', '0,1,19,225,', '城步苗族自治县', '1990', '430529', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1991', '225', '0,1,19,225,', '武冈市', '1991', '430581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1992', '226', '0,1,19,226,', '岳阳楼区', '1992', '430602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1993', '226', '0,1,19,226,', '云溪区', '1993', '430603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1994', '226', '0,1,19,226,', '君山区', '1994', '430611', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1995', '226', '0,1,19,226,', '岳阳县', '1995', '430621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1996', '226', '0,1,19,226,', '华容县', '1996', '430623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1997', '226', '0,1,19,226,', '湘阴县', '1997', '430624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1998', '226', '0,1,19,226,', '平江县', '1998', '430626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('1999', '226', '0,1,19,226,', '汨罗市', '1999', '430681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '北京市', '2', '110000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('20', '1', '0,1,', '广东省', '20', '440000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('200', '17', '0,1,17,', '三门峡市', '200', '411200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2000', '226', '0,1,19,226,', '临湘市', '2000', '430682', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2001', '227', '0,1,19,227,', '武陵区', '2001', '430702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2002', '227', '0,1,19,227,', '鼎城区', '2002', '430703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2003', '227', '0,1,19,227,', '安乡县', '2003', '430721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2004', '227', '0,1,19,227,', '汉寿县', '2004', '430722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2005', '227', '0,1,19,227,', '澧县', '2005', '430723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2006', '227', '0,1,19,227,', '临澧县', '2006', '430724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2007', '227', '0,1,19,227,', '桃源县', '2007', '430725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2008', '227', '0,1,19,227,', '石门县', '2008', '430726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2009', '227', '0,1,19,227,', '津市市', '2009', '430781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('201', '17', '0,1,17,', '南阳市', '201', '411300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2010', '228', '0,1,19,228,', '永定区', '2010', '430802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2011', '228', '0,1,19,228,', '武陵源区', '2011', '430811', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2012', '228', '0,1,19,228,', '慈利县', '2012', '430821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2013', '228', '0,1,19,228,', '桑植县', '2013', '430822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2014', '229', '0,1,19,229,', '资阳区', '2014', '430902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2015', '229', '0,1,19,229,', '赫山区', '2015', '430903', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2016', '229', '0,1,19,229,', '南县', '2016', '430921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2017', '229', '0,1,19,229,', '桃江县', '2017', '430922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2018', '229', '0,1,19,229,', '安化县', '2018', '430923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2019', '229', '0,1,19,229,', '沅江市', '2019', '430981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('202', '17', '0,1,17,', '商丘市', '202', '411400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2020', '230', '0,1,19,230,', '北湖区', '2020', '431002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2021', '230', '0,1,19,230,', '苏仙区', '2021', '431003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2022', '230', '0,1,19,230,', '桂阳县', '2022', '431021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2023', '230', '0,1,19,230,', '宜章县', '2023', '431022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2024', '230', '0,1,19,230,', '永兴县', '2024', '431023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2025', '230', '0,1,19,230,', '嘉禾县', '2025', '431024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2026', '230', '0,1,19,230,', '临武县', '2026', '431025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2027', '230', '0,1,19,230,', '汝城县', '2027', '431026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2028', '230', '0,1,19,230,', '桂东县', '2028', '431027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2029', '230', '0,1,19,230,', '安仁县', '2029', '431028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('203', '17', '0,1,17,', '信阳市', '203', '411500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2030', '230', '0,1,19,230,', '资兴市', '2030', '431081', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2031', '231', '0,1,19,231,', '零陵区', '2031', '431102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2032', '231', '0,1,19,231,', '冷水滩区', '2032', '431103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2033', '231', '0,1,19,231,', '祁阳县', '2033', '431121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2034', '231', '0,1,19,231,', '东安县', '2034', '431122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2035', '231', '0,1,19,231,', '双牌县', '2035', '431123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2036', '231', '0,1,19,231,', '道县', '2036', '431124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2037', '231', '0,1,19,231,', '江永县', '2037', '431125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2038', '231', '0,1,19,231,', '宁远县', '2038', '431126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2039', '231', '0,1,19,231,', '蓝山县', '2039', '431127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('204', '17', '0,1,17,', '周口市', '204', '411600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2040', '231', '0,1,19,231,', '新田县', '2040', '431128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2041', '231', '0,1,19,231,', '江华瑶族自治县', '2041', '431129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2042', '232', '0,1,19,232,', '鹤城区', '2042', '431202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2043', '232', '0,1,19,232,', '中方县', '2043', '431221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2044', '232', '0,1,19,232,', '沅陵县', '2044', '431222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2045', '232', '0,1,19,232,', '辰溪县', '2045', '431223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2046', '232', '0,1,19,232,', '溆浦县', '2046', '431224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2047', '232', '0,1,19,232,', '会同县', '2047', '431225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2048', '232', '0,1,19,232,', '麻阳苗族自治县', '2048', '431226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2049', '232', '0,1,19,232,', '新晃侗族自治县', '2049', '431227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('205', '17', '0,1,17,', '驻马店市', '205', '411700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2050', '232', '0,1,19,232,', '芷江侗族自治县', '2050', '431228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2051', '232', '0,1,19,232,', '靖州苗族侗族自治县', '2051', '431229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2052', '232', '0,1,19,232,', '通道侗族自治县', '2052', '431230', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2053', '232', '0,1,19,232,', '洪江市', '2053', '431281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2054', '233', '0,1,19,233,', '娄星区', '2054', '431302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2055', '233', '0,1,19,233,', '双峰县', '2055', '431321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2056', '233', '0,1,19,233,', '新化县', '2056', '431322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2057', '233', '0,1,19,233,', '冷水江市', '2057', '431381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2058', '233', '0,1,19,233,', '涟源市', '2058', '431382', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2059', '234', '0,1,19,234,', '吉首市', '2059', '433101', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('206', '17', '0,1,17,', '省直辖县级行政区划', '206', '419000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2060', '234', '0,1,19,234,', '泸溪县', '2060', '433122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2061', '234', '0,1,19,234,', '凤凰县', '2061', '433123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2062', '234', '0,1,19,234,', '花垣县', '2062', '433124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2063', '234', '0,1,19,234,', '保靖县', '2063', '433125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2064', '234', '0,1,19,234,', '古丈县', '2064', '433126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2065', '234', '0,1,19,234,', '永顺县', '2065', '433127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2066', '234', '0,1,19,234,', '龙山县', '2066', '433130', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2067', '235', '0,1,20,235,', '荔湾区', '2067', '440103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2068', '235', '0,1,20,235,', '越秀区', '2068', '440104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2069', '235', '0,1,20,235,', '海珠区', '2069', '440105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('207', '18', '0,1,18,', '武汉市', '207', '420100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2070', '235', '0,1,20,235,', '天河区', '2070', '440106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2071', '235', '0,1,20,235,', '白云区', '2071', '440111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2072', '235', '0,1,20,235,', '黄埔区', '2072', '440112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2073', '235', '0,1,20,235,', '番禺区', '2073', '440113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2074', '235', '0,1,20,235,', '花都区', '2074', '440114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2075', '235', '0,1,20,235,', '南沙区', '2075', '440115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2076', '235', '0,1,20,235,', '萝岗区', '2076', '440116', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2077', '235', '0,1,20,235,', '从化区', '2077', '440117', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2078', '235', '0,1,20,235,', '增城区', '2078', '440118', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2079', '236', '0,1,20,236,', '武江区', '2079', '440203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('208', '18', '0,1,18,', '黄石市', '208', '420200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2080', '236', '0,1,20,236,', '浈江区', '2080', '440204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2081', '236', '0,1,20,236,', '曲江区', '2081', '440205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2082', '236', '0,1,20,236,', '始兴县', '2082', '440222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2083', '236', '0,1,20,236,', '仁化县', '2083', '440224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2084', '236', '0,1,20,236,', '翁源县', '2084', '440229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2085', '236', '0,1,20,236,', '乳源瑶族自治县', '2085', '440232', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2086', '236', '0,1,20,236,', '新丰县', '2086', '440233', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2087', '236', '0,1,20,236,', '乐昌市', '2087', '440281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2088', '236', '0,1,20,236,', '南雄市', '2088', '440282', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2089', '237', '0,1,20,237,', '罗湖区', '2089', '440303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('209', '18', '0,1,18,', '十堰市', '209', '420300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2090', '237', '0,1,20,237,', '福田区', '2090', '440304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2091', '237', '0,1,20,237,', '宝安区', '2091', '440306', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2092', '237', '0,1,20,237,', '龙岗区', '2092', '440307', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2093', '237', '0,1,20,237,', '盐田区', '2093', '440308', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2094', '238', '0,1,20,238,', '香洲区', '2094', '440402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2095', '238', '0,1,20,238,', '斗门区', '2095', '440403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2096', '238', '0,1,20,238,', '金湾区', '2096', '440404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2097', '239', '0,1,20,239,', '龙湖区', '2097', '440507', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2098', '239', '0,1,20,239,', '金平区', '2098', '440511', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2099', '239', '0,1,20,239,', '濠江区', '2099', '440512', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('21', '1', '0,1,', '广西壮族自治区', '21', '450000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('210', '18', '0,1,18,', '宜昌市', '210', '420500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2100', '239', '0,1,20,239,', '潮阳区', '2100', '440513', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2101', '239', '0,1,20,239,', '潮南区', '2101', '440514', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2102', '239', '0,1,20,239,', '澄海区', '2102', '440515', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2103', '239', '0,1,20,239,', '南澳县', '2103', '440523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2104', '240', '0,1,20,240,', '禅城区', '2104', '440604', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2105', '240', '0,1,20,240,', '南海区', '2105', '440605', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2106', '240', '0,1,20,240,', '顺德区', '2106', '440606', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2107', '240', '0,1,20,240,', '三水区', '2107', '440607', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2108', '240', '0,1,20,240,', '高明区', '2108', '440608', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2109', '241', '0,1,20,241,', '蓬江区', '2109', '440703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('211', '18', '0,1,18,', '襄阳市', '211', '420600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2110', '241', '0,1,20,241,', '江海区', '2110', '440704', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2111', '241', '0,1,20,241,', '新会区', '2111', '440705', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2112', '241', '0,1,20,241,', '台山市', '2112', '440781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2113', '241', '0,1,20,241,', '开平市', '2113', '440783', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2114', '241', '0,1,20,241,', '鹤山市', '2114', '440784', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2115', '241', '0,1,20,241,', '恩平市', '2115', '440785', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2116', '242', '0,1,20,242,', '赤坎区', '2116', '440802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2117', '242', '0,1,20,242,', '霞山区', '2117', '440803', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2118', '242', '0,1,20,242,', '坡头区', '2118', '440804', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2119', '242', '0,1,20,242,', '麻章区', '2119', '440811', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('212', '18', '0,1,18,', '鄂州市', '212', '420700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2120', '242', '0,1,20,242,', '遂溪县', '2120', '440823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2121', '242', '0,1,20,242,', '徐闻县', '2121', '440825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2122', '242', '0,1,20,242,', '廉江市', '2122', '440881', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2123', '242', '0,1,20,242,', '雷州市', '2123', '440882', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2124', '242', '0,1,20,242,', '吴川市', '2124', '440883', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2125', '243', '0,1,20,243,', '茂南区', '2125', '440902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2126', '243', '0,1,20,243,', '电白区', '2126', '440904', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2127', '243', '0,1,20,243,', '高州市', '2127', '440981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2128', '243', '0,1,20,243,', '化州市', '2128', '440982', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2129', '243', '0,1,20,243,', '信宜市', '2129', '440983', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('213', '18', '0,1,18,', '荆门市', '213', '420800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2130', '244', '0,1,20,244,', '端州区', '2130', '441202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2131', '244', '0,1,20,244,', '鼎湖区', '2131', '441203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2132', '244', '0,1,20,244,', '广宁县', '2132', '441223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2133', '244', '0,1,20,244,', '怀集县', '2133', '441224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2134', '244', '0,1,20,244,', '封开县', '2134', '441225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2135', '244', '0,1,20,244,', '德庆县', '2135', '441226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2136', '244', '0,1,20,244,', '高要市', '2136', '441283', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2137', '244', '0,1,20,244,', '四会市', '2137', '441284', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2138', '245', '0,1,20,245,', '惠城区', '2138', '441302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2139', '245', '0,1,20,245,', '惠阳区', '2139', '441303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('214', '18', '0,1,18,', '孝感市', '214', '420900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2140', '245', '0,1,20,245,', '博罗县', '2140', '441322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2141', '245', '0,1,20,245,', '惠东县', '2141', '441323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2142', '245', '0,1,20,245,', '龙门县', '2142', '441324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2143', '246', '0,1,20,246,', '梅江区', '2143', '441402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2144', '246', '0,1,20,246,', '梅县区', '2144', '441403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2145', '246', '0,1,20,246,', '大埔县', '2145', '441422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2146', '246', '0,1,20,246,', '丰顺县', '2146', '441423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2147', '246', '0,1,20,246,', '五华县', '2147', '441424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2148', '246', '0,1,20,246,', '平远县', '2148', '441426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2149', '246', '0,1,20,246,', '蕉岭县', '2149', '441427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('215', '18', '0,1,18,', '荆州市', '215', '421000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2150', '246', '0,1,20,246,', '兴宁市', '2150', '441481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2151', '247', '0,1,20,247,', '海丰县', '2151', '441521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2152', '247', '0,1,20,247,', '陆河县', '2152', '441523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2153', '247', '0,1,20,247,', '陆丰市', '2153', '441581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2154', '248', '0,1,20,248,', '源城区', '2154', '441602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2155', '248', '0,1,20,248,', '紫金县', '2155', '441621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2156', '248', '0,1,20,248,', '龙川县', '2156', '441622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2157', '248', '0,1,20,248,', '连平县', '2157', '441623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2158', '248', '0,1,20,248,', '和平县', '2158', '441624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2159', '248', '0,1,20,248,', '东源县', '2159', '441625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('216', '18', '0,1,18,', '黄冈市', '216', '421100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2160', '249', '0,1,20,249,', '江城区', '2160', '441702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2161', '249', '0,1,20,249,', '阳西县', '2161', '441721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2162', '249', '0,1,20,249,', '阳东县', '2162', '441723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2163', '249', '0,1,20,249,', '阳春市', '2163', '441781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2164', '250', '0,1,20,250,', '清城区', '2164', '441802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2165', '250', '0,1,20,250,', '清新区', '2165', '441803', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2166', '250', '0,1,20,250,', '佛冈县', '2166', '441821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2167', '250', '0,1,20,250,', '阳山县', '2167', '441823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2168', '250', '0,1,20,250,', '连山壮族瑶族自治县', '2168', '441825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2169', '250', '0,1,20,250,', '连南瑶族自治县', '2169', '441826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('217', '18', '0,1,18,', '咸宁市', '217', '421200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2170', '250', '0,1,20,250,', '英德市', '2170', '441881', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2171', '250', '0,1,20,250,', '连州市', '2171', '441882', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2172', '253', '0,1,20,253,', '湘桥区', '2172', '445102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2173', '253', '0,1,20,253,', '潮安区', '2173', '445103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2174', '253', '0,1,20,253,', '饶平县', '2174', '445122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2175', '254', '0,1,20,254,', '榕城区', '2175', '445202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2176', '254', '0,1,20,254,', '揭东区', '2176', '445203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2177', '254', '0,1,20,254,', '揭西县', '2177', '445222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2178', '254', '0,1,20,254,', '惠来县', '2178', '445224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2179', '254', '0,1,20,254,', '普宁市', '2179', '445281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('218', '18', '0,1,18,', '随州市', '218', '421300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2180', '255', '0,1,20,255,', '云城区', '2180', '445302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2181', '255', '0,1,20,255,', '云安区', '2181', '445303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2182', '255', '0,1,20,255,', '新兴县', '2182', '445321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2183', '255', '0,1,20,255,', '郁南县', '2183', '445322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2184', '255', '0,1,20,255,', '罗定市', '2184', '445381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2185', '256', '0,1,21,256,', '兴宁区', '2185', '450102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2186', '256', '0,1,21,256,', '青秀区', '2186', '450103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2187', '256', '0,1,21,256,', '江南区', '2187', '450105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2188', '256', '0,1,21,256,', '西乡塘区', '2188', '450107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2189', '256', '0,1,21,256,', '良庆区', '2189', '450108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('219', '18', '0,1,18,', '恩施土家族苗族自治州', '219', '422800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2190', '256', '0,1,21,256,', '邕宁区', '2190', '450109', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2191', '256', '0,1,21,256,', '武鸣县', '2191', '450122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2192', '256', '0,1,21,256,', '隆安县', '2192', '450123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2193', '256', '0,1,21,256,', '马山县', '2193', '450124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2194', '256', '0,1,21,256,', '上林县', '2194', '450125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2195', '256', '0,1,21,256,', '宾阳县', '2195', '450126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2196', '256', '0,1,21,256,', '横县', '2196', '450127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2197', '257', '0,1,21,257,', '城中区', '2197', '450202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2198', '257', '0,1,21,257,', '鱼峰区', '2198', '450203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2199', '257', '0,1,21,257,', '柳南区', '2199', '450204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('22', '1', '0,1,', '海南省', '22', '460000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('220', '18', '0,1,18,', '省直辖县级行政区划', '220', '429000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2200', '257', '0,1,21,257,', '柳北区', '2200', '450205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2201', '257', '0,1,21,257,', '柳江县', '2201', '450221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2202', '257', '0,1,21,257,', '柳城县', '2202', '450222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2203', '257', '0,1,21,257,', '鹿寨县', '2203', '450223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2204', '257', '0,1,21,257,', '融安县', '2204', '450224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2205', '257', '0,1,21,257,', '融水苗族自治县', '2205', '450225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2206', '257', '0,1,21,257,', '三江侗族自治县', '2206', '450226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2207', '258', '0,1,21,258,', '秀峰区', '2207', '450302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2208', '258', '0,1,21,258,', '叠彩区', '2208', '450303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2209', '258', '0,1,21,258,', '象山区', '2209', '450304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('221', '19', '0,1,19,', '长沙市', '221', '430100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2210', '258', '0,1,21,258,', '七星区', '2210', '450305', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2211', '258', '0,1,21,258,', '雁山区', '2211', '450311', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2212', '258', '0,1,21,258,', '临桂区', '2212', '450312', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2213', '258', '0,1,21,258,', '阳朔县', '2213', '450321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2214', '258', '0,1,21,258,', '灵川县', '2214', '450323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2215', '258', '0,1,21,258,', '全州县', '2215', '450324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2216', '258', '0,1,21,258,', '兴安县', '2216', '450325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2217', '258', '0,1,21,258,', '永福县', '2217', '450326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2218', '258', '0,1,21,258,', '灌阳县', '2218', '450327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2219', '258', '0,1,21,258,', '龙胜各族自治县', '2219', '450328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('222', '19', '0,1,19,', '株洲市', '222', '430200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2220', '258', '0,1,21,258,', '资源县', '2220', '450329', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2221', '258', '0,1,21,258,', '平乐县', '2221', '450330', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2222', '258', '0,1,21,258,', '荔浦县', '2222', '450331', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2223', '258', '0,1,21,258,', '恭城瑶族自治县', '2223', '450332', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2224', '259', '0,1,21,259,', '万秀区', '2224', '450403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2225', '259', '0,1,21,259,', '长洲区', '2225', '450405', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2226', '259', '0,1,21,259,', '龙圩区', '2226', '450406', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2227', '259', '0,1,21,259,', '苍梧县', '2227', '450421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2228', '259', '0,1,21,259,', '藤县', '2228', '450422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2229', '259', '0,1,21,259,', '蒙山县', '2229', '450423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('223', '19', '0,1,19,', '湘潭市', '223', '430300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2230', '259', '0,1,21,259,', '岑溪市', '2230', '450481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2231', '260', '0,1,21,260,', '海城区', '2231', '450502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2232', '260', '0,1,21,260,', '银海区', '2232', '450503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2233', '260', '0,1,21,260,', '铁山港区', '2233', '450512', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2234', '260', '0,1,21,260,', '合浦县', '2234', '450521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2235', '261', '0,1,21,261,', '港口区', '2235', '450602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2236', '261', '0,1,21,261,', '防城区', '2236', '450603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2237', '261', '0,1,21,261,', '上思县', '2237', '450621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2238', '261', '0,1,21,261,', '东兴市', '2238', '450681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2239', '262', '0,1,21,262,', '钦南区', '2239', '450702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('224', '19', '0,1,19,', '衡阳市', '224', '430400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2240', '262', '0,1,21,262,', '钦北区', '2240', '450703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2241', '262', '0,1,21,262,', '灵山县', '2241', '450721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2242', '262', '0,1,21,262,', '浦北县', '2242', '450722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2243', '263', '0,1,21,263,', '港北区', '2243', '450802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2244', '263', '0,1,21,263,', '港南区', '2244', '450803', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2245', '263', '0,1,21,263,', '覃塘区', '2245', '450804', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2246', '263', '0,1,21,263,', '平南县', '2246', '450821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2247', '263', '0,1,21,263,', '桂平市', '2247', '450881', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2248', '264', '0,1,21,264,', '玉州区', '2248', '450902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2249', '264', '0,1,21,264,', '福绵区', '2249', '450903', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('225', '19', '0,1,19,', '邵阳市', '225', '430500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2250', '264', '0,1,21,264,', '容县', '2250', '450921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2251', '264', '0,1,21,264,', '陆川县', '2251', '450922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2252', '264', '0,1,21,264,', '博白县', '2252', '450923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2253', '264', '0,1,21,264,', '兴业县', '2253', '450924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2254', '264', '0,1,21,264,', '北流市', '2254', '450981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2255', '265', '0,1,21,265,', '右江区', '2255', '451002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2256', '265', '0,1,21,265,', '田阳县', '2256', '451021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2257', '265', '0,1,21,265,', '田东县', '2257', '451022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2258', '265', '0,1,21,265,', '平果县', '2258', '451023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2259', '265', '0,1,21,265,', '德保县', '2259', '451024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('226', '19', '0,1,19,', '岳阳市', '226', '430600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2260', '265', '0,1,21,265,', '靖西县', '2260', '451025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2261', '265', '0,1,21,265,', '那坡县', '2261', '451026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2262', '265', '0,1,21,265,', '凌云县', '2262', '451027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2263', '265', '0,1,21,265,', '乐业县', '2263', '451028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2264', '265', '0,1,21,265,', '田林县', '2264', '451029', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2265', '265', '0,1,21,265,', '西林县', '2265', '451030', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2266', '265', '0,1,21,265,', '隆林各族自治县', '2266', '451031', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2267', '266', '0,1,21,266,', '八步区', '2267', '451102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2268', '266', '0,1,21,266,', '昭平县', '2268', '451121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2269', '266', '0,1,21,266,', '钟山县', '2269', '451122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('227', '19', '0,1,19,', '常德市', '227', '430700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2270', '266', '0,1,21,266,', '富川瑶族自治县', '2270', '451123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2271', '267', '0,1,21,267,', '金城江区', '2271', '451202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2272', '267', '0,1,21,267,', '南丹县', '2272', '451221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2273', '267', '0,1,21,267,', '天峨县', '2273', '451222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2274', '267', '0,1,21,267,', '凤山县', '2274', '451223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2275', '267', '0,1,21,267,', '东兰县', '2275', '451224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2276', '267', '0,1,21,267,', '罗城仫佬族自治县', '2276', '451225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2277', '267', '0,1,21,267,', '环江毛南族自治县', '2277', '451226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2278', '267', '0,1,21,267,', '巴马瑶族自治县', '2278', '451227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2279', '267', '0,1,21,267,', '都安瑶族自治县', '2279', '451228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('228', '19', '0,1,19,', '张家界市', '228', '430800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2280', '267', '0,1,21,267,', '大化瑶族自治县', '2280', '451229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2281', '267', '0,1,21,267,', '宜州市', '2281', '451281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2282', '268', '0,1,21,268,', '兴宾区', '2282', '451302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2283', '268', '0,1,21,268,', '忻城县', '2283', '451321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2284', '268', '0,1,21,268,', '象州县', '2284', '451322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2285', '268', '0,1,21,268,', '武宣县', '2285', '451323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2286', '268', '0,1,21,268,', '金秀瑶族自治县', '2286', '451324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2287', '268', '0,1,21,268,', '合山市', '2287', '451381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2288', '269', '0,1,21,269,', '江州区', '2288', '451402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2289', '269', '0,1,21,269,', '扶绥县', '2289', '451421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('229', '19', '0,1,19,', '益阳市', '229', '430900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2290', '269', '0,1,21,269,', '宁明县', '2290', '451422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2291', '269', '0,1,21,269,', '龙州县', '2291', '451423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2292', '269', '0,1,21,269,', '大新县', '2292', '451424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2293', '269', '0,1,21,269,', '天等县', '2293', '451425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2294', '269', '0,1,21,269,', '凭祥市', '2294', '451481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2295', '270', '0,1,22,270,', '秀英区', '2295', '460105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2296', '270', '0,1,22,270,', '龙华区', '2296', '460106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2297', '270', '0,1,22,270,', '琼山区', '2297', '460107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2298', '270', '0,1,22,270,', '美兰区', '2298', '460108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2299', '271', '0,1,22,271,', '海棠区', '2299', '460202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('23', '1', '0,1,', '重庆市', '23', '500000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('230', '19', '0,1,19,', '郴州市', '230', '431000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2300', '271', '0,1,22,271,', '吉阳区', '2300', '460203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2301', '271', '0,1,22,271,', '天涯区', '2301', '460204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2302', '271', '0,1,22,271,', '崖州区', '2302', '460205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2303', '273', '0,1,22,273,', '五指山市', '2303', '469001', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2304', '273', '0,1,22,273,', '琼海市', '2304', '469002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2305', '273', '0,1,22,273,', '儋州市', '2305', '469003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2306', '273', '0,1,22,273,', '文昌市', '2306', '469005', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2307', '273', '0,1,22,273,', '万宁市', '2307', '469006', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2308', '273', '0,1,22,273,', '东方市', '2308', '469007', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2309', '273', '0,1,22,273,', '定安县', '2309', '469021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('231', '19', '0,1,19,', '永州市', '231', '431100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2310', '273', '0,1,22,273,', '屯昌县', '2310', '469022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2311', '273', '0,1,22,273,', '澄迈县', '2311', '469023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2312', '273', '0,1,22,273,', '临高县', '2312', '469024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2313', '273', '0,1,22,273,', '白沙黎族自治县', '2313', '469025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2314', '273', '0,1,22,273,', '昌江黎族自治县', '2314', '469026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2315', '273', '0,1,22,273,', '乐东黎族自治县', '2315', '469027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2316', '273', '0,1,22,273,', '陵水黎族自治县', '2316', '469028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2317', '273', '0,1,22,273,', '保亭黎族苗族自治县', '2317', '469029', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2318', '273', '0,1,22,273,', '琼中黎族苗族自治县', '2318', '469030', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2319', '274', '0,1,23,274,', '万州区', '2319', '500101', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('232', '19', '0,1,19,', '怀化市', '232', '431200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2320', '274', '0,1,23,274,', '涪陵区', '2320', '500102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2321', '274', '0,1,23,274,', '渝中区', '2321', '500103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2322', '274', '0,1,23,274,', '大渡口区', '2322', '500104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2323', '274', '0,1,23,274,', '沙坪坝区', '2323', '500106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2324', '274', '0,1,23,274,', '九龙坡区', '2324', '500107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2325', '274', '0,1,23,274,', '南岸区', '2325', '500108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2326', '274', '0,1,23,274,', '北碚区', '2326', '500109', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2327', '274', '0,1,23,274,', '綦江区', '2327', '500110', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2328', '274', '0,1,23,274,', '大足区', '2328', '500111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2329', '274', '0,1,23,274,', '渝北区', '2329', '500112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('233', '19', '0,1,19,', '娄底市', '233', '431300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2330', '274', '0,1,23,274,', '巴南区', '2330', '500113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2331', '274', '0,1,23,274,', '黔江区', '2331', '500114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2332', '274', '0,1,23,274,', '长寿区', '2332', '500115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2333', '274', '0,1,23,274,', '江津区', '2333', '500116', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2334', '274', '0,1,23,274,', '合川区', '2334', '500117', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2335', '274', '0,1,23,274,', '永川区', '2335', '500118', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2336', '274', '0,1,23,274,', '南川区', '2336', '500119', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2337', '274', '0,1,23,274,', '璧山区', '2337', '500120', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2338', '274', '0,1,23,274,', '铜梁区', '2338', '500151', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2339', '275', '0,1,23,275,', '潼南县', '2339', '500223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('234', '19', '0,1,19,', '湘西土家族苗族自治州', '234', '433100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2340', '275', '0,1,23,275,', '荣昌县', '2340', '500226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2341', '275', '0,1,23,275,', '梁平县', '2341', '500228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2342', '275', '0,1,23,275,', '城口县', '2342', '500229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2343', '275', '0,1,23,275,', '丰都县', '2343', '500230', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2344', '275', '0,1,23,275,', '垫江县', '2344', '500231', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2345', '275', '0,1,23,275,', '武隆县', '2345', '500232', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2346', '275', '0,1,23,275,', '忠县', '2346', '500233', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2347', '275', '0,1,23,275,', '开县', '2347', '500234', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2348', '275', '0,1,23,275,', '云阳县', '2348', '500235', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2349', '275', '0,1,23,275,', '奉节县', '2349', '500236', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('235', '20', '0,1,20,', '广州市', '235', '440100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2350', '275', '0,1,23,275,', '巫山县', '2350', '500237', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2351', '275', '0,1,23,275,', '巫溪县', '2351', '500238', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2352', '275', '0,1,23,275,', '石柱土家族自治县', '2352', '500240', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2353', '275', '0,1,23,275,', '秀山土家族苗族自治县', '2353', '500241', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2354', '275', '0,1,23,275,', '酉阳土家族苗族自治县', '2354', '500242', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2355', '275', '0,1,23,275,', '彭水苗族土家族自治县', '2355', '500243', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2356', '276', '0,1,24,276,', '锦江区', '2356', '510104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2357', '276', '0,1,24,276,', '青羊区', '2357', '510105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2358', '276', '0,1,24,276,', '金牛区', '2358', '510106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2359', '276', '0,1,24,276,', '武侯区', '2359', '510107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('236', '20', '0,1,20,', '韶关市', '236', '440200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2360', '276', '0,1,24,276,', '成华区', '2360', '510108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2361', '276', '0,1,24,276,', '龙泉驿区', '2361', '510112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2362', '276', '0,1,24,276,', '青白江区', '2362', '510113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2363', '276', '0,1,24,276,', '新都区', '2363', '510114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2364', '276', '0,1,24,276,', '温江区', '2364', '510115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2365', '276', '0,1,24,276,', '金堂县', '2365', '510121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2366', '276', '0,1,24,276,', '双流县', '2366', '510122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2367', '276', '0,1,24,276,', '郫县', '2367', '510124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2368', '276', '0,1,24,276,', '大邑县', '2368', '510129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2369', '276', '0,1,24,276,', '蒲江县', '2369', '510131', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('237', '20', '0,1,20,', '深圳市', '237', '440300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2370', '276', '0,1,24,276,', '新津县', '2370', '510132', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2371', '276', '0,1,24,276,', '都江堰市', '2371', '510181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2372', '276', '0,1,24,276,', '彭州市', '2372', '510182', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2373', '276', '0,1,24,276,', '邛崃市', '2373', '510183', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2374', '276', '0,1,24,276,', '崇州市', '2374', '510184', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2375', '277', '0,1,24,277,', '自流井区', '2375', '510302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2376', '277', '0,1,24,277,', '贡井区', '2376', '510303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2377', '277', '0,1,24,277,', '大安区', '2377', '510304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2378', '277', '0,1,24,277,', '沿滩区', '2378', '510311', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2379', '277', '0,1,24,277,', '荣县', '2379', '510321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('238', '20', '0,1,20,', '珠海市', '238', '440400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2380', '277', '0,1,24,277,', '富顺县', '2380', '510322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2381', '278', '0,1,24,278,', '东区', '2381', '510402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2382', '278', '0,1,24,278,', '西区', '2382', '510403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2383', '278', '0,1,24,278,', '仁和区', '2383', '510411', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2384', '278', '0,1,24,278,', '米易县', '2384', '510421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2385', '278', '0,1,24,278,', '盐边县', '2385', '510422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2386', '279', '0,1,24,279,', '江阳区', '2386', '510502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2387', '279', '0,1,24,279,', '纳溪区', '2387', '510503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2388', '279', '0,1,24,279,', '龙马潭区', '2388', '510504', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2389', '279', '0,1,24,279,', '泸县', '2389', '510521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('239', '20', '0,1,20,', '汕头市', '239', '440500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2390', '279', '0,1,24,279,', '合江县', '2390', '510522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2391', '279', '0,1,24,279,', '叙永县', '2391', '510524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2392', '279', '0,1,24,279,', '古蔺县', '2392', '510525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2393', '280', '0,1,24,280,', '旌阳区', '2393', '510603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2394', '280', '0,1,24,280,', '中江县', '2394', '510623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2395', '280', '0,1,24,280,', '罗江县', '2395', '510626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2396', '280', '0,1,24,280,', '广汉市', '2396', '510681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2397', '280', '0,1,24,280,', '什邡市', '2397', '510682', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2398', '280', '0,1,24,280,', '绵竹市', '2398', '510683', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2399', '281', '0,1,24,281,', '涪城区', '2399', '510703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('24', '1', '0,1,', '四川省', '24', '510000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('240', '20', '0,1,20,', '佛山市', '240', '440600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2400', '281', '0,1,24,281,', '游仙区', '2400', '510704', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2401', '281', '0,1,24,281,', '三台县', '2401', '510722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2402', '281', '0,1,24,281,', '盐亭县', '2402', '510723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2403', '281', '0,1,24,281,', '安县', '2403', '510724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2404', '281', '0,1,24,281,', '梓潼县', '2404', '510725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2405', '281', '0,1,24,281,', '北川羌族自治县', '2405', '510726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2406', '281', '0,1,24,281,', '平武县', '2406', '510727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2407', '281', '0,1,24,281,', '江油市', '2407', '510781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2408', '282', '0,1,24,282,', '利州区', '2408', '510802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2409', '282', '0,1,24,282,', '昭化区', '2409', '510811', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('241', '20', '0,1,20,', '江门市', '241', '440700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2410', '282', '0,1,24,282,', '朝天区', '2410', '510812', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2411', '282', '0,1,24,282,', '旺苍县', '2411', '510821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2412', '282', '0,1,24,282,', '青川县', '2412', '510822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2413', '282', '0,1,24,282,', '剑阁县', '2413', '510823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2414', '282', '0,1,24,282,', '苍溪县', '2414', '510824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2415', '283', '0,1,24,283,', '船山区', '2415', '510903', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2416', '283', '0,1,24,283,', '安居区', '2416', '510904', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2417', '283', '0,1,24,283,', '蓬溪县', '2417', '510921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2418', '283', '0,1,24,283,', '射洪县', '2418', '510922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2419', '283', '0,1,24,283,', '大英县', '2419', '510923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('242', '20', '0,1,20,', '湛江市', '242', '440800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2420', '284', '0,1,24,284,', '东兴区', '2420', '511011', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2421', '284', '0,1,24,284,', '威远县', '2421', '511024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2422', '284', '0,1,24,284,', '资中县', '2422', '511025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2423', '284', '0,1,24,284,', '隆昌县', '2423', '511028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2424', '285', '0,1,24,285,', '市中区', '2424', '511102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2425', '285', '0,1,24,285,', '沙湾区', '2425', '511111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2426', '285', '0,1,24,285,', '五通桥区', '2426', '511112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2427', '285', '0,1,24,285,', '金口河区', '2427', '511113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2428', '285', '0,1,24,285,', '犍为县', '2428', '511123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2429', '285', '0,1,24,285,', '井研县', '2429', '511124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('243', '20', '0,1,20,', '茂名市', '243', '440900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2430', '285', '0,1,24,285,', '夹江县', '2430', '511126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2431', '285', '0,1,24,285,', '沐川县', '2431', '511129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2432', '285', '0,1,24,285,', '峨边彝族自治县', '2432', '511132', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2433', '285', '0,1,24,285,', '马边彝族自治县', '2433', '511133', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2434', '285', '0,1,24,285,', '峨眉山市', '2434', '511181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2435', '286', '0,1,24,286,', '顺庆区', '2435', '511302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2436', '286', '0,1,24,286,', '高坪区', '2436', '511303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2437', '286', '0,1,24,286,', '嘉陵区', '2437', '511304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2438', '286', '0,1,24,286,', '南部县', '2438', '511321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2439', '286', '0,1,24,286,', '营山县', '2439', '511322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('244', '20', '0,1,20,', '肇庆市', '244', '441200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2440', '286', '0,1,24,286,', '蓬安县', '2440', '511323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2441', '286', '0,1,24,286,', '仪陇县', '2441', '511324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2442', '286', '0,1,24,286,', '西充县', '2442', '511325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2443', '286', '0,1,24,286,', '阆中市', '2443', '511381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2444', '287', '0,1,24,287,', '东坡区', '2444', '511402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2445', '287', '0,1,24,287,', '仁寿县', '2445', '511421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2446', '287', '0,1,24,287,', '彭山县', '2446', '511422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2447', '287', '0,1,24,287,', '洪雅县', '2447', '511423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2448', '287', '0,1,24,287,', '丹棱县', '2448', '511424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2449', '287', '0,1,24,287,', '青神县', '2449', '511425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('245', '20', '0,1,20,', '惠州市', '245', '441300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2450', '288', '0,1,24,288,', '翠屏区', '2450', '511502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2451', '288', '0,1,24,288,', '南溪区', '2451', '511503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2452', '288', '0,1,24,288,', '宜宾县', '2452', '511521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2453', '288', '0,1,24,288,', '江安县', '2453', '511523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2454', '288', '0,1,24,288,', '长宁县', '2454', '511524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2455', '288', '0,1,24,288,', '高县', '2455', '511525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2456', '288', '0,1,24,288,', '珙县', '2456', '511526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2457', '288', '0,1,24,288,', '筠连县', '2457', '511527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2458', '288', '0,1,24,288,', '兴文县', '2458', '511528', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2459', '288', '0,1,24,288,', '屏山县', '2459', '511529', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('246', '20', '0,1,20,', '梅州市', '246', '441400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2460', '289', '0,1,24,289,', '广安区', '2460', '511602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2461', '289', '0,1,24,289,', '前锋区', '2461', '511603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2462', '289', '0,1,24,289,', '岳池县', '2462', '511621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2463', '289', '0,1,24,289,', '武胜县', '2463', '511622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2464', '289', '0,1,24,289,', '邻水县', '2464', '511623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2465', '289', '0,1,24,289,', '华蓥市', '2465', '511681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2466', '290', '0,1,24,290,', '通川区', '2466', '511702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2467', '290', '0,1,24,290,', '达川区', '2467', '511703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2468', '290', '0,1,24,290,', '宣汉县', '2468', '511722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2469', '290', '0,1,24,290,', '开江县', '2469', '511723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('247', '20', '0,1,20,', '汕尾市', '247', '441500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2470', '290', '0,1,24,290,', '大竹县', '2470', '511724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2471', '290', '0,1,24,290,', '渠县', '2471', '511725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2472', '290', '0,1,24,290,', '万源市', '2472', '511781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2473', '291', '0,1,24,291,', '雨城区', '2473', '511802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2474', '291', '0,1,24,291,', '名山区', '2474', '511803', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2475', '291', '0,1,24,291,', '荥经县', '2475', '511822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2476', '291', '0,1,24,291,', '汉源县', '2476', '511823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2477', '291', '0,1,24,291,', '石棉县', '2477', '511824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2478', '291', '0,1,24,291,', '天全县', '2478', '511825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2479', '291', '0,1,24,291,', '芦山县', '2479', '511826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('248', '20', '0,1,20,', '河源市', '248', '441600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2480', '291', '0,1,24,291,', '宝兴县', '2480', '511827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2481', '292', '0,1,24,292,', '巴州区', '2481', '511902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2482', '292', '0,1,24,292,', '恩阳区', '2482', '511903', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2483', '292', '0,1,24,292,', '通江县', '2483', '511921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2484', '292', '0,1,24,292,', '南江县', '2484', '511922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2485', '292', '0,1,24,292,', '平昌县', '2485', '511923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2486', '293', '0,1,24,293,', '雁江区', '2486', '512002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2487', '293', '0,1,24,293,', '安岳县', '2487', '512021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2488', '293', '0,1,24,293,', '乐至县', '2488', '512022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2489', '293', '0,1,24,293,', '简阳市', '2489', '512081', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('249', '20', '0,1,20,', '阳江市', '249', '441700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2490', '294', '0,1,24,294,', '汶川县', '2490', '513221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2491', '294', '0,1,24,294,', '理县', '2491', '513222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2492', '294', '0,1,24,294,', '茂县', '2492', '513223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2493', '294', '0,1,24,294,', '松潘县', '2493', '513224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2494', '294', '0,1,24,294,', '九寨沟县', '2494', '513225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2495', '294', '0,1,24,294,', '金川县', '2495', '513226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2496', '294', '0,1,24,294,', '小金县', '2496', '513227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2497', '294', '0,1,24,294,', '黑水县', '2497', '513228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2498', '294', '0,1,24,294,', '马尔康县', '2498', '513229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2499', '294', '0,1,24,294,', '壤塘县', '2499', '513230', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('25', '1', '0,1,', '贵州省', '25', '520000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('250', '20', '0,1,20,', '清远市', '250', '441800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2500', '294', '0,1,24,294,', '阿坝县', '2500', '513231', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2501', '294', '0,1,24,294,', '若尔盖县', '2501', '513232', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2502', '294', '0,1,24,294,', '红原县', '2502', '513233', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2503', '295', '0,1,24,295,', '康定县', '2503', '513321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2504', '295', '0,1,24,295,', '泸定县', '2504', '513322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2505', '295', '0,1,24,295,', '丹巴县', '2505', '513323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2506', '295', '0,1,24,295,', '九龙县', '2506', '513324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2507', '295', '0,1,24,295,', '雅江县', '2507', '513325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2508', '295', '0,1,24,295,', '道孚县', '2508', '513326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2509', '295', '0,1,24,295,', '炉霍县', '2509', '513327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('251', '20', '0,1,20,', '东莞市', '251', '441900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2510', '295', '0,1,24,295,', '甘孜县', '2510', '513328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2511', '295', '0,1,24,295,', '新龙县', '2511', '513329', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2512', '295', '0,1,24,295,', '德格县', '2512', '513330', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2513', '295', '0,1,24,295,', '白玉县', '2513', '513331', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2514', '295', '0,1,24,295,', '石渠县', '2514', '513332', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2515', '295', '0,1,24,295,', '色达县', '2515', '513333', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2516', '295', '0,1,24,295,', '理塘县', '2516', '513334', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2517', '295', '0,1,24,295,', '巴塘县', '2517', '513335', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2518', '295', '0,1,24,295,', '乡城县', '2518', '513336', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2519', '295', '0,1,24,295,', '稻城县', '2519', '513337', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('252', '20', '0,1,20,', '中山市', '252', '442000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2520', '295', '0,1,24,295,', '得荣县', '2520', '513338', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2521', '296', '0,1,24,296,', '西昌市', '2521', '513401', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2522', '296', '0,1,24,296,', '木里藏族自治县', '2522', '513422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2523', '296', '0,1,24,296,', '盐源县', '2523', '513423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2524', '296', '0,1,24,296,', '德昌县', '2524', '513424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2525', '296', '0,1,24,296,', '会理县', '2525', '513425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2526', '296', '0,1,24,296,', '会东县', '2526', '513426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2527', '296', '0,1,24,296,', '宁南县', '2527', '513427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2528', '296', '0,1,24,296,', '普格县', '2528', '513428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2529', '296', '0,1,24,296,', '布拖县', '2529', '513429', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('253', '20', '0,1,20,', '潮州市', '253', '445100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2530', '296', '0,1,24,296,', '金阳县', '2530', '513430', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2531', '296', '0,1,24,296,', '昭觉县', '2531', '513431', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2532', '296', '0,1,24,296,', '喜德县', '2532', '513432', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2533', '296', '0,1,24,296,', '冕宁县', '2533', '513433', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2534', '296', '0,1,24,296,', '越西县', '2534', '513434', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2535', '296', '0,1,24,296,', '甘洛县', '2535', '513435', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2536', '296', '0,1,24,296,', '美姑县', '2536', '513436', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2537', '296', '0,1,24,296,', '雷波县', '2537', '513437', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2538', '297', '0,1,25,297,', '南明区', '2538', '520102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2539', '297', '0,1,25,297,', '云岩区', '2539', '520103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('254', '20', '0,1,20,', '揭阳市', '254', '445200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2540', '297', '0,1,25,297,', '花溪区', '2540', '520111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2541', '297', '0,1,25,297,', '乌当区', '2541', '520112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2542', '297', '0,1,25,297,', '白云区', '2542', '520113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2543', '297', '0,1,25,297,', '观山湖区', '2543', '520115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2544', '297', '0,1,25,297,', '开阳县', '2544', '520121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2545', '297', '0,1,25,297,', '息烽县', '2545', '520122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2546', '297', '0,1,25,297,', '修文县', '2546', '520123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2547', '297', '0,1,25,297,', '清镇市', '2547', '520181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2548', '298', '0,1,25,298,', '钟山区', '2548', '520201', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2549', '298', '0,1,25,298,', '六枝特区', '2549', '520203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('255', '20', '0,1,20,', '云浮市', '255', '445300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2550', '298', '0,1,25,298,', '水城县', '2550', '520221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2551', '298', '0,1,25,298,', '盘县', '2551', '520222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2552', '299', '0,1,25,299,', '红花岗区', '2552', '520302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2553', '299', '0,1,25,299,', '汇川区', '2553', '520303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2554', '299', '0,1,25,299,', '遵义县', '2554', '520321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2555', '299', '0,1,25,299,', '桐梓县', '2555', '520322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2556', '299', '0,1,25,299,', '绥阳县', '2556', '520323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2557', '299', '0,1,25,299,', '正安县', '2557', '520324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2558', '299', '0,1,25,299,', '道真仡佬族苗族自治县', '2558', '520325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2559', '299', '0,1,25,299,', '务川仡佬族苗族自治县', '2559', '520326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('256', '21', '0,1,21,', '南宁市', '256', '450100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2560', '299', '0,1,25,299,', '凤冈县', '2560', '520327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2561', '299', '0,1,25,299,', '湄潭县', '2561', '520328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2562', '299', '0,1,25,299,', '余庆县', '2562', '520329', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2563', '299', '0,1,25,299,', '习水县', '2563', '520330', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2564', '299', '0,1,25,299,', '赤水市', '2564', '520381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2565', '299', '0,1,25,299,', '仁怀市', '2565', '520382', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2566', '300', '0,1,25,300,', '西秀区', '2566', '520402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2567', '300', '0,1,25,300,', '平坝县', '2567', '520421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2568', '300', '0,1,25,300,', '普定县', '2568', '520422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2569', '300', '0,1,25,300,', '镇宁布依族苗族自治县', '2569', '520423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('257', '21', '0,1,21,', '柳州市', '257', '450200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2570', '300', '0,1,25,300,', '关岭布依族苗族自治县', '2570', '520424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2571', '300', '0,1,25,300,', '紫云苗族布依族自治县', '2571', '520425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2572', '301', '0,1,25,301,', '七星关区', '2572', '520502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2573', '301', '0,1,25,301,', '大方县', '2573', '520521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2574', '301', '0,1,25,301,', '黔西县', '2574', '520522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2575', '301', '0,1,25,301,', '金沙县', '2575', '520523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2576', '301', '0,1,25,301,', '织金县', '2576', '520524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2577', '301', '0,1,25,301,', '纳雍县', '2577', '520525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2578', '301', '0,1,25,301,', '威宁彝族回族苗族自治县', '2578', '520526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2579', '301', '0,1,25,301,', '赫章县', '2579', '520527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('258', '21', '0,1,21,', '桂林市', '258', '450300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2580', '302', '0,1,25,302,', '碧江区', '2580', '520602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2581', '302', '0,1,25,302,', '万山区', '2581', '520603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2582', '302', '0,1,25,302,', '江口县', '2582', '520621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2583', '302', '0,1,25,302,', '玉屏侗族自治县', '2583', '520622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2584', '302', '0,1,25,302,', '石阡县', '2584', '520623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2585', '302', '0,1,25,302,', '思南县', '2585', '520624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2586', '302', '0,1,25,302,', '印江土家族苗族自治县', '2586', '520625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2587', '302', '0,1,25,302,', '德江县', '2587', '520626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2588', '302', '0,1,25,302,', '沿河土家族自治县', '2588', '520627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2589', '302', '0,1,25,302,', '松桃苗族自治县', '2589', '520628', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('259', '21', '0,1,21,', '梧州市', '259', '450400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2590', '303', '0,1,25,303,', '兴义市', '2590', '522301', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2591', '303', '0,1,25,303,', '兴仁县', '2591', '522322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2592', '303', '0,1,25,303,', '普安县', '2592', '522323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2593', '303', '0,1,25,303,', '晴隆县', '2593', '522324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2594', '303', '0,1,25,303,', '贞丰县', '2594', '522325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2595', '303', '0,1,25,303,', '望谟县', '2595', '522326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2596', '303', '0,1,25,303,', '册亨县', '2596', '522327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2597', '303', '0,1,25,303,', '安龙县', '2597', '522328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2598', '304', '0,1,25,304,', '凯里市', '2598', '522601', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2599', '304', '0,1,25,304,', '黄平县', '2599', '522622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('26', '1', '0,1,', '云南省', '26', '530000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('260', '21', '0,1,21,', '北海市', '260', '450500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2600', '304', '0,1,25,304,', '施秉县', '2600', '522623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2601', '304', '0,1,25,304,', '三穗县', '2601', '522624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2602', '304', '0,1,25,304,', '镇远县', '2602', '522625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2603', '304', '0,1,25,304,', '岑巩县', '2603', '522626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2604', '304', '0,1,25,304,', '天柱县', '2604', '522627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2605', '304', '0,1,25,304,', '锦屏县', '2605', '522628', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2606', '304', '0,1,25,304,', '剑河县', '2606', '522629', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2607', '304', '0,1,25,304,', '台江县', '2607', '522630', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2608', '304', '0,1,25,304,', '黎平县', '2608', '522631', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2609', '304', '0,1,25,304,', '榕江县', '2609', '522632', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('261', '21', '0,1,21,', '防城港市', '261', '450600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2610', '304', '0,1,25,304,', '从江县', '2610', '522633', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2611', '304', '0,1,25,304,', '雷山县', '2611', '522634', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2612', '304', '0,1,25,304,', '麻江县', '2612', '522635', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2613', '304', '0,1,25,304,', '丹寨县', '2613', '522636', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2614', '305', '0,1,25,305,', '都匀市', '2614', '522701', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2615', '305', '0,1,25,305,', '福泉市', '2615', '522702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2616', '305', '0,1,25,305,', '荔波县', '2616', '522722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2617', '305', '0,1,25,305,', '贵定县', '2617', '522723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2618', '305', '0,1,25,305,', '瓮安县', '2618', '522725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2619', '305', '0,1,25,305,', '独山县', '2619', '522726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('262', '21', '0,1,21,', '钦州市', '262', '450700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2620', '305', '0,1,25,305,', '平塘县', '2620', '522727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2621', '305', '0,1,25,305,', '罗甸县', '2621', '522728', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2622', '305', '0,1,25,305,', '长顺县', '2622', '522729', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2623', '305', '0,1,25,305,', '龙里县', '2623', '522730', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2624', '305', '0,1,25,305,', '惠水县', '2624', '522731', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2625', '305', '0,1,25,305,', '三都水族自治县', '2625', '522732', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2626', '306', '0,1,26,306,', '五华区', '2626', '530102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2627', '306', '0,1,26,306,', '盘龙区', '2627', '530103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2628', '306', '0,1,26,306,', '官渡区', '2628', '530111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2629', '306', '0,1,26,306,', '西山区', '2629', '530112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('263', '21', '0,1,21,', '贵港市', '263', '450800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2630', '306', '0,1,26,306,', '东川区', '2630', '530113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2631', '306', '0,1,26,306,', '呈贡区', '2631', '530114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2632', '306', '0,1,26,306,', '晋宁县', '2632', '530122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2633', '306', '0,1,26,306,', '富民县', '2633', '530124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2634', '306', '0,1,26,306,', '宜良县', '2634', '530125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2635', '306', '0,1,26,306,', '石林彝族自治县', '2635', '530126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2636', '306', '0,1,26,306,', '嵩明县', '2636', '530127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2637', '306', '0,1,26,306,', '禄劝彝族苗族自治县', '2637', '530128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2638', '306', '0,1,26,306,', '寻甸回族彝族自治县', '2638', '530129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2639', '306', '0,1,26,306,', '安宁市', '2639', '530181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('264', '21', '0,1,21,', '玉林市', '264', '450900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2640', '307', '0,1,26,307,', '麒麟区', '2640', '530302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2641', '307', '0,1,26,307,', '马龙县', '2641', '530321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2642', '307', '0,1,26,307,', '陆良县', '2642', '530322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2643', '307', '0,1,26,307,', '师宗县', '2643', '530323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2644', '307', '0,1,26,307,', '罗平县', '2644', '530324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2645', '307', '0,1,26,307,', '富源县', '2645', '530325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2646', '307', '0,1,26,307,', '会泽县', '2646', '530326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2647', '307', '0,1,26,307,', '沾益县', '2647', '530328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2648', '307', '0,1,26,307,', '宣威市', '2648', '530381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2649', '308', '0,1,26,308,', '红塔区', '2649', '530402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('265', '21', '0,1,21,', '百色市', '265', '451000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2650', '308', '0,1,26,308,', '江川县', '2650', '530421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2651', '308', '0,1,26,308,', '澄江县', '2651', '530422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2652', '308', '0,1,26,308,', '通海县', '2652', '530423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2653', '308', '0,1,26,308,', '华宁县', '2653', '530424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2654', '308', '0,1,26,308,', '易门县', '2654', '530425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2655', '308', '0,1,26,308,', '峨山彝族自治县', '2655', '530426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2656', '308', '0,1,26,308,', '新平彝族傣族自治县', '2656', '530427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2657', '308', '0,1,26,308,', '元江哈尼族彝族傣族自治县', '2657', '530428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2658', '309', '0,1,26,309,', '隆阳区', '2658', '530502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2659', '309', '0,1,26,309,', '施甸县', '2659', '530521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('266', '21', '0,1,21,', '贺州市', '266', '451100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2660', '309', '0,1,26,309,', '腾冲县', '2660', '530522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2661', '309', '0,1,26,309,', '龙陵县', '2661', '530523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2662', '309', '0,1,26,309,', '昌宁县', '2662', '530524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2663', '310', '0,1,26,310,', '昭阳区', '2663', '530602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2664', '310', '0,1,26,310,', '鲁甸县', '2664', '530621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2665', '310', '0,1,26,310,', '巧家县', '2665', '530622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2666', '310', '0,1,26,310,', '盐津县', '2666', '530623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2667', '310', '0,1,26,310,', '大关县', '2667', '530624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2668', '310', '0,1,26,310,', '永善县', '2668', '530625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2669', '310', '0,1,26,310,', '绥江县', '2669', '530626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('267', '21', '0,1,21,', '河池市', '267', '451200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2670', '310', '0,1,26,310,', '镇雄县', '2670', '530627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2671', '310', '0,1,26,310,', '彝良县', '2671', '530628', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2672', '310', '0,1,26,310,', '威信县', '2672', '530629', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2673', '310', '0,1,26,310,', '水富县', '2673', '530630', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2674', '311', '0,1,26,311,', '古城区', '2674', '530702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2675', '311', '0,1,26,311,', '玉龙纳西族自治县', '2675', '530721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2676', '311', '0,1,26,311,', '永胜县', '2676', '530722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2677', '311', '0,1,26,311,', '华坪县', '2677', '530723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2678', '311', '0,1,26,311,', '宁蒗彝族自治县', '2678', '530724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2679', '312', '0,1,26,312,', '思茅区', '2679', '530802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('268', '21', '0,1,21,', '来宾市', '268', '451300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2680', '312', '0,1,26,312,', '宁洱哈尼族彝族自治县', '2680', '530821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2681', '312', '0,1,26,312,', '墨江哈尼族自治县', '2681', '530822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2682', '312', '0,1,26,312,', '景东彝族自治县', '2682', '530823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2683', '312', '0,1,26,312,', '景谷傣族彝族自治县', '2683', '530824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2684', '312', '0,1,26,312,', '镇沅彝族哈尼族拉祜族自治县', '2684', '530825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2685', '312', '0,1,26,312,', '江城哈尼族彝族自治县', '2685', '530826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2686', '312', '0,1,26,312,', '孟连傣族拉祜族佤族自治县', '2686', '530827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2687', '312', '0,1,26,312,', '澜沧拉祜族自治县', '2687', '530828', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2688', '312', '0,1,26,312,', '西盟佤族自治县', '2688', '530829', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2689', '313', '0,1,26,313,', '临翔区', '2689', '530902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('269', '21', '0,1,21,', '崇左市', '269', '451400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2690', '313', '0,1,26,313,', '凤庆县', '2690', '530921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2691', '313', '0,1,26,313,', '云县', '2691', '530922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2692', '313', '0,1,26,313,', '永德县', '2692', '530923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2693', '313', '0,1,26,313,', '镇康县', '2693', '530924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2694', '313', '0,1,26,313,', '双江拉祜族佤族布朗族傣族自治县', '2694', '530925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2695', '313', '0,1,26,313,', '耿马傣族佤族自治县', '2695', '530926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2696', '313', '0,1,26,313,', '沧源佤族自治县', '2696', '530927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2697', '314', '0,1,26,314,', '楚雄市', '2697', '532301', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2698', '314', '0,1,26,314,', '双柏县', '2698', '532322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2699', '314', '0,1,26,314,', '牟定县', '2699', '532323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('27', '1', '0,1,', '西藏自治区', '27', '540000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('270', '22', '0,1,22,', '海口市', '270', '460100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2700', '314', '0,1,26,314,', '南华县', '2700', '532324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2701', '314', '0,1,26,314,', '姚安县', '2701', '532325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2702', '314', '0,1,26,314,', '大姚县', '2702', '532326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2703', '314', '0,1,26,314,', '永仁县', '2703', '532327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2704', '314', '0,1,26,314,', '元谋县', '2704', '532328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2705', '314', '0,1,26,314,', '武定县', '2705', '532329', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2706', '314', '0,1,26,314,', '禄丰县', '2706', '532331', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2707', '315', '0,1,26,315,', '个旧市', '2707', '532501', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2708', '315', '0,1,26,315,', '开远市', '2708', '532502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2709', '315', '0,1,26,315,', '蒙自市', '2709', '532503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('271', '22', '0,1,22,', '三亚市', '271', '460200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2710', '315', '0,1,26,315,', '弥勒市', '2710', '532504', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2711', '315', '0,1,26,315,', '屏边苗族自治县', '2711', '532523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2712', '315', '0,1,26,315,', '建水县', '2712', '532524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2713', '315', '0,1,26,315,', '石屏县', '2713', '532525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2714', '315', '0,1,26,315,', '泸西县', '2714', '532527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2715', '315', '0,1,26,315,', '元阳县', '2715', '532528', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2716', '315', '0,1,26,315,', '红河县', '2716', '532529', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2717', '315', '0,1,26,315,', '金平苗族瑶族傣族自治县', '2717', '532530', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2718', '315', '0,1,26,315,', '绿春县', '2718', '532531', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2719', '315', '0,1,26,315,', '河口瑶族自治县', '2719', '532532', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('272', '22', '0,1,22,', '三沙市', '272', '460300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2720', '316', '0,1,26,316,', '文山市', '2720', '532601', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2721', '316', '0,1,26,316,', '砚山县', '2721', '532622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2722', '316', '0,1,26,316,', '西畴县', '2722', '532623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2723', '316', '0,1,26,316,', '麻栗坡县', '2723', '532624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2724', '316', '0,1,26,316,', '马关县', '2724', '532625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2725', '316', '0,1,26,316,', '丘北县', '2725', '532626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2726', '316', '0,1,26,316,', '广南县', '2726', '532627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2727', '316', '0,1,26,316,', '富宁县', '2727', '532628', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2728', '317', '0,1,26,317,', '景洪市', '2728', '532801', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2729', '317', '0,1,26,317,', '勐海县', '2729', '532822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('273', '22', '0,1,22,', '省直辖县级行政区划', '273', '469000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2730', '317', '0,1,26,317,', '勐腊县', '2730', '532823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2731', '318', '0,1,26,318,', '大理市', '2731', '532901', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2732', '318', '0,1,26,318,', '漾濞彝族自治县', '2732', '532922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2733', '318', '0,1,26,318,', '祥云县', '2733', '532923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2734', '318', '0,1,26,318,', '宾川县', '2734', '532924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2735', '318', '0,1,26,318,', '弥渡县', '2735', '532925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2736', '318', '0,1,26,318,', '南涧彝族自治县', '2736', '532926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2737', '318', '0,1,26,318,', '巍山彝族回族自治县', '2737', '532927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2738', '318', '0,1,26,318,', '永平县', '2738', '532928', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2739', '318', '0,1,26,318,', '云龙县', '2739', '532929', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('274', '23', '0,1,23,', '重庆市', '274', '500100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2740', '318', '0,1,26,318,', '洱源县', '2740', '532930', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2741', '318', '0,1,26,318,', '剑川县', '2741', '532931', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2742', '318', '0,1,26,318,', '鹤庆县', '2742', '532932', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2743', '319', '0,1,26,319,', '瑞丽市', '2743', '533102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2744', '319', '0,1,26,319,', '芒市', '2744', '533103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2745', '319', '0,1,26,319,', '梁河县', '2745', '533122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2746', '319', '0,1,26,319,', '盈江县', '2746', '533123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2747', '319', '0,1,26,319,', '陇川县', '2747', '533124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2748', '320', '0,1,26,320,', '泸水县', '2748', '533321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2749', '320', '0,1,26,320,', '福贡县', '2749', '533323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('275', '23', '0,1,23,', '重庆县', '275', '500200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2750', '320', '0,1,26,320,', '贡山独龙族怒族自治县', '2750', '533324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2751', '320', '0,1,26,320,', '兰坪白族普米族自治县', '2751', '533325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2752', '321', '0,1,26,321,', '香格里拉县', '2752', '533421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2753', '321', '0,1,26,321,', '德钦县', '2753', '533422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2754', '321', '0,1,26,321,', '维西傈僳族自治县', '2754', '533423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2755', '322', '0,1,27,322,', '城关区', '2755', '540102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2756', '322', '0,1,27,322,', '林周县', '2756', '540121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2757', '322', '0,1,27,322,', '当雄县', '2757', '540122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2758', '322', '0,1,27,322,', '尼木县', '2758', '540123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2759', '322', '0,1,27,322,', '曲水县', '2759', '540124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('276', '24', '0,1,24,', '成都市', '276', '510100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2760', '322', '0,1,27,322,', '堆龙德庆县', '2760', '540125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2761', '322', '0,1,27,322,', '达孜县', '2761', '540126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2762', '322', '0,1,27,322,', '墨竹工卡县', '2762', '540127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2763', '323', '0,1,27,323,', '桑珠孜区', '2763', '540202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2764', '323', '0,1,27,323,', '南木林县', '2764', '540221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2765', '323', '0,1,27,323,', '江孜县', '2765', '540222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2766', '323', '0,1,27,323,', '定日县', '2766', '540223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2767', '323', '0,1,27,323,', '萨迦县', '2767', '540224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2768', '323', '0,1,27,323,', '拉孜县', '2768', '540225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2769', '323', '0,1,27,323,', '昂仁县', '2769', '540226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('277', '24', '0,1,24,', '自贡市', '277', '510300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2770', '323', '0,1,27,323,', '谢通门县', '2770', '540227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2771', '323', '0,1,27,323,', '白朗县', '2771', '540228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2772', '323', '0,1,27,323,', '仁布县', '2772', '540229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2773', '323', '0,1,27,323,', '康马县', '2773', '540230', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2774', '323', '0,1,27,323,', '定结县', '2774', '540231', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2775', '323', '0,1,27,323,', '仲巴县', '2775', '540232', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2776', '323', '0,1,27,323,', '亚东县', '2776', '540233', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2777', '323', '0,1,27,323,', '吉隆县', '2777', '540234', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2778', '323', '0,1,27,323,', '聂拉木县', '2778', '540235', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2779', '323', '0,1,27,323,', '萨嘎县', '2779', '540236', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('278', '24', '0,1,24,', '攀枝花市', '278', '510400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2780', '323', '0,1,27,323,', '岗巴县', '2780', '540237', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2781', '324', '0,1,27,324,', '昌都县', '2781', '542121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2782', '324', '0,1,27,324,', '江达县', '2782', '542122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2783', '324', '0,1,27,324,', '贡觉县', '2783', '542123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2784', '324', '0,1,27,324,', '类乌齐县', '2784', '542124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2785', '324', '0,1,27,324,', '丁青县', '2785', '542125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2786', '324', '0,1,27,324,', '察雅县', '2786', '542126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2787', '324', '0,1,27,324,', '八宿县', '2787', '542127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2788', '324', '0,1,27,324,', '左贡县', '2788', '542128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2789', '324', '0,1,27,324,', '芒康县', '2789', '542129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('279', '24', '0,1,24,', '泸州市', '279', '510500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2790', '324', '0,1,27,324,', '洛隆县', '2790', '542132', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2791', '324', '0,1,27,324,', '边坝县', '2791', '542133', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2792', '325', '0,1,27,325,', '乃东县', '2792', '542221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2793', '325', '0,1,27,325,', '扎囊县', '2793', '542222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2794', '325', '0,1,27,325,', '贡嘎县', '2794', '542223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2795', '325', '0,1,27,325,', '桑日县', '2795', '542224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2796', '325', '0,1,27,325,', '琼结县', '2796', '542225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2797', '325', '0,1,27,325,', '曲松县', '2797', '542226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2798', '325', '0,1,27,325,', '措美县', '2798', '542227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2799', '325', '0,1,27,325,', '洛扎县', '2799', '542228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('28', '1', '0,1,', '陕西省', '28', '610000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('280', '24', '0,1,24,', '德阳市', '280', '510600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2800', '325', '0,1,27,325,', '加查县', '2800', '542229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2801', '325', '0,1,27,325,', '隆子县', '2801', '542231', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2802', '325', '0,1,27,325,', '错那县', '2802', '542232', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2803', '325', '0,1,27,325,', '浪卡子县', '2803', '542233', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2804', '326', '0,1,27,326,', '那曲县', '2804', '542421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2805', '326', '0,1,27,326,', '嘉黎县', '2805', '542422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2806', '326', '0,1,27,326,', '比如县', '2806', '542423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2807', '326', '0,1,27,326,', '聂荣县', '2807', '542424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2808', '326', '0,1,27,326,', '安多县', '2808', '542425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2809', '326', '0,1,27,326,', '申扎县', '2809', '542426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('281', '24', '0,1,24,', '绵阳市', '281', '510700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2810', '326', '0,1,27,326,', '索县', '2810', '542427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2811', '326', '0,1,27,326,', '班戈县', '2811', '542428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2812', '326', '0,1,27,326,', '巴青县', '2812', '542429', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2813', '326', '0,1,27,326,', '尼玛县', '2813', '542430', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2814', '326', '0,1,27,326,', '双湖县', '2814', '542431', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2815', '327', '0,1,27,327,', '普兰县', '2815', '542521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2816', '327', '0,1,27,327,', '札达县', '2816', '542522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2817', '327', '0,1,27,327,', '噶尔县', '2817', '542523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2818', '327', '0,1,27,327,', '日土县', '2818', '542524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2819', '327', '0,1,27,327,', '革吉县', '2819', '542525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('282', '24', '0,1,24,', '广元市', '282', '510800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2820', '327', '0,1,27,327,', '改则县', '2820', '542526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2821', '327', '0,1,27,327,', '措勤县', '2821', '542527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2822', '328', '0,1,27,328,', '林芝县', '2822', '542621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2823', '328', '0,1,27,328,', '工布江达县', '2823', '542622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2824', '328', '0,1,27,328,', '米林县', '2824', '542623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2825', '328', '0,1,27,328,', '墨脱县', '2825', '542624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2826', '328', '0,1,27,328,', '波密县', '2826', '542625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2827', '328', '0,1,27,328,', '察隅县', '2827', '542626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2828', '328', '0,1,27,328,', '朗县', '2828', '542627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2829', '329', '0,1,28,329,', '碑林区', '2829', '610103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('283', '24', '0,1,24,', '遂宁市', '283', '510900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2830', '329', '0,1,28,329,', '莲湖区', '2830', '610104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2831', '329', '0,1,28,329,', '灞桥区', '2831', '610111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2832', '329', '0,1,28,329,', '未央区', '2832', '610112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2833', '329', '0,1,28,329,', '雁塔区', '2833', '610113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2834', '329', '0,1,28,329,', '阎良区', '2834', '610114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2835', '329', '0,1,28,329,', '临潼区', '2835', '610115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2836', '329', '0,1,28,329,', '蓝田县', '2836', '610122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2837', '329', '0,1,28,329,', '周至县', '2837', '610124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2838', '329', '0,1,28,329,', '户县', '2838', '610125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2839', '329', '0,1,28,329,', '高陵县', '2839', '610126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('284', '24', '0,1,24,', '内江市', '284', '511000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2840', '330', '0,1,28,330,', '王益区', '2840', '610202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2841', '330', '0,1,28,330,', '印台区', '2841', '610203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2842', '330', '0,1,28,330,', '耀州区', '2842', '610204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2843', '330', '0,1,28,330,', '宜君县', '2843', '610222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2844', '331', '0,1,28,331,', '渭滨区', '2844', '610302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2845', '331', '0,1,28,331,', '金台区', '2845', '610303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2846', '331', '0,1,28,331,', '陈仓区', '2846', '610304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2847', '331', '0,1,28,331,', '凤翔县', '2847', '610322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2848', '331', '0,1,28,331,', '岐山县', '2848', '610323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2849', '331', '0,1,28,331,', '扶风县', '2849', '610324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('285', '24', '0,1,24,', '乐山市', '285', '511100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2850', '331', '0,1,28,331,', '眉县', '2850', '610326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2851', '331', '0,1,28,331,', '陇县', '2851', '610327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2852', '331', '0,1,28,331,', '千阳县', '2852', '610328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2853', '331', '0,1,28,331,', '麟游县', '2853', '610329', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2854', '331', '0,1,28,331,', '凤县', '2854', '610330', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2855', '331', '0,1,28,331,', '太白县', '2855', '610331', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2856', '332', '0,1,28,332,', '秦都区', '2856', '610402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2857', '332', '0,1,28,332,', '杨陵区', '2857', '610403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2858', '332', '0,1,28,332,', '渭城区', '2858', '610404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2859', '332', '0,1,28,332,', '三原县', '2859', '610422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('286', '24', '0,1,24,', '南充市', '286', '511300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2860', '332', '0,1,28,332,', '泾阳县', '2860', '610423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2861', '332', '0,1,28,332,', '乾县', '2861', '610424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2862', '332', '0,1,28,332,', '礼泉县', '2862', '610425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2863', '332', '0,1,28,332,', '永寿县', '2863', '610426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2864', '332', '0,1,28,332,', '彬县', '2864', '610427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2865', '332', '0,1,28,332,', '长武县', '2865', '610428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2866', '332', '0,1,28,332,', '旬邑县', '2866', '610429', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2867', '332', '0,1,28,332,', '淳化县', '2867', '610430', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2868', '332', '0,1,28,332,', '武功县', '2868', '610431', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2869', '332', '0,1,28,332,', '兴平市', '2869', '610481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('287', '24', '0,1,24,', '眉山市', '287', '511400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2870', '333', '0,1,28,333,', '临渭区', '2870', '610502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2871', '333', '0,1,28,333,', '华县', '2871', '610521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2872', '333', '0,1,28,333,', '潼关县', '2872', '610522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2873', '333', '0,1,28,333,', '大荔县', '2873', '610523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2874', '333', '0,1,28,333,', '合阳县', '2874', '610524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2875', '333', '0,1,28,333,', '澄城县', '2875', '610525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2876', '333', '0,1,28,333,', '蒲城县', '2876', '610526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2877', '333', '0,1,28,333,', '白水县', '2877', '610527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2878', '333', '0,1,28,333,', '富平县', '2878', '610528', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2879', '333', '0,1,28,333,', '韩城市', '2879', '610581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('288', '24', '0,1,24,', '宜宾市', '288', '511500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2880', '333', '0,1,28,333,', '华阴市', '2880', '610582', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2881', '334', '0,1,28,334,', '宝塔区', '2881', '610602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2882', '334', '0,1,28,334,', '延长县', '2882', '610621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2883', '334', '0,1,28,334,', '延川县', '2883', '610622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2884', '334', '0,1,28,334,', '子长县', '2884', '610623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2885', '334', '0,1,28,334,', '安塞县', '2885', '610624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2886', '334', '0,1,28,334,', '志丹县', '2886', '610625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2887', '334', '0,1,28,334,', '吴起县', '2887', '610626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2888', '334', '0,1,28,334,', '甘泉县', '2888', '610627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2889', '334', '0,1,28,334,', '富县', '2889', '610628', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('289', '24', '0,1,24,', '广安市', '289', '511600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2890', '334', '0,1,28,334,', '洛川县', '2890', '610629', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2891', '334', '0,1,28,334,', '宜川县', '2891', '610630', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2892', '334', '0,1,28,334,', '黄龙县', '2892', '610631', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2893', '334', '0,1,28,334,', '黄陵县', '2893', '610632', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2894', '335', '0,1,28,335,', '汉台区', '2894', '610702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2895', '335', '0,1,28,335,', '南郑县', '2895', '610721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2896', '335', '0,1,28,335,', '城固县', '2896', '610722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2897', '335', '0,1,28,335,', '洋县', '2897', '610723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2898', '335', '0,1,28,335,', '西乡县', '2898', '610724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2899', '335', '0,1,28,335,', '勉县', '2899', '610725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('29', '1', '0,1,', '甘肃省', '29', '620000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('290', '24', '0,1,24,', '达州市', '290', '511700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2900', '335', '0,1,28,335,', '宁强县', '2900', '610726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2901', '335', '0,1,28,335,', '略阳县', '2901', '610727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2902', '335', '0,1,28,335,', '镇巴县', '2902', '610728', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2903', '335', '0,1,28,335,', '留坝县', '2903', '610729', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2904', '335', '0,1,28,335,', '佛坪县', '2904', '610730', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2905', '336', '0,1,28,336,', '榆阳区', '2905', '610802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2906', '336', '0,1,28,336,', '神木县', '2906', '610821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2907', '336', '0,1,28,336,', '府谷县', '2907', '610822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2908', '336', '0,1,28,336,', '横山县', '2908', '610823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2909', '336', '0,1,28,336,', '靖边县', '2909', '610824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('291', '24', '0,1,24,', '雅安市', '291', '511800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2910', '336', '0,1,28,336,', '定边县', '2910', '610825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2911', '336', '0,1,28,336,', '绥德县', '2911', '610826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2912', '336', '0,1,28,336,', '米脂县', '2912', '610827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2913', '336', '0,1,28,336,', '佳县', '2913', '610828', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2914', '336', '0,1,28,336,', '吴堡县', '2914', '610829', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2915', '336', '0,1,28,336,', '清涧县', '2915', '610830', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2916', '336', '0,1,28,336,', '子洲县', '2916', '610831', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2917', '337', '0,1,28,337,', '汉滨区', '2917', '610902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2918', '337', '0,1,28,337,', '汉阴县', '2918', '610921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2919', '337', '0,1,28,337,', '石泉县', '2919', '610922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('292', '24', '0,1,24,', '巴中市', '292', '511900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2920', '337', '0,1,28,337,', '宁陕县', '2920', '610923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2921', '337', '0,1,28,337,', '紫阳县', '2921', '610924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2922', '337', '0,1,28,337,', '岚皋县', '2922', '610925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2923', '337', '0,1,28,337,', '平利县', '2923', '610926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2924', '337', '0,1,28,337,', '镇坪县', '2924', '610927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2925', '337', '0,1,28,337,', '旬阳县', '2925', '610928', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2926', '337', '0,1,28,337,', '白河县', '2926', '610929', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2927', '338', '0,1,28,338,', '商州区', '2927', '611002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2928', '338', '0,1,28,338,', '洛南县', '2928', '611021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2929', '338', '0,1,28,338,', '丹凤县', '2929', '611022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('293', '24', '0,1,24,', '资阳市', '293', '512000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2930', '338', '0,1,28,338,', '商南县', '2930', '611023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2931', '338', '0,1,28,338,', '山阳县', '2931', '611024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2932', '338', '0,1,28,338,', '镇安县', '2932', '611025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2933', '338', '0,1,28,338,', '柞水县', '2933', '611026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2934', '339', '0,1,29,339,', '七里河区', '2934', '620103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2935', '339', '0,1,29,339,', '西固区', '2935', '620104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2936', '339', '0,1,29,339,', '安宁区', '2936', '620105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2937', '339', '0,1,29,339,', '红古区', '2937', '620111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2938', '339', '0,1,29,339,', '永登县', '2938', '620121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2939', '339', '0,1,29,339,', '皋兰县', '2939', '620122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('294', '24', '0,1,24,', '阿坝藏族羌族自治州', '294', '513200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2940', '339', '0,1,29,339,', '榆中县', '2940', '620123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2941', '341', '0,1,29,341,', '金川区', '2941', '620302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2942', '341', '0,1,29,342,', '永昌县', '2942', '620321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2943', '342', '0,1,29,342,', '白银区', '2943', '620402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2944', '342', '0,1,29,342,', '平川区', '2944', '620403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2945', '342', '0,1,29,342,', '靖远县', '2945', '620421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2946', '342', '0,1,29,342,', '会宁县', '2946', '620422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2947', '342', '0,1,29,342,', '景泰县', '2947', '620423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2948', '343', '0,1,29,343,', '秦州区', '2948', '620502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2949', '343', '0,1,29,343,', '麦积区', '2949', '620503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('295', '24', '0,1,24,', '甘孜藏族自治州', '295', '513300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2950', '343', '0,1,29,343,', '清水县', '2950', '620521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2951', '343', '0,1,29,343,', '秦安县', '2951', '620522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2952', '343', '0,1,29,343,', '甘谷县', '2952', '620523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2953', '343', '0,1,29,343,', '武山县', '2953', '620524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2954', '343', '0,1,29,343,', '张家川回族自治县', '2954', '620525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2955', '344', '0,1,29,344,', '凉州区', '2955', '620602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2956', '344', '0,1,29,344,', '民勤县', '2956', '620621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2957', '344', '0,1,29,344,', '古浪县', '2957', '620622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2958', '344', '0,1,29,344,', '天祝藏族自治县', '2958', '620623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2959', '345', '0,1,29,345,', '甘州区', '2959', '620702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('296', '24', '0,1,24,', '凉山彝族自治州', '296', '513400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2960', '345', '0,1,29,345,', '肃南裕固族自治县', '2960', '620721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2961', '345', '0,1,29,345,', '民乐县', '2961', '620722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2962', '345', '0,1,29,345,', '临泽县', '2962', '620723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2963', '345', '0,1,29,345,', '高台县', '2963', '620724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2964', '345', '0,1,29,345,', '山丹县', '2964', '620725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2965', '346', '0,1,29,346,', '崆峒区', '2965', '620802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2966', '346', '0,1,29,346,', '泾川县', '2966', '620821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2967', '346', '0,1,29,346,', '灵台县', '2967', '620822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2968', '346', '0,1,29,346,', '崇信县', '2968', '620823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2969', '346', '0,1,29,346,', '华亭县', '2969', '620824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('297', '25', '0,1,25,', '贵阳市', '297', '520100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2970', '346', '0,1,29,346,', '庄浪县', '2970', '620825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2971', '346', '0,1,29,346,', '静宁县', '2971', '620826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2972', '347', '0,1,29,347,', '肃州区', '2972', '620902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2973', '347', '0,1,29,347,', '金塔县', '2973', '620921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2974', '347', '0,1,29,347,', '瓜州县', '2974', '620922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2975', '347', '0,1,29,347,', '肃北蒙古族自治县', '2975', '620923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2976', '347', '0,1,29,347,', '阿克塞哈萨克族自治县', '2976', '620924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2977', '347', '0,1,29,347,', '玉门市', '2977', '620981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2978', '347', '0,1,29,347,', '敦煌市', '2978', '620982', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2979', '348', '0,1,29,348,', '西峰区', '2979', '621002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('298', '25', '0,1,25,', '六盘水市', '298', '520200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2980', '348', '0,1,29,348,', '庆城县', '2980', '621021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2981', '348', '0,1,29,348,', '环县', '2981', '621022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2982', '348', '0,1,29,348,', '华池县', '2982', '621023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2983', '348', '0,1,29,348,', '合水县', '2983', '621024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2984', '348', '0,1,29,348,', '正宁县', '2984', '621025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2985', '348', '0,1,29,348,', '宁县', '2985', '621026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2986', '348', '0,1,29,348,', '镇原县', '2986', '621027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2987', '349', '0,1,29,349,', '安定区', '2987', '621102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2988', '349', '0,1,29,349,', '通渭县', '2988', '621121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2989', '349', '0,1,29,349,', '陇西县', '2989', '621122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('299', '25', '0,1,25,', '遵义市', '299', '520300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('2990', '349', '0,1,29,349,', '渭源县', '2990', '621123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2991', '349', '0,1,29,349,', '临洮县', '2991', '621124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2992', '349', '0,1,29,349,', '漳县', '2992', '621125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2993', '349', '0,1,29,349,', '岷县', '2993', '621126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2994', '350', '0,1,29,350,', '武都区', '2994', '621202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2995', '350', '0,1,29,350,', '成县', '2995', '621221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2996', '350', '0,1,29,350,', '文县', '2996', '621222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2997', '350', '0,1,29,350,', '宕昌县', '2997', '621223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2998', '350', '0,1,29,350,', '康县', '2998', '621224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('2999', '350', '0,1,29,350,', '西和县', '2999', '621225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3', '1', '0,1,', '天津市', '3', '120000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('30', '1', '0,1,', '青海省', '30', '630000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('300', '25', '0,1,25,', '安顺市', '300', '520400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3000', '350', '0,1,29,350,', '礼县', '3000', '621226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3001', '350', '0,1,29,350,', '徽县', '3001', '621227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3002', '350', '0,1,29,350,', '两当县', '3002', '621228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3003', '351', '0,1,29,351,', '临夏市', '3003', '622901', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3004', '351', '0,1,29,351,', '临夏县', '3004', '622921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3005', '351', '0,1,29,351,', '康乐县', '3005', '622922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3006', '351', '0,1,29,351,', '永靖县', '3006', '622923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3007', '351', '0,1,29,351,', '广河县', '3007', '622924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3008', '351', '0,1,29,351,', '和政县', '3008', '622925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3009', '351', '0,1,29,351,', '东乡族自治县', '3009', '622926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('301', '25', '0,1,25,', '毕节市', '301', '520500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3010', '351', '0,1,29,351,', '积石山保安族东乡族撒拉族自治县', '3010', '622927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3011', '352', '0,1,29,352,', '合作市', '3011', '623001', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3012', '352', '0,1,29,352,', '临潭县', '3012', '623021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3013', '352', '0,1,29,352,', '卓尼县', '3013', '623022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3014', '352', '0,1,29,352,', '舟曲县', '3014', '623023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3015', '352', '0,1,29,352,', '迭部县', '3015', '623024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3016', '352', '0,1,29,352,', '玛曲县', '3016', '623025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3017', '352', '0,1,29,352,', '碌曲县', '3017', '623026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3018', '352', '0,1,29,352,', '夏河县', '3018', '623027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3019', '353', '0,1,30,353,', '城东区', '3019', '630102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('302', '25', '0,1,25,', '铜仁市', '302', '520600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3020', '353', '0,1,30,353,', '城西区', '3020', '630104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3021', '353', '0,1,30,353,', '城北区', '3021', '630105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3022', '353', '0,1,30,353,', '大通回族土族自治县', '3022', '630121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3023', '353', '0,1,30,353,', '湟中县', '3023', '630122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3024', '353', '0,1,30,353,', '湟源县', '3024', '630123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3025', '354', '0,1,30,354,', '乐都区', '3025', '630202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3026', '354', '0,1,30,354,', '平安县', '3026', '630221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3027', '354', '0,1,30,354,', '民和回族土族自治县', '3027', '630222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3028', '354', '0,1,30,354,', '互助土族自治县', '3028', '630223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3029', '354', '0,1,30,354,', '化隆回族自治县', '3029', '630224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('303', '25', '0,1,25,', '黔西南布依族苗族自治州', '303', '522300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3030', '354', '0,1,30,354,', '循化撒拉族自治县', '3030', '630225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3031', '355', '0,1,30,355,', '门源回族自治县', '3031', '632221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3032', '355', '0,1,30,355,', '祁连县', '3032', '632222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3033', '355', '0,1,30,355,', '海晏县', '3033', '632223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3034', '355', '0,1,30,355,', '刚察县', '3034', '632224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3035', '356', '0,1,30,356,', '同仁县', '3035', '632321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3036', '356', '0,1,30,356,', '尖扎县', '3036', '632322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3037', '356', '0,1,30,356,', '泽库县', '3037', '632323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3038', '356', '0,1,30,356,', '河南蒙古族自治县', '3038', '632324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3039', '357', '0,1,30,357,', '共和县', '3039', '632521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('304', '25', '0,1,25,', '黔东南苗族侗族自治州', '304', '522600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3040', '357', '0,1,30,357,', '同德县', '3040', '632522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3041', '357', '0,1,30,357,', '贵德县', '3041', '632523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3042', '357', '0,1,30,357,', '兴海县', '3042', '632524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3043', '357', '0,1,30,357,', '贵南县', '3043', '632525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3044', '358', '0,1,30,358,', '玛沁县', '3044', '632621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3045', '358', '0,1,30,358,', '班玛县', '3045', '632622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3046', '358', '0,1,30,358,', '甘德县', '3046', '632623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3047', '358', '0,1,30,358,', '达日县', '3047', '632624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3048', '358', '0,1,30,358,', '久治县', '3048', '632625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3049', '358', '0,1,30,358,', '玛多县', '3049', '632626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('305', '25', '0,1,25,', '黔南布依族苗族自治州', '305', '522700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3050', '359', '0,1,30,359,', '玉树市', '3050', '632701', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3051', '359', '0,1,30,359,', '杂多县', '3051', '632722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3052', '359', '0,1,30,359,', '称多县', '3052', '632723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3053', '359', '0,1,30,359,', '治多县', '3053', '632724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3054', '359', '0,1,30,359,', '囊谦县', '3054', '632725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3055', '359', '0,1,30,359,', '曲麻莱县', '3055', '632726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3056', '360', '0,1,30,360,', '格尔木市', '3056', '632801', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3057', '360', '0,1,30,360,', '德令哈市', '3057', '632802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3058', '360', '0,1,30,360,', '乌兰县', '3058', '632821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3059', '360', '0,1,30,360,', '都兰县', '3059', '632822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('306', '26', '0,1,26,', '昆明市', '306', '530100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3060', '360', '0,1,30,360,', '天峻县', '3060', '632823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3061', '361', '0,1,31,361,', '兴庆区', '3061', '640104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3062', '361', '0,1,31,361,', '西夏区', '3062', '640105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3063', '361', '0,1,31,361,', '金凤区', '3063', '640106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3064', '361', '0,1,31,361,', '永宁县', '3064', '640121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3065', '361', '0,1,31,361,', '贺兰县', '3065', '640122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3066', '361', '0,1,31,361,', '灵武市', '3066', '640181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3067', '362', '0,1,31,362,', '大武口区', '3067', '640202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3068', '362', '0,1,31,362,', '惠农区', '3068', '640205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3069', '362', '0,1,31,362,', '平罗县', '3069', '640221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('307', '26', '0,1,26,', '曲靖市', '307', '530300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3070', '363', '0,1,31,363,', '利通区', '3070', '640302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3071', '363', '0,1,31,363,', '红寺堡区', '3071', '640303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3072', '363', '0,1,31,363,', '盐池县', '3072', '640323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3073', '363', '0,1,31,363,', '同心县', '3073', '640324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3074', '363', '0,1,31,363,', '青铜峡市', '3074', '640381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3075', '364', '0,1,31,364,', '原州区', '3075', '640402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3076', '364', '0,1,31,364,', '西吉县', '3076', '640422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3077', '364', '0,1,31,364,', '隆德县', '3077', '640423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3078', '364', '0,1,31,364,', '泾源县', '3078', '640424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3079', '364', '0,1,31,364,', '彭阳县', '3079', '640425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('308', '26', '0,1,26,', '玉溪市', '308', '530400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3080', '365', '0,1,31,365,', '沙坡头区', '3080', '640502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3081', '365', '0,1,31,365,', '中宁县', '3081', '640521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3082', '365', '0,1,31,365,', '海原县', '3082', '640522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3083', '366', '0,1,32,366,', '天山区', '3083', '650102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3084', '366', '0,1,32,366,', '沙依巴克区', '3084', '650103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3085', '366', '0,1,32,366,', '水磨沟区', '3085', '650105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3086', '366', '0,1,32,366,', '头屯河区', '3086', '650106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3087', '366', '0,1,32,366,', '达坂城区', '3087', '650107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3088', '366', '0,1,32,366,', '米东区', '3088', '650109', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3089', '366', '0,1,32,366,', '乌鲁木齐县', '3089', '650121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('309', '26', '0,1,26,', '保山市', '309', '530500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3090', '367', '0,1,32,367,', '独山子区', '3090', '650202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3091', '367', '0,1,32,367,', '克拉玛依区', '3091', '650203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3092', '367', '0,1,32,367,', '白碱滩区', '3092', '650204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3093', '367', '0,1,32,367,', '乌尔禾区', '3093', '650205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3094', '368', '0,1,32,368,', '吐鲁番市', '3094', '652101', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3095', '368', '0,1,32,368,', '鄯善县', '3095', '652122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3096', '368', '0,1,32,368,', '托克逊县', '3096', '652123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3097', '369', '0,1,32,369,', '哈密市', '3097', '652201', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3098', '369', '0,1,32,369,', '巴里坤哈萨克自治县', '3098', '652222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3099', '369', '0,1,32,369,', '伊吾县', '3099', '652223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('31', '1', '0,1,', '宁夏回族自治区', '31', '640000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('310', '26', '0,1,26,', '昭通市', '310', '530600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3100', '370', '0,1,32,370,', '昌吉市', '3100', '652301', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3101', '370', '0,1,32,370,', '阜康市', '3101', '652302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3102', '370', '0,1,32,370,', '呼图壁县', '3102', '652323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3103', '370', '0,1,32,370,', '玛纳斯县', '3103', '652324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3104', '370', '0,1,32,370,', '奇台县', '3104', '652325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3105', '370', '0,1,32,370,', '吉木萨尔县', '3105', '652327', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3106', '370', '0,1,32,370,', '木垒哈萨克自治县', '3106', '652328', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3107', '371', '0,1,32,371,', '博乐市', '3107', '652701', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3108', '371', '0,1,32,371,', '阿拉山口市', '3108', '652702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3109', '371', '0,1,32,371,', '精河县', '3109', '652722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('311', '26', '0,1,26,', '丽江市', '311', '530700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3110', '371', '0,1,32,371,', '温泉县', '3110', '652723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3111', '372', '0,1,32,372,', '库尔勒市', '3111', '652801', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3112', '372', '0,1,32,372,', '轮台县', '3112', '652822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3113', '372', '0,1,32,372,', '尉犁县', '3113', '652823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3114', '372', '0,1,32,372,', '若羌县', '3114', '652824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3115', '372', '0,1,32,372,', '且末县', '3115', '652825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3116', '372', '0,1,32,372,', '焉耆回族自治县', '3116', '652826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3117', '372', '0,1,32,372,', '和静县', '3117', '652827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3118', '372', '0,1,32,372,', '和硕县', '3118', '652828', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3119', '372', '0,1,32,372,', '博湖县', '3119', '652829', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('312', '26', '0,1,26,', '普洱市', '312', '530800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3120', '373', '0,1,32,373,', '阿克苏市', '3120', '652901', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3121', '373', '0,1,32,373,', '温宿县', '3121', '652922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3122', '373', '0,1,32,373,', '库车县', '3122', '652923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3123', '373', '0,1,32,373,', '沙雅县', '3123', '652924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3124', '373', '0,1,32,373,', '新和县', '3124', '652925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3125', '373', '0,1,32,373,', '拜城县', '3125', '652926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3126', '373', '0,1,32,373,', '乌什县', '3126', '652927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3127', '373', '0,1,32,373,', '阿瓦提县', '3127', '652928', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3128', '373', '0,1,32,373,', '柯坪县', '3128', '652929', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3129', '374', '0,1,32,374,', '阿图什市', '3129', '653001', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('313', '26', '0,1,26,', '临沧市', '313', '530900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3130', '374', '0,1,32,374,', '阿克陶县', '3130', '653022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3131', '374', '0,1,32,374,', '阿合奇县', '3131', '653023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3132', '374', '0,1,32,374,', '乌恰县', '3132', '653024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3133', '375', '0,1,32,375,', '喀什市', '3133', '653101', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3134', '375', '0,1,32,375,', '疏附县', '3134', '653121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3135', '375', '0,1,32,375,', '疏勒县', '3135', '653122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3136', '375', '0,1,32,375,', '英吉沙县', '3136', '653123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3137', '375', '0,1,32,375,', '泽普县', '3137', '653124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3138', '375', '0,1,32,375,', '莎车县', '3138', '653125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3139', '375', '0,1,32,375,', '叶城县', '3139', '653126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('314', '26', '0,1,26,', '楚雄彝族自治州', '314', '532300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3140', '375', '0,1,32,375,', '麦盖提县', '3140', '653127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3141', '375', '0,1,32,375,', '岳普湖县', '3141', '653128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3142', '375', '0,1,32,375,', '伽师县', '3142', '653129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3143', '375', '0,1,32,375,', '巴楚县', '3143', '653130', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3144', '375', '0,1,32,375,', '塔什库尔干塔吉克自治县', '3144', '653131', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3145', '376', '0,1,32,376,', '和田市', '3145', '653201', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3146', '376', '0,1,32,376,', '和田县', '3146', '653221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3147', '376', '0,1,32,376,', '墨玉县', '3147', '653222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3148', '376', '0,1,32,376,', '皮山县', '3148', '653223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3149', '376', '0,1,32,376,', '洛浦县', '3149', '653224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('315', '26', '0,1,26,', '红河哈尼族彝族自治州', '315', '532500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3150', '376', '0,1,32,376,', '策勒县', '3150', '653225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3151', '376', '0,1,32,376,', '于田县', '3151', '653226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3152', '376', '0,1,32,376,', '民丰县', '3152', '653227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3153', '377', '0,1,32,377,', '伊宁市', '3153', '654002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3154', '377', '0,1,32,377,', '奎屯市', '3154', '654003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3155', '377', '0,1,32,377,', '伊宁县', '3155', '654021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3156', '377', '0,1,32,377,', '察布查尔锡伯自治县', '3156', '654022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3157', '377', '0,1,32,377,', '霍城县', '3157', '654023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3158', '377', '0,1,32,377,', '巩留县', '3158', '654024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3159', '377', '0,1,32,377,', '新源县', '3159', '654025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('316', '26', '0,1,26,', '文山壮族苗族自治州', '316', '532600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3160', '377', '0,1,32,377,', '昭苏县', '3160', '654026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3161', '377', '0,1,32,377,', '特克斯县', '3161', '654027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3162', '377', '0,1,32,377,', '尼勒克县', '3162', '654028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3163', '378', '0,1,32,378,', '塔城市', '3163', '654201', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3164', '378', '0,1,32,378,', '乌苏市', '3164', '654202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3165', '378', '0,1,32,378,', '额敏县', '3165', '654221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3166', '378', '0,1,32,378,', '沙湾县', '3166', '654223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3167', '378', '0,1,32,378,', '托里县', '3167', '654224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3168', '378', '0,1,32,378,', '裕民县', '3168', '654225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3169', '378', '0,1,32,378,', '和布克赛尔蒙古自治县', '3169', '654226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('317', '26', '0,1,26,', '西双版纳傣族自治州', '317', '532800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3170', '379', '0,1,32,379,', '阿勒泰市', '3170', '654301', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3171', '379', '0,1,32,379,', '布尔津县', '3171', '654321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3172', '379', '0,1,32,379,', '富蕴县', '3172', '654322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3173', '379', '0,1,32,379,', '福海县', '3173', '654323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3174', '379', '0,1,32,379,', '哈巴河县', '3174', '654324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3175', '379', '0,1,32,379,', '青河县', '3175', '654325', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3176', '379', '0,1,32,379,', '吉木乃县', '3176', '654326', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3177', '380', '0,1,32,380,', '石河子市', '3177', '659001', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3178', '380', '0,1,32,380,', '阿拉尔市', '3178', '659002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3179', '380', '0,1,32,380,', '图木舒克市', '3179', '659003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('318', '26', '0,1,26,', '大理白族自治州', '318', '532900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('3180', '380', '0,1,32,380,', '五家渠市', '3180', '659004', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3181', '237', '0,1,20,237,', '南山区', '3181', '440305', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('3182', '247', '0,1,20,247,', '城区', '3182', '441502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('319', '26', '0,1,26,', '德宏傣族景颇族自治州', '319', '533100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('32', '1', '0,1,', '新疆维吾尔自治区', '32', '650000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('320', '26', '0,1,26,', '怒江傈僳族自治州', '320', '533300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('321', '26', '0,1,26,', '迪庆藏族自治州', '321', '533400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('322', '27', '0,1,27,', '拉萨市', '322', '540100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('323', '27', '0,1,27,', '日喀则市', '323', '540200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('324', '27', '0,1,27,', '昌都地区', '324', '542100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('325', '27', '0,1,27,', '山南地区', '325', '542200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('326', '27', '0,1,27,', '那曲地区', '326', '542400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('327', '27', '0,1,27,', '阿里地区', '327', '542500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('328', '27', '0,1,27,', '林芝地区', '328', '542600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('329', '28', '0,1,28,', '西安市', '329', '610100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('33', '1', '0,1,', '台湾省', '33', '710000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('330', '28', '0,1,28,', '铜川市', '330', '610200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('331', '28', '0,1,28,', '宝鸡市', '331', '610300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('332', '28', '0,1,28,', '咸阳市', '332', '610400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('333', '28', '0,1,28,', '渭南市', '333', '610500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('334', '28', '0,1,28,', '延安市', '334', '610600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('335', '28', '0,1,28,', '汉中市', '335', '610700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('336', '28', '0,1,28,', '榆林市', '336', '610800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('337', '28', '0,1,28,', '安康市', '337', '610900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('338', '28', '0,1,28,', '商洛市', '338', '611000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('339', '29', '0,1,29,', '兰州市', '339', '620100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('34', '1', '0,1,', '香港特别行政区', '34', '810000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('340', '29', '0,1,29,', '嘉峪关市', '340', '620200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('341', '29', '0,1,29,', '金昌市', '341', '620300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('342', '29', '0,1,29,', '白银市', '342', '620400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('343', '29', '0,1,29,', '天水市', '343', '620500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('344', '29', '0,1,29,', '武威市', '344', '620600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('345', '29', '0,1,29,', '张掖市', '345', '620700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('346', '29', '0,1,29,', '平凉市', '346', '620800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('347', '29', '0,1,29,', '酒泉市', '347', '620900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('348', '29', '0,1,29,', '庆阳市', '348', '621000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('349', '29', '0,1,29,', '定西市', '349', '621100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('35', '1', '0,1,', '澳门特别行政区', '35', '820000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('350', '29', '0,1,29,', '陇南市', '350', '621200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('351', '29', '0,1,29,', '临夏回族自治州', '351', '622900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('352', '29', '0,1,29,', '甘南藏族自治州', '352', '623000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('353', '30', '0,1,30,', '西宁市', '353', '630100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('354', '30', '0,1,30,', '海东市', '354', '630200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('355', '30', '0,1,30,', '海北藏族自治州', '355', '632200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('356', '30', '0,1,30,', '黄南藏族自治州', '356', '632300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('357', '30', '0,1,30,', '海南藏族自治州', '357', '632500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('358', '30', '0,1,30,', '果洛藏族自治州', '358', '632600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('359', '30', '0,1,30,', '玉树藏族自治州', '359', '632700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('36', '2', '0,1,2,', '北京市', '36', '110100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('360', '30', '0,1,30,', '海西蒙古族藏族自治州', '360', '632800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('361', '31', '0,1,31,', '银川市', '361', '640100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('362', '31', '0,1,31,', '石嘴山市', '362', '640200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('363', '31', '0,1,31,', '吴忠市', '363', '640300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('364', '31', '0,1,31,', '固原市', '364', '640400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('365', '31', '0,1,31,', '中卫市', '365', '640500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('366', '32', '0,1,32,', '乌鲁木齐市', '366', '650100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('367', '32', '0,1,32,', '克拉玛依市', '367', '650200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('368', '32', '0,1,32,', '吐鲁番地区', '368', '652100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('369', '32', '0,1,32,', '哈密地区', '369', '652200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('37', '2', '0,1,2,', '北京县', '37', '110200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('370', '32', '0,1,32,', '昌吉回族自治州', '370', '652300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('371', '32', '0,1,32,', '博尔塔拉蒙古自治州', '371', '652700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('372', '32', '0,1,32,', '巴音郭楞蒙古自治州', '372', '652800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('373', '32', '0,1,32,', '阿克苏地区', '373', '652900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('374', '32', '0,1,32,', '克孜勒苏柯尔克孜自治州', '374', '653000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('375', '32', '0,1,32,', '喀什地区', '375', '653100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('376', '32', '0,1,32,', '和田地区', '376', '653200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('377', '32', '0,1,32,', '伊犁哈萨克自治州', '377', '654000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('378', '32', '0,1,32,', '塔城地区', '378', '654200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('379', '32', '0,1,32,', '阿勒泰地区', '379', '654300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('38', '3', '0,1,3,', '天津市', '38', '120100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('380', '32', '0,1,32,', '自治区直辖县级行政区划', '380', '659000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('381', '36', '0,1,2,36,', '东城区', '381', '110101', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('382', '36', '0,1,2,36,', '西城区', '382', '110102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('383', '36', '0,1,2,36,', '朝阳区', '383', '110105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('384', '36', '0,1,2,36,', '丰台区', '384', '110106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('385', '36', '0,1,2,36,', '石景山区', '385', '110107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('386', '36', '0,1,2,36,', '海淀区', '386', '110108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('387', '36', '0,1,2,36,', '门头沟区', '387', '110109', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('388', '36', '0,1,2,36,', '房山区', '388', '110111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('389', '36', '0,1,2,36,', '通州区', '389', '110112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('39', '3', '0,1,3,', '天津县', '39', '120200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('390', '36', '0,1,2,36,', '顺义区', '390', '110113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('391', '36', '0,1,2,36,', '昌平区', '391', '110114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('392', '36', '0,1,2,36,', '大兴区', '392', '110115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('393', '36', '0,1,2,36,', '怀柔区', '393', '110116', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('394', '36', '0,1,2,36,', '平谷区', '394', '110117', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('395', '37', '0,1,2,37,', '密云县', '395', '110228', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('396', '37', '0,1,2,37,', '延庆县', '396', '110229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('397', '38', '0,1,3,38,', '和平区', '397', '120101', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('398', '38', '0,1,3,38,', '河东区', '398', '120102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('399', '38', '0,1,3,38,', '河西区', '399', '120103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('4', '1', '0,1,', '河北省', '4', '130000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('40', '4', '0,1,4,', '石家庄市', '40', '130100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('400', '38', '0,1,3,38,', '南开区', '400', '120104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('401', '38', '0,1,3,38,', '河北区', '401', '120105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('402', '38', '0,1,3,38,', '红桥区', '402', '120106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('403', '38', '0,1,3,38,', '东丽区', '403', '120110', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('404', '38', '0,1,3,38,', '西青区', '404', '120111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('405', '38', '0,1,3,38,', '津南区', '405', '120112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('406', '38', '0,1,3,38,', '北辰区', '406', '120113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('407', '38', '0,1,3,38,', '武清区', '407', '120114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('408', '38', '0,1,3,38,', '宝坻区', '408', '120115', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('409', '38', '0,1,3,38,', '滨海新区', '409', '120116', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('41', '4', '0,1,4,', '唐山市', '41', '130200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('410', '39', '0,1,3,39,', '宁河县', '410', '120221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('411', '39', '0,1,3,39,', '静海县', '411', '120223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('412', '39', '0,1,3,39,', '蓟县', '412', '120225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('413', '40', '0,1,4,40,', '长安区', '413', '130102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('414', '40', '0,1,4,40,', '桥西区', '414', '130104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('415', '40', '0,1,4,40,', '正定县', '415', '130123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('416', '40', '0,1,4,40,', '行唐县', '416', '130125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('417', '40', '0,1,4,40,', '灵寿县', '417', '130126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('418', '40', '0,1,4,40,', '高邑县', '418', '130127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('419', '40', '0,1,4,40,', '辛集市', '419', '130181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('42', '4', '0,1,4,', '秦皇岛市', '42', '130300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('420', '40', '0,1,4,40,', '晋州市', '420', '130183', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('421', '40', '0,1,4,40,', '新乐市', '421', '130184', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('422', '41', '0,1,4,41,', '路南区', '422', '130202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('423', '41', '0,1,4,41,', '路北区', '423', '130203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('424', '41', '0,1,4,41,', '古冶区', '424', '130204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('425', '41', '0,1,4,41,', '开平区', '425', '130205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('426', '41', '0,1,4,41,', '丰南区', '426', '130207', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('427', '41', '0,1,4,41,', '丰润区', '427', '130208', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('428', '41', '0,1,4,41,', '曹妃甸区', '428', '130209', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('429', '41', '0,1,4,41,', '滦县', '429', '130223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('43', '4', '0,1,4,', '邯郸市', '43', '130400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('430', '41', '0,1,4,41,', '滦南县', '430', '130224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('431', '41', '0,1,4,41,', '乐亭县', '431', '130225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('432', '41', '0,1,4,41,', '迁西县', '432', '130227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('433', '41', '0,1,4,41,', '玉田县', '433', '130229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('434', '41', '0,1,4,41,', '遵化市', '434', '130281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('435', '41', '0,1,4,41,', '迁安市', '435', '130283', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('436', '42', '0,1,4,42,', '海港区', '436', '130302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('437', '42', '0,1,4,42,', '山海关区', '437', '130303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('438', '42', '0,1,4,42,', '北戴河区', '438', '130304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('439', '42', '0,1,4,42,', '青龙满族自治县', '439', '130321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('44', '4', '0,1,4,', '邢台市', '44', '130500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('440', '42', '0,1,4,42,', '昌黎县', '440', '130322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('441', '42', '0,1,4,42,', '抚宁县', '441', '130323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('442', '42', '0,1,4,42,', '卢龙县', '442', '130324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('443', '43', '0,1,4,43,', '邯山区', '443', '130402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('444', '43', '0,1,4,43,', '丛台区', '444', '130403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('445', '43', '0,1,4,43,', '复兴区', '445', '130404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('446', '43', '0,1,4,43,', '峰峰矿区', '446', '130406', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('447', '43', '0,1,4,43,', '邯郸县', '447', '130421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('448', '43', '0,1,4,43,', '临漳县', '448', '130423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('449', '43', '0,1,4,43,', '成安县', '449', '130424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('45', '4', '0,1,4,', '保定市', '45', '130600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('450', '43', '0,1,4,43,', '大名县', '450', '130425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('451', '43', '0,1,4,43,', '涉县', '451', '130426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('452', '43', '0,1,4,43,', '磁县', '452', '130427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('453', '43', '0,1,4,43,', '肥乡县', '453', '130428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('454', '43', '0,1,4,43,', '永年县', '454', '130429', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('455', '43', '0,1,4,43,', '邱县', '455', '130430', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('456', '43', '0,1,4,43,', '鸡泽县', '456', '130431', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('457', '43', '0,1,4,43,', '广平县', '457', '130432', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('458', '43', '0,1,4,43,', '馆陶县', '458', '130433', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('459', '43', '0,1,4,43,', '魏县', '459', '130434', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('46', '4', '0,1,4,', '张家口市', '46', '130700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('460', '43', '0,1,4,43,', '曲周县', '460', '130435', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('461', '43', '0,1,4,43,', '武安市', '461', '130481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('462', '44', '0,1,4,44,', '桥东区', '462', '130502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('463', '44', '0,1,4,44,', '邢台县', '463', '130521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('464', '44', '0,1,4,44,', '临城县', '464', '130522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('465', '44', '0,1,4,44,', '内丘县', '465', '130523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('466', '44', '0,1,4,44,', '柏乡县', '466', '130524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('467', '44', '0,1,4,44,', '隆尧县', '467', '130525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('468', '44', '0,1,4,44,', '任县', '468', '130526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('469', '44', '0,1,4,44,', '南和县', '469', '130527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('47', '4', '0,1,4,', '承德市', '47', '130800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('470', '44', '0,1,4,44,', '宁晋县', '470', '130528', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('471', '44', '0,1,4,44,', '巨鹿县', '471', '130529', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('472', '44', '0,1,4,44,', '新河县', '472', '130530', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('473', '44', '0,1,4,44,', '广宗县', '473', '130531', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('474', '44', '0,1,4,44,', '平乡县', '474', '130532', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('475', '44', '0,1,4,44,', '威县', '475', '130533', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('476', '44', '0,1,4,44,', '清河县', '476', '130534', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('477', '44', '0,1,4,44,', '临西县', '477', '130535', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('478', '44', '0,1,4,44,', '南宫市', '478', '130581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('479', '44', '0,1,4,44,', '沙河市', '479', '130582', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('48', '4', '0,1,4,', '沧州市', '48', '130900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('480', '45', '0,1,4,45,', '新市区', '480', '130602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('481', '45', '0,1,4,45,', '北市区', '481', '130603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('482', '45', '0,1,4,45,', '南市区', '482', '130604', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('483', '45', '0,1,4,45,', '满城县', '483', '130621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('484', '45', '0,1,4,45,', '清苑县', '484', '130622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('485', '45', '0,1,4,45,', '涞水县', '485', '130623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('486', '45', '0,1,4,45,', '阜平县', '486', '130624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('487', '45', '0,1,4,45,', '徐水县', '487', '130625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('488', '45', '0,1,4,45,', '定兴县', '488', '130626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('489', '45', '0,1,4,45,', '唐县', '489', '130627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('49', '4', '0,1,4,', '廊坊市', '49', '131000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('490', '45', '0,1,4,45,', '高阳县', '490', '130628', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('491', '45', '0,1,4,45,', '容城县', '491', '130629', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('492', '45', '0,1,4,45,', '涞源县', '492', '130630', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('493', '45', '0,1,4,45,', '望都县', '493', '130631', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('494', '45', '0,1,4,45,', '安新县', '494', '130632', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('495', '45', '0,1,4,45,', '易县', '495', '130633', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('496', '45', '0,1,4,45,', '曲阳县', '496', '130634', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('497', '45', '0,1,4,45,', '蠡县', '497', '130635', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('498', '45', '0,1,4,45,', '顺平县', '498', '130636', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('499', '45', '0,1,4,45,', '博野县', '499', '130637', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('5', '1', '0,1,', '山西省', '5', '140000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('50', '4', '0,1,4,', '衡水市', '50', '131100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('500', '45', '0,1,4,45,', '雄县', '500', '130638', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('501', '45', '0,1,4,45,', '涿州市', '501', '130681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('502', '45', '0,1,4,45,', '定州市', '502', '130682', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('503', '45', '0,1,4,45,', '安国市', '503', '130683', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('504', '45', '0,1,4,45,', '高碑店市', '504', '130684', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('505', '46', '0,1,4,46,', '宣化区', '505', '130705', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('506', '46', '0,1,4,46,', '下花园区', '506', '130706', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('507', '46', '0,1,4,46,', '宣化县', '507', '130721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('508', '46', '0,1,4,46,', '张北县', '508', '130722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('509', '46', '0,1,4,46,', '康保县', '509', '130723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('51', '5', '0,1,5,', '太原市', '51', '140100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('510', '46', '0,1,4,46,', '沽源县', '510', '130724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('511', '46', '0,1,4,46,', '尚义县', '511', '130725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('512', '46', '0,1,4,46,', '蔚县', '512', '130726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('513', '46', '0,1,4,46,', '阳原县', '513', '130727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('514', '46', '0,1,4,46,', '怀安县', '514', '130728', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('515', '46', '0,1,4,46,', '万全县', '515', '130729', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('516', '46', '0,1,4,46,', '怀来县', '516', '130730', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('517', '46', '0,1,4,46,', '涿鹿县', '517', '130731', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('518', '46', '0,1,4,46,', '赤城县', '518', '130732', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('519', '46', '0,1,4,46,', '崇礼县', '519', '130733', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('52', '5', '0,1,5,', '大同市', '52', '140200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('520', '47', '0,1,4,47,', '双桥区', '520', '130802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('521', '47', '0,1,4,47,', '双滦区', '521', '130803', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('522', '47', '0,1,4,47,', '鹰手营子矿区', '522', '130804', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('523', '47', '0,1,4,47,', '承德县', '523', '130821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('524', '47', '0,1,4,47,', '兴隆县', '524', '130822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('525', '47', '0,1,4,47,', '平泉县', '525', '130823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('526', '47', '0,1,4,47,', '滦平县', '526', '130824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('527', '47', '0,1,4,47,', '隆化县', '527', '130825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('528', '47', '0,1,4,47,', '丰宁满族自治县', '528', '130826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('529', '47', '0,1,4,47,', '宽城满族自治县', '529', '130827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('53', '5', '0,1,5,', '阳泉市', '53', '140300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('530', '47', '0,1,4,47,', '围场满族蒙古族自治县', '530', '130828', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('531', '48', '0,1,4,48,', '运河区', '531', '130903', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('532', '48', '0,1,4,48,', '沧县', '532', '130921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('533', '48', '0,1,4,48,', '青县', '533', '130922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('534', '48', '0,1,4,48,', '东光县', '534', '130923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('535', '48', '0,1,4,48,', '海兴县', '535', '130924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('536', '48', '0,1,4,48,', '盐山县', '536', '130925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('537', '48', '0,1,4,48,', '肃宁县', '537', '130926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('538', '48', '0,1,4,48,', '南皮县', '538', '130927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('539', '48', '0,1,4,48,', '吴桥县', '539', '130928', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('54', '5', '0,1,5,', '长治市', '54', '140400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('540', '48', '0,1,4,48,', '献县', '540', '130929', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('541', '48', '0,1,4,48,', '孟村回族自治县', '541', '130930', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('542', '48', '0,1,4,48,', '泊头市', '542', '130981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('543', '48', '0,1,4,48,', '任丘市', '543', '130982', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('544', '48', '0,1,4,48,', '黄骅市', '544', '130983', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('545', '48', '0,1,4,48,', '河间市', '545', '130984', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('546', '49', '0,1,4,49,', '安次区', '546', '131002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('547', '49', '0,1,4,49,', '广阳区', '547', '131003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('548', '49', '0,1,4,49,', '固安县', '548', '131022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('549', '49', '0,1,4,49,', '永清县', '549', '131023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('55', '5', '0,1,5,', '晋城市', '55', '140500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('550', '49', '0,1,4,49,', '香河县', '550', '131024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('551', '49', '0,1,4,49,', '大城县', '551', '131025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('552', '49', '0,1,4,49,', '文安县', '552', '131026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('553', '49', '0,1,4,49,', '大厂回族自治县', '553', '131028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('554', '49', '0,1,4,49,', '霸州市', '554', '131081', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('555', '49', '0,1,4,49,', '三河市', '555', '131082', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('556', '50', '0,1,4,50,', '桃城区', '556', '131102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('557', '50', '0,1,4,50,', '枣强县', '557', '131121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('558', '50', '0,1,4,50,', '武邑县', '558', '131122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('559', '50', '0,1,4,50,', '武强县', '559', '131123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('56', '5', '0,1,5,', '朔州市', '56', '140600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('560', '50', '0,1,4,50,', '饶阳县', '560', '131124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('561', '50', '0,1,4,50,', '安平县', '561', '131125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('562', '50', '0,1,4,50,', '故城县', '562', '131126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('563', '50', '0,1,4,50,', '景县', '563', '131127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('564', '50', '0,1,4,50,', '阜城县', '564', '131128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('565', '50', '0,1,4,50,', '冀州市', '565', '131181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('566', '50', '0,1,4,50,', '深州市', '566', '131182', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('567', '51', '0,1,5,51,', '小店区', '567', '140105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('568', '51', '0,1,5,51,', '迎泽区', '568', '140106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('569', '51', '0,1,5,51,', '杏花岭区', '569', '140107', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('57', '5', '0,1,5,', '晋中市', '57', '140700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('570', '51', '0,1,5,51,', '尖草坪区', '570', '140108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('571', '51', '0,1,5,51,', '万柏林区', '571', '140109', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('572', '51', '0,1,5,51,', '晋源区', '572', '140110', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('573', '51', '0,1,5,51,', '清徐县', '573', '140121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('574', '51', '0,1,5,51,', '阳曲县', '574', '140122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('575', '51', '0,1,5,51,', '娄烦县', '575', '140123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('576', '51', '0,1,5,51,', '古交市', '576', '140181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('577', '52', '0,1,5,52,', '城区', '577', '140202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('578', '52', '0,1,5,52,', '矿区', '578', '140203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('579', '52', '0,1,5,52,', '南郊区', '579', '140211', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('58', '5', '0,1,5,', '运城市', '58', '140800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('580', '52', '0,1,5,52,', '新荣区', '580', '140212', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('581', '52', '0,1,5,52,', '阳高县', '581', '140221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('582', '52', '0,1,5,52,', '天镇县', '582', '140222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('583', '52', '0,1,5,52,', '广灵县', '583', '140223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('584', '52', '0,1,5,52,', '灵丘县', '584', '140224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('585', '52', '0,1,5,52,', '浑源县', '585', '140225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('586', '52', '0,1,5,52,', '左云县', '586', '140226', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('587', '52', '0,1,5,52,', '大同县', '587', '140227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('588', '53', '0,1,5,53,', '郊区', '588', '140311', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('589', '53', '0,1,5,53,', '平定县', '589', '140321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('59', '5', '0,1,5,', '忻州市', '59', '140900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('590', '53', '0,1,5,53,', '盂县', '590', '140322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('591', '54', '0,1,5,54,', '长治县', '591', '140421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('592', '54', '0,1,5,54,', '襄垣县', '592', '140423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('593', '54', '0,1,5,54,', '屯留县', '593', '140424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('594', '54', '0,1,5,54,', '平顺县', '594', '140425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('595', '54', '0,1,5,54,', '黎城县', '595', '140426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('596', '54', '0,1,5,54,', '壶关县', '596', '140427', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('597', '54', '0,1,5,54,', '长子县', '597', '140428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('598', '54', '0,1,5,54,', '武乡县', '598', '140429', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('599', '54', '0,1,5,54,', '沁县', '599', '140430', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('6', '1', '0,1,', '内蒙古自治区', '6', '150000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('60', '5', '0,1,5,', '临汾市', '60', '141000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('600', '54', '0,1,5,54,', '沁源县', '600', '140431', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('601', '54', '0,1,5,54,', '潞城市', '601', '140481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('602', '55', '0,1,5,55,', '沁水县', '602', '140521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('603', '55', '0,1,5,55,', '阳城县', '603', '140522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('604', '55', '0,1,5,55,', '陵川县', '604', '140524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('605', '55', '0,1,5,55,', '泽州县', '605', '140525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('606', '55', '0,1,5,55,', '高平市', '606', '140581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('607', '56', '0,1,5,56,', '朔城区', '607', '140602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('608', '56', '0,1,5,56,', '平鲁区', '608', '140603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('609', '56', '0,1,5,56,', '山阴县', '609', '140621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('61', '5', '0,1,5,', '吕梁市', '61', '141100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('610', '56', '0,1,5,56,', '应县', '610', '140622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('611', '56', '0,1,5,56,', '右玉县', '611', '140623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('612', '56', '0,1,5,56,', '怀仁县', '612', '140624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('613', '57', '0,1,5,57,', '榆次区', '613', '140702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('614', '57', '0,1,5,57,', '榆社县', '614', '140721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('615', '57', '0,1,5,57,', '左权县', '615', '140722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('616', '57', '0,1,5,57,', '和顺县', '616', '140723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('617', '57', '0,1,5,57,', '昔阳县', '617', '140724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('618', '57', '0,1,5,57,', '寿阳县', '618', '140725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('619', '57', '0,1,5,57,', '太谷县', '619', '140726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('62', '6', '0,1,6,', '呼和浩特市', '62', '150100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('620', '57', '0,1,5,57,', '祁县', '620', '140727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('621', '57', '0,1,5,57,', '平遥县', '621', '140728', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('622', '57', '0,1,5,57,', '灵石县', '622', '140729', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('623', '57', '0,1,5,57,', '介休市', '623', '140781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('624', '58', '0,1,5,58,', '盐湖区', '624', '140802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('625', '58', '0,1,5,58,', '临猗县', '625', '140821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('626', '58', '0,1,5,58,', '万荣县', '626', '140822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('627', '58', '0,1,5,58,', '闻喜县', '627', '140823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('628', '58', '0,1,5,58,', '稷山县', '628', '140824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('629', '58', '0,1,5,58,', '新绛县', '629', '140825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('63', '6', '0,1,6,', '包头市', '63', '150200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('630', '58', '0,1,5,58,', '绛县', '630', '140826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('631', '58', '0,1,5,58,', '垣曲县', '631', '140827', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('632', '58', '0,1,5,58,', '夏县', '632', '140828', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('633', '58', '0,1,5,58,', '平陆县', '633', '140829', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('634', '58', '0,1,5,58,', '芮城县', '634', '140830', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('635', '58', '0,1,5,58,', '永济市', '635', '140881', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('636', '58', '0,1,5,58,', '河津市', '636', '140882', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('637', '59', '0,1,5,59,', '忻府区', '637', '140902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('638', '59', '0,1,5,59,', '定襄县', '638', '140921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('639', '59', '0,1,5,59,', '五台县', '639', '140922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('64', '6', '0,1,6,', '乌海市', '64', '150300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('640', '59', '0,1,5,59,', '代县', '640', '140923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('641', '59', '0,1,5,59,', '繁峙县', '641', '140924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('642', '59', '0,1,5,59,', '宁武县', '642', '140925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('643', '59', '0,1,5,59,', '静乐县', '643', '140926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('644', '59', '0,1,5,59,', '神池县', '644', '140927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('645', '59', '0,1,5,59,', '五寨县', '645', '140928', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('646', '59', '0,1,5,59,', '岢岚县', '646', '140929', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('647', '59', '0,1,5,59,', '河曲县', '647', '140930', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('648', '59', '0,1,5,59,', '保德县', '648', '140931', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('649', '59', '0,1,5,59,', '偏关县', '649', '140932', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('65', '6', '0,1,6,', '赤峰市', '65', '150400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('650', '59', '0,1,5,59,', '原平市', '650', '140981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('651', '60', '0,1,5,60,', '尧都区', '651', '141002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('652', '60', '0,1,5,60,', '曲沃县', '652', '141021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('653', '60', '0,1,5,60,', '翼城县', '653', '141022', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('654', '60', '0,1,5,60,', '襄汾县', '654', '141023', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('655', '60', '0,1,5,60,', '洪洞县', '655', '141024', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('656', '60', '0,1,5,60,', '古县', '656', '141025', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('657', '60', '0,1,5,60,', '安泽县', '657', '141026', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('658', '60', '0,1,5,60,', '浮山县', '658', '141027', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('659', '60', '0,1,5,60,', '吉县', '659', '141028', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('66', '6', '0,1,6,', '通辽市', '66', '150500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('660', '60', '0,1,5,60,', '乡宁县', '660', '141029', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('661', '60', '0,1,5,60,', '大宁县', '661', '141030', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('662', '60', '0,1,5,60,', '隰县', '662', '141031', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('663', '60', '0,1,5,60,', '永和县', '663', '141032', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('664', '60', '0,1,5,60,', '蒲县', '664', '141033', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('665', '60', '0,1,5,60,', '汾西县', '665', '141034', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('666', '60', '0,1,5,60,', '侯马市', '666', '141081', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('667', '60', '0,1,5,60,', '霍州市', '667', '141082', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('668', '61', '0,1,5,61,', '离石区', '668', '141102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('669', '61', '0,1,5,61,', '文水县', '669', '141121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('67', '6', '0,1,6,', '鄂尔多斯市', '67', '150600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('670', '61', '0,1,5,61,', '交城县', '670', '141122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('671', '61', '0,1,5,61,', '兴县', '671', '141123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('672', '61', '0,1,5,61,', '临县', '672', '141124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('673', '61', '0,1,5,61,', '柳林县', '673', '141125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('674', '61', '0,1,5,61,', '石楼县', '674', '141126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('675', '61', '0,1,5,61,', '岚县', '675', '141127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('676', '61', '0,1,5,61,', '方山县', '676', '141128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('677', '61', '0,1,5,61,', '中阳县', '677', '141129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('678', '61', '0,1,5,61,', '交口县', '678', '141130', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('679', '61', '0,1,5,61,', '孝义市', '679', '141181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('68', '6', '0,1,6,', '呼伦贝尔市', '68', '150700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('680', '61', '0,1,5,61,', '汾阳市', '680', '141182', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('681', '62', '0,1,6,62,', '新城区', '681', '150102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('682', '62', '0,1,6,62,', '回民区', '682', '150103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('683', '62', '0,1,6,62,', '玉泉区', '683', '150104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('684', '62', '0,1,6,62,', '赛罕区', '684', '150105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('685', '62', '0,1,6,62,', '土默特左旗', '685', '150121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('686', '62', '0,1,6,62,', '托克托县', '686', '150122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('687', '62', '0,1,6,62,', '和林格尔县', '687', '150123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('688', '62', '0,1,6,62,', '清水河县', '688', '150124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('689', '62', '0,1,6,62,', '武川县', '689', '150125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('69', '6', '0,1,6,', '巴彦淖尔市', '69', '150800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('690', '63', '0,1,6,63,', '东河区', '690', '150202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('691', '63', '0,1,6,63,', '昆都仑区', '691', '150203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('692', '63', '0,1,6,63,', '青山区', '692', '150204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('693', '63', '0,1,6,63,', '石拐区', '693', '150205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('694', '63', '0,1,6,63,', '白云鄂博矿区', '694', '150206', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('695', '63', '0,1,6,63,', '九原区', '695', '150207', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('696', '63', '0,1,6,63,', '土默特右旗', '696', '150221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('697', '63', '0,1,6,63,', '固阳县', '697', '150222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('698', '63', '0,1,6,63,', '达尔罕茂明安联合旗', '698', '150223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('699', '64', '0,1,6,64,', '海勃湾区', '699', '150302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('7', '1', '0,1,', '辽宁省', '7', '210000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('70', '6', '0,1,6,', '乌兰察布市', '70', '150900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('700', '64', '0,1,6,64,', '海南区', '700', '150303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('701', '64', '0,1,6,64,', '乌达区', '701', '150304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('702', '65', '0,1,6,65,', '红山区', '702', '150402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('703', '65', '0,1,6,65,', '元宝山区', '703', '150403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('704', '65', '0,1,6,65,', '松山区', '704', '150404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('705', '65', '0,1,6,65,', '阿鲁科尔沁旗', '705', '150421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('706', '65', '0,1,6,65,', '巴林左旗', '706', '150422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('707', '65', '0,1,6,65,', '巴林右旗', '707', '150423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('708', '65', '0,1,6,65,', '林西县', '708', '150424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('709', '65', '0,1,6,65,', '克什克腾旗', '709', '150425', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('71', '6', '0,1,6,', '兴安盟', '71', '152200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('710', '65', '0,1,6,65,', '翁牛特旗', '710', '150426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('711', '65', '0,1,6,65,', '喀喇沁旗', '711', '150428', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('712', '65', '0,1,6,65,', '宁城县', '712', '150429', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('713', '65', '0,1,6,65,', '敖汉旗', '713', '150430', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('714', '66', '0,1,6,66,', '科尔沁区', '714', '150502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('715', '66', '0,1,6,66,', '科尔沁左翼中旗', '715', '150521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('716', '66', '0,1,6,66,', '科尔沁左翼后旗', '716', '150522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('717', '66', '0,1,6,66,', '开鲁县', '717', '150523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('718', '66', '0,1,6,66,', '库伦旗', '718', '150524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('719', '66', '0,1,6,66,', '奈曼旗', '719', '150525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('72', '6', '0,1,6,', '锡林郭勒盟', '72', '152500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('720', '66', '0,1,6,66,', '扎鲁特旗', '720', '150526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('721', '66', '0,1,6,66,', '霍林郭勒市', '721', '150581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('722', '67', '0,1,6,67,', '东胜区', '722', '150602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('723', '67', '0,1,6,67,', '达拉特旗', '723', '150621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('724', '67', '0,1,6,67,', '准格尔旗', '724', '150622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('725', '67', '0,1,6,67,', '鄂托克前旗', '725', '150623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('726', '67', '0,1,6,67,', '鄂托克旗', '726', '150624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('727', '67', '0,1,6,67,', '杭锦旗', '727', '150625', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('728', '67', '0,1,6,67,', '乌审旗', '728', '150626', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('729', '67', '0,1,6,67,', '伊金霍洛旗', '729', '150627', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('73', '6', '0,1,6,', '阿拉善盟', '73', '152900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('730', '68', '0,1,6,68,', '海拉尔区', '730', '150702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('731', '68', '0,1,6,68,', '扎赉诺尔区', '731', '150703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('732', '68', '0,1,6,68,', '阿荣旗', '732', '150721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('733', '68', '0,1,6,68,', '莫力达瓦达斡尔族自治旗', '733', '150722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('734', '68', '0,1,6,68,', '鄂伦春自治旗', '734', '150723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('735', '68', '0,1,6,68,', '鄂温克族自治旗', '735', '150724', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('736', '68', '0,1,6,68,', '陈巴尔虎旗', '736', '150725', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('737', '68', '0,1,6,68,', '新巴尔虎左旗', '737', '150726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('738', '68', '0,1,6,68,', '新巴尔虎右旗', '738', '150727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('739', '68', '0,1,6,68,', '满洲里市', '739', '150781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('74', '7', '0,1,7,', '沈阳市', '74', '210100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('740', '68', '0,1,6,68,', '牙克石市', '740', '150782', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('741', '68', '0,1,6,68,', '扎兰屯市', '741', '150783', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('742', '68', '0,1,6,68,', '额尔古纳市', '742', '150784', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('743', '68', '0,1,6,68,', '根河市', '743', '150785', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('744', '69', '0,1,6,69,', '临河区', '744', '150802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('745', '69', '0,1,6,69,', '五原县', '745', '150821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('746', '69', '0,1,6,69,', '磴口县', '746', '150822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('747', '69', '0,1,6,69,', '乌拉特前旗', '747', '150823', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('748', '69', '0,1,6,69,', '乌拉特中旗', '748', '150824', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('749', '69', '0,1,6,69,', '乌拉特后旗', '749', '150825', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('75', '7', '0,1,7,', '大连市', '75', '210200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('750', '69', '0,1,6,69,', '杭锦后旗', '750', '150826', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('751', '70', '0,1,6,70,', '集宁区', '751', '150902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('752', '70', '0,1,6,70,', '卓资县', '752', '150921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('753', '70', '0,1,6,70,', '化德县', '753', '150922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('754', '70', '0,1,6,70,', '商都县', '754', '150923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('755', '70', '0,1,6,70,', '兴和县', '755', '150924', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('756', '70', '0,1,6,70,', '凉城县', '756', '150925', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('757', '70', '0,1,6,70,', '察哈尔右翼前旗', '757', '150926', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('758', '70', '0,1,6,70,', '察哈尔右翼中旗', '758', '150927', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('759', '70', '0,1,6,70,', '察哈尔右翼后旗', '759', '150928', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('76', '7', '0,1,7,', '鞍山市', '76', '210300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('760', '70', '0,1,6,70,', '四子王旗', '760', '150929', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('761', '70', '0,1,6,70,', '丰镇市', '761', '150981', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('762', '71', '0,1,6,71,', '乌兰浩特市', '762', '152201', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('763', '71', '0,1,6,71,', '阿尔山市', '763', '152202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('764', '71', '0,1,6,71,', '科尔沁右翼前旗', '764', '152221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('765', '71', '0,1,6,71,', '科尔沁右翼中旗', '765', '152222', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('766', '71', '0,1,6,71,', '扎赉特旗', '766', '152223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('767', '71', '0,1,6,71,', '突泉县', '767', '152224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('768', '72', '0,1,6,72,', '二连浩特市', '768', '152501', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('769', '72', '0,1,6,72,', '锡林浩特市', '769', '152502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('77', '7', '0,1,7,', '抚顺市', '77', '210400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('770', '72', '0,1,6,72,', '阿巴嘎旗', '770', '152522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('771', '72', '0,1,6,72,', '苏尼特左旗', '771', '152523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('772', '72', '0,1,6,72,', '苏尼特右旗', '772', '152524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('773', '72', '0,1,6,72,', '东乌珠穆沁旗', '773', '152525', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('774', '72', '0,1,6,72,', '西乌珠穆沁旗', '774', '152526', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('775', '72', '0,1,6,72,', '太仆寺旗', '775', '152527', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('776', '72', '0,1,6,72,', '镶黄旗', '776', '152528', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('777', '72', '0,1,6,72,', '正镶白旗', '777', '152529', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('778', '72', '0,1,6,72,', '正蓝旗', '778', '152530', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('779', '72', '0,1,6,72,', '多伦县', '779', '152531', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('78', '7', '0,1,7,', '本溪市', '78', '210500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('780', '73', '0,1,6,73,', '阿拉善左旗', '780', '152921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('781', '73', '0,1,6,73,', '阿拉善右旗', '781', '152922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('782', '73', '0,1,6,73,', '额济纳旗', '782', '152923', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('783', '74', '0,1,7,74,', '沈河区', '783', '210103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('784', '74', '0,1,7,74,', '大东区', '784', '210104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('785', '74', '0,1,7,74,', '皇姑区', '785', '210105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('786', '74', '0,1,7,74,', '铁西区', '786', '210106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('787', '74', '0,1,7,74,', '苏家屯区', '787', '210111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('788', '74', '0,1,7,74,', '浑南区', '788', '210112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('789', '74', '0,1,7,74,', '沈北新区', '789', '210113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('79', '7', '0,1,7,', '丹东市', '79', '210600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('790', '74', '0,1,7,74,', '于洪区', '790', '210114', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('791', '74', '0,1,7,74,', '辽中县', '791', '210122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('792', '74', '0,1,7,74,', '康平县', '792', '210123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('793', '74', '0,1,7,74,', '法库县', '793', '210124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('794', '74', '0,1,7,74,', '新民市', '794', '210181', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('795', '75', '0,1,7,75,', '中山区', '795', '210202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('796', '75', '0,1,7,75,', '西岗区', '796', '210203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('797', '75', '0,1,7,75,', '沙河口区', '797', '210204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('798', '75', '0,1,7,75,', '甘井子区', '798', '210211', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('799', '75', '0,1,7,75,', '旅顺口区', '799', '210212', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('8', '1', '0,1,', '吉林省', '8', '220000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('80', '7', '0,1,7,', '锦州市', '80', '210700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('800', '75', '0,1,7,75,', '金州区', '800', '210213', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('801', '75', '0,1,7,75,', '长海县', '801', '210224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('802', '75', '0,1,7,75,', '瓦房店市', '802', '210281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('803', '75', '0,1,7,75,', '普兰店市', '803', '210282', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('804', '75', '0,1,7,75,', '庄河市', '804', '210283', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('805', '76', '0,1,7,76,', '铁东区', '805', '210302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('806', '76', '0,1,7,76,', '立山区', '806', '210304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('807', '76', '0,1,7,76,', '千山区', '807', '210311', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('808', '76', '0,1,7,76,', '台安县', '808', '210321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('809', '76', '0,1,7,76,', '岫岩满族自治县', '809', '210323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('81', '7', '0,1,7,', '营口市', '81', '210800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('810', '76', '0,1,7,76,', '海城市', '810', '210381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('811', '77', '0,1,7,77,', '新抚区', '811', '210402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('812', '77', '0,1,7,77,', '东洲区', '812', '210403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('813', '77', '0,1,7,77,', '望花区', '813', '210404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('814', '77', '0,1,7,77,', '顺城区', '814', '210411', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('815', '77', '0,1,7,77,', '抚顺县', '815', '210421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('816', '77', '0,1,7,77,', '新宾满族自治县', '816', '210422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('817', '77', '0,1,7,77,', '清原满族自治县', '817', '210423', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('818', '78', '0,1,7,78,', '平山区', '818', '210502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('819', '78', '0,1,7,78,', '溪湖区', '819', '210503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('82', '7', '0,1,7,', '阜新市', '82', '210900', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('820', '78', '0,1,7,78,', '明山区', '820', '210504', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('821', '78', '0,1,7,78,', '南芬区', '821', '210505', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('822', '78', '0,1,7,78,', '本溪满族自治县', '822', '210521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('823', '78', '0,1,7,78,', '桓仁满族自治县', '823', '210522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('824', '79', '0,1,7,79,', '元宝区', '824', '210602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('825', '79', '0,1,7,79,', '振兴区', '825', '210603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('826', '79', '0,1,7,79,', '振安区', '826', '210604', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('827', '79', '0,1,7,79,', '宽甸满族自治县', '827', '210624', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('828', '79', '0,1,7,79,', '东港市', '828', '210681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('829', '79', '0,1,7,79,', '凤城市', '829', '210682', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('83', '7', '0,1,7,', '辽阳市', '83', '211000', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('830', '80', '0,1,7,80,', '古塔区', '830', '210702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('831', '80', '0,1,7,80,', '凌河区', '831', '210703', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('832', '80', '0,1,7,80,', '太和区', '832', '210711', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('833', '80', '0,1,7,80,', '黑山县', '833', '210726', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('834', '80', '0,1,7,80,', '义县', '834', '210727', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('835', '80', '0,1,7,80,', '凌海市', '835', '210781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('836', '80', '0,1,7,80,', '北镇市', '836', '210782', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('837', '81', '0,1,7,81,', '站前区', '837', '210802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('838', '81', '0,1,7,81,', '西市区', '838', '210803', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('839', '81', '0,1,7,81,', '鲅鱼圈区', '839', '210804', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('84', '7', '0,1,7,', '盘锦市', '84', '211100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('840', '81', '0,1,7,81,', '老边区', '840', '210811', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('841', '81', '0,1,7,81,', '盖州市', '841', '210881', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('842', '81', '0,1,7,81,', '大石桥市', '842', '210882', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('843', '82', '0,1,7,82,', '海州区', '843', '210902', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('844', '82', '0,1,7,82,', '新邱区', '844', '210903', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('845', '82', '0,1,7,82,', '太平区', '845', '210904', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('846', '82', '0,1,7,82,', '清河门区', '846', '210905', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('847', '82', '0,1,7,82,', '细河区', '847', '210911', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('848', '82', '0,1,7,82,', '阜新蒙古族自治县', '848', '210921', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('849', '82', '0,1,7,82,', '彰武县', '849', '210922', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('85', '7', '0,1,7,', '铁岭市', '85', '211200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('850', '83', '0,1,7,83,', '白塔区', '850', '211002', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('851', '83', '0,1,7,83,', '文圣区', '851', '211003', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('852', '83', '0,1,7,83,', '宏伟区', '852', '211004', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('853', '83', '0,1,7,83,', '弓长岭区', '853', '211005', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('854', '83', '0,1,7,83,', '太子河区', '854', '211011', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('855', '83', '0,1,7,83,', '辽阳县', '855', '211021', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('856', '83', '0,1,7,83,', '灯塔市', '856', '211081', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('857', '84', '0,1,7,84,', '双台子区', '857', '211102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('858', '84', '0,1,7,84,', '兴隆台区', '858', '211103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('859', '84', '0,1,7,84,', '大洼县', '859', '211121', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('86', '7', '0,1,7,', '朝阳市', '86', '211300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('860', '84', '0,1,7,84,', '盘山县', '860', '211122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('861', '85', '0,1,7,85,', '银州区', '861', '211202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('862', '85', '0,1,7,85,', '清河区', '862', '211204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('863', '85', '0,1,7,85,', '铁岭县', '863', '211221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('864', '85', '0,1,7,85,', '西丰县', '864', '211223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('865', '85', '0,1,7,85,', '昌图县', '865', '211224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('866', '85', '0,1,7,85,', '调兵山市', '866', '211281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('867', '85', '0,1,7,85,', '开原市', '867', '211282', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('868', '86', '0,1,7,86,', '双塔区', '868', '211302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('869', '86', '0,1,7,86,', '龙城区', '869', '211303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('87', '7', '0,1,7,', '葫芦岛市', '87', '211400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('870', '86', '0,1,7,86,', '朝阳县', '870', '211321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('871', '86', '0,1,7,86,', '建平县', '871', '211322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('872', '86', '0,1,7,86,', '喀喇沁左翼蒙古族自治县', '872', '211324', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('873', '86', '0,1,7,86,', '北票市', '873', '211381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('874', '86', '0,1,7,86,', '凌源市', '874', '211382', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('875', '87', '0,1,7,87,', '连山区', '875', '211402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('876', '87', '0,1,7,87,', '龙港区', '876', '211403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('877', '87', '0,1,7,87,', '南票区', '877', '211404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('878', '87', '0,1,7,87,', '绥中县', '878', '211421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('879', '87', '0,1,7,87,', '建昌县', '879', '211422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('88', '8', '0,1,8,', '长春市', '88', '220100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('880', '87', '0,1,7,87,', '兴城市', '880', '211481', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('881', '88', '0,1,8,88,', '南关区', '881', '220102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('882', '88', '0,1,8,88,', '宽城区', '882', '220103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('883', '88', '0,1,8,88,', '二道区', '883', '220105', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('884', '88', '0,1,8,88,', '绿园区', '884', '220106', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('885', '88', '0,1,8,88,', '双阳区', '885', '220112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('886', '88', '0,1,8,88,', '九台区', '886', '220113', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('887', '88', '0,1,8,88,', '农安县', '887', '220122', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('888', '88', '0,1,8,88,', '榆树市', '888', '220182', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('889', '88', '0,1,8,88,', '德惠市', '889', '220183', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('89', '8', '0,1,8,', '吉林市', '89', '220200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('890', '89', '0,1,8,89,', '昌邑区', '890', '220202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('891', '89', '0,1,8,89,', '龙潭区', '891', '220203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('892', '89', '0,1,8,89,', '船营区', '892', '220204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('893', '89', '0,1,8,89,', '丰满区', '893', '220211', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('894', '89', '0,1,8,89,', '永吉县', '894', '220221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('895', '89', '0,1,8,89,', '蛟河市', '895', '220281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('896', '89', '0,1,8,89,', '桦甸市', '896', '220282', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('897', '89', '0,1,8,89,', '舒兰市', '897', '220283', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('898', '89', '0,1,8,89,', '磐石市', '898', '220284', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('899', '90', '0,1,8,90,', '梨树县', '899', '220322', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('9', '1', '0,1,', '黑龙江省', '9', '230000', '2', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('90', '8', '0,1,8,', '四平市', '90', '220300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('900', '90', '0,1,8,90,', '伊通满族自治县', '900', '220323', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('901', '90', '0,1,8,90,', '公主岭市', '901', '220381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('902', '90', '0,1,8,90,', '双辽市', '902', '220382', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('903', '91', '0,1,8,91,', '龙山区', '903', '220402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('904', '91', '0,1,8,91,', '西安区', '904', '220403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('905', '91', '0,1,8,91,', '东丰县', '905', '220421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('906', '91', '0,1,8,91,', '东辽县', '906', '220422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('907', '92', '0,1,8,92,', '东昌区', '907', '220502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('908', '92', '0,1,8,92,', '二道江区', '908', '220503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('909', '92', '0,1,8,92,', '通化县', '909', '220521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('91', '8', '0,1,8,', '辽源市', '91', '220400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('910', '92', '0,1,8,92,', '辉南县', '910', '220523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('911', '92', '0,1,8,92,', '柳河县', '911', '220524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('912', '92', '0,1,8,92,', '梅河口市', '912', '220581', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('913', '92', '0,1,8,92,', '集安市', '913', '220582', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('914', '93', '0,1,8,93,', '浑江区', '914', '220602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('915', '93', '0,1,8,93,', '江源区', '915', '220605', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('916', '93', '0,1,8,93,', '抚松县', '916', '220621', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('917', '93', '0,1,8,93,', '靖宇县', '917', '220622', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('918', '93', '0,1,8,93,', '长白朝鲜族自治县', '918', '220623', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('919', '93', '0,1,8,93,', '临江市', '919', '220681', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('92', '8', '0,1,8,', '通化市', '92', '220500', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('920', '94', '0,1,8,94,', '宁江区', '920', '220702', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('921', '94', '0,1,8,94,', '前郭尔罗斯蒙古族自治县', '921', '220721', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('922', '94', '0,1,8,94,', '长岭县', '922', '220722', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('923', '94', '0,1,8,94,', '乾安县', '923', '220723', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('924', '94', '0,1,8,94,', '扶余市', '924', '220781', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('925', '95', '0,1,8,95,', '洮北区', '925', '220802', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('926', '95', '0,1,8,95,', '镇赉县', '926', '220821', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('927', '95', '0,1,8,95,', '通榆县', '927', '220822', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('928', '95', '0,1,8,95,', '洮南市', '928', '220881', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('929', '95', '0,1,8,95,', '大安市', '929', '220882', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('93', '8', '0,1,8,', '白山市', '93', '220600', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('930', '96', '0,1,8,96,', '延吉市', '930', '222401', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('931', '96', '0,1,8,96,', '图们市', '931', '222402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('932', '96', '0,1,8,96,', '敦化市', '932', '222403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('933', '96', '0,1,8,96,', '珲春市', '933', '222404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('934', '96', '0,1,8,96,', '龙井市', '934', '222405', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('935', '96', '0,1,8,96,', '和龙市', '935', '222406', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('936', '96', '0,1,8,96,', '汪清县', '936', '222424', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('937', '96', '0,1,8,96,', '安图县', '937', '222426', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('938', '97', '0,1,9,97,', '道里区', '938', '230102', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('939', '97', '0,1,9,97,', '南岗区', '939', '230103', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('94', '8', '0,1,8,', '松原市', '94', '220700', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('940', '97', '0,1,9,97,', '道外区', '940', '230104', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('941', '97', '0,1,9,97,', '平房区', '941', '230108', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('942', '97', '0,1,9,97,', '松北区', '942', '230109', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('943', '97', '0,1,9,97,', '香坊区', '943', '230110', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('944', '97', '0,1,9,97,', '呼兰区', '944', '230111', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('945', '97', '0,1,9,97,', '阿城区', '945', '230112', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('946', '97', '0,1,9,97,', '依兰县', '946', '230123', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('947', '97', '0,1,9,97,', '方正县', '947', '230124', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('948', '97', '0,1,9,97,', '宾县', '948', '230125', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('949', '97', '0,1,9,97,', '巴彦县', '949', '230126', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('95', '8', '0,1,8,', '白城市', '95', '220800', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('950', '97', '0,1,9,97,', '木兰县', '950', '230127', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('951', '97', '0,1,9,97,', '通河县', '951', '230128', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('952', '97', '0,1,9,97,', '延寿县', '952', '230129', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('953', '97', '0,1,9,97,', '双城市', '953', '230182', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('954', '97', '0,1,9,97,', '尚志市', '954', '230183', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('955', '97', '0,1,9,97,', '五常市', '955', '230184', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('956', '98', '0,1,9,98,', '龙沙区', '956', '230202', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('957', '98', '0,1,9,98,', '建华区', '957', '230203', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('958', '98', '0,1,9,98,', '铁锋区', '958', '230204', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('959', '98', '0,1,9,98,', '昂昂溪区', '959', '230205', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('96', '8', '0,1,8,', '延边朝鲜族自治州', '96', '222400', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('960', '98', '0,1,9,98,', '富拉尔基区', '960', '230206', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('961', '98', '0,1,9,98,', '碾子山区', '961', '230207', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('962', '98', '0,1,9,98,', '梅里斯达斡尔族区', '962', '230208', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('963', '98', '0,1,9,98,', '龙江县', '963', '230221', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('964', '98', '0,1,9,98,', '依安县', '964', '230223', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('965', '98', '0,1,9,98,', '泰来县', '965', '230224', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('966', '98', '0,1,9,98,', '甘南县', '966', '230225', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('967', '98', '0,1,9,98,', '富裕县', '967', '230227', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('968', '98', '0,1,9,98,', '克山县', '968', '230229', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('969', '98', '0,1,9,98,', '克东县', '969', '230230', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('97', '9', '0,1,9,', '哈尔滨市', '97', '230100', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('970', '98', '0,1,9,98,', '拜泉县', '970', '230231', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('971', '98', '0,1,9,98,', '讷河市', '971', '230281', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('972', '99', '0,1,9,99,', '鸡冠区', '972', '230302', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('973', '99', '0,1,9,99,', '恒山区', '973', '230303', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('974', '99', '0,1,9,99,', '滴道区', '974', '230304', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('975', '99', '0,1,9,99,', '梨树区', '975', '230305', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('976', '99', '0,1,9,99,', '城子河区', '976', '230306', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('977', '99', '0,1,9,99,', '麻山区', '977', '230307', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('978', '99', '0,1,9,99,', '鸡东县', '978', '230321', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('979', '99', '0,1,9,99,', '虎林市', '979', '230381', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('98', '9', '0,1,9,', '齐齐哈尔市', '98', '230200', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('980', '99', '0,1,9,99,', '密山市', '980', '230382', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('981', '100', '0,1,9,100,', '向阳区', '981', '230402', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('982', '100', '0,1,9,100,', '工农区', '982', '230403', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('983', '100', '0,1,9,100,', '南山区', '983', '230404', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('984', '100', '0,1,9,100,', '兴安区', '984', '230405', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('985', '100', '0,1,9,100,', '东山区', '985', '230406', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('986', '100', '0,1,9,100,', '兴山区', '986', '230407', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('987', '100', '0,1,9,100,', '萝北县', '987', '230421', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('988', '100', '0,1,9,100,', '绥滨县', '988', '230422', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('989', '101', '0,1,9,101,', '尖山区', '989', '230502', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('99', '9', '0,1,9,', '鸡西市', '99', '230300', '3', '1', '2017-11-10 15:35:19', '1', '2017-11-10 15:35:19', '', '0');
INSERT INTO `sys_area` VALUES ('990', '101', '0,1,9,101,', '岭东区', '990', '230503', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('991', '101', '0,1,9,101,', '四方台区', '991', '230505', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('992', '101', '0,1,9,101,', '宝山区', '992', '230506', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('993', '101', '0,1,9,101,', '集贤县', '993', '230521', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('994', '101', '0,1,9,101,', '友谊县', '994', '230522', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('995', '101', '0,1,9,101,', '宝清县', '995', '230523', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('996', '101', '0,1,9,101,', '饶河县', '996', '230524', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('997', '102', '0,1,9,102,', '萨尔图区', '997', '230602', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('998', '102', '0,1,9,102,', '龙凤区', '998', '230603', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');
INSERT INTO `sys_area` VALUES ('999', '102', '0,1,9,102,', '让胡路区', '999', '230604', '4', '1', '2017-11-10 16:46:36', '1', '2017-11-10 16:46:36', '', '1');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0dc4f6e4acb04af3ab58cb511d18d4fc', 'G', '信息传输、计算机服务和软件业', 'sys_industry', '行业', '7', '0', 's1', '2017-11-16 15:37:05', 's1', '2017-11-16 15:37:05', '', '0');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('11c91be94e44449891f1e953a3656c66', 'T', '国际组织', 'sys_industry', '行业', '20', '0', 's1', '2017-11-16 15:43:50', 's1', '2017-11-16 15:43:50', '', '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('16', 'cosmo', '黑色主题', 'theme', '主题方案', '60', '0', 's1', '2013-05-27 00:00:00', 's1', '2017-11-13 15:02:21', '', '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('17917b9d0e7e46cf995d31872ae4e7a6', 'M', '科学研究、技术服务和地质勘杳业', 'sys_industry', '行业', '13', '0', 's1', '2017-11-16 15:41:38', 's1', '2017-11-16 15:41:38', '', '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('205e55a46205458181c454dc7802c512', 'N', '水利、环境和公共设施管理业', 'sys_industry', '行业', '14', '0', 's1', '2017-11-16 15:41:51', 's1', '2017-11-16 15:41:55', '', '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '机构', 'sys_office_type', '机构类型', '60', '0', 's1', '2013-05-27 00:00:00', 's1', '2017-11-14 09:39:27', '', '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('33e5098f924347789bfdaf1f71926d6b', 'K', '房地产业', 'sys_industry', '行业', '11', '0', 's1', '2017-11-16 15:37:54', 's1', '2017-11-16 15:37:54', '', '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('3bf4d2d4ebd542a8b9aef9c3e7b0df70', 'E', '建筑业', 'sys_industry', '行业', '5', '0', 's1', '2017-11-16 15:36:09', 's1', '2017-11-16 15:36:32', '', '0');
INSERT INTO `sys_dict` VALUES ('3f1648a4d1184e7fbfdc7bc8d4a5f9b5', 'P', '教育', 'sys_industry', '行业', '16', '0', 's1', '2017-11-16 15:42:37', 's1', '2017-11-16 15:42:37', '', '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '经理', 'sys_user_type', '用户类型', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2017-11-10 15:40:03', '', '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('46d97769c9f54beeb4edad61927d2a5c', 'J', '金融业', 'sys_industry', '行业', '10', '0', 's1', '2017-11-16 15:37:42', 's1', '2017-11-16 15:37:42', '', '0');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('5510cb5f17fe45e4b577e4b581e2174e', 'F', '交通运输、仓储和邮政业', 'sys_industry', '行业', '6', '0', 's1', '2017-11-16 15:36:26', 's1', '2017-11-16 15:38:59', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', 's1', '2013-06-03 00:00:00', 's1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', 's1', '2013-06-03 00:00:00', 's1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('77ff9dccac914e64be20990352ede235', 'A', '农、林、牧、渔业', 'sys_industry', '行业', '1', '0', 's1', '2017-11-16 15:34:46', 's1', '2017-11-16 15:36:53', '', '0');
INSERT INTO `sys_dict` VALUES ('78d9708b2bef4bcb9856a6ead726fc8e', 'I', '住宿和餐饮业', 'sys_industry', '行业', '9', '0', 's1', '2017-11-16 15:37:30', 's1', '2017-11-16 15:37:30', '', '0');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('836a3173fa4a4a44b68da0923cab10c5', 'H', '批发和零售业', 'sys_industry', '行业', '8', '0', 's1', '2017-11-16 15:37:14', 's1', '2017-11-16 15:37:14', '', '0');
INSERT INTO `sys_dict` VALUES ('8bb8d8e64a3246f4b32b239e5574a1b0', 'S', '公共管理和社会组织', 'sys_industry', '行业', '19', '0', 's1', '2017-11-16 15:43:21', 's1', '2017-11-16 15:43:30', '', '0');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', 's1', '2013-10-28 00:00:00', 's1', '2013-10-28 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', 's1', '2013-10-28 00:00:00', 's1', '2013-10-28 00:00:00', '', '0');
INSERT INTO `sys_dict` VALUES ('98d0710f9f464fe99a1d178998ced617', 'C', '制造业', 'sys_industry', '行业', '3', '0', 's1', '2017-11-16 15:35:22', 's1', '2017-11-16 15:36:44', '', '0');
INSERT INTO `sys_dict` VALUES ('9e9796f9cf244dd9a1a5e8afaa72f198', 'R', '文化、体育和娱乐业', 'sys_industry', '行业', '18', '0', 's1', '2017-11-16 15:43:12', 's1', '2017-11-16 15:43:26', '', '0');
INSERT INTO `sys_dict` VALUES ('a08b491dac2149b4b10a9508d7d26855', 'L', '租赁和商务服务业', 'sys_industry', '行业', '12', '0', 's1', '2017-11-16 15:38:18', 's1', '2017-11-16 15:38:18', '', '0');
INSERT INTO `sys_dict` VALUES ('a130fca924ac469882e1713d5f1458cb', 'D', '电力、燃气及水的生产和供应业', 'sys_industry', '行业', '4', '0', 's1', '2017-11-16 15:35:49', 's1', '2017-11-16 15:36:38', '', '0');
INSERT INTO `sys_dict` VALUES ('bfc788932181473695701cf01bbdbe80', 'Q', '卫生、社会保幢和社会福利业', 'sys_industry', '行业', '17', '0', 's1', '2017-11-16 15:42:53', 's1', '2017-11-16 15:42:53', '', '0');
INSERT INTO `sys_dict` VALUES ('db277b98d6c0467f99f7028b84459de5', 'B', '采矿业', 'sys_industry', '行业', '2', '0', 's1', '2017-11-16 15:35:10', 's1', '2017-11-16 15:36:48', '', '0');
INSERT INTO `sys_dict` VALUES ('e445544baed04739b0b450bb49551b61', 'O', '居民服务和其他服务业', 'sys_industry', '行业', '15', '0', 's1', '2017-11-16 15:42:12', 's1', '2017-11-16 15:42:12', '', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mdict
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('09c8e6cd58a84672942e4cd54f8ee81c', 'f30512d237974af381cd6a9f73e29bd3', '0,1,2,13,f30512d237974af381cd6a9f73e29bd3,', '修改', '2', '', '', '', '0', 'sys:unit:edit', 's1', '2017-11-16 17:47:28', 's1', '2017-11-16 17:47:41', '', '0');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', '', 'th-list', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,2,3,10,', '查看', '30', '', '', '', '0', 'sys:dict:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,2,3,10,', '修改', '40', '', '', '', '0', 'sys:dict:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '21', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', '', 'th', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,2,13,14,', '查看', '1', '', '', '', '0', 'sys:area:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,2,13,14,', '修改', '2', '', '', '', '0', 'sys:area:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', '', 'th-large', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,2,13,17,', '查看', '1', '', '', '', '0', 'sys:office:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,2,13,17,', '修改', '2', '', '', '', '0', 'sys:office:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('1aa2bc96837f4b0eba477841727a7043', 'f30512d237974af381cd6a9f73e29bd3', '0,1,2,13,f30512d237974af381cd6a9f73e29bd3,', '查看', '1', '', '', '', '0', 'sys:unit:view', 's1', '2017-11-16 17:47:08', 's1', '2017-11-16 17:47:08', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '2', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', '', 'user', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,2,13,20,', '查看', '1', '', '', '', '0', 'sys:user:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,2,13,20,', '修改', '2', '', '', '', '0', 'sys:user:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '1', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-17 16:09:05', '', '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '11', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 11:26:34', '', '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '1', '/sys/user/info', '', 'user', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 11:08:20', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '22', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '2', '/sys/user/modifyPwd', '', 'lock', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 11:17:19', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', '', 'list-alt', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,2,3,4,', '查看', '30', '', '', '', '0', 'sys:menu:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('56', '71', '0,1,27,71,', '文件管理', '1', '/../static/ckfinder/ckfinder.html', '', 'folder-open', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '1', '', '', '', '0', 'cms:ckfinder:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '2', '', '', '', '0', 'cms:ckfinder:upload', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '3', '', '', '', '0', 'cms:ckfinder:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,2,3,4,', '修改', '40', '', '', '', '0', 'sys:menu:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '23', '', '', '', '1', '', 's1', '2013-06-03 00:00:00', 's1', '2017-11-15 10:44:15', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', '', 'pencil', '1', 'sys:log:view', 's1', '2013-06-03 00:00:00', 's1', '2013-06-03 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', '', 'lock', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('71', '27', '0,1,27,', '文件管理', '12', '', '', '', '1', '', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('79', '1', '0,1,', '代码生成', '3', '', '', '', '1', '', 's1', '2013-10-16 00:00:00', 's1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,2,3,7,', '查看', '30', '', '', '', '0', 'sys:role:view', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('80', '79', '0,1,79,', '代码生成', '31', '', '', '', '1', '', 's1', '2013-10-16 00:00:00', 's1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('81', '80', '0,1,79,80,', '生成方案配置', '312', '/gen/genScheme', '', '', '1', 'gen:genScheme:view,gen:genScheme:edit', 's1', '2013-10-16 00:00:00', 's1', '2017-11-16 17:53:53', '', '0');
INSERT INTO `sys_menu` VALUES ('82', '80', '0,1,79,80,', '业务表配置', '311', '/gen/genTable', '', '', '1', 'gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit', 's1', '2013-10-16 00:00:00', 's1', '2013-10-16 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,2,3,7,', '修改', '40', '', '', '', '0', 'sys:role:edit', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_menu` VALUES ('f30512d237974af381cd6a9f73e29bd3', '13', '0,1,2,13,', '单位管理', '60', '/sys/unit', '', 'hospital', '1', '', 's1', '2017-11-16 17:46:31', 's1', '2017-11-16 17:46:31', '', '0');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '消防总局', '10', '276', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 15:51:40', '', '0');
INSERT INTO `sys_office` VALUES ('10', '7', '0,1,7,', '市场部', '30', '276', '200003', '2', '2', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('11', '7', '0,1,7,', '技术部', '40', '276', '200004', '2', '2', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('12', '7', '0,1,7,', '武侯区分公司', '0', '276', '201000', '1', '3', '', '', '', '', '', '', '1', '', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 15:50:58', '', '0');
INSERT INTO `sys_office` VALUES ('13', '12', '0,1,7,12,', '公司领导', '10', '276', '201001', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('14', '12', '0,1,7,12,', '综合部', '20', '276', '201002', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('15', '12', '0,1,7,12,', '市场部', '30', '276', '201003', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('16', '12', '0,1,7,12,', '技术部', '40', '276', '201004', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('17', '7', '0,1,7,', '历下区分公司', '40', '276', '201010', '1', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_office` VALUES ('18', '17', '0,1,7,17,', '公司领导', '10', '276', '201011', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_office` VALUES ('19', '17', '0,1,7,17,', '综合部', '20', '276', '201012', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '276', '100001', '2', '1', '', '', '', '', '', '', '1', '', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 15:47:54', '', '0');
INSERT INTO `sys_office` VALUES ('20', '17', '0,1,7,17,', '市场部', '30', '276', '201013', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_office` VALUES ('21', '17', '0,1,7,17,', '技术部', '40', '276', '201014', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '1');
INSERT INTO `sys_office` VALUES ('22', '7', '0,1,7,', '高新区分公司', '50', '276', '201010', '1', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('23', '22', '0,1,7,22,', '公司领导', '10', '276', '201011', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('24', '22', '0,1,7,22,', '综合部', '20', '276', '201012', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('25', '22', '0,1,7,22,', '市场部', '30', '276', '201013', '2', '3', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('26', '22', '0,1,7,22,', '技术部', '40', '276', '201014', '2', '3', '', '', '', '', '', '', '1', '', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-17 18:03:20', '', '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '综合部', '20', '276', '100002', '2', '1', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '276', '100003', '2', '1', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('4fa3507266404a8fa249ced7b8574b99', '26', '0,1,7,22,26,', '技术一组', '30', '276', '201014001', '3', '1', '', '', '', '', '', '', '1', '', '', 's1', '2017-11-16 13:40:27', 's1', '2017-11-16 13:40:27', '', '1');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '276', '100004', '2', '1', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '276', '100005', '2', '1', '', '', '', '', '', '', '1', '', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 15:49:09', '', '0');
INSERT INTO `sys_office` VALUES ('7', '1', '0,1,', '成都市分公司', '20', '276', '200000', '1', '2', '', '', '', '', '', '', '1', '', '', 's1', '2013-05-27 00:00:00', 's1', '2017-11-17 18:03:10', '', '0');
INSERT INTO `sys_office` VALUES ('8', '7', '0,1,7,', '公司领导', '10', '276', '200001', '2', '2', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('9', '7', '0,1,7,', '综合部', '20', '276', '200002', '2', '2', '', '', '', '', '', '', '1', null, null, 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_office` VALUES ('f8d6ad1b24d94cf6ae75360dc651c6a5', '1', '0,1,', 'test', '30', '276', '100000007', '2', '1', '', '', '', '', '', '', '1', '', '', 's1', '2017-11-17 17:52:05', 's1', '2017-11-17 17:52:05', '', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '2', '系统管理员', 'dept', 'assignment', '1', '1', '1', 's1', '2013-05-27 00:00:00', 's1', '2017-11-16 17:51:50', '', '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'hr', 'assignment', '2', null, '1', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'd', 'assignment', '8', null, '1', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '', '0');
INSERT INTO `sys_role` VALUES ('7', '2', '济南市管理员', 'e', 'assignment', '9', '1', '1', 's1', '2013-05-27 00:00:00', 's1', '2017-11-15 15:44:15', '', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '09c8e6cd58a84672942e4cd54f8ee81c');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '1aa2bc96837f4b0eba477841727a7043');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '56');
INSERT INTO `sys_role_menu` VALUES ('1', '57');
INSERT INTO `sys_role_menu` VALUES ('1', '58');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '67');
INSERT INTO `sys_role_menu` VALUES ('1', '68');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '71');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '80');
INSERT INTO `sys_role_menu` VALUES ('1', '81');
INSERT INTO `sys_role_menu` VALUES ('1', '82');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', 'f30512d237974af381cd6a9f73e29bd3');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '11');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '15');
INSERT INTO `sys_role_menu` VALUES ('2', '16');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '18');
INSERT INTO `sys_role_menu` VALUES ('2', '19');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '21');
INSERT INTO `sys_role_menu` VALUES ('2', '22');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '56');
INSERT INTO `sys_role_menu` VALUES ('2', '57');
INSERT INTO `sys_role_menu` VALUES ('2', '58');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '67');
INSERT INTO `sys_role_menu` VALUES ('2', '68');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '79');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '80');
INSERT INTO `sys_role_menu` VALUES ('2', '81');
INSERT INTO `sys_role_menu` VALUES ('2', '82');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('7', '1');
INSERT INTO `sys_role_menu` VALUES ('7', '10');
INSERT INTO `sys_role_menu` VALUES ('7', '11');
INSERT INTO `sys_role_menu` VALUES ('7', '12');
INSERT INTO `sys_role_menu` VALUES ('7', '13');
INSERT INTO `sys_role_menu` VALUES ('7', '14');
INSERT INTO `sys_role_menu` VALUES ('7', '15');
INSERT INTO `sys_role_menu` VALUES ('7', '16');
INSERT INTO `sys_role_menu` VALUES ('7', '17');
INSERT INTO `sys_role_menu` VALUES ('7', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '19');
INSERT INTO `sys_role_menu` VALUES ('7', '2');
INSERT INTO `sys_role_menu` VALUES ('7', '20');
INSERT INTO `sys_role_menu` VALUES ('7', '21');
INSERT INTO `sys_role_menu` VALUES ('7', '22');
INSERT INTO `sys_role_menu` VALUES ('7', '27');
INSERT INTO `sys_role_menu` VALUES ('7', '28');
INSERT INTO `sys_role_menu` VALUES ('7', '29');
INSERT INTO `sys_role_menu` VALUES ('7', '3');
INSERT INTO `sys_role_menu` VALUES ('7', '30');
INSERT INTO `sys_role_menu` VALUES ('7', '4');
INSERT INTO `sys_role_menu` VALUES ('7', '5');
INSERT INTO `sys_role_menu` VALUES ('7', '56');
INSERT INTO `sys_role_menu` VALUES ('7', '57');
INSERT INTO `sys_role_menu` VALUES ('7', '58');
INSERT INTO `sys_role_menu` VALUES ('7', '59');
INSERT INTO `sys_role_menu` VALUES ('7', '6');
INSERT INTO `sys_role_menu` VALUES ('7', '67');
INSERT INTO `sys_role_menu` VALUES ('7', '68');
INSERT INTO `sys_role_menu` VALUES ('7', '7');
INSERT INTO `sys_role_menu` VALUES ('7', '71');
INSERT INTO `sys_role_menu` VALUES ('7', '8');
INSERT INTO `sys_role_menu` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for sys_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `longitude` double(20,6) DEFAULT NULL COMMENT '经度',
  `latitude` double(20,6) DEFAULT NULL COMMENT '纬度',
  `point` varchar(100) DEFAULT NULL COMMENT '经纬度',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `usable` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `industry` varchar(64) DEFAULT NULL COMMENT '所属行业',
  `office_id` varchar(64) DEFAULT NULL COMMENT '所属机构',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单位表';

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES ('1', '', '0,', '航利集团', '10', '276', '100000', '四川省成都市', null, null, null, '', '', '', '', '', '1', 'A', '1', 's1', '2013-05-27 00:00:00', 's1', '2017-11-17 17:38:46', '', '0');
INSERT INTO `sys_unit` VALUES ('41433e9c1d984ab3ae8779a9e60198b0', '1', '0,1,', '航利中心', '30', '276', '100000001', '', null, null, null, '', '', '', '', '', '1', 'E', '1', 's1', '2017-11-17 17:57:39', 's1', '2017-11-23 13:49:52', '', '0');
INSERT INTO `sys_unit` VALUES ('499beb5ddd8e4a1abb99421501cc28e9', '1', '0,1,', '二栋', '30', '276', '100000003', '', null, null, null, '', '', '', '', '', '1', 'E', '1', 's1', '2017-11-17 18:02:56', 's1', '2017-11-23 13:50:03', '', '0');
INSERT INTO `sys_unit` VALUES ('6705651be7234fb484a3c4107ccc8c8c', '1', '0,1,', '一栋', '30', '276', '100000002', '', null, null, null, '', '', '', '', '', '1', 'E', '1', 's1', '2017-11-17 17:59:43', 's1', '2017-11-23 13:49:58', '', '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('0ebe1f3872204169958002b5ba065dcc', '7', '2', '0001', 'ff3ca22d328da199b16164ae1d9b4b18acb52b3df4d63d7b9fe497ab', '0001', '六三', '', '', '', '2', '', '0:0:0:0:0:0:0:1', '2017-11-15 15:44:26', '1', 's1', '2017-11-15 15:43:01', 's1', '2017-11-15 15:43:14', '', '0');
INSERT INTO `sys_user` VALUES ('s1', '1', '2', 'admin', '02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032', '0001', '系统管理员', 'admin@163.com', '8675', '8675', '', null, '0:0:0:0:0:0:0:1', '2017-11-23 13:55:54', '1', 's1', '2013-05-27 00:00:00', 's1', '2013-05-27 00:00:00', '最高管理员', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('0ebe1f3872204169958002b5ba065dcc', '7');
INSERT INTO `sys_user_role` VALUES ('s1', '1');
INSERT INTO `sys_user_role` VALUES ('s1', '2');
