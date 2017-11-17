/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.common.persistence;

import java.util.List;

/**
 * DAO支持类实现
 * @author reshi
 * @version 2014-05-16
 * @param <T>
 */
public interface TreeDao<T extends TreeEntity<T>> extends CrudDao<T> {

	/**
	 * 找到所有子节点
	 * @param entity
	 * @return
	 */
	  List<T> findByParentIdsLike(T entity);

	/**
	 * 更新所有父节点字段
	 * @param entity
	 * @return
	 */
	  int updateParentIds(T entity);
	
}