package com.earlybud.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Payment_Info {
	private String merchant_uid;//구매상품 테이블과 연결.
	//payment/input 에서 받아온 값들
	private String nickname;
	private String email;
	private String del_name;
	private String del_phone;
	private String zip_code;
	private String addr1;
	private String addr2;
	private String card_owner;
	private String cardnum;
	private String birthdate;
	private String pur_type;
	private String exp_month;
	private String exp_year;
	private String cardpwd;
	private long amount;
	private String schedule_at;
	private long type_code;
}
