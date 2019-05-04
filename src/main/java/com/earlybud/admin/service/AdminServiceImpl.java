package com.earlybud.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.earlybud.admin.dao.AdminDao;
import com.earlybud.model.Email;
import com.earlybud.model.Item;
import com.earlybud.model.Member;
import com.earlybud.model.Message;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = { @Autowired })
	private AdminDao dao;
	
	
	@Override
	public List<Item> listItem() {
		log.info("listItem service");
		return dao.listItem();
	}
	
	@Override
	public List<Item> listEncoreItem() {
		return dao.listEncoreItem();
	}
	
	@Override
	public int updateApproveItem(long item_code) {
		log.info("updateAdmincall service");
		return dao.updateApproveItem(item_code);
	}
	
	@Override
	public int updateRejectItem(long item_code) {
		log.info("updateAdmincall service");
		return dao.updateRejectItem(item_code);
	}
	
	@Override
	public int suggestAncoreItem(long item_code) {
		return dao.suggestAncoreItem(item_code);
	}
	
	@Override
	public List<Member> listMember() {
		log.info("listmember service");
		return dao.listMember();
	}

	@Override
	public void dropMember(String email) {
		log.info("del member service");
		dao.dropMember(email);
	}

	@Override
	public List<Message> listMessage(String email) {
		return dao.listMessage(email);
	}

	@Override
	public List<Message> listSentMessage(String email) {
		return dao.listSentMessage(email);
	}

	@Override
	public int sendMessage(Email email) {
		String mailto = email.getMailto();
		String sender = "laughcryrepeat@naver.com";
		String mailsubject = email.getMailsubject();
		String content = mailsubject+ "/" + email.getMailcontent();
		String recievers[] = null;
		int x = 0;
		if(mailto.contains(",")) {
			recievers = mailto.split("\\s*,\\s*");
			for(int i=0; i<recievers.length; i++) {
				Message msg = new Message(-1,-1,recievers[i],sender,content,null,-1);
				dao.sendMessage(msg);
				x++;
			}
		}else {
			Message msg = new Message(-1,-1, mailto,sender,content,null,-1);
			dao.sendMessage(msg);
			x++;
		}	
		return x;
	}

	@Override
	public int updateRead(int message_code) {
		System.out.println("updateRead service, message_code: "+message_code);
		return dao.updateRead(message_code);
	}
	@Override
	public int sendPassword(String email) {
		String mailto = email;
		String sender = "laughcryrepeat@naver.com";
		String mailsubject = "EarlyBud 요청하신 비밀번호 입니다";
		String content = mailsubject+ "/" + "..";
		String recievers[] = null;
		int x = 0;
		if(mailto.contains(",")) {
			recievers = mailto.split("\\s*,\\s*");
			for(int i=0; i<recievers.length; i++) {
				Message msg = new Message(-1,-1,recievers[i],sender,content,null,-1);
				dao.sendMessage(msg);
				x++;
			}
		}else {
			Message msg = new Message(-1,-1, mailto,sender,content,null,-1);
			dao.sendMessage(msg);
			x++;
		}	
		return x;
	}
	@Override
	public int countNewMessage(String email) {
		// TODO Auto-generated method stub
		return dao.countNewMessage(email);
	}

}
