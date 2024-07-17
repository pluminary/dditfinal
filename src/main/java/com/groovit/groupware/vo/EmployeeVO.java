package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class EmployeeVO {
	private String empId;
	private String empPass;
	private String empMng;
	private String atchfileSn;
	private String empStts;
	private String empNm;
	private String empMail;
	private String empEml;
	private String empTelno;
	private String empAddr;
	private String empDaddr;
	private Date empBrdt;
	private Date empJncmpYmd;
	private String deptCd;
	private String jbgdCd;
}
