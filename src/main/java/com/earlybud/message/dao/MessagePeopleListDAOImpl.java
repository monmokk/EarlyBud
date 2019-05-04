package com.earlybud.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.vo.MessagePeopleListVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class MessagePeopleListDAOImpl implements MessagePeopleListDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.MessagePeopleListVO";
	
	@Override
	public List<MessagePeopleListVO> getList() {
		log.info("MessagePeopleLikeDAO");
		System.out.println("MessagePeopleLikedao");
		List<MessagePeopleListVO> listM = sqlSession.selectList(ns + ".MessagePeople");
		System.out.println("Item list size: "+listM.size());

		return listM;
	}

	@Override
	public List<MessagePeopleListVO> getList(String email) {
		log.info("MessagePeopleLikeDAO");
		System.out.println("MessagePeopleLikedao");
		List<MessagePeopleListVO> listMM = sqlSession.selectList(ns + ".MessagePeopleX", email);
		System.out.println("Item list size: "+listMM.size());

		return listMM;
	}

}
