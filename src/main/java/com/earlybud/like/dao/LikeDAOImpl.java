package com.earlybud.like.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.vo.MemberLikeVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class LikeDAOImpl implements LikeDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.MemberLikeVO";
	
	@Override
	public List<MemberLikeVO> getList() {
		log.info("MemberLikeDAO");
		System.out.println("MemberLikedao");
		List<MemberLikeVO> listL = sqlSession.selectList(ns + ".readItemLiked");
		System.out.println("Item list size: "+listL.size());

		return listL;
	}
	
	@Override
	public List<MemberLikeVO> getList(String email) {
		log.info("MemberLikeDAO");
		System.out.println("MemberLikedao");
		List<MemberLikeVO> listL = sqlSession.selectList(ns + ".readItemLikedX", email);
		System.out.println("Item list size: "+listL.size());

		return listL;
	}

	@Override
	public List<MemberLikeVO> getSellerItemList(String email) {
		log.info("One each seller's Item List");
		System.out.println("One seller's Item List");
		List<MemberLikeVO> oneSellerList = sqlSession.selectList(ns + ".readOneSellerItem", email);
		return oneSellerList;

	}

	@Override
	public Long likeCheck(HashMap map) {
		return sqlSession.selectOne(ns+".likeCK", map);
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

	@Override
	public long countLike(String seller) {
		 return sqlSession.selectOne(ns+".countLikes", seller);

	}

	@Override
	public int like(String email, String seller) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("seller", seller);
		int like = sqlSession.insert(ns + ".likeSeller", map);
		return like;
	}



}
