package com.earlybud.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import com.earlybud.like.service.LikeSellerService;
import com.earlybud.like.service.LikeService;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
public class MypageController {
	
	private LikeService service;
	private LikeSellerService services;

	@RequestMapping(value = "mypage/{email:.+}", method = RequestMethod.GET)
	public String list(@PathVariable("email") String email, Model model) {
		log.info("list");
		model.addAttribute("list", service.getList(email));
		model.addAttribute("listS", services.getListS(email));
		System.out.println("컨트롤러에서 리스트 줌");

		return "mypage/mypage";
	}

	@RequestMapping(value = "seller_items/{email:.+}", method = RequestMethod.GET)
	   public String seller_items(@PathVariable("email") String email, Model model) {
		System.out.println("시작됨");
		log.info("/seller_items");
		System.out.println("시작됨2");
		model.addAttribute("OneList", service.getOneSellerList(email));
		System.out.println("시작됨3");
		System.out.println("한 판매자의 아이템 목록을 컨트롤러가 넘겨줌");
		return "mypage/seller_items";
	   }
	
	
	@RequestMapping(value = "member_orderlist")
	   public String member_orderlist() {
	      return "mypage/member_orderlist";
	   }
	
	@RequestMapping(value = "member_ordereach")
	   public String member_ordereach() {
	      return "mypage/member_ordereach";
	   }
	
	@RequestMapping(value="seller_items/like/{seller:.+}", method=RequestMethod.GET)
	   public String likes(@PathVariable("seller") String seller, Model model) throws Exception{
	      System.out.println("좋아요 조작하는 컨트롤러 들어옴!!!!!!!!");
	      //////////파라미터로 로그인한사람 이메일 안받아옴!!!!!!!!
	      System.out.println("판매자는 "+seller);
	      
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	      String email = authentication.getName();
	      //PrintWriter writer = response.getWriter();
	      
	      
	      if (email == null) {
	    	 return "login";
	      }else {
	    	  HashMap<String, Object> map = new HashMap<String, Object>();
		      map.put("email", email);
		      map.put("seller", seller);
		      
		      String like_check = Long.toString(service.likeCheckService(map));
		      System.out.println("like체크는 "+like_check);
		      if (like_check.equals("0")) {         
		        System.out.println("like체크는 0임. 관심추가");         
		        service.likeAddService(map);
	            System.out.println("관심추가완료");
	            like_check = "1";
	            String msg = "팔로우가 등록되었습니다.";
	            model.addAttribute("msg", msg);
	            System.out.println("msg 줬음");
	            String url = "../../seller_items/"+seller;
	            model.addAttribute("url", url);
	            System.out.println("url 줬음"+url);
	            return "mypage/redirect";
			  }else {         
		        System.out.println("like체크는 1임. 관심취소");
		        service.likeDelService(map);
	            System.out.println("관심제외완료");
	            like_check = "0";
	            String msg = "팔로우가 취소되었습니다.";
	           model.addAttribute("msg", msg);
	           System.out.println("msg 줬음");
	           String url = "../../seller_items/"+seller;
	            model.addAttribute("url", url);
	            System.out.println("url 줬음"+url);
	           return "mypage/redirect";
			  }
	      }
	   }
	
//	@RequestMapping(value="seller_items/like/{seller:.+}", method=RequestMethod.GET)
//	   public String likes(@PathVariable("seller") String seller, Model model) throws Exception{
//	      System.out.println("좋아요 조작하는 컨트롤러 들어옴!!!!!!!!");
//	      //////////파라미터로 로그인한사람 이메일 안받아옴!!!!!!!!
//	      System.out.println("판매자는 "+seller);
//	      
//	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//	      String email = authentication.getName();
//	      //PrintWriter writer = response.getWriter();
//	      
//	      
//	      if (email == null) {
//	    	 return "login";
//	      }else {
//	    	  HashMap<String, Object> map = new HashMap<String, Object>();
//		      map.put("email", email);
//		      map.put("seller", seller);
//		      
//		      String like_check = Long.toString(service.likeCheckService(map));
//		      System.out.println("like체크는 "+like_check);
//		      if (like_check.equals("0")) {         
//		        System.out.println("like체크는 0임. 관심추가");         
//		        service.likeAddService(map);
//	            System.out.println("관심추가완료");
//	            like_check = "1";
//	            model.addAttribute("msg", "팔로우 되었습니다.");
//	            //writer.println("<script>alert('팔로우 되었습니다');</script>");
//	           // writer.flush();
//	           // model.addAttribute("url", "seller_items/"+seller);
//	           return "redirect:/seller_items/"+seller;
//	            //return "redirect:";
//			  }else {         
//		        System.out.println("like체크는 1임. 관심취소");
//		        service.likeDelService(map);
//	            System.out.println("관심제외완료");
//	            like_check = "0";
//	           model.addAttribute("msg", "팔로우가 취소되었습니다.");
//	           // writer.println("<script>alert('팔로우가 취소되었습니다.');</script>");
//	          //  writer.flush();
//	           // model.addAttribute("url", "seller_items/"+seller);
//	           return "redirect:/seller_items/"+seller;
//	          // return "redirect:";
//			  }
//	      }
//	   }
	
	
}
