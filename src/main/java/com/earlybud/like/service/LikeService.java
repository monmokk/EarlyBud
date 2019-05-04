package com.earlybud.like.service;

import java.util.HashMap;
import java.util.List;

import com.earlybud.vo.MemberLikeVO;

public interface LikeService {
   public List<MemberLikeVO> getList();
   public List<MemberLikeVO> getList(String email);
   public List<MemberLikeVO> getOneSellerList(String email);
   public Long likeCheckService(HashMap map);
   public boolean likeAddService(HashMap map);
   public boolean likeDelService(HashMap map);
   public long countLikeService(String seller);
}
