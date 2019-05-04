package com.earlybud.payment.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.earlybud.model.Item;
import com.earlybud.model.Payment_Info;
import com.earlybud.model.Purchase_Item;
import com.earlybud.model.Type;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SqlSession sqlSession;
	private String ns = "com.earlybud.model.Member";
	private String ns1 = "com.earlybud.model.Purchase_Item";
	private String ns2 = "com.earlybud.model.Payment_Info";
	private String ns3 = "com.earlybud.model.Type";
	private String ns4 = "com.earlybud.model.Item";
	
	@Override
	public HashMap<String, Object> selectTypeInfo(long type_code) {
		HashMap<String,Object> itemMap = sqlSession.selectOne(ns4+".selectTypeInfo", type_code);
		System.out.println("selectTypeInfo after sql");
		System.out.println("itemMap: "+itemMap);
		System.out.println("itemMap.get('TITLE'):"+itemMap.get("TITLE"));
		return itemMap;
	}
	
	@Override
	public Type selectType(long type_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns3+".selectType", type_code);
	}
	
	@Override
	public Item selectItem(long item_code) {
		return sqlSession.selectOne(ns4+".selectItem", item_code);
	}
	
	@Override
	public String pwdCheck(String nickname) {
		log.info("pwd check DAO");
		return sqlSession.selectOne(ns+".pwdCheck", nickname);
	}


	@Override
	public void insertPurchaseItem(Purchase_Item purItem) {
		log.info("insertPurchaseItem DAO");
		int i =sqlSession.insert(ns1+".insertPurItem", purItem);
		System.out.println("insertPurchaseItem: "+i);
	}


	@Override
	public void insertPaymentInfo(Payment_Info payInfo) {
		log.info("insertPaymentInfo DAO");
		int i = sqlSession.insert(ns2+".insertPayInfo", payInfo);
		System.out.println("insertPaymentInfo :"+i);
	}


	@Override
	public void updateType(long type_code) {
		System.out.println("type update dao");
		int i=sqlSession.update(ns3+".updatePurnum", type_code);
		System.out.println("type update: "+i);
	}

	@Override
	public void updateSum(long price, long type_code) {
		System.out.println("update item price sum");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("price",price);
		map.put("type_code", type_code);
		System.out.println("map: "+map);
		int i = sqlSession.update(ns4+".updateSum", map);
		System.out.println("item price sum update: "+i);
	}

	@Override
	public List<Map<String, Object>> listClosingItem() {
		log.info("listClosingItem dao");
		List<Map<String, Object>> closingList = sqlSession.selectList(ns1+".listClosingItem");
		System.out.println("closingList size: "+closingList.size());
		return closingList;
	}

	@Override
	public void updateCancel(String merchant_uid) {//Purchase_Item cancle
		log.info("updateCancel dao");
		sqlSession.update(ns1+".canclePurchaseItem", merchant_uid);
	}

	@Override
	public void updateCancelSum(long type_code, long price) {//Item price cancle
		log.info("updateCancelSum dao");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("price",price);
		map.put("type_code", type_code);
		System.out.println("map: "+map);
		int i = sqlSession.update(ns4+".updateCancelSum", map);
		System.out.println("item price cancle sum update: "+i);
	}

	@Override
	public void updateCancelType(long type_code) {//Type num cancle
		System.out.println("type cancle update dao");
		int i=sqlSession.update(ns3+".updateCanclePurnum", type_code);
		System.out.println("type cancle update: "+i);
	}

	@Override
	public Purchase_Item selectPurchaseItem(String merchant_uid) {
		// TODO Auto-generated method stub
		log.info("select purchase item");
		return sqlSession.selectOne(ns1+".selectPurItem", merchant_uid);
	}

	@Override
	public void updatePayItem(Map<String, Object> paymap) {
		// TODO Auto-generated method stub
		log.info("update pay item imp_uid");
		System.out.println("update pay item imp_uid");
		System.out.println("paymap: "+paymap);
		sqlSession.update(ns1+".updateImp_uid", paymap);
	}	

}
