SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Indexes */

DROP INDEX sys_office_del_flag ON sys_unit;



/* Drop Tables */

DROP TABLE IF EXISTS sys_building_floor;
DROP TABLE IF EXISTS sys_building;
DROP TABLE IF EXISTS sys_unit;




/* Create Tables */

CREATE TABLE sys_building
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	name varchar(255),
	-- 编号
	unit_id varchar(64) NOT NULL COMMENT '编号',
	building_no varchar(64),
	-- 纬度
	latitude double(20,6) COMMENT '纬度',
	-- 经度
	longitude double(20,6) COMMENT '经度',
	-- 经纬度
	point varchar(100) COMMENT '经纬度',
	floor_num int,
	plane_img varbinary(400),
	elevators_num int,
	stair_num int,
	video_url varbinary(5000),
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 删除标记
	del_flag char COMMENT '删除标记',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	PRIMARY KEY (id)
);


CREATE TABLE sys_building_floor
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 编号
	building_id varchar(64) NOT NULL COMMENT '编号',
	floor_no varbinary(20),
	plane_img varbinary(400),
	video_url varbinary(5000),
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 删除标记
	del_flag char COMMENT '删除标记',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	PRIMARY KEY (id)
);


CREATE TABLE sys_unit
(
	-- 编号
	id varchar(64) NOT NULL COMMENT '编号',
	-- 父级编号
	parent_id varchar(64) NOT NULL COMMENT '父级编号',
	-- 所有父级编号
	parent_ids varchar(2000) NOT NULL COMMENT '所有父级编号',
	-- 安防类型
	security_type varchar(1) COMMENT '安防类型',
	-- 名称
	name varchar(100) NOT NULL COMMENT '名称',
	-- 排序
	sort decimal NOT NULL COMMENT '排序',
	-- 归属区域
	area_id varchar(64) NOT NULL COMMENT '归属区域',
	-- 编码
	code varchar(100) COMMENT '编码',
	-- 联系地址
	address varchar(255) COMMENT '联系地址',
	-- 经度
	longitude double(20,6) COMMENT '经度',
	-- 纬度
	latitude double(20,6) COMMENT '纬度',
	-- 经纬度
	point varchar(100) COMMENT '经纬度',
	-- 邮政编码
	zip_code varchar(100) COMMENT '邮政编码',
	-- 负责人
	master varchar(100) COMMENT '负责人',
	-- 电话
	phone varchar(200) COMMENT '电话',
	-- 传真
	fax varchar(200) COMMENT '传真',
	-- 邮箱
	email varchar(200) COMMENT '邮箱',
	-- 是否启用
	usable varchar(64) COMMENT '是否启用',
	-- 所属行业
	industry varchar(64) COMMENT '所属行业',
	-- 安保电话
	security_phone varchar(255) COMMENT '安保电话',
	-- 安保负责人
	security_user varchar(100) COMMENT '安保负责人',
	-- 所属消防局机构
	office_id varchar(64) COMMENT '所属消防局机构',
	-- 所属街道办
	street_office_id varchar(64) COMMENT '所属街道办',
	-- 创建者
	create_by varchar(64) COMMENT '创建者',
	-- 创建时间
	create_date datetime COMMENT '创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者',
	-- 更新时间
	update_date datetime COMMENT '更新时间',
	-- 删除标记
	del_flag char COMMENT '删除标记',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息',
	PRIMARY KEY (id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;



/* Create Foreign Keys */

ALTER TABLE sys_building_floor
	ADD FOREIGN KEY (building_id)
	REFERENCES sys_building (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sys_building
	ADD FOREIGN KEY (unit_id)
	REFERENCES sys_unit (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Create Indexes */

CREATE INDEX sys_office_del_flag USING BTREE ON sys_unit ();



