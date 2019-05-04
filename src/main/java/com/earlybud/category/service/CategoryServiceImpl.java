package com.earlybud.category.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.earlybud.category.dao.CategoryDAO;
import com.earlybud.vo.MainVO;
import com.earlybud.model.Category;
import com.earlybud.vo.CategoryVO;
import com.earlybud.vo.PageVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {

	private CategoryDAO dao;

	/*메인용*/
	 @Override
	 public List<MainVO> getRandomList() {
		 return dao.getRandomList();	 
	}	 
	 @Override
	 public List<MainVO> getMainList(HashMap map) {
		 return dao.getMainList(map);	 
	}
	 @Override
	 public List<MainVO> getMainOpenList(HashMap map) {
		 return dao.getMainOpenList(map);	 
	}
	 @Override
	 public List<MainVO> getOpenRankNumService() {
		 return dao.getOpenRankNum();	 
	} 
	 @Override
	 public List<MainVO> getRewardRankNumService() {
		 return dao.getRewardRankNum();	 
	}
	 @Override
	 public List<MainVO> getRankListService(HashMap map) {
		 return dao.getRankList(map);	 
	} 
	 
	 
	 /*카테고리용*/
	 @Override
	 public List<Category> cateListService() {
		 return dao.getList();	 
	}		 
	 @Override
	public int countItemService(HashMap map) {
		return dao.countItem(map);
	}
	 @Override
	public List<CategoryVO> itemListService(PageVO vo) {
		return dao.itemList(vo);
	}
	 
	 @Override
	public List<CategoryVO> selectCategoryService(HashMap map) {
		return dao.selectCategory(map);
	}
}
