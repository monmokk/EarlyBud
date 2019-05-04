package com.earlybud.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NarinHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NarinHomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/NarinHome", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "NarinEtc/NarinHome";
	}
	
	@RequestMapping(value = "like_list")
	   public String like_list() {
	      return "NarinEtc/like_list";
	   }
	
	@RequestMapping(value = "like_seller_each")
	   public String like_seller_each() {
	      return "NarinEtc/like_seller_each";
	   }
	
	@RequestMapping(value = "message22")
	   public String message() {
	      return "NarinEtc/message22";
	   }
	
	@RequestMapping(value = "order_list")
	   public String order_list() {
	      return "NarinEtc/order_list";
	   }
	
	@RequestMapping(value = "order_sheet_each")
	   public String order_sheet_each() {
	      return "NarinEtc/order_sheet_each";
	   }
	
	@RequestMapping(value = "airi")
	   public String airi() {
	      return "NarinEtc/airi";
	   }
	
	@RequestMapping(value = "airi_like")
	   public String airi_like() {
	      return "NarinEtc/airi_like";
	   }
	
	@RequestMapping(value = "seller_list")
	   public String seller_list() {
	      return "NarinEtc/seller_list";
	   }
	
	@RequestMapping(value = "seller_list2")
	   public String seller_list2() {
	      return "NarinEtc/seller_list2";
	   }
	
	@RequestMapping(value = "airi_seller_items")
	   public String airi_seller_items() {
	      return "NarinEtc/airi_seller_items";
	   }
	
	/**@RequestMapping(value = "airi_message")
	   public String airi_message() {
	      return "airi_message";
	   }*/
	
	@RequestMapping(value = "airi_orderlist")
	   public String airi_orderlist() {
	      return "NarinEtc/airi_orderlist";
	   }
	
   @RequestMapping(value = "airi_ordereach")
   public String airi_ordereach() {
      return "NarinEtc/airi_ordereach";
   }
   
   @RequestMapping(value = "message_test")
   public String message_test() {
      return "NarinEtc/message_test";
   }
}
