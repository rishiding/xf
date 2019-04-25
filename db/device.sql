SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Indexes */

DROP INDEX sys_office_del_flag ON xf_device_check;



/* Drop Tables */

DROP TABLE IF EXISTS xf_device;
DROP TABLE IF EXISTS xf_device_check;
DROP TABLE IF EXISTS xf_terminal;




/* Create Tables */

-- 消防设施
CREATE TABLE xf_device
(
	-- 编号
	id varchar(64) NOT NULL COMMENT 'ID : 编号',
	-- 所属消防局机构
	office_id varchar(64) COMMENT '所属消防局机构 : 所属消防局机构',
	build_id varchar(64) COMMENT '消防建筑',
	device_id varchar(64) COMMENT '设施id',
	device_name varchar(60) COMMENT '消防设施名',
	device_type varchar(10) COMMENT '设施类型',
	note varchar(1000) COMMENT '事件描述',
	-- 1 未上报
	-- 2 已经上报
	status varchar(2) COMMENT '状态 : 1 未上报
2 已经上报',
	source varchar(10) COMMENT '数据来源',
	-- 创建者
	create_by varchar(64) COMMENT '创建者 : 创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间 : 创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者 : 更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间 : 更新时间',
	-- 删除标记
	del_flag char COMMENT '删除标记 : 删除标记',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息 : 备注信息',
	PRIMARY KEY (id)
) COMMENT = '消防设施';


-- 消防设施巡检
CREATE TABLE xf_device_check
(
	-- 编号
	id varchar(64) NOT NULL COMMENT 'ID : 编号',
	-- 名称
	sys_name varchar(100) NOT NULL COMMENT '系统名称 : 名称',
	build_id varchar(64) NOT NULL COMMENT '所属建筑',
	-- 所属消防局机构
	office_id varchar(64) COMMENT '所属消防局机构 : 所属消防局机构',
	check_date date COMMENT '巡检日期',
	check_by varchar(64) COMMENT '巡检人',
	check_type varchar(64) COMMENT '巡检类型',
	normal_num int COMMENT '正常设备数',
	error_num int COMMENT '异常设备数量',
	-- 0  未上报
	-- 1 已上报
	status char DEFAULT '''0''' COMMENT '状态 : 0  未上报
1 已上报',
	-- 创建者
	create_by varchar(64) COMMENT '创建者 : 创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间 : 创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者 : 更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间 : 更新时间',
	-- 删除标记
	del_flag char COMMENT '删除标记 : 删除标记',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息 : 备注信息',
	PRIMARY KEY (id)
) COMMENT = '消防设施巡检' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- 消防终端
CREATE TABLE xf_terminal
(
	-- 编号
	id varchar(64) NOT NULL COMMENT 'ID : 编号',
	ieme varchar(64) NOT NULL COMMENT '设备标识',
	-- 该值用于查询电话卡的卡号用于用户的充值
	ccid varchar(64) COMMENT 'ccid : 该值用于查询电话卡的卡号用于用户的充值',
	Longitude varchar(50) COMMENT '经度',
	Latitude varchar(50) COMMENT '纬度',
	name varchar(255) COMMENT '设备类型',
	-- 0 在线
	-- 1 不在线
	online varchar(1) DEFAULT '0' COMMENT '是否在线 : 0 在线
1 不在线',
	last_online_time timestamp COMMENT '最后一次在线时间',
	-- 创建者
	create_by varchar(64) COMMENT '创建者 : 创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间 : 创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者 : 更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间 : 更新时间',
	-- 删除标记
	del_flag char COMMENT '删除标记 : 删除标记',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息 : 备注信息',
	PRIMARY KEY (id)
) COMMENT = '消防终端';



/* Create Indexes */

CREATE INDEX sys_office_del_flag USING BTREE ON xf_device_check ();



