package com.earlybud.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.earlybud.message.service.MessageListService;
import com.earlybud.message.service.MessagePeopleListService;
import com.earlybud.vo.MessageListVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MessageListController {
	private MessagePeopleListService service;
	private MessageListService serviceL;

	
	@RequestMapping(value = "message/{email:.+}")
	public String myList(@PathVariable("email") String email, Model model) {
		model.addAttribute("listM", service.getList(email));
		return "message/message2";
	}
	
	@RequestMapping(value = "message/{email:.+}/{receiver:.+}")
	public String finalList(@PathVariable("email") String email, @PathVariable("receiver") String receiver, Model model) {
		log.info("listM");
		model.addAttribute("listM", service.getList(email));
		model.addAttribute("listS", serviceL.getAllMessagesWithYou(email, receiver)); //맨처음에 켜면 그냥 최신의 메세지가 떠ㅑ야되난...............
		System.out.println("컨트롤러에서 리스트 줌");
		return "message/message";
		
	}
	
	@RequestMapping(value = "message/{email:.+}/{receiver:.+}/{content}")
	public String finalList(@PathVariable("email") String email, @PathVariable("receiver") String receiver, @PathVariable("content") String content, Model model) {
		serviceL.sendMessageX(email, receiver, content);
		System.out.println("email: "+email+", receiver: "+receiver+", content: "+content);
		log.info("listM");
		model.addAttribute("listM", service.getList(email));
		model.addAttribute("listS", serviceL.getAllMessagesWithYou(email, receiver)); //맨처음에 켜면 그냥 최신의 메세지가 떠ㅑ야되난...............
		System.out.println("컨트롤러에서 리스트 줌");
		String redirectU = "redirect:/../earlybud/message/"+email+"/"+receiver;
		return redirectU;
		
		
	}			
}
