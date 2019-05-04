package com.earlybud.like.service;

import java.util.List;

import com.earlybud.vo.SellerLikeVO;

public interface LikeSellerService {
   public List<SellerLikeVO> getListS();
   public List<SellerLikeVO> getListS(String email);
}