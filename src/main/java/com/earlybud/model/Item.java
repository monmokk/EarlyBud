package com.earlybud.model;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data //롬복으로 getter,setter자동셋팅하기 위해서
@Component
public class Item {
  private long item_code;
  private long cat_code;
  private String title;
  private String summary;
  private String content;
  private String main_image;
  //private String image_item;
  private long target_sum; //목표금액
  private long cur_sum;
  private Date opendate;
  private Date closingdate;
  private int admincall;
  private int success;
  private long view_count; 
  private long encore_num;
  private long encore;
  //private long encore_time;
  private String email;
  private String cat_name;
}