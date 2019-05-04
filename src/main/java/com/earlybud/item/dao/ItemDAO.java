package com.earlybud.item.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import com.earlybud.vo.RewardVO;

public interface ItemDAO {
	
	public RewardVO read(Long item_code);
	public long countLike(Long item_code);
	public List<Map<String, Object>> midnightPlan();
	void updateSuccessN();
	void updateSuccessY(long item_code);
	String encoreCheck(HashMap map);
	boolean encoreInsert(HashMap map);
	boolean encoreAddItem(HashMap map);	
	Long likeCheck(HashMap map);
	boolean likeAdd(HashMap map);
	boolean likeDel(HashMap map);
}
