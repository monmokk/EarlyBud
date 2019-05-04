package com.earlybud.message.service;

import java.util.List;

import com.earlybud.vo.MessagePeopleListVO;

public interface MessagePeopleListService {
	public List<MessagePeopleListVO> getList();
	public List<MessagePeopleListVO> getList(String email);
}
