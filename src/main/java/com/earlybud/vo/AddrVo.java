package com.earlybud.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AddrVo {
	private String zipNo;
	private String addrDetail;
	private String roadAddrPart1;
	private String roadFullAddr;
}
