package com.earlybud.model;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Member {
	private String email;
	private String pwd;
	private String nickname;
	private String phone;
	private String addr;
	private String detail_addr;
	private Date joindate;
	private Date dropdate;
	private List<Authorities> authList;
}
