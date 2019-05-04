<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="member_ordereach_header.jsp" %>
<!doctype html> 
<html class="no-js">
<!doctype html>
<html lang="en-US">


<body class="home page-template page-template-page-templates page-template-template_page-builder page-template-page-templatestemplate_page-builder-php page page-id-4 wp-custom-logo menuStyle2 menuContained sticky-header elementor-default elementor-page elementor-page-4">
	<div id="page" class="site">
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>

		
<!-- MAIN -->
		<div id="main">
		<c:forEach items="${listO}" var="listO">
			<div class="wrapper cf">	
			<!-- page content-->
      	<div id="page-content" class="cf">
      	<div class="tab2">
				  <button class="tablinks" type="button"><i class="fas fa-check-circle" style="color:#ffffff"></i> 주문서보기</button>
				</div>
				<div id="London" class="tabcontent2" style="display: block;">
					<p>
						<table class="type01" style="margin: 0 auto;">
						<tr>
					        <th width="30%">판매자ID</th>
					       <!-- 원래코드  <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${product.id}" id="sellerID" readonly></td>-->
					  		 <td><input class = "form-control" style="border:0;background:#fff" type="text" value="<c:out value="${listO.nickname}"/>" id="sellerID" readonly></td>
					   		
					    </tr>
					    <tr>
					        <th width="30%">상품제목</th>
					       <!-- 원래코드 <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${product.subject}" id="subject" readonly></td> -->
					   		 <td><input class = "form-control" style="border:0;background:#fff" type="text" value="<c:out value="${listO.title}"/>" id="subject" readonly></td>					 
					    </tr>
						</table>
						<br/>
					</p>
						<p>
						
						<table class="type09" style="margin: 0 auto;">
					    <thead>
					    <tr>
					        <th scope="cols" width="40%">옵션</th>
					        <th scope="cols">갯수</th>
					        <th scope="cols">가격</th>
					    </tr>
					    </thead>
					    <tbody>
<%-- 					    	<c:forEach items="${sale_option}" var="listOption"> --%>
<!-- 					    		<tr> -->
<%-- 							    	<th scope="row">${listOption.option_name}</th> --%>
<%-- 							    	<td>${listOption.sale_option_qty}개</td> --%>
<%-- 									<td><fmt:formatNumber value="${listOption.option_price*listOption.sale_option_qty}" type="number"/>원</td> --%>
<!-- 								</tr> -->
<%-- 								</c:forEach> --%>
								<tr>
							    	<th scope="row"><c:out value="${listO.name}"/></th>
							    	<td>1 개</td>
									<td><fmt:formatNumber value="${listO.price}" type="number"/>원</td>
								</tr>
					    </tbody>
					</table >
					<br/>
				</p>
				
				<p>
					<table class="type01" style="margin: 0 auto;">
						<tr>
					        <th width="30%">구매자이름</th>
					     <!-- 원본  <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${member.name}" id="memberName" readonly></td>-->  
					  		<td><input class = "form-control" style="border:0;background:#fff" type="text" value="<c:out value="${listO.del_name}"/>" id="memberName" readonly></td>
					  
					    </tr>
			    	    <tr>
					        <th width="30%">핸드폰</th>
					        <!-- 원본<td><input class = "form-control" style="border:0;background:#fff" type="text" value="${member.phone}" id="memberPhone" name="memberPhone" maxlength="13" readonly></td> -->
					   		<td><input class = "form-control" style="border:0;background:#fff" type="text" value="<c:out value="${listO.del_phone}"/>" id="memberPhone" name="memberPhone" maxlength="13" readonly></td>
					    </tr>	
					    <tr>
					        <th>주소</td>
					       <!-- 원본 <td><input value="${member.address}" class = "form-control" style="border:0;background:#fff" id = "address1" name = "address1" readonly></td> -->
					   		<td><input value="<c:out value="${listO.addr1}"/>" class = "form-control" style="border:0;background:#fff" id = "<c:out value="${listO.addr1}"/>" name = "address1" readonly></td>					   
					    </tr>
					    <tr>
					        <th>상세주소</td>
					     <!-- 원본   <td><input value="${member.detail_address}" class = "form-control" style="border:0;background:#fff;"  id = "address2" name = "address2" readonly></td> -->
					  		<td><input value="<c:out value="${listO.addr2}"/>" class = "form-control" style="border:0;background:#fff;"  id = "<c:out value="${listO.addr2}"/>" name = "address2" readonly></td>
					    </tr>
					</table>
			
				</p>
				
<!-- 				<p><table class="type04" style="margin: 0 auto;"> -->
<!-- 							<tr> -->
<!-- 					        <th>가격</th> -->
<!-- 					        <th></th> -->
<!-- 					        <th>배송비</th> -->
<!-- 					        <th></th> -->
<!-- 					        <th>총가격</th> -->
<!-- 					    </tr> -->
<!-- 					    <tr> -->
<!-- 					       원본 <td><fmt:formatNumber value="${sale.sale_amount-sale.sale_shippay}" type="number"/></td> -->
<!-- 					        <td><fmt:formatNumber value="20000" type="number"/></td>					         -->
<!-- 					        <td><i class="fas fa-plus"></i></td> -->
<!-- 					        원본<td><fmt:formatNumber value="${sale.sale_shippay}" type="number"/></td> -->
<!-- 					        <td><fmt:formatNumber value="2500" type="number"/></td> -->
					        
<!-- 					        <td><i class="fas fa-equals"></i></td> -->
<!-- 					       원본  <td scope="row" style="color:red;font-weight: bold;"><fmt:formatNumber value="${sale.sale_amount}" type="number"/>원</td> -->
<!-- 					  	<td scope="row" style="color:red;font-weight: bold;"><fmt:formatNumber value="22500" type="number"/>원</td>					   -->
<!-- 					    </tr> -->
<!-- 					</table></p> -->
				
				
				<p>
				<table class="type04" style="margin: 0 auto;">
							<tr>
					        <th>배송상태</th>
					        <th>배송추적</th>
					        <th>주문취소</th>
					    </tr>
					    <tr>
					        <td><c:out value="${listO.pur_state}"/></td>
					       <!--   window.open(http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=6065711418803,'popup', 'width=585,height=340,left=0,top=0,scrollbars=no');
					        
					        -->
					        <td>
					        <a href="#" onclick="window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=6065711418803', '_blank', 'width=550 height=500')">추적하기</a>
					        </td>
					        <c:choose>
					        <c:when test="${listO.pur_state eq '주문 취소중'}">
					         <td>취소중</td>
					         </c:when>
					        <c:otherwise>
					       	<td><button onclick="button_event();">취소하기</button></td>
					       	</c:otherwise>
					       	</c:choose>
					    </tr>
					</table>
				</p>
				</div>
				<!-- ENDS form -->				
    		</div>
    		<!-- ENDS page content-->
			</div><!-- ENDS WRAPPER -->
			</c:forEach>
		</div>
		<!-- ENDS MAIN -->
		


<script type='text/javascript'>
	function button_event(){
		if(confirm("정말 주문을 취소하시겠습니까?")==true){
    		location.href=window.location.href+"/cancel";
		}else{
			return;
		}
	}
</script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/slick/slick.min.js?ver=1.8.1'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/airi-pro//js/elementor.js?ver=20181010'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/imagesloaded.min.js?ver=3.2.0'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/vendor/navigation.js?ver=20180717'></script>
	<script type='text/javascript'>
		/* <![CDATA[ */
		var wpcf7 = {
			"apiSettings": {
				"root": "https:\/\/demo.athemes.com\/airi-portfolio\/wp-json\/contact-form-7\/v1",
				"namespace": "contact-form-7\/v1"
			},
			"recaptcha": {
				"messages": {
					"empty": "Please verify that you are not a robot."
				}
			}
		};
		/* ]]> */
	</script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/contact-form-7/includes/js/scripts.js?ver=5.0.2'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/vendor/skip-link-focus-fix.js?ver=20151215'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/vendor/scripts.js?ver=20180223'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/custom/custom.min.js?ver=20180223'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/wp-embed.min.js?ver=4.9.9'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/kirki/modules/webfont-loader/vendor-typekit/webfontloader.js?ver=3.0.28'></script>
	<script type='text/javascript'>
		WebFont.load({
			google: {
				families: ['Work Sans:500,400:cyrillic,cyrillic-ext,devanagari,greek,greek-ext,khmer,latin,latin-ext,vietnamese,hebrew,arabic,bengali,gujarati,tamil,telugu,thai']
			}
		});
	</script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/ui/position.min.js?ver=1.11.4'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/dialog/dialog.min.js?ver=4.5.0'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/waypoints/waypoints.min.js?ver=4.0.2'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/swiper/swiper.jquery.min.js?ver=4.4.3'></script>
	<script type='text/javascript'>
		/* <![CDATA[ */
		var elementorFrontendConfig = {
			"isEditMode": "",
			"is_rtl": "",
			"breakpoints": {
				"xs": 0,
				"sm": 480,
				"md": 768,
				"lg": 1025,
				"xl": 1440,
				"xxl": 1600
			},
			"version": "2.2.6",
			"urls": {
				"assets": "https:\/\/demo.athemes.com\/airi-portfolio\/wp-content\/plugins\/elementor\/assets\/"
			},
			"settings": {
				"page": [],
				"general": {
					"elementor_global_image_lightbox": "yes",
					"elementor_enable_lightbox_in_editor": "yes"
				}
			},
			"post": {
				"id": 4,
				"title": "Home",
				"excerpt": ""
			}
		};
		/* ]]> */
	</script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/js/frontend.min.js?ver=2.2.6'></script>
<!-- 주문서시작 -->
<script type="text/javascript">
var dtd_companys = new Array();
dtd_companys["우체국택배"] = new Array(13, "http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=","1234567890123 (13자리)","1588-1300","http://parcel.epost.go.kr");
dtd_companys["대한통운"] = new Array(10, "http://www.doortodoor.co.kr/servlets/cmnChnnel?tc=dtd.cmn.command.c03condiCrg01Cmd&invc_no=","1234567890 (10자리)", "1588-1255", "http://www.doortodoor.co.kr");
dtd_companys["한진택배"] = new Array(12, "http://www.hanjin.co.kr/Delivery_html/inquiry/result_waybill.jsp?wbl_num=", "1234567890 (10,12자리)", "1588-0011", "http://hanex.hanjin.co.kr");
dtd_companys["로젠택배"] = new Array(11, "http://www.ilogen.com/iLOGEN.Web.New/TRACE/TraceView.aspx?gubun=slipno&slipno=", "12345678901 (11자리)","1588-9988", "http://www.ilogen.com");
dtd_companys["현대택배"] = new Array(12, "http://www.hlc.co.kr/hydex/jsp/tracking/trackingViewCus.jsp?InvNo=", "1234567890 (10,12자리)", "1588-2121", "http://www.hlc.co.kr");
dtd_companys["KG옐로우캡택배"] = new Array(11, "http://www.yellowcap.co.kr/custom/inquiry_result.asp?invoice_no=", "12345678901 (11자리)", "1588-0123", "http://www.yellowcap.co.kr");
dtd_companys["KGB택배"] = new Array(10, "http://www.kgbls.co.kr/sub5/trace.asp?f_slipno=", "1234567890 (10자리)", "1577-4577", "http://www.kgbls.co.kr");
dtd_companys["EMS"] = new Array(13, "http://service.epost.go.kr/trace.RetrieveEmsTrace.postal?ems_gubun=E&POST_CODE=", "EE123456789KR (13자리)", "1588-1300", "http://service.epost.go.kr");
dtd_companys["DHL"] = new Array(0, "http://www.dhl.co.kr/publish/kr/ko/eshipping/track.high.html?pageToInclude=RESULTS&type=fasttrack&AWB=", "1234567890 (10자리)", "1588-0001", "http://www.dhl.co.kr");
dtd_companys["한덱스"] = new Array(10, "http://btob.sedex.co.kr/work/app/tm/tmtr01/tmtr01_s4.jsp?IC_INV_NO=", "1234567890 (10자리)", "1588-9040", "http://www.e-handex.co.kr");
dtd_companys["FedEx"] = new Array(12, "http://www.fedex.com/Tracking?ascend_header=1&clienttype=dotcomreg&cntry_code=kr&language=korean&tracknumbers=", "123456789012 (12자리)", "080-023-8000", "http://www.fedex.com/kr");
dtd_companys["동부익스프레스"] = new Array(12, "http://www.dongbuexpress.co.kr/Html/Delivery/DeliveryCheckView.jsp?item_no=", "123456789012 (12자리)", "1588-8848", "http://www.dongbuexpress.co.kr");
dtd_companys["CJ GLS"] = new Array(12, "http://nexs.cjgls.com/web/service02_01.jsp?slipno=", "123456789012 (12자리)", "1588-5353", "http://www.cjgls.co.kr");
dtd_companys["UPS"] = new Array(25, "http://www.ups.com/WebTracking/track?loc=ko_KR&InquiryNumber1=", "M1234567890 (최대 25자리)", "1588-6886", "http://www.ups.com/content/kr/ko/index.jsx" );
dtd_companys["하나로택배"] = new Array(10, "http://www.hanarologis.com/branch/chase/listbody.html?a_gb=center&a_cd=4&a_item=0&fr_slipno=", "1234567890 (최대 10자리)", "1577-2828", "http://www.hanarologis.com");
dtd_companys["대신택배"] = new Array(13, "http://home.daesinlogistics.co.kr/daesin/jsp/d_freight_chase/d_general_process2.jsp?", "1234567890123 (13자리)", "043-222-4582", "http://apps.ds3211.co.kr");
dtd_companys["경동택배"] = new Array(11, "http://www.kdexp.com/sub4_1.asp?stype=1&p_item=", "12345678901 (최대11자리)", "031-460-2400", "http://www.kdexp.com/");
dtd_companys["이노지스택배"] = new Array(13, "http://www.innogis.net/trace02.asp?invoice=", "1234567890123 (최대13자리)", "1566-4082", "http://www.innogis.net/");
dtd_companys["일양로지스택배"] = new Array(9, "http://www.ilyanglogis.com/functionality/tracking_result.asp?hawb_no=", "123456789 (9자리)", "1588-0002", "http://www.ilyanglogis.com/");
dtd_companys["CVSnet 편의점택배"] = new Array(10, "http://was.cvsnet.co.kr/src/ctod_status.jsp?invoice_no=", "1234567890 (10자리)", "1566-1025", "http://www.cvsnet.co.kr/");
dtd_companys["TNT Express"] = new Array(13, "http://www.tnt.com/webtracker/tracking.do?respCountry=kr&respLang=ko&searchType=CON&cons=", "GE123456789WW (9,13자리)", "1588-0588", "http://www.tnt.com/express/ko_kr/site/home.html");
dtd_companys["HB한방택배"] = new Array(12, "http://www.hbtb.co.kr/search/s_search.asp?f_slipno=", "123456789012 (12자리)", "1588-1059", "http://www.hbtb.co.kr/");
dtd_companys["GTX"] = new Array(12, "http://www.gtx2010.co.kr/del_inquiry_result.html?s_gbn=1&awblno=", "123456789012 (12자리)", "1588-1756", "http://www.gtx2010.co.kr");

//var dtd_select_obj = document.getElementById('dtd_select');
var dtd_select_obj = $("#dtd_select");
var company = $("#dtd_select").val();
//var company = dtd_select_obj.options[dtd_select_obj.selectedIndex].value;
if(company == "" ) company = "우체국택배";
console.log("company: "+company);

function doorToDoorSearch()
{
 var query_obj = document.getElementById('dtd_number_query');
 var query = query_obj.value;
 query = query.replace(' ', '');
 var url = "";
 company = $("#dtd_select").val();
 console.log("url: "+url);
 console.log("company: "+company);
 /* 운송장 번호 값 확인 */
 if (company == "UPS") {
  var pattern1 = /^[0-9a-zA-Z]{9,12}$/i;
  var pattern2 = /^[0-9a-zA-Z]{18}$/i;
  var pattern3 = /^[0-9a-zA-Z]{25}$/i;
  if (query.search(pattern1) == -1 && query.search(pattern2) == -1 && query.search(pattern3) == -1) {
   alert(company+"의 운송장 번호 패턴에 맞지 않습니다.");
   query_obj.focus();
   return false;
  }
 } else if (company == "EMS") {
  var pattern = /^[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}$/;
  if (query.search(pattern) == -1) {
   alert(company+"의 운송장 번호 패턴에 맞지 않습니다.");
   query_obj.focus();
   return false;
  }
 } else if (company == "한진택배" || company == "현대택배") {
  if (!isNumeric(query)) {
   alert("운송장 번호는 숫자만 입력해주세요.");
   query_obj.focus();
   return false;
  } else if ( query.length != 10 && query.length != 12 ) {
   alert(company+"의 운송장 번호는 10자리 또는 12자리의 숫자로 입력해주세요.");
   query_obj.focus();
   return false;
  }
 } else if (company == "경동택배") {
  if (!isNumeric(query)) {
   alert("운송장 번호는 숫자만 입력해주세요.");
   query_obj.focus();
   return false;
  } else if (query.length != 9 && query.length != 10 && query.length != 11) {
   alert(company+"의 운송장 번호는 9자리 또는 10자리 또는 11자리의 숫자로 입력해주세요.");
   query_obj.focus();
   return false;
  }
 } else if (company == "이노지스택배") {
  if (!isNumeric(query)) {
   alert("운송장 번호는 숫자만 입력해주세요.");
   query_obj.focus();
   return false;
  } else if (query.length > 13) {
   alert(company+"의 운송장 번호는 최대 13자리의 숫자로 입력해주세요.");
   query_obj.focus();
   return false;
  }
 } else if (company == "TNT Express") {
  var pattern1 = /^[a-zA-Z]{2}[0-9]{9}[a-zA-Z]{2}$/;
  var pattern2 = /^[0-9]{9}$/;
  if (query.search(pattern1) == -1 && query.search(pattern2) == -1) {
   alert(company+"의 운송장 번호 패턴에 맞지 않습니다.");
   query_obj.focus();
   return false;
  }
 } else {
  if (!isNumeric(query)) {
   alert("운송장 번호는 숫자만 입력해 주세요.");
   query_obj.focus();   
   return false;
  } else if (dtd_companys[company][0] > 0 && dtd_companys[company][0] != query.length) {
   alert(company+"의 운송장 번호는 "+dtd_companys[company][0]+"자리의 숫자로 입력해 주세요.");
   query_obj.focus();   
   return false;
  }
 }
 /* 링크만들기 */
 if (company == "대신택배") {
  url = dtd_companys[company][1];
  url+= "billno1="+query.substring(0,4);
  url+= "&billno2="+query.substring(4,7);
  url+= "&billno3="+query.substring(7,13);
 } else if (dtd_companys[company][1]) {
  url = dtd_companys[company][1]+query;
 }
 window.open(url,'popup', 'width=585,height=340,left=0,top=0,scrollbars=no');
}

function isNumeric(s) {
 var count = 0;
 for (i = 0; i < s.length; i++) {

  if(s.charAt(i)<'0' || s.charAt(i)>'9') {
   count++;
  }
 }
 if(count > 0) {
  return 0;
 } else {
  return 1;
 }
}

function SetDeleveryContents(idx) {
 company = dtd_select_obj.options[idx].value;
 document.getElementById("Dcs01").innerHTML = dtd_companys[company][2];
 document.getElementById("Dcs02").innerHTML = company;
 document.getElementById("Dcs03").innerHTML = dtd_companys[company][3];
 document.getElementById("Dcs04").href  = dtd_companys[company][4];
 document.getElementById("Dcs04").target  = "_blank";
 
}

function checkValidDoor(query) {
 /* 운송장 번호 값 확인 */
 if (company == "UPS") {
  var pattern1 = /^1z[0-9]{16}$/i;
  var pattern2 = /^M[0-9]{10}$/;
  if (query.search(pattern1) == -1 && query.search(pattern2) == -1) {
   lert(company+"의 운송장 번호 패턴에 맞지 않습니다.");
   document.door_to_door_frm.dtd_number_query.focus();
   return false;
  }
 } else if (company == "EMS") {
  var pattern = /^[a-zA-z]{2}[0-9]{9}[a-zA-z]{2}$/;
  if (query.search(pattern) == -1) {
   alert(company+"의 운송장 번호 패턴에 맞지 않습니다.");
   document.door_to_door_frm.dtd_number_query.focus();
   return false;
  }
 } else if (company == "SC 로지스" || company == "한진택배" || company == "현대택배") {
  if (!isNumeric(query)) {
   alert("운송장 번호는 숫자만 입력해주세요.");
   document.door_to_door_frm.dtd_number_query.focus();
   return false;
  } else if ( query.length != 10 && query.length != 12 ) {
   alert(company+"의 운송장 번호는 10자리 또는 12자리의 숫자로 입력해주세요.");
   document.door_to_door_frm.dtd_number_query.focus();
   return false;
  }
 } else {
  if (!isNumeric(query)) {
   alert("운송장 번호는 숫자만 입력해 주세요.");
   document.door_to_door_frm.dtd_number_query.focus();   
   return false;
  } else if (dtd_companys[company][0] > 0 && dtd_companys[company][0] != query.length) {
   alert(company+"의 운송장 번호는 "+dtd_companys[company][0]+"자리의 숫자로 입력해 주세요.");
   document.door_to_door_frm.dtd_number_query.focus();   
   return false;
  } 
 }

}

</script>
<!-- 주문서끝 -->
</body>

</html>
