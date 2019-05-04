package com.earlybud.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberLikeVO {
	private String MAIN_IMAGE;
	private String ITEM_CODE;
	private String EMAIL;
	private String TITLE;
	private String NICKNAME;
	private String CAT_NAME;
	private Long TARGET_SUM;
	private Long CUR_SUM;
	private String SUMMARY;
	private String TIME;
	private String IMAGE;
	private String INFO;
	private String PERCENT;
	private String NOW_SUM;
}
