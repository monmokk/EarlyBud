package com.earlybud.message.dao;

import java.util.List;

import com.earlybud.vo.MessagePeopleListVO;

public interface MessagePeopleListDAO {
	public List<MessagePeopleListVO> getList();
	public List<MessagePeopleListVO> getList(String email);
}
