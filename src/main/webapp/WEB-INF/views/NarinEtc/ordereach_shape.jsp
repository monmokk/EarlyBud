<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  </%@ page import="soo.mjk.model.Member" %/> -->
<!doctype html> 
<html class="no-js">

<head>

		<meta http-equiv=”Cache-Control” content=”no-cache”/> 
		<meta http-equiv=”Expires” content=”0″/> 
		<meta http-equiv=”Pragma” content=”no-cache”/>

		<meta charset="utf-8"/>
		<title>FOLDER TEMPLATE</title>
			
		<!-- https://getbootstrap.com/docs/4.0/getting-started/introduction/   js는 </body> 바로 앞에 있음. -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
			
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link rel="stylesheet" media="all" href="${root}css/style.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<!-- Adding "maximum-scale=1" fixes the Mobile Safari auto-zoom bug: http://filamentgroup.com/examples/iosScaleBug/ -->		
				
		<!-- JS -->
		
		<!--  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>-->
		<script src="${root}js/jquery-1.7.1.min.js"></script>
		<script src="${root}js/custom.js"></script>
		<script src="${root}js/tabs.js"></script>
		<script src="${root}js/css3-mediaqueries.js"></script>
		<script src="${root}js/jquery.columnizer.min.js"></script>
		
		<!-- Isotope -->
		<script src="${root}js/jquery.isotope.min.js"></script>
		
		<!-- Lof slider -->
		<script src="${root}js/jquery.easing.js"></script>
		<script src="${root}js/lof-slider.js"></script>
		<link rel="stylesheet" href="${root}css/lof-slider.css" media="all"  /> 
		<!-- ENDS slider -->
		
		<!-- Tweet -->
		<link rel="stylesheet" href="${root}css/jquery.tweet.css" media="all"  /> 
		<script src="${root}js/tweet/jquery.tweet.js" ></script> 
		<!-- ENDS Tweet -->
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="${root}css/superfish.css" /> 
		<script  src="${root}js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script  src="${root}js/superfish-1.4.8/js/superfish.js"></script>
		<script  src="${root}js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<!-- prettyPhoto -->
		<script  src="${root}js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="${root}js/prettyPhoto/css/prettyPhoto.css"  media="screen" />
		<!-- ENDS prettyPhoto -->
		
		<!-- poshytip -->
		<link rel="stylesheet" href="${root}js/poshytip-1.1/src/tip-twitter/tip-twitter.css"  />
		<link rel="stylesheet" href="${root}js/poshytip-1.1/src/tip-yellowsimple/tip-yellowsimple.css"  />
		<script  src="${root}js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		<!-- JCarousel -->
		<script type="text/javascript" src="${root}js/jquery.jcarousel.min.js"></script>
		<link rel="stylesheet" media="screen" href="${root}css/carousel.css" /> 
		<!-- ENDS JCarousel -->
		
		<!-- GOOGLE FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Voltaire' rel='stylesheet' type='text/css'>

		<!-- modernizr -->
		<script src="${root}js/modernizr.js"></script>
		
		<!-- SKIN -->
		<link rel="stylesheet" media="all" href="${root}css/skin.css"/>
		
		<!-- Less framework -->
		<link rel="stylesheet" media="all" href="${root}css/lessframework.css"/>
		
		<!-- jplayer -->
		<link href="${root}player-skin/jplayer-black-and-yellow.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${root}js/jquery.jplayer.min.js"></script>
		
		<!-- flexslider -->
		<link rel="stylesheet" href="${root}css/flexslider.css" >
		<script src="${root}js/jquery.flexslider.js"></script>
		
		
		<!-- reply move form -->
		<script src="${root}js/moveform.js"></script>
		
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"> 
	 
	 <style>
		 .tab2 {
		    overflow: hidden;
		    /*border: 1px solid #ccc;*/
		    border: 1px solid #999;
		    background-color: #333333;
		    font-family: Tahoma,'Noto Sans Korean', 'Malgun Gothic', '맑은 고딕', AppleSDGothicNeo, Helvetica, dotum, 돋움, sans-serif;
		    height:65px;
		    
		}
		.tab2 button {
				font-weight: bold;
		    background-color: inherit;
		    color:#ffffff;
		    float: left;
		    border: none;
		    outline: none;
		    cursor: pointer;
		    padding: 14px 16px;
		    transition: 0.3s;
		    font-size: 25px;
		    height:48px;
		}
		.tab2 button:hover {
		    /*background-color: #ddd;*/
		    color:#ffffff;
		}
		.tabcontent2 {
		    display: none;
		    padding: 6px 12px;
		    /*padding: 6px 0 6px 0;*/
		    border: 1px solid #999;
		    border-top: none;
		}
		/* Create an active/current tablink class */
		.tab2 button.active {
		    font-weight: bold;
		    border-bottom: 2px solid #ff0000;
		    color:#ffffff;
		}
		.select_table table[id=buytable]{
		font-size: 14px; 
		width: 100%; /* 원하는 너비설정 */ 
		padding: .8em .5em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */
		/*border: 1px solid #999;*/
		border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none;
}
.select_table table input,
.select_table table button[class=mybtn2]{
		font-size: 14px; 
		width: 100%; /* 원하는 너비설정 */
		height:100%; 
		padding: .8em .5em; /* 여백으로 높이 설정 */ 
		font-family: inherit; /* 폰트 상속 */
		/*border: 1px solid #999;*/
		border-radius: 0px; /* iOS 둥근모서리 제거 */ 
		-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
		-moz-appearance: none; 
		appearance: none;
		border:0;
}
.select_table table input[name=item_count],
.select_table table input[name=item_price]{
	text-align: center;
}
.select_table table tr{
	border:1px solid #a9a9a9;
	/*background-color:#a9a9a9;*/
}

table.type09 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
    width:90%;
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #000;
    border-bottom: 1px solid #ccc;
}
table.type09 tbody th {
    /*width: 150px;*/
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    color: black;
}
table.type09 td {
    /*width: 350px;*/
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    color: black;
}
table.type04 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 3px solid #036;
    border-bottom: 3px solid #036;
 		/*margin : 20px 10px;*/
 		width:90%;
 		color: #369;
}
table.type04 th {
    /*width: 150px;*/
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    color:black;
}
table.type04 td {
    /*width: 350px;*/
    padding: 10px;
    vertical-align: top;
    /*border-bottom: 1px solid #ccc;*/
    color:black;
}
table.type01 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    border-top: 3px solid #036;
    border-bottom: 3px solid #036;
 		/*margin : 20px 10px;*/
 		width:90%;
 		color: #369;
}
table.type01 th {
    /*width: 150px;*/
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-right: 1px solid #ccc;
    color:black;
}
table.type01 td {
    /*width: 350px;*/
    /*padding: 10px;*/
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    color:black;
}
<!--
</%

	String joinOrLogin = "로그인/회원가입";
	String action = "login.do";
	HttpSession session = request.getSession();
	String id = "";
	if(session.getAttribute("userLoginInfo")!=null){
		joinOrLogin = "로그아웃";
		action = "logout";
		id = ((Member)session.getAttribute("userLoginInfo")).getId();
		System.out.println("action: "+action);
		System.out.println("id: "+id);
		request.setAttribute("joinOrLogin",joinOrLogin); 
	}else{		
		request.setAttribute("joinOrLogin",joinOrLogin);
		System.out.println("로그아웃중");
	%>
		<script type="text/javascript"> 
		$(function(){
				console.log("다시 로그인.");
				alert("다시 로그인 해주세요");
				location.href="/team";
				location.replace("/team");

		});
		</script>
	</%
	}
	%/> -->
	<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
	</style>
	<!--  <input  value="검토요청" name="submit2" id="submit2" type="submit"/> -->
	</head>
	
	
	<body class="page" onload="">
	
		<!-- HEADER -->
		<header>
			<div class="wrapper cf">
				
				<div id="logo">
					<a href="${root}./"><img  src="${root}img/gonggu_logo.png" alt="Simpler"></a>
				</div>
				
				<!-- nav -->
				<ul id="nav" class="sf-menu">
					<li><a href="${root}./"><span>홈</span></a></li>
					<li><a href="${root}write.do">상품올리기</a></li>
					<li><a href="${root}list/category/0">카테고리</a>
						<ul>
							<c:forEach items="${list_category}" var="list_category">
								<c:if test="${list_category.category_code eq 0}">
									<li><a href="${root}list/category/${list_category.category_code}">전체보기</a></li>
								</c:if>
								<c:if test="${list_category.category_code ne 0}">
									<li><a href="${root}list/category/${list_category.category_code}">${list_category.category_name}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</li>
					<!--  <li><a href="portfolio.do">WORK</a></li>-->
					<!-- <li><a href="#"></%=id%/>님 정보</a> -->
						<ul>
							<li><a href="${root}./mypage/mybuy.do">내가 산 물건</a></li>
							<li><a href="${root}./mypage/mybuy.do">내가 판 물건</a></li>
							<li><a href="#">프로필 설정</a></li>
						<!--  <li><a href="${root}</%=action%/>">로그아웃</a></li> -->
						</ul>
					</li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->

			</div>
		</header>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
		<div id="main">
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
					        <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${product.id}" id="sellerID" readonly></td>
					    </tr>
					    <tr>
					        <th width="30%">상품제목</th>
					        <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${product.subject}" id="subject" readonly></td>
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
					    
					    	<c:forEach items="${sale_option}" var="listOption">
					    		<tr>
							    	<th scope="row">${listOption.option_name}</th>
							    	<td>${listOption.sale_option_qty}개</td>
									<td><fmt:formatNumber value="${listOption.option_price*listOption.sale_option_qty}" type="number"/>원</td>
								</tr>
								</c:forEach>
					    </tbody>
					</table >
					<br/>
				</p>
				
				<p>
					<table class="type01" style="margin: 0 auto;">
						<tr>
					        <th width="30%">구매자이름</th>
					        <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${member.name}" id="memberName" readonly></td>
					    </tr>
			    	    <tr>
					        <th width="30%">핸드폰</th>
					        <td><input class = "form-control" style="border:0;background:#fff" type="text" value="${member.phone}" id="memberPhone" name="memberPhone" maxlength="13" readonly></td>
					    </tr>	
					    <tr>
					        <th>주소</td>
					        <td><input value="${member.address}" class = "form-control" style="border:0;background:#fff" id = "address1" name = "address1" readonly></td>
					    </tr>
					    <tr>
					        <th>상세주소</td>
					        <td><input value="${member.detail_address}" class = "form-control" style="border:0;background:#fff;"  id = "address2" name = "address2" readonly></td>
					    </tr>
					</table>
			
				</p>
				<p>
				<table class="type04" style="margin: 0 auto;">
							<tr>
					        <th>가격</th>
					        <th></th>
					        <th>배송비</th>
					        <th></th>
					        <th>총가격</th>
					    </tr>
					    <tr>
					        <td><fmt:formatNumber value="${sale.sale_amount-sale.sale_shippay}" type="number"/></td>
					        <td><i class="fas fa-plus"></i></td>
					        <td><fmt:formatNumber value="${sale.sale_shippay}" type="number"/></td>
					        <td><i class="fas fa-equals"></i></td>
					        <td scope="row" style="color:red;font-weight: bold;"><fmt:formatNumber value="${sale.sale_amount}" type="number"/>원</td>
					    </tr>
					</table>
				</p>
				
				<p>
				<table class="type04" style="margin: 0 auto;">
							<tr>
					        <th>배송상태</th>
					        <th>배송추적</th>
					        <th>총가격</th>
					    </tr>
					    <tr>
					        <td>주문완료</td>
					       <!--   window.open(http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=6065711418803,'popup', 'width=585,height=340,left=0,top=0,scrollbars=no');
					        
					        -->
					        <td>
					        <a href="#" onclick="window.open('http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=6065711418803', '_blank', 'width=550 height=500')">추적하기</a>
					        </td>
					       	<td scope="row" style="color:red;font-weight: bold;">수취확인버튼</td>
					    </tr>
					</table>
				</p>
				</div>
				<!-- ENDS form -->				
    		</div>
    		<!-- ENDS page content-->
			</div><!-- ENDS WRAPPER -->
		</div>
		<!-- ENDS MAIN -->
		<script>
		</script>
		  <!-- 
		<form name="door_to_door_frm" onSubmit="doorToDoorSearch();return false;">
  <select name="dtd_select" id="dtd_select" >
    <option value="경동택배" selected>경동택배</option>
    <option value="대신택배">대신택배</option>
    <option value="대한통운">대한통운</option>
    <option value="동부익스프레스">동부익스프레스</option>
    <option value="로젠택배">로젠택배</option>
    <option value="우체국택배">우체국택배</option>
    <option value="이노지스택배">이노지스택배</option>
    <option value="일양로지스택배">일양로지스택배</option>
    <option value="하나로택배">하나로택배</option>
    <option value="한덱스">한덱스</option>
    <option value="한진택배">한진택배</option>
    <option value="현대택배">현대택배</option>
    <option value="CJ GLS">CJ GLS</option>
    <option value="CVSnet 편의점택배">CVSnet 편의점택배</option>
    <option value="DHL">DHL</option>
    <option value="EMS">EMS</option>
    <option value="FedEx">FedEx</option>
    <option value="GTX">GTX</option>
    <option value="HB한방택배">HB한방택배</option>
    <option value="KG옐로우캡택배">KG옐로우캡택배</option>
    <option value="KGB택배">KGB택배</option>
    <option value="TNT Express">TNT Express</option>
    <option value="UPS">UPS</option>
  </select>

  <input type="text" style="width:201px;" class="input_off" name="dtd_number_query" id="dtd_number_query" value="'-'를 제외하고 입력하세요." onClick="this.value=''">
  <input type="submit" value="조회">
  
</form>
	 -->	
		
		
		
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


		
		
		<!-- FOOTER -->
		<footer>
			<div class="wrapper cf">
			
				<!-- widgets -->
				<ul  class="widget-cols cf">
					<li class="first-col">
						<div class="widget-block">
							<div id="tweets" class="footer-col tweet">
		         				<h4>
		         					<a href="./">이용약관</a>
		         				</h4>
		         			</div>
						</div>
					</li>
					
					<li class="second-col">
						<div class="widget-block">
							<div id="tweets" class="footer-col tweet">
		         				<h4>
		         					<a href="./">개인정보 보호정책</a>
		         				</h4>
		         			</div>
						</div>
					</li>
					
					<li class="third-col">
						
						<div class="widget-block">
							<div id="tweets" class="footer-col tweet">
		         				<h4>
		         					<a href="./">고객센터</a>
		         				</h4>
		         			</div>
		         		</div>
		         		
					</li>
					
					<li class="fourth-col">
						<div class="widget-block">
							<div id="tweets" class="footer-col tweet">
		         				<h4>
		         					<a href="./">Q&A</a>
		         				</h4>
		         			</div>
						</div>
					</li>	
				</ul>
				<!-- ENDS widgets -->	
				
				
				<!-- bottom -->
				<div class="footer-bottom">
					<div class="left">텀블벅(주) | 대표 염재승 105-87-52823 | 서울시 중구 삼일대로 343, 13층 |<br/> 통신판매업 2017-서울중구-1156 | 대표전화 02-6080-0760
						<a href="http://luiszuno.com" >© 2017 Tumblbug Inc.</a>
					</div>
						<ul id="social-bar" class="cf sb">
							<li><a href="http://www.facebook.com"  title="Become a fan" class="facebook">Facebook</a></li>
							<li><a href="http://www.twitter.com" title="Follow my tweets" class="twitter"></a></li>
							<li><a href="http://plus.google.com" title="Enter my circles" class="plus"></a></li>
						</ul>
				</div>	
				<!-- ENDS bottom -->
			
			</div>
		</footer>
		<!-- ENDS FOOTER -->

		
	<!--  script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
	
	
	
</html>