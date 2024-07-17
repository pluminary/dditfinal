package com.groovit.groupware.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ObituaryVO {
	private String evtbNo;
	private String obtTtl;
	private Date obtDmDt;
	private Date obtFpDt;
	private String obtAddr;
	private String obtDaddr;
}
