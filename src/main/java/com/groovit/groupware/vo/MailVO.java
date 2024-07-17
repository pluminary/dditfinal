package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MailVO {
	private String mlSn;
	private String mlTtl;
	private String mlCn;
	private Date mlSndngYmd;
	private String mlIptYn;
	private String atchfileSn;
}
