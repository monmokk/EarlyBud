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
public class Reply {
	private long reply_code;/*고유키*/
	private String id;/*댓글 쓴 사람 아이디 외래키*/
	private String reply_content;/*댓글 내용*/
	private Date reply_date; /*댓글 올린 날짜*/
	private long product_code;/*상품코드 외래키*/
	private long reply_parent; /*댓글 부모 그룹키 3번댓글에 댓글달면 3임*/
	private long reply_order;/*댓글 순서1은 부모 2는 자식*/
}