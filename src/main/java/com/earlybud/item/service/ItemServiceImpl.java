package com.earlybud.item.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.earlybud.item.dao.ItemDAO;
import com.earlybud.vo.RewardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ItemServiceImpl implements ItemService {

	private ItemDAO dao;

	@Override
	public RewardVO get(Long item_code) {
		log.info("get......" + item_code);
		return dao.read(item_code);
	} 
	@Override
	public long countLikeService(Long item_code){
		return dao.countLike(item_code);
	}
	@Override
	public List<Map<String, Object>> midnightService(){
		return dao.midnightPlan();
	}
	@Override
	public void updateSuccessNService() {
		dao.updateSuccessN();
	}
	@Override
	public void updateSuccessYService(long item_code) {
		dao.updateSuccessY(item_code);		
	}
	
	@Override
	public String encoreCheckService(HashMap map) {
		return dao.encoreCheck(map);
	}
	@Override
	public boolean encoreInsertService(HashMap map) {
		return dao.encoreInsert(map);
	}
	@Override
	public boolean encoreAddItemService(HashMap map) {
		return dao.encoreAddItem(map);
	}
	@Override
	public Long likeCheckService(HashMap map) {
		return dao.likeCheck(map);
	}
	@Override
	public boolean likeAddService(HashMap map) {
		return dao.likeAdd(map);
	}
	@Override
	public boolean likeDelService(HashMap map) {
		return dao.likeDel(map);
	}
}
