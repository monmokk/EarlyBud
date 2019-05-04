package com.earlybud.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllOrdersVO {
	private String item_code;
	private String title;
	private String success;
	private String nickname;
	private String price;
	private String pur_date;
	private String merchant_uid;
//	private String TITLE;
//	private String SUCCESS;
//	private String NICKNAME;
//	private String PRICE;
//	private String PUR_DATE;
//	private String MERCHANT_UID;
}
