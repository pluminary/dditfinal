package com.groovit.groupware.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.groovit.groupware.mapper.SalaryMapper;
import com.groovit.groupware.service.SalaryService;
import com.groovit.groupware.vo.SalaryVO;



@Service
public class SalaryServiceImpl implements SalaryService {
	
	@Autowired
	SalaryMapper salaryMapper;

	@Override
	public SalaryVO list(int month) {
		return this.salaryMapper.list(month);
	}
	
}
