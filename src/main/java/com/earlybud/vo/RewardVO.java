package com.earlybud.vo;

import java.util.Date;
import java.util.List;
import lombok.Data;
import com.earlybud.model.ItemOption;

@Data //롬복으로 getter,setter자동셋팅하기 위해서
public class RewardVO {
  
  private String TOTAL_PUR;	//총판매량
  private String CAT_CODE;
  private String CAT_NAME;
  private String TITLE;
  private String MAIN_IMAGE;
  private String NOW_SUM;
  private String PERCENT;
  private String TARGET;
  private String DEADLINE;
  private String CONTENT;
  private String IMAGE;	//판매자 프사
  private String EMAIL;	//판매자 이메일
  private String NICKNAME; //판매자 닉네임
  private String TIME; //남은시간 몇일인지//숫자로 받아서 0일경우(펀딩마감 당일일 경우) "오늘 자정까지" 라고 문구 띄우기, 마이너스면 끝난 펀딩이라고 띄우기 - 뷰단에서 처리
  private Date OPENDATE;
  private List<ItemOption> OptionList; 
  //select TYPE_CODE, ITEM_CODE, NAME, INFO, TO_CHAR(PRICE, '999,999,999'), PUR_NUM from TYPE where ITEM_CODE=4;

  public void show(){
	  System.out.println("item객체에 담긴 내용은 : "+ NOW_SUM);	  
	  System.out.println("item객체에 담긴 내용은 : "+ TOTAL_PUR);	 
	  System.out.println("item객체에 담긴 내용은 : "+ OptionList);	
	  System.out.println("item객체에 담긴 내용은 : "+ TIME);
  }


}


//private String TOTALMEMBER; //참여인원


//상품상세페이지에서 필요한 정보를 담아서 보내주는 껍데기

