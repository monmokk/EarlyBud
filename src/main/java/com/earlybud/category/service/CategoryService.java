package com.earlybud.category.service;

import java.util.HashMap;
import java.util.List;

import com.earlybud.vo.MainVO;
import com.earlybud.model.Category;
import com.earlybud.vo.CategoryVO;
import com.earlybud.vo.PageVO;


public interface CategoryService {
	
	/*메인용*/
	public List<MainVO> getRandomList();
	public List<MainVO> getMainList(HashMap map);
	public List<MainVO> getMainOpenList(HashMap map);
	public List<MainVO> getOpenRankNumService();
	public List<MainVO> getRewardRankNumService();
	public List<MainVO> getRankListService(HashMap map);
	
	/*카테고리용*/
	public List<Category> cateListService();
	public int countItemService(HashMap map);
	public List<CategoryVO> itemListService(PageVO vo);
	public List<CategoryVO> selectCategoryService(HashMap map);
}
