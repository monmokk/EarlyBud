package com.earlybud.message.service;

import java.util.List;

import com.earlybud.vo.MessageListVO;

public interface MessageListService {
	public List<MessageListVO> getIamSenderList(); //for test
	public List<MessageListVO> getYouareSenderList(); //for test
	public List<MessageListVO> getIamSenderList(String email);
	public List<MessageListVO> getYouareSenderList(String email);
	public List<MessageListVO> getAllMessagesWithYou();
	public List<MessageListVO> getAllMessagesWithYou(String email, String receiver);
	public int sendMessage();
	public int changeRead();
	public int sendMessageX(String email, String receiver, String content);
	public int changeReadX(String message_code);
}












