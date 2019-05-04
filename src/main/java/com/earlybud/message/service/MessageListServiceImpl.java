package com.earlybud.message.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.earlybud.message.dao.MessageListDAO;
import com.earlybud.vo.MessageListVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MessageListServiceImpl implements MessageListService {
	
	private MessageListDAO dao;
	
	@Override
	public List<MessageListVO> getIamSenderList() {
		log.info("get... I am Sender List...");
		return dao.getIamSenderList();
	}

	@Override
	public List<MessageListVO> getYouareSenderList() {
		log.info("get... You are Sender List...");
		return dao.getYouareSenderList();
	}

	@Override
	public List<MessageListVO> getIamSenderList(String email) {
		log.info("get... I am Sender List...");
		return dao.getIamSenderList(email);
	}

	@Override
	public List<MessageListVO> getYouareSenderList(String email) {
		log.info("get... You are Sender List...");
		return dao.getYouareSenderList(email);
	}

	@Override
	public int sendMessage() {
		log.info("sending a message");
		return dao.sendMessage();
	}
	
	@Override
	public int sendMessageX(String email, String receiver, String content) {
		log.info("sending a message");
		return dao.sendMessageX(email, receiver, content);
	}

	@Override
	public int changeRead() {
		log.info("Read a message");
		return dao.changeRead();
	}

	@Override
	public int changeReadX(String message_code) {
		log.info("Read a message");
		return dao.changeReadX(message_code);
	}

	@Override
	public List<MessageListVO> getAllMessagesWithYou() {
		log.info("get messages");
		return dao.AllMessagesWithYou();
	}

	@Override
	public List<MessageListVO> getAllMessagesWithYou(String email, String receiver) {
		log.info("get messages");
		return dao.AllMessagesWithYou(email, receiver);
	}
}
