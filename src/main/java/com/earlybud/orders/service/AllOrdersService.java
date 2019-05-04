package com.earlybud.orders.service;

import java.util.List;

import com.earlybud.vo.AllOrdersVO;

public interface AllOrdersService {
	public List<AllOrdersVO> getAllOrdersList();
	public List<AllOrdersVO> getAllOrdersList(String email);
}
