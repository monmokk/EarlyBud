package com.earlybud.like.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.vo.SellerLikeVO;

import jdk.internal.jline.internal.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class LikeSellerDAOImpl implements LikeSellerDAO {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.vo.SellerLikeVO";
	
	@Override
	public List<SellerLikeVO> getList() {
		log.info("SellerLikeDAO");
		System.out.println("SellerLikedao");
		List<SellerLikeVO> listM = sqlSession.selectList(ns + ".readSellerLiked");
		System.out.println("Item list size : "+listM.size());
		return listM;
	}

	@Override
	public List<SellerLikeVO> getList(String email) {
		log.info("SellerLikeDAO");
		System.out.println("SellerLikedao");
		List<SellerLikeVO> listM = sqlSession.selectList(ns + ".readSellerLikedX", email);
		System.out.println("Item list size : "+listM.size());
		return listM;
	}

}
