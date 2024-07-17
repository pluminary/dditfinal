package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SurveyVO {
	private String srvyNo;
	private String empId;
	private String srvyTtl;
	private String srvyCn;
	private Date srvyWrtYmd;
	private Date srvyBgngYmd;
	private Date srvyEndYmd;
}
