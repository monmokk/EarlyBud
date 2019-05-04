package com.earlybud.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type {
	private long type_code;
	private long item_code;
	private String name;
	private String info;
	private long price;
	private long pur_num;
}
