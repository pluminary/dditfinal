package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private String ntcNo;
	private String ntcTtl;
	private String ntcCn;
	private String atchfileSn;
	private Date ntcFrstRegYmd;
	private Date ntcLastRegYmd;
	private String ntcFrstRgtr;
	private String ntcLastRgtr;
}
