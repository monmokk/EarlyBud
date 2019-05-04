package com.earlybud.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.earlybud.model.Purchase_Item;
import com.earlybud.orders.service.AllOrdersService;
import com.earlybud.orders.service.EachOrderService;
import com.earlybud.payment.service.PaymentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class OrdersController {
	private AllOrdersService service;
	private EachOrderService serviceO;
	private PaymentService serviceP;

	
	@RequestMapping(value = "member_orderlist/{email:.+}")
	public String AllOrders(@PathVariable("email") String email, Model model) {
		log.info("회원별 주문내역 전체 조회");
		model.addAttribute("list", service.getAllOrdersList(email));
		return "mypage/member_orderlist";
	}
	
	@RequestMapping(value = "member_ordereach/{merchant_uid}")
	public String OneOrder(@PathVariable("merchant_uid") String merchant_uid, Model model) {
		log.info("주문 하나 조회");
		model.addAttribute("listO", serviceO.getOneOrderList(merchant_uid));
		return "mypage/member_ordereach";
	}
	
	@RequestMapping(value = "member_ordereach/{merchant_uid}/cancel")
	public String CancelOrder(@PathVariable("merchant_uid") String merchant_uid, Model model) {
		serviceO.cancelOrder(merchant_uid);
		Purchase_Item  pItem = serviceP.selectPurchaseItem(merchant_uid);
		serviceP.canclePayment(pItem);
		model.addAttribute("listO", serviceO.getOneOrderList(merchant_uid));
		String redirectU = "redirect:/../earlybud/member_ordereach/"+merchant_uid;
		return redirectU;
	}
	
	@RequestMapping(value="get_imp_uid", method=RequestMethod.POST )
	public void getPayResult(HttpServletRequest request ,HttpServletResponse response,
			String imp_uid, String merchant_uid, String status) {
		
		// 결제완료후응답. 아임포트에서 보내는 아이피만 응답할수 있게함
		if (request.getRemoteAddr().startsWith("52.78.")) {
			System.out.println("payment response!!!");

			System.out.println("imp_uid = "+imp_uid);
			System.out.println("merchant_uid = "+merchant_uid);
			System.out.println("status = "+status);
			
			Map<String, Object> paymap = new HashMap<String, Object>();
			paymap.put("imp_uid",imp_uid);
			paymap.put("merchant_uid",merchant_uid);
			serviceP.updatePayItem(paymap);
		}			
	}
}
