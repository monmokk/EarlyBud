package com.earlybud.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.earlybud.item.service.ItemService;
import com.earlybud.model.Notice;
import com.earlybud.model.Reply;
import com.earlybud.vo.RewardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@RequestMapping(value = "category")
//@RequestMapping("/category/*")   
@AllArgsConstructor
public class ItemController {
   
   private ItemService service;


	@RequestMapping(value="reward", method=RequestMethod.GET)
	public ModelAndView reward(@RequestParam("item_code") Long item_code, HttpServletRequest request) {
		String reply = (String)request.getParameter("reply");
		System.out.println("하용");
		
		RewardVO listOne= service.get(item_code);
		String view = "category/item2";
		System.out.println("하용2");
		
	//	List<Notice> listNotice = service_Notice.listService(item_code);
	//	List<Reply> listReply = service_Reply.listService(item_code);	//댓글리스트 만들기
		Date date = new Date();
		if (date.getTime()<listOne.getOPENDATE().getTime()){
			listOne.setTIME("999");			
		}
		Long likes = service.countLikeService(item_code);
			
		ModelAndView mv = new ModelAndView(view, "item", listOne);
		mv.addObject("item_code", item_code);
		mv.addObject("reply", reply);	//최초로딩시 상세설명탭에 위치하기 위해서 반드시 null값을 보내야함
	//	mv.addObject("list_reply", listReply);
		mv.addObject("likes", likes);
		System.out.println("하용~객체내용"+listOne);
		return mv;
	}
	
	
	@RequestMapping(value="reward/encore", method=RequestMethod.POST)
	public @ResponseBody String encore(@RequestBody Map<String, Object> params) {
		
		String email = (String) params.get("em");
		String item_code = (String) params.get("itemcode");
		
		System.out.println("em은 "+email);
		System.out.println("카테고리코드는 "+item_code);
	
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("item_code", item_code);
		String enc_check = service.encoreCheckService(map);
		
		System.out.println("앵콜체크는 "+enc_check);
		if (enc_check == null) {			
			System.out.println("앵콜체크는 1임. 승인");
			
			if(service.encoreInsertService(map) & service.encoreAddItemService(map)){
				System.out.println("승인완료");
				enc_check = "1";	
			}
		}else {
			System.out.println("앵콜체크는 0임. "+enc_check);
			enc_check = "0";
			
		}
		
		return enc_check;
	}
	@RequestMapping(value="reward/like", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> likes(@RequestBody Map<String, Object> params) {
		
		String email = (String) params.get("em");
		String item_code = (String) params.get("itemcode");
		
		System.out.println("em은 "+email);
		System.out.println("카테고리코드는 "+item_code);
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("item_code", item_code);
		
		String like_check = Long.toString(service.likeCheckService(map));

		System.out.println("like체크는 "+like_check);
		if (like_check.equals("0")) {			
			System.out.println("like체크는 0임. 관심추가");			
			if(service.likeAddService(map)){
				System.out.println("관심추가완료");
				like_check = "1";	
			}
		}else {			
			System.out.println("like체크는 1임. 관심취소");
			if(service.likeDelService(map)){
				System.out.println("관심제외완료");
				like_check = "0";
			}			
		}
		Long count = service.countLikeService(Long.parseLong(item_code));
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("likecheck", like_check);
		map2.put("count", count);
		
		
		return map2;
	}

}

