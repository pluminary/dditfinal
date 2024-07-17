package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MailReceiver {
	private String mlRcvr;
	private String mlSn;
	private String mlStts;
	private Date mlRDt;
}
