package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class YearlyVacationVO {
	private String yrycNo;
	private int yrycCount;
	private String empId;
	private String yrycTy;
	private Date yrycRegDt;
}
