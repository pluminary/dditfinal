package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MeetingRoomRentVO {
	private String rentNo;
	private String mtgrNo;
	private String empId;
	private String rentStts;
	private Date rentBgng;
	private Date rentEnd;
	private String rentRsn;
}
