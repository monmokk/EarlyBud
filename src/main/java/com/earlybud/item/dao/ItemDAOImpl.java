package com.earlybud.item.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.earlybud.vo.RewardVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class ItemDAOImpl implements ItemDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.RewardVO";
	
	@Override
	public RewardVO read(Long item_code) {
		System.out.println("read contents item code: "+item_code);	
		RewardVO selectItem = sqlSession.selectOne(ns+".readItem", item_code);
		selectItem.show();
		return selectItem;
	}
	@Override
	public long countLike(Long item_code) {
		 return sqlSession.selectOne(ns+".countLikes", item_code);
	}
	@Override
	public Long likeCheck(HashMap map) {
		return sqlSession.selectOne(ns+".likeCK", map);			
	}
	@Override
	public List<Map<String, Object>> midnightPlan(){
		return sqlSession.selectList(ns+".midnight");
	}
	@Override
	public	void updateSuccessN() {
		sqlSession.update(ns+".UpdateSuccessN");
	}
	@Override
	public void updateSuccessY(long item_code) {
		System.out.println("성공~~");
		sqlSession.update(ns+".UpdateSuccessY", item_code);		
	}
	@Override
	public String encoreCheck(HashMap map) {
		return sqlSession.selectOne(ns+".encoreCK", map);			
	}
	@Override
	public boolean encoreInsert(HashMap map) {
		sqlSession.selectOne(ns+".encoreInsert", map);
		return true;
	}
	@Override
	public boolean encoreAddItem(HashMap map) {
		sqlSession.selectOne(ns+".encoreAddItem", map);
		return true;
	}
	@Override
	public boolean likeAdd(HashMap map) {
		sqlSession.selectOne(ns+".likeAdd", map);
		return true;
	}
	@Override
	public boolean likeDel(HashMap map) {
		sqlSession.selectOne(ns+".likeDel", map);
		return true;
	}
}
