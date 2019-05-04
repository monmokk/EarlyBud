package com.earlybud.like.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.earlybud.like.dao.LikeSellerDAO;
import com.earlybud.vo.SellerLikeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LikeSellerServiceImpl implements LikeSellerService {

	private LikeSellerDAO dao;
	@Override
	public List<SellerLikeVO> getListS() {
		log.info("get...List...");
		return dao.getList();
	}
	@Override
	public List<SellerLikeVO> getListS(String email) {
		log.info("get...List...");
		return dao.getList(email);
	}

}
