package com.earlybud.item.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.earlybud.vo.RewardVO;

public interface ItemService {

	public RewardVO get(Long item_code);
	public List<Map<String, Object>> midnightService();
	public long countLikeService(Long item_code);
	public void updateSuccessYService(long item_code);
	public void updateSuccessNService();
	public String encoreCheckService(HashMap map);
	public boolean encoreInsertService(HashMap map);
	public boolean encoreAddItemService(HashMap map);
	public Long likeCheckService(HashMap map);
	public boolean likeAddService(HashMap map);
	public boolean likeDelService(HashMap map);
	
}
