/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.operation.dao;

import com.xl.common.persistence.CrudDao;
import org.apache.ibatis.annotations.Mapper;
import com.xl.modules.operation.entity.Operation;

/**
 * 消防年月检DAO接口
 * @author dingrenxin
 * @version 2019-06-04
 */
@Mapper
public interface OperationDao extends CrudDao<Operation> {
	
}