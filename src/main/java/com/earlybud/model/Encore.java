package com.earlybud.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Encore {
	private long encore_code;
	private long item_code;
	private int encore_master;
	private int encore_seller;
	private long newitem_code;
}
