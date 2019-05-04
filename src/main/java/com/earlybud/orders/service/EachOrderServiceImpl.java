package com.earlybud.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.earlybud.orders.dao.EachOrderDAO;
import com.earlybud.vo.EachOrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EachOrderServiceImpl implements EachOrderService {
	private EachOrderDAO dao;
	
	@Override
	public List<EachOrderVO> getOneOrderList(String merchant_uid){
		log.info("get One Order List from SERVICE");
		return dao.getOrder(merchant_uid);
	}

	@Override
	public int cancelOrder(String merchant_uid) {
		return dao.cancelOrder(merchant_uid);
	}
}
