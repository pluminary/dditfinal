package com.groovit.groupware.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.groovit.groupware.service.SalaryService;
import com.groovit.groupware.vo.SalaryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/salary")
@Controller
public class SalaryController {

	@Autowired
	SalaryService salaryService;
	
	@GetMapping("/list")
	public String salary(Model model) {
		log.info("리스트");
		
		SalaryVO salaryVO = this.salaryService.list(1);
		log.info("salaryVO: " + salaryVO);
		model.addAttribute("salaryVO",salaryVO);
		
		return "salary/PDF";
	}

	@ResponseBody
	@PostMapping("/ajax")
	public SalaryVO test(@RequestBody int month) {
		log.info("month: " + month);
		
		SalaryVO salaryVO = this.salaryService.list(month);
		log.info("salaryVO: " + salaryVO);
		
		return salaryVO;
	}
}
