package com.earlybud.orders.service;

import java.util.List;

import com.earlybud.vo.EachOrderVO;

public interface EachOrderService {
	public List<EachOrderVO> getOneOrderList(String merchant_uid);
	public int cancelOrder(String merchant_uid);
}
