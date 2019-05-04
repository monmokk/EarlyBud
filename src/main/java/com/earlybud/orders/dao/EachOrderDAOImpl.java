package com.earlybud.orders.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.vo.EachOrderVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class EachOrderDAOImpl implements EachOrderDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.EachOrderVO";
	
	@Override
	public List<EachOrderVO> getOrder(String merchant_uid) {
		log.info("get One Order");
		List<EachOrderVO> OneOrderList = sqlSession.selectList(ns+".OneOrderX", merchant_uid);
		return OneOrderList;
	}

	@Override
	public int cancelOrder(String merchant_uid) {
		int cancel = sqlSession.insert(ns+".cancelOrder", merchant_uid);
		return cancel;
	}

}
