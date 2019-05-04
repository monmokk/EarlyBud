package com.earlybud.controller;

import static org.junit.Assert.assertThat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.earlybud.model.Item;
import com.earlybud.model.Member;
import com.earlybud.model.Seller;
import com.earlybud.payment.service.PaymentService;
import com.earlybud.project.service.NewProjectService;
import com.earlybud.security.CustomUserDetailsService;
import com.earlybud.vo.AddrVo;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/mypage/*")
public class MemberUploadController {
	@Setter(onMethod_ = { @Autowired } )
	private PaymentService payservice;
	@Autowired
	CustomUserDetailsService service;
	@Autowired
	NewProjectService projectS;
	@Autowired
	BCryptPasswordEncoder passwordencoder;
	@RequestMapping("mypage/modify")
	public String mypage(Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		System.out.println("컨트롤러 접속자: "+service.userDetail(email));
		model.addAttribute("user", service.userDetail(email));
		return "/mypage/myPageDetail";
	}
	@RequestMapping(value="juso")
	public String juso(@ModelAttribute("AddrVo") AddrVo addrvo) {
		return "payment/jusoPopup";
	}
	@RequestMapping("/memberUpload")
	public Member memberUpload(Member member, @RequestParam String nickname, @RequestParam("email") String email,
			@RequestParam("pwd") String pwd, @RequestParam("addr") String addr, @RequestParam("detail_addr") String detail_addr,
			@RequestParam("phone") String phone,String error, Model model)
		throws Exception{
		System.out.println(pwd);
		service.userDetail(email);
		String pp = payservice.pwdCheckService(nickname);
		System.out.println(pp);
		
		if(passwordencoder.matches(pwd, pp)) {
			System.out.println("비밀번호가 같다");
		}else {
			System.out.println("비밀번호 다르다");
			member.setPwd(pwd);
		}
		member.setEmail(member.getEmail());
		member.setAddr(addr);
		member.setDetail_addr(detail_addr);
		member.setPhone(phone);
		service.update(member);
		log.info("회원정보가 수정되었습니다. 회원명: "+member);
		return member;
	}
	@RequestMapping("sellerPage")
	public String sellerpage(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String email = authentication.getName();
		List<Item> item = projectS.sellerItem(email);
		List<Item> itemEdit = projectS.sellerEditItem(email);
		List<Item> itemEnd = projectS.sellerEndItem(email);
		List<Item> itemEncore = projectS.sellerEncoreItem(email);
		Seller seller = projectS.seller_select(email);
		System.out.println(seller);
		model.addAttribute("item", item);
		model.addAttribute("itemEdit",itemEdit);
		model.addAttribute("itemEnd",itemEnd);
		model.addAttribute("itemEncore", itemEncore);
		model.addAttribute("seller",seller);
		return "/mypage/sellerPage";
	}
}
