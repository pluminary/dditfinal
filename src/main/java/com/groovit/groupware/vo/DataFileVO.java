package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DataFileVO {
	private String dfNo;
	private String dfFilePath;
	private Date dfUldDt;
	private String dfOrgnlFileNm;
	private String dfChgFileNm;
	private int dfFileSz;
	private String dfFileStts;
	private String empId;
	private String dfExtn;
	private String fdNo;
	private String drNo;
}
