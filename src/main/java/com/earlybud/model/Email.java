package com.earlybud.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Email {
	private String mailfrom;
	private String mailto;
	private String mailcc;
	private String mailbcc;
	private String mailsubject;
	private String mailcontent;
}
