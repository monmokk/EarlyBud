package com.earlybud.project.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.model.Encore;
import com.earlybud.model.Item;
import com.earlybud.model.Seller;
import com.earlybud.model.Type;

import lombok.extern.log4j.Log4j;

@Repository
@Log4j
public class NewProjectDaoImpl implements NewProjectDao {
	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.model.Item";
	private String ns1 = "com.earlybud.model.Seller";
	private String ns2 = "com.earlybud.model.Type";
	private String ns3 = "com.earlybud.model.Encore";
	
	public List<Item> sellerItem(String email){
		System.out.println("dao");
		return sqlSession.selectList(ns+".sellerItem", email);
	}
	public Seller seller_select(String email) {
		return sqlSession.selectOne(ns1+".sel_select", email);
	}
	public Item item_select(long item_code) {
		System.out.println("아이템 select dao 들어왔어용"+item_code);

		return sqlSession.selectOne(ns+".modifyItem1", item_code);
	}
	public Item item_select2(long item_code) {
		System.out.println("아이템 select dao 들어왔어용"+item_code);

		return sqlSession.selectOne(ns+".modifyItem2", item_code);
	}
	public List<Type> selectType(long item_code) {
		return sqlSession.selectList(ns2+".selectType", item_code);
	}
	public int modifyItem(Item item) {
		int i=-1;
		try {
			i = sqlSession.update(ns+".modifyItem11", item);
		} finally {
		}
		return i;
	}
	public int save(Item item) {
		int p = -1;
		System.out.println("dao 들어왔어용"+item.getEmail());
		try {
			p = sqlSession.insert(ns+".insertItem", item);
		} finally {
		}
		System.out.println("2page insert("+item+")");
		return p;
	}
	public int save2(Type type) {
		int p = -1;
		System.out.println("저장 dao 들어왔어용"+type.getItem_code());
		try {
			p = sqlSession.insert(ns2+".insertOption", type);
		} finally {
		}
		System.out.println("lastPage insert("+type+")");
		return p;
	}
	public int modifyType(long item_code) {
		int p = -1;
		System.out.println("타입 삭제 dao 들어왔어용"+item_code);
		try {
			p = sqlSession.delete(ns2+".updateType", item_code);
			
		} finally {
		}
		return p;
	}
	
	public int modifySeller(Seller seller) {
		int i = -1;
		try {
			i = sqlSession.update(ns1+".updateSeller", seller);
		} finally {
		}
		return i;
	}
	public int update(Item item) {
		int p = -1;
		try {
			p = sqlSession.update(ns+".insertItem2", item);
		} finally {
		}
		System.out.println("3page insert("+item+")");
		return p;
	}
	public int update2(Seller seller) {
		int p=-1;
		try {
			System.out.println("셀러 dao 들어왔어용");
			p = sqlSession.insert(ns1+".insertItem3", seller);
		} finally {
		}
		System.out.println("1page insert("+seller+")");
		return p;
	}
	@Override
	public List<Item> sellerEndItem(String email) {
		return sqlSession.selectList(ns+".sellerEndItem", email);
	}
	@Override
	public List<Item> sellerEncoreItem(String email) {
		return sqlSession.selectList(ns+".sellerEncoreItem", email);
	}
	@Override
	public List<Item> sellerEditItem(String email) {
		return sqlSession.selectList(ns+".sellerEditItem", email);
	}
	@Override
	public void applyItem(long item_code) {
		// TODO Auto-generated method stub
		int i = sqlSession.update(ns+".applyItem", item_code);
		if(i>0) System.out.println("applyItem");
	}
	@Override
	public void insertEncoreItem(Item item) {
		// TODO Auto-generated method stub
		int i = sqlSession.insert(ns+".insertEncoreItem", item);
		if(i>0) System.out.println("insert Encore item1");
	}
	@Override
	public void insertEncoreItem2(Item item) {
		// TODO Auto-generated method stub
		int i = sqlSession.insert(ns+".insertEncoreItem2", item);
		if(i>0) System.out.println("insert Encore item2");
	}
	@Override
	public void updateEncore(Encore encore) {
		// TODO Auto-generated method stub
		int i = sqlSession.update(ns3+".updateEncore", encore);
		if(i>0) System.out.println("update encore table completed");
	}
}
