package com.earlybud.controller;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.Message;

import com.earlybud.admin.service.AdminService;
import com.earlybud.model.Email;
import com.earlybud.model.Member;
import com.earlybud.security.CustomUserDetailsService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class MailController {
	
	@Setter(onMethod_ = { @Autowired })
	private AdminService service;
	
	@PostMapping(value = "send_mail", consumes = "application/json")
	public ResponseEntity<String> sendMail(@RequestBody Email email) {
		System.out.println("mailcontroller");
		System.out.println("mail:"+ email);
		
		String host = "smtp.naver.com";
		String user = "laughcryrepeat@naver.com";
		String password = "bitcamp2019";
		String emailto = email.getMailto();
		emailto = emailto.trim();
		System.out.println("emailto: "+ emailto);
		String[] mailtoArray = null;
		
		if(emailto.contains(",")) {
			mailtoArray = emailto.split("\\s*,\\s*");
		}
	
		//SMTP 서버정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			if(mailtoArray == null) {
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailto));
			}else {
				InternetAddress[] addArray = new InternetAddress[mailtoArray.length];
				for(int i=0; i<mailtoArray.length; i++) {
					addArray[i] = new InternetAddress(mailtoArray[i]);
				}
				message.addRecipients(Message.RecipientType.TO, addArray);
			}
			
			//메일 제목
			message.setSubject(email.getMailsubject());
			//메일 내용
			message.setText(email.getMailcontent());
			//send 
			Transport.send(message);
			System.out.println("Message sent Successfully");
			
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
		int insertCount = 1;
		insertCount = service.sendMessage(email);
		return insertCount >= 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	
	@PostMapping(value="update_read")
	public ResponseEntity<String> updateRead(@RequestParam("msg_code") int msg_code) {
		System.out.println("updateRead ajax");
		System.out.println("msg_code: "+msg_code);
		int updateCount = 1;
		updateCount = service.updateRead(msg_code);
		return updateCount == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@Autowired
	CustomUserDetailsService serviceM;
	@RequestMapping(value = "/forgot")
	public ResponseEntity<String> sendPasswordForm(@RequestParam String email, Member member) throws IOException{
		System.out.println("mailcontroller");
		System.out.println("수신자:"+ email);
		
		String host = "smtp.naver.com";
		String user = "laughcryrepeat@naver.com";
		String password = "bitcamp2019";
		System.out.println("emailto: "+ email);
		String[] mailtoArray = null;
		
		if(email.contains(",")) {
			mailtoArray = email.split("\\s*,\\s*");
		}
	
		//SMTP 서버정보 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', 
				'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 
				'W', 'X', 'Y', 'Z' }; 

		int idx = 0; StringBuffer sb = new StringBuffer(); 
		System.out.println("charSet.length :::: "+charSet.length); 
		int len = 10;
		for (int i = 0; i < len; i++) { 
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]); 
		} 
		String pWD = sb.toString();
		member.setEmail(email);
		member.setPwd(pWD);
		serviceM.updatePwd(member);
		System.out.println("생성된 비밀번호: " + pWD);
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			if(mailtoArray == null) {
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			}else {
				InternetAddress[] addArray = new InternetAddress[mailtoArray.length];
				for(int i=0; i<mailtoArray.length; i++) {
					addArray[i] = new InternetAddress(mailtoArray[i]);
				}
				message.addRecipients(Message.RecipientType.TO, addArray);
			}
			//메일 제목
			String subject ="EarlyBud 요청하신 비밀번호 입니다";
			message.setSubject(subject);
			//메일 내용
			String content = pWD +  "\n보안을 위해 사이트에 접속하셔서 비밀번호를 꼭 변경해주세요";
			message.setText(content);
			//send 
			Transport.send(message);
			System.out.println("Message sent Successfully");
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		int insertCount = 1;
		insertCount = service.sendPassword(email);
		return insertCount >= 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
}
