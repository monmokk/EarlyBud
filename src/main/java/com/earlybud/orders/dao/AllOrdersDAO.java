package com.earlybud.orders.dao;

import java.util.List;

import com.earlybud.vo.AllOrdersVO;

public interface AllOrdersDAO {
	public List<AllOrdersVO> getAllOrders();
	public List<AllOrdersVO> getAllOrders(String email);
}
