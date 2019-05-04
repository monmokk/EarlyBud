package com.earlybud.model;

import java.sql.Date;
import org.springframework.stereotype.Component;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data //롬복으로 getter,setter자동셋팅하기 위해서
@Component
public class Notice {
	private long NOTICE_CODE;/*공지번호*/
	private long ITEM_CODE;/*해당 아이템코드 외래키*/
	private String TITLE;/*공지제목*/
	private String CONTENT; /*공지내용*/
	private Date WRITEDATE;/*작성날짜*/
	private Date NEWDATE; /*수정날짜*/
	private String EMAIL; /*판매자이메일*/
	//////////////////////////////////////////////
	
}