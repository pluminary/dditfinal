package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AttendanceVO {
	private int attnNo;
	private String empId;
	private Date attnBgng;
	private Date attnEnd;
	private String attnStts;
	private Date attnFrstRegDt; 
	private Date attnLastRegDt;
}
