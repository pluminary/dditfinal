package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalLineVO {
	private String alSn;
	private String alAutzrNm;
	private String aprvrDocNo;
	private int alSeq;
	private String alDcrdYn;
	private String alStts;
	private String alCm;
	private Date alCmptnYmd;
}
