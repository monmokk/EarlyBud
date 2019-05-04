package com.earlybud.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.earlybud.login.kakao.KakaoAccessToken;
import com.earlybud.login.kakao.KakaoUserInfo;
import com.earlybud.member.dao.MemberDAO;
import com.earlybud.model.Member;
import com.earlybud.security.CustomUserDetailsService;
import com.earlybud.security.model.EarlybudUser;
import com.fasterxml.jackson.databind.JsonNode;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
   @Autowired
   CustomUserDetailsService service;
   @GetMapping("/accessError")
   public void accessDenied(Authentication auth, Model model) {

      log.info("access Denied : " + auth);

      model.addAttribute("msg", "Access Denied");
   }

   @RequestMapping("/login")
   public String loginInput(HttpServletRequest request, String error, String logout, Model model, 
		   HttpSession session, Principal principal) {
	   if(principal != null) return "redirect:/";
	  log.info("LOGIN error: " + error);
      log.info("logout: " + logout);
      String referer = request.getHeader("Referer");
      request.getSession().setAttribute("prevPage", referer);
      if (error != null) {
         model.addAttribute("error", "Login Error Check Your Account");
      }

      if (logout != null) {
         model.addAttribute("logout", "Logout!!");
      }
      return "login";
   }
   @RequestMapping(value="/oauth", produces="application/json; charset=utf-8", method= {RequestMethod.GET, RequestMethod.POST})
   public Member kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, String error, String logout,
		   RedirectAttributes ra, HttpSession session, HttpServletResponse response, 
		   Model model) throws IOException{
      JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
      JsonNode accessToken = jsonToken.get("access_token");
      JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
      String id = userInfo.path("id").asText();
      String name = null;
      String email = null;
      
      JsonNode properties = userInfo.path("properties");
      JsonNode kakao_account = userInfo.path("kakao_account");
      name = properties.path("nickname").asText();
      email = kakao_account.path("email").asText();
      System.out.println("[email] : "+email+", [name] : "+name+", [id] : "+id);

      if(service.readM(email) != null) {
    	  model.addAttribute("email", email);
    	  model.addAttribute("pw", id);
    	  return service.readM(email);
      }else {
    	  
      Member member = new Member();
      member.setEmail(email);
      member.setNickname(name);
      member.setPwd(id);
      System.out.println("[JOIN] NEW MEMBER :  " + member);
      service.save(member);
      model.addAttribute("email", email);
	  model.addAttribute("pw", id);
      return member;
      }
   }
   @RequestMapping("/join")
   public String join_input(@RequestParam("email") String email, @RequestParam("pwd") String pwd, @RequestParam("nickname") String nickname, String error, Model model)
      throws Exception{
      Member member = new Member();
      member.setEmail(email);
      member.setNickname(nickname);
      member.setPwd(pwd);
      System.out.println("[JOIN] NEW MEMBER :  " + member);
      service.save(member);
      log.info("JOIN error: " + error);
      return "join";
   }
   @RequestMapping("/customLogout")
   public String logoutPost() {
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   String email = authentication.getName();
      log.info("로그아웃: "+email);
      return "customLogout";
   }
   @RequestMapping(value="/login_check", method=RequestMethod.GET)
   public @ResponseBody int emailCheck(Member member, Model model){
      int i = service.login_check(member);
      String n="존재";
      System.out.println("나와라 좀"+i);
      return i;
   }

}