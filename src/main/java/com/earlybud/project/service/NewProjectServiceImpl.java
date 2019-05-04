package com.earlybud.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.earlybud.model.Encore;
import com.earlybud.model.Item;
import com.earlybud.model.Seller;
import com.earlybud.model.Type;
import com.earlybud.project.dao.NewProjectDao;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class NewProjectServiceImpl implements NewProjectService {
	
	@Setter(onMethod_ = { @Autowired })
	private NewProjectDao dao;
	
	public List<Item> sellerItem(String email){
		System.out.println("service");
		return dao.sellerItem(email);
	}
	public List<Type> selectType(long item_code){
		return dao.selectType(item_code);
	}
	public Seller seller_select(String email) {
		return dao.seller_select(email);
	}
	public Item item_select(long item_code) {
		System.out.println("아이템 select 서비스 들어왔어용");

		return dao.item_select(item_code);
	}
	public Item item_select2(long item_code) {

		return dao.item_select2(item_code);
	}
	public int modifyItem(Item item) {
		return dao.modifyItem(item);
	}
	public int save(Item item) {
		System.out.println("아이템 save 서비스 들어왔어용");
		return dao.save(item);
	}
	public int save2(Type type) {
		System.out.println("타입 save 서비스 들어왔어용");
		return dao.save2(type);
	}
	public int modifyType(long item_code) {
		System.out.println("타입 update 서비스 들어왔어용");
		return dao.modifyType(item_code);
	}
	public int modifySeller(Seller seller) {
		return dao.modifySeller(seller);
	}
	public int update(Item item) {
		System.out.println("아이템 업데이트 서비스 들어왔어용");
		return dao.update(item);
	}
	public int update2(Seller seller) {
		System.out.println("셀러 인서트 서비스 들어왔어용");
		return dao.update2(seller);
	}
	@Override
	public List<Item> sellerEndItem(String email) {
		return dao.sellerEndItem(email);
	}
	@Override
	public List<Item> sellerEncoreItem(String email) {
		return dao.sellerEncoreItem(email);
	}
	@Override
	public List<Item> sellerEditItem(String email) {
		return dao.sellerEditItem(email);
	}
	@Override
	public void applyItem(long item_code) {
		dao.applyItem(item_code);
	}
	@Override
	public void insertEncoreItem(Item item) {
		// TODO Auto-generated method stub
		dao.insertEncoreItem(item);
	}
	@Override
	public void insertEncoreItem2(Item item) {
		// TODO Auto-generated method stub
		dao.insertEncoreItem2(item);
	}
	@Override
	public void updateEncore(Encore encore) {
		// TODO Auto-generated method stub
		dao.updateEncore(encore);
	}
}
