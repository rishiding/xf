/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.operation.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.persistence.Page;
import com.xl.common.service.CrudService;
import com.xl.modules.operation.entity.Operation;
import com.xl.modules.operation.dao.OperationDao;

/**
 * 消防年月检Service
 * @author dingrenxin
 * @version 2019-06-04
 */
@Service
@Transactional(readOnly = true)
public class OperationService extends CrudService<OperationDao, Operation> {

	public Operation get(String id) {
		return super.get(id);
	}
	
	public List<Operation> findList(Operation operation) {
		return super.findList(operation);
	}
	
	public Page<Operation> findPage(Page<Operation> page, Operation operation) {
		return super.findPage(page, operation);
	}
	
	@Transactional(readOnly = false)
	public void save(Operation operation) {
		super.save(operation);
	}
	
	@Transactional(readOnly = false)
	public void delete(Operation operation) {
		super.delete(operation);
	}
	
}