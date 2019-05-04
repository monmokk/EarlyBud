package com.earlybud.vo;

import java.util.Date;

import lombok.Data;
import oracle.sql.DATE;

@Data //롬복으로 getter,setter자동셋팅하기 위해서
public class CategoryVO {

  private Long ITEM_CODE;
  private Long CAT_CODE;
  private String CAT_NAME;
  private String TITLE;
  private String SUMMARY;
  private String MAIN_IMAGE;
  private String IMAGE;	//판매자 프사
  private String NICKNAME;
  private String NOW_SUM;
  private String PERCENT;	//인기순 계산할때 필요
  private String SUCCESS;
  private Date CLOSINGDATE;	//마감임박순, 최신순 계산할때 필요함
  private String TIME;	//몇일남았는지
}
