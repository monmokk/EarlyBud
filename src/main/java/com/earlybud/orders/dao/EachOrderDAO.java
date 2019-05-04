package com.earlybud.orders.dao;

import java.util.List;

import com.earlybud.vo.EachOrderVO;

public interface EachOrderDAO {
	public List<EachOrderVO> getOrder(String merchant_uid);
	public int cancelOrder(String merchant_uid);
}
