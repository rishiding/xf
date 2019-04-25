/**
 * Copyright &copy; 2017 <a href="#">xf</a> All rights reserved.
 */
package com.xl.modules.terminal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xl.common.persistence.Page;
import com.xl.common.service.CrudService;
import com.xl.modules.terminal.entity.Terminal;
import com.xl.modules.terminal.dao.TerminalDao;

/**
 * 消防终端Service
 * @author dingrenxin
 * @version 2019-04-24
 */
@Service
@Transactional(readOnly = true)
public class TerminalService extends CrudService<TerminalDao, Terminal> {

	public Terminal get(String id) {
		return super.get(id);
	}
	
	public List<Terminal> findList(Terminal terminal) {
		return super.findList(terminal);
	}
	
	public Page<Terminal> findPage(Page<Terminal> page, Terminal terminal) {
		return super.findPage(page, terminal);
	}
	
	@Transactional(readOnly = false)
	public void save(Terminal terminal) {
		super.save(terminal);
	}
	
	@Transactional(readOnly = false)
	public void delete(Terminal terminal) {
		super.delete(terminal);
	}
	
}