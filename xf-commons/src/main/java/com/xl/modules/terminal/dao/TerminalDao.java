/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.terminal.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.terminal.entity.Terminal;

/**
 * 消防终端DAO接口
 * @author dingrenxin
 * @version 2019-04-24
 */
@Mapper
public interface TerminalDao extends CrudDao<Terminal> {
	
}