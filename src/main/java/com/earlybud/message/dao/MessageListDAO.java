package com.earlybud.message.dao;

import java.util.List;

import com.earlybud.vo.MessageListVO;

public interface MessageListDAO {
	//일단 위의 두개로 테스트하고 실제로는 밑의 두개 써야함
	public List<MessageListVO> getIamSenderList();
	public List<MessageListVO> getYouareSenderList();
	public List<MessageListVO> getIamSenderList(String email);
	public List<MessageListVO> getYouareSenderList(String email);
	public List<MessageListVO> AllMessagesWithYou();
	public List<MessageListVO> AllMessagesWithYou(String email, String receiver);
	public int sendMessage();
	public int sendMessageX(String email, String receiver, String content);
	public int changeRead();
	public int changeReadX(String message_code);
}
