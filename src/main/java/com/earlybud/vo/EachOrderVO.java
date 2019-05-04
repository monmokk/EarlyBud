package com.earlybud.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EachOrderVO {
	private String nickname;
	private String cancel;
	private String title;
	private String name;
	private String price;
	private String del_name;
	private String del_phone;
	private String addr1;
	private String addr2;
	private String pur_state;
	private String merchant_uid;
	private String invoice;
}