package com.earlybud.like.dao;

import java.util.HashMap;
import java.util.List;

import com.earlybud.vo.MemberLikeVO;

public interface LikeDAO {
	public List<MemberLikeVO> getList();
	public List<MemberLikeVO> getList(String email);
	public List<MemberLikeVO> getSellerItemList(String email);
	public int like(String email, String seller);
	public Long likeCheck(HashMap map);
	public boolean likeAdd(HashMap map);
	public boolean likeDel(HashMap map);
	public long countLike(String seller);
}
