package com.earlybud.message.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.earlybud.message.dao.MessagePeopleListDAO;
import com.earlybud.vo.MessagePeopleListVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class MessagePeopleListServiceImpl implements MessagePeopleListService {
	
	private MessagePeopleListDAO dao;
	@Override
	public List<MessagePeopleListVO> getList() {
		log.info("get...List...");
		return dao.getList();
	}

	@Override
	public List<MessagePeopleListVO> getList(String email) {
		log.info("get...List...");
		return dao.getList(email);
	}

}
