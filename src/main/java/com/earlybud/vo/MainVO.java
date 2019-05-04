package com.earlybud.vo;

import java.util.Date;

import lombok.Data;

@Data //롬복으로 getter,setter자동셋팅하기 위해서
public class MainVO {

  private Long ITEM_CODE;
  private String TITLE;
  private String MAIN_IMAGE;
  private String SUMMARY;  
}
