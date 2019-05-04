package com.earlybud.message.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.vo.MessageListVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class MessageListDAOImpl implements MessageListDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.MessageListVO";
	

	@Override
	public List<MessageListVO> getIamSenderList() { //테스트용
		log.info("Message I sent ListDAO");
		System.out.println("One Member's Sent Message List");
		List<MessageListVO> IamSenderList = sqlSession.selectList(ns + ".IamSender");
		return IamSenderList;
	}

	@Override
	public List<MessageListVO> getYouareSenderList() { //테스트용
		log.info("Message You Sent ListDAO");
		System.out.println("One Member's Received Message List");
		List<MessageListVO> YouareSenderList = sqlSession.selectList(ns + ".YouareSender");
		return YouareSenderList;
	}
	
	
	@Override
	public List<MessageListVO> getIamSenderList(String email) {
		log.info("Message I sent ListDAO");
		System.out.println("One Member's Sent Message List");
		List<MessageListVO> IamSenderList = sqlSession.selectList(ns + ".IamSenderx", email);
		return IamSenderList;
	}

	@Override
	public List<MessageListVO> getYouareSenderList(String email) {
		log.info("Message You Sent ListDAO");
		System.out.println("One Member's Received Message List");
		List<MessageListVO> YouareSenderList = sqlSession.selectList(ns + ".YouareSenderx", email);
		return YouareSenderList;
	}

	@Override
	public List<MessageListVO> AllMessagesWithYou() {
		log.info("Message You Sent ListDAO");
		System.out.println("One Member's Message List");
		List<MessageListVO> AllMessagesWithYou = sqlSession.selectList(ns + ".AllMessagesWithYou");
		return AllMessagesWithYou;
	}

	@Override
	public List<MessageListVO> AllMessagesWithYou(String email, String receiver) {
		log.info("Message You Sent ListDAO");
		System.out.println("One Member's Message List");
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("receiver", receiver);
		List<MessageListVO> AllMessagesWithYouX = sqlSession.selectList(ns + ".AllMessagesWithYouX", map);
		return AllMessagesWithYouX;
	}
	
	@Override
	public int sendMessage() {
		log.info("Send One Message");
		System.out.println("Send One Message");
		int send = sqlSession.insert(ns + ".sendMessage");
		return send;
	}

	@Override
	public int sendMessageX(String email, String receiver, String content) {
		log.info("Send One Message");
		System.out.println("Send One Message");
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("receiver", receiver);
		map.put("content", content);
		int send = sqlSession.insert(ns + ".sendMessageX", map);
		return send;
	}


	@Override
	public int changeRead() {
		log.info("Update Message Read");
		System.out.println("changeRead");
		int send = sqlSession.insert(ns + ".changeRead");
		return send;
	}

	@Override
	public int changeReadX(String message_code) {
		log.info("Update Message Read");
		System.out.println("changeRead");
		int send = sqlSession.insert(ns + ".changeRead", message_code);
		return send;
	}
}
