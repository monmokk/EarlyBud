package com.earlybud.payment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.earlybud.model.Item;
import com.earlybud.model.Payment_Info;
import com.earlybud.model.Purchase_Item;
import com.earlybud.model.Type;

public interface PaymentService {
	Item selectItem(long item_code);
	Type selectType(long type_code);
	HashMap<String,Object> selectTypeInfo(long type_code);
	String pwdCheckService(String nickname);
	void insertPurchaseItem(Purchase_Item purItem);
	void insertPaymentInfo(Payment_Info payInfo);
	void updateType(long type_code);
	void updateSum(long price, long type_code);
	void canclePayment(Purchase_Item pItem);
	void cancleMultiPayment(Map<String, Object> map);
	List<Map<String, Object>> listClosingItem();
	Purchase_Item selectPurchaseItem(String merchant_uid);
	void updatePayItem(Map<String, Object> paymap);
}
