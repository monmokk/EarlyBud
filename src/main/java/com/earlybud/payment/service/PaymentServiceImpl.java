package com.earlybud.payment.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.earlybud.model.Item;
import com.earlybud.model.Payment_Info;
import com.earlybud.model.Purchase_Item;
import com.earlybud.model.Type;
import com.earlybud.payment.dao.PaymentDao;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.UnscheduleData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Schedule;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {

	@Setter(onMethod_ = { @Autowired })
	private PaymentDao dao;
	
	IamportClient client = new IamportClient("6720365022563293","fR14uM6bvndQ4MUl2u0pJWLjkPH4tUHJMINhvTs0hGRmtLHvgHUZDGiYv02ZVKJItwZYqrYI8P4BBL6R");
	
	@Override
	public HashMap<String, Object> selectTypeInfo(long type_code) {
		return dao.selectTypeInfo(type_code);
	}
	
	@Override
	public Type selectType(long type_code) {
		return dao.selectType(type_code);
	}
	
	@Override
	public Item selectItem(long item_code) {
		return dao.selectItem(item_code);
	}
	
	@Override
	public String pwdCheckService(String nickname) {
		return dao.pwdCheck(nickname);
	}

	@Override
	public void insertPurchaseItem(Purchase_Item purItem) {
		dao.insertPurchaseItem(purItem);
	}

	@Override
	public void insertPaymentInfo(Payment_Info payInfo) {
		dao.insertPaymentInfo(payInfo);
	}

	@Override
	public void updateType(long type_code) {
		dao.updateType(type_code);
	}

	@Override
	public void updateSum(long price, long type_code) {//구매시 아이템 가격 더해주기
		dao.updateSum(price, type_code);
	}
	
	@Override
	public void canclePayment(Purchase_Item pItem) {//클로징전 사용자 캔슬
		UnscheduleData unschedule_data = new UnscheduleData(pItem.getCustomer_uid());
		unschedule_data.addMerchantUid(pItem.getMerchant_uid());
		
		IamportResponse<List<Schedule>> unschedule_response = client.unsubscribeSchedule(unschedule_data);
		List<Schedule> cancelled_schedule = unschedule_response.getResponse();
		System.out.println("cancelled_schedule: "+cancelled_schedule);
		
		//스케줄된 purchase_item 테이블 cancel 칼럼 업데이트!!
		dao.updateCancel(pItem.getMerchant_uid());
		//아이템 테이블 팔린 금액 빼기.
		dao.updateCancelSum(pItem.getType_code(),pItem.getPrice());
		//타입 purnum 한개빼는것 update
		dao.updateCancelType(pItem.getType_code());
		//취소 이메일 메세지
	}

	@Override
	public void cancleMultiPayment(Map<String, Object> map) {//클로징후 캔슬
		UnscheduleData unschedule_data = new UnscheduleData(map.get("CUSTOMER_UID").toString());
		unschedule_data.addMerchantUid(map.get("MERCHANT_UID").toString());
		
		IamportResponse<List<Schedule>> unschedule_response = client.unsubscribeSchedule(unschedule_data);
		List<Schedule> cancelled_schedule = unschedule_response.getResponse();
		System.out.println("cancelled_schedule: "+cancelled_schedule);
		//스케줄된 purchase_item 테이블 cancel 칼럼 업데이트!!
		dao.updateCancel(map.get("MERCHANT_UID").toString());
		//Type purnum 과 Item 테이블 팔린 금액은 클로징 이후에 그대로 두기.
		//취소 이메일 메세지
	}

	@Override
	public List<Map<String, Object>> listClosingItem() {//지금 클로징한 아이템리스트 가져오기
		log.info("listClosingItem service");
		return dao.listClosingItem();
	}

	@Override
	public Purchase_Item selectPurchaseItem(String merchant_uid) {
		log.info("selectPurchaseItem service");
		return dao.selectPurchaseItem(merchant_uid);
	}

	@Override
	public void updatePayItem(Map<String, Object> paymap) {
		log.info("updatePayItem service");
		dao.updatePayItem(paymap);
	}

}
