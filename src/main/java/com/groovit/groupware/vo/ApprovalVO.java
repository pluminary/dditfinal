package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ApprovalVO {
	private String aprvrDocNo;
	private String aprvrDocTtl;
	private String aprvrDocCn;
	private String atchfileSn;
	private String aprvrSttsCd;
	private String empId;
	private Date aprvrWrtYmd;
	private String atCd;
}
