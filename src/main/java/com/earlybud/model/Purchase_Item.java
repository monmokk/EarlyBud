package com.earlybud.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Purchase_Item {
	private String merchant_uid;//결제예약에 필요
	private String customer_uid;//빌링키 발급에 필요
	private String email;//멤버테이블과 연결
	private long item_code;
	private long type_code;//상품타입테이블과 연결
	private long price;
	private Date pur_date;//구매한 날
	private String cancel;
	private String invoice;//송장번호
	private String pur_state;//발송관련 상태
	private String imp_uid;//결제후 발급됨
}
