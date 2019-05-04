<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--   page import="soo.mjk.model.Member"-->
<!doctype html> 
<html class="no-js">

<head>
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
	<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua|Nanum+Gothic" rel="stylesheet">
	<style>
		.container{
			/*font-family: 'Nanum Gothic', sans-serif;*/
		}
		
		
	</style>
<!-- 

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

<input  value="검토요청" name="submit2" id="submit2" type="submit"/> -->
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
					<li><a href="${root}write.do" class="selected">상품올리기</a></li>
					<li><a href="${root}list/category/0">카테고리</a>
						<ul>
							<c:forEach items="${list_category}" var="list_category">
								<li><a href="${root}list/category/${list_category.category_code}">${list_category.category_name}</a></li>
							</c:forEach>
						</ul>
					</li>
					<!--  <li><a href="portfolio.do">WORK</a></li>-->
				<!-- 	<li><a href="#"></%=id%/>님 정보</a> -->
						<ul>
							<li><a href="${root}./mypage/mybuy.do">내가 산 물건</a></li>
							<li><a href="${root}./mypage/mysell.do">내가 판 물건</a></li>
							<li><a href="#">프로필 설정</a></li>
							<li><a href="${root}</%=action%/>">로그아웃</a></li>
						</ul>
					</li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->

			</div>
		</header>
		<!-- ENDS HEADER -->
		
		<!-- https://bootdey.com/snippets/view/table-user-list#css   이거  -->
		<!-- MAIN -->
				<!-- MAIN -->
		<div id="main">
			<div class="wrapper cf">	
			
			
				<ul id="filter-buttons" style="margin-bottom:0; border-bottom: none;">
					<li><a href="#" data-filter="*" onclick="changeCategory('0')" <c:if test="${success eq '0'}">class="selected"</c:if>>All</a></li>
					<li><a href="#" data-filter="*" onclick="changeCategory('1')" <c:if test="${success eq '1'}">class="selected"</c:if>>Progress</a></li>
					<li><a href="#" data-filter="*" onclick="changeCategory('2')" <c:if test="${success eq '2'}">class="selected"</c:if>>Close</a></li>
				</ul>
				<script>
				function changeCategory(category){	
					location.replace("${root}mypage/mybuy.do?success="+category); 
				}
				</script>
			
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list" style="background-color: #8d8d8d12;color:#000000;">
                            <thead>
                                <tr>
                                <th><div style="text-align: center;" style="text-align: center;">product</div></th>
                                <th class="text-center"><div style="text-align: center;">progress</div></th>
                                <th><div style="text-align: center;">seller</div></th>
                                <th><div style="text-align: center;">buy price</div></th>
                                <th colspan="2"><div style="text-align: center;">buy date</div></th>
                                <!--  <th>&nbsp;</th> -->
                                </tr>
                            </thead>
                            <tbody style="background:#ffffff;">
                            	<c:forEach items="${orderlist}" var="orderlist">
                                <tr>
                                    <td style="vertical-align:middle">
                                        <img src="${orderlist.THUMBNAIL}" alt="" style="width:120px;vertical-align:middle">
                                        <div style="display:  inline-block; vertical-align:middle;">
                                        	<a href="${root}detail.do?product_code=${orderlist.PRODUCT_CODE}" class="user-link" style=" color: #3498db;font-size: 1.25em;vertical-align:middle;">${orderlist.SUBJECT}</a>
                                    		<!-- <div>상품정보</div>
                                    		<span>price : </span>
                                    		<span>q'ty : </span> -->
                                    	</div>
                                    </td>	
                                 

                                    <td class="text-center" style="vertical-align:middle; text-align:center;">
                                        <span class="label label-default">
                                        <c:if test="${orderlist.BOOLEAN_SUCCESS eq 'ING'}">
																				    진행중
																				</c:if>
																				<c:if test="${orderlist.BOOLEAN_SUCCESS eq 'Y'}">
																				   성공
																				</c:if>
																				<c:if test="${orderlist.BOOLEAN_SUCCESS eq 'N'}">
																				    실패																				
																				</c:if>
                                       	</span>
                                    </td>
                                    <td style="vertical-align:middle; text-align:center;">
                                        <a href="#">${orderlist.ID}</a>
                                    </td>
                                    <td style="vertical-align:middle; text-align:center;">
                                        <a href="#"><fmt:formatNumber value="${orderlist.SALE_AMOUNT}" pattern="#,###" /> 원</a>
                                    </td>
                                    <td style="vertical-align:middle; text-align:center;">${orderlist.APPLY_DATE}</td>
                                    <td style="vertical-align:middle; text-align:center;">
                                    	<c:if test="${orderlist.BOOLEAN_SUCCESS ne 'N'}">
										    <a href="mybuy_detail.do?sale_code=${orderlist.SALE_CODE}" class="table-link" >
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x" style="color:royalblue"></i>
                                                <i class="fa fa-search-plus fa-stack-1x fa-inverse" ></i>
                                            </span>
	                                        </a>
	                                        <a href="#" class="table-link">
	                                            <span class="fa-stack">
	                                                <i class="fa fa-square fa-stack-2x" style="color:royalblue"></i>
	                                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
	                                            </span>
	                                        </a>
	                                        <c:if test="${orderlist.BOOLEAN_SUCCESS eq 'ING'}">
		                                        <a href="#" class="table-link danger" onclick="requestCancel(${orderlist.SALE_CODE})">
		                                            <span class="fa-stack">
		                                                <i class="fa fa-square fa-stack-2x" style="color:#ff0000"></i>
		                                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
		                                            </span>
		                                        </a>
	                                        </c:if>																		
										</c:if>
                                    </td>
                                </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>		
			</div><!-- ENDS WRAPPER -->
		</div>
		<!-- ENDS MAIN -->
<script>
function requestCancel(SALE_CODE){
	var result = confirm('결제를 취소하시겠습니까?');
	if(result) {//yes이면
	    var uploadURL = "${root}payments/cancel"; //Upload URL
	    $.ajax({
	      url: uploadURL,
	      type: 'POST',
				dataType: 'json',
				data: {
	  			sale_code : SALE_CODE
				},
	      success: function(data){
	    	  console.log("성공했다");
	    	  console.log("data: "+data);
	    	  
	      }
	    }); 
		alert("결제가 취소되었습니다.");
		location.href="mybuy.do";
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
					<div class="left">공구상자(주) | 대표 파란물개 000-111-2222 | 서울시 중구 비트캠프 7층 |<br/> 통신판매업 2017-서울중구-1156 | 대표전화 02-0000-0000
						<a href="#" >© 2018 GongguBox Inc.</a>
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
	</body>
	
	
	
</html>