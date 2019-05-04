package com.earlybud.vo;

import java.sql.Date;

import lombok.Data;

@Data 
public class MessageListVO {
	private String MESSAGE_CODE;
	private String ITEM_CODE;
	private String RECEIVER;
	private String SENDER;
	private String CONTENT;
	private Date SEND_DATE;
	private String READ_CHECK;
}
