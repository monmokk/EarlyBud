package com.earlybud.like.dao;

import java.util.List;

import com.earlybud.vo.SellerLikeVO;

public interface LikeSellerDAO {
	public List<SellerLikeVO> getList();
	public List<SellerLikeVO> getList(String email);
}
