package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DepartmentVO {
	private String deptCd;
	private String deptUpCd;
	private String deptNm;
	private String deptUseYn;
	private Date deptFrstRegDt;
	private String deptFrstRgtr;
	private Date deptLastRegDt;
	private String deptLastRgtr;
}
