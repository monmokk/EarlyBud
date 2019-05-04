package com.earlybud.controller;

import java.io.*;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.earlybud.member.dao.MemberDAO;
import com.earlybud.model.Item;
import com.earlybud.model.Member;
import com.earlybud.payment.service.PaymentService;
import com.earlybud.security.CustomNoOpPasswordEncoder;
import com.earlybud.security.CustomUserDetailsService;
import com.earlybud.vo.AddrVo;
import com.earlybud.model.Payment_Info;
import com.earlybud.model.Purchase_Item;
import com.earlybud.model.Type;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.ScheduleData;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.request.UnscheduleData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Schedule;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/payment/*")
@Log4j
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	@Setter(onMethod_ = { @Autowired })
	private MemberDAO dao;
	
	IamportClient client = new IamportClient("6720365022563293","fR14uM6bvndQ4MUl2u0pJWLjkPH4tUHJMINhvTs0hGRmtLHvgHUZDGiYv02ZVKJItwZYqrYI8P4BBL6R");
	
	@GetMapping("input/{type_code}")
	public String paymentInput(@PathVariable("type_code") long type_code, Model model) {
		log.info("payment input");
		System.out.println("type_code: "+type_code);
		//Type type = service.selectType(type_code);
		//System.out.println("item_code: "+type.getItem_code());
		//Item item = service.selectItem(type.getItem_code());
		//model.addAttribute("type",type);
		//model.addAttribute("item",item);
		HashMap<String,Object> itemMap = service.selectTypeInfo(type_code);
		System.out.println("itemMap.get('CLOSINGDATE-1'):"+itemMap.get("CLOSINGDATE-1"));
		model.addAttribute("itemMap",itemMap);
		model.addAttribute("type_code",type_code);
		
		return "payment/input";
	}
	@Autowired
	BCryptPasswordEncoder passwordencoder;
	@RequestMapping("pwdCheck")
	public @ResponseBody Boolean pwdCheck(String pwd, String nickname, HttpServletResponse response) {
		log.info("pwd check with Ajex");
		log.info("pwd : "+pwd);
		log.info("nickname: "+nickname);
		String pwdMatch = service.pwdCheckService(nickname);
		log.info("pwdMatch: "+pwdMatch);
		//CustomNoOpPasswordEncoder cpe = new CustomNoOpPasswordEncoder();
		//System.out.println("cpe.encode(pwd) :"+cpe.encode(pwd));
		//if(cpe.encode(pwd).equals(pwdMatch)) {
		try {
			if(passwordencoder.matches(pwd, pwdMatch)) {
				System.out.println("true");
				return true;
			}else {
				System.out.println("false");
			}
			
		}catch (NullPointerException ne) {
			System.out.println("false");
			return null;
		}
		return null;
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup(@ModelAttribute("AddrVo") AddrVo addrvo) {
		log.info("jusoPopup");
		return "payment/jusoPopup";
	}
	
	@RequestMapping(value="reserve_payment", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public @ResponseBody String registerBillingKey(HttpServletRequest request ,HttpServletResponse response, Payment_Info pi, long item_code) {
		// 연결
		
		String customer_uid = null;
		log.info("registerBillingKey");
		log.info("paymentVo nickname: "+pi.getNickname());
		String card_number = pi.getCardnum();
		String expiry = pi.getExp_year() +"-"+ pi.getExp_month() ;
		String birth = pi.getBirthdate();
		String pwd_2digit = pi.getCardpwd();
		
		//Member member = dao.read(paymentVo.getEmail());
		customer_uid = getCustomerUid(pi.getEmail());
		
		System.out.println("customer_uid: "+customer_uid);
		System.out.println("card_number: "+card_number);
		System.out.println("expiry: "+expiry);
		System.out.println("birth: "+birth);
		System.out.println("pwd_2digit: "+pwd_2digit);
		
		AccessToken auth = client.getAuth().getResponse();//토큰 가져오기
		System.out.println("AccessToken auth: "+auth);
		
		try {
			URL url = new URL("https://api.iamport.kr/subscribe/customers/"+customer_uid);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST"); // 보내는 타입
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", auth.getToken());
		
			// 데이터
			String param = "{\"card_number\": \""+card_number+"\", \"expiry\" : \""+expiry+"\", "
					+ "\"birth\" : \""+birth+"\", \"pwd_2digit\" : \""+pwd_2digit+"\", \"pg\" : \"nictest04m\""
					+ ",\"customer_name\":\""+pi.getCard_owner()+"\""
					+ ",\"customer_tel\":\""+pi.getDel_phone()+"\" "
					+ ",\"customer_email\": \""+pi.getEmail()+"\""
					+ ",\"customer_addr\": \""+pi.getAddr1()+pi.getAddr2()+"\" "
					+ ",\"customer_postcode\": \""+pi.getZip_code()+"\"}";
			// 전송
			OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
			osw.write(param);
			System.out.println("send customer_uid & param");
			osw.flush();
			// 응답
			BufferedReader br = null;
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line = null;
			String message = null;
			while ((line = br.readLine()) != null) {
				System.out.println(line);
				System.out.println("Billing key response!!!");
				JsonParser jsonParser = new JsonParser();
				JsonElement element = jsonParser.parse(line);
				int code = element.getAsJsonObject().get("code").getAsInt();
				System.out.println("code = "+code);
				
				if(code==0) {
					reservePayment(pi, customer_uid, item_code);
				}else {
					message = element.getAsJsonObject().get("message").getAsString();
					System.out.println("message = "+message);
					return message;
				}
			}			
			// 닫기
			osw.close();
			br.close();		
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void reservePayment(Payment_Info pi, String customer_uid, long item_code) {
		log.info("reserve payment");	
		ScheduleData schedule_data = new ScheduleData(customer_uid);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("sdf: "+sdf);
		Calendar cal = Calendar.getInstance();
		Date d;
		String merchant_uid = getMerchantUid(pi.getType_code());
		try { //closingdate+1 and + 15 mins
			d = sdf.parse(pi.getSchedule_at());
			cal.setTime(d);
			cal.add(Calendar.DATE,1);
			cal.add(Calendar.MINUTE, 15);
			Date d1 = cal.getTime();
			
			System.out.println("cal: "+cal);
			System.out.println("date d1: "+d1);
			schedule_data.addSchedule(new ScheduleEntry(merchant_uid, d1, BigDecimal.valueOf(100)));
			
			IamportResponse<List<Schedule>> schedule_response = client.subscribeSchedule(schedule_data);
			System.out.println("예약 요청 !");
			System.out.println("schedule_response : "+schedule_response);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		java.sql.Date now = new java.sql.Date(new java.util.Date().getTime());
		
		Purchase_Item purItem = new Purchase_Item(merchant_uid, customer_uid, pi.getEmail(), item_code, 
				pi.getType_code(), pi.getAmount(), now, null, null, null, null);
		//customer_uid, merchant_uid update!! payment_Info insert!!
		service.insertPurchaseItem(purItem);//스케줄된 Purchase_Item insert!!
		
		Payment_Info payInfo = new Payment_Info(merchant_uid, pi.getNickname(), pi.getEmail(), pi.getDel_name(), pi.getDel_phone(),
				pi.getZip_code(), pi.getAddr1(), pi.getAddr2(), pi.getCard_owner(), pi.getCardnum(),
				pi.getBirthdate(), pi.getPur_type(), pi.getExp_month(), pi.getExp_year(), pi.getCardpwd(),
				pi.getAmount(), pi.getSchedule_at(), pi.getType_code());
		service.insertPaymentInfo(payInfo);//구매금액 아이템 Payment_Info 테이블 업데이트.
		
		//Type purnum update!! 아이템 Item 테이블 팔린 금액 더하기.
		service.updateType(pi.getType_code());
		service.updateSum(pi.getAmount(),pi.getType_code());
		
		//이후 뷰단으로 돌아가서 ajax로  결제 컨펌 이메일과 쪽지 보내기.(결제파트 완료)

		/*cal.set(Calendar.YEAR, Integer.parseInt(closingdate.substring(0,4)));
		cal.set(Calendar.MONTH, Integer.parseInt(closingdate.substring(4,6))-1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(closingdate.substring(6,8))+1);
		cal.set(Calendar.HOUR, 00);
		cal.set(Calendar.MINUTE, 10);*/
	}
	public void canclePayment(Purchase_Item pItem) {
		UnscheduleData unschedule_data = new UnscheduleData(pItem.getCustomer_uid());
		unschedule_data.addMerchantUid(pItem.getMerchant_uid());
		
		IamportResponse<List<Schedule>> unschedule_response = client.unsubscribeSchedule(unschedule_data);
		List<Schedule> cancelled_schedule = unschedule_response.getResponse();
		System.out.println("cancelled_schedule: "+cancelled_schedule);
		//스케줄된 purchase_item 테이블 cancel 칼럼 업데이트!!
		//Type purnum 한개빼는것 update!! 아이템 Item 테이블 팔린 금액 빼기.
		//취소 이메일 메세지
	}
	
	private String getMerchantUid(Long type_code) {
		DateFormat df = new SimpleDateFormat("$$hhmmssSS");
		//int n = (int) (Math.random() * 100) + 1;		
		return type_code + "_" + df.format(new Date());
	}
	private String getCustomerUid(String email) {
		DateFormat df = new SimpleDateFormat("$$hhmmssSS");
		//int n = (int) (Math.random() * 100) + 1;		
		return email+ "_" + df.format(new Date());
	}
}
