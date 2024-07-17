package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LeaveVO {
	private int leNo;
	private String leMngCd;
	private String leCn;
	private Date leBgngYmd;
	private Date leEndYmd;
	private Date leFrstRegDt;
	private Date leLastRegDt;
	private String leAgent;
	private String empId;
	private String aprvrDocNo;
}
