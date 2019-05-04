package com.earlybud.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {	//페이지처리. criteria는 '검색의 기준'을 의미함.

  private int pageNum;
  private int amount;
  
 // private String type;
 // private String keyword;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;
    this.amount = amount;
  }
  
 /* public String[] getTypeArr() {
    
    return type == null? new String[] {}: type.split("");
  }*/
}
