package com.earlybud.model;

import lombok.Data;

@Data
public class Category {
	private long CAT_CODE;
	private String CAT_NAME;
	public Category() {}
	public Category(long CAT_CODE, String CAT_NAME) {
		this.CAT_CODE = CAT_CODE;
		this.CAT_NAME = CAT_NAME;
	}

}
