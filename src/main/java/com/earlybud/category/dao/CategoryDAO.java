package com.earlybud.category.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.earlybud.vo.MainVO;
import com.earlybud.model.Category;
import com.earlybud.vo.CategoryVO;
import com.earlybud.vo.PageVO;


public interface CategoryDAO {
	
	/*메인용*/
	public List<MainVO> getMainList(HashMap map);
	public List<MainVO> getMainOpenList(HashMap map);
	public List<MainVO> getRandomList();
	public List<MainVO> getOpenRankNum();
	public List<MainVO> getRewardRankNum();
	public List<MainVO> getRankList(HashMap map);
	
	/*카테고리용*/
	public List<Category> getList();	
	public int countItem(HashMap map);
	public List<CategoryVO> itemList(PageVO vo);
	public List<CategoryVO> selectCategory(HashMap map);
}
