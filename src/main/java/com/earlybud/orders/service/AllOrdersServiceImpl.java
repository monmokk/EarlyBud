package com.earlybud.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.earlybud.orders.dao.AllOrdersDAO;
import com.earlybud.vo.AllOrdersVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AllOrdersServiceImpl implements AllOrdersService {

	private AllOrdersDAO dao;
	
	@Override
	public List<AllOrdersVO> getAllOrdersList() {
		log.info("get All Orders List");
		return dao.getAllOrders();
	}

	@Override
	public List<AllOrdersVO> getAllOrdersList(String email) {
		log.info("get All Orders List");
		return dao.getAllOrders(email);
	}

}
