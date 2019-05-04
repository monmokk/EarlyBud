package com.earlybud.orders.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.vo.AllOrdersVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class AllOrdersDAOImpl implements AllOrdersDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.AllOrdersVO";
	
	@Override
	public List<AllOrdersVO> getAllOrders() {
		log.info("get All Orders of the user");
		System.out.println("get All Orders of the user");
		List<AllOrdersVO> AllOrdersList = sqlSession.selectList(ns+".AllOrders");
		System.out.println("slq문도 실행함");
		return AllOrdersList;
	}

	@Override
	public List<AllOrdersVO> getAllOrders(String email) {
		log.info("get All Orders of the user");
		System.out.println("get All Orders of the user");
		List<AllOrdersVO> AllOrdersList = sqlSession.selectList(ns+".AllOrdersX", email);
		System.out.println("slq문도 실행함");
		return AllOrdersList;
	}

}
