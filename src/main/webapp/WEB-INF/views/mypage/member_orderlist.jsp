<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="member_orderlist_header.jsp" %>
<!doctype html> 
<html class="no-js">


<body class="home page-template page-template-page-templates page-template-template_page-builder page-template-page-templatestemplate_page-builder-php page page-id-4 wp-custom-logo menuStyle2 menuContained sticky-header elementor-default elementor-page elementor-page-4">
	<div id="page" class="site">
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>

				<main id="main" class="site-main" role="main">
<!-- 여기부터 -->
				
<br/><br/><br/>	
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
                                <th><div style="text-align: center;">purchased price</div></th>
                                <th colspan="2"><div style="text-align: center;">purchased date</div></th>

                                </tr>
                            </thead>

                           
                             <tbody style="background:#ffffff;">
                             
                              <c:forEach items="${list}" var="list">
<%--                               <c:when test="${empty list}"> --%>
<!--                               <td class="text-center" style="vertical-align:middle; text-align:center;"> -->
<!--                               	<span class="label label-default">주문 내역이 없습니다.</span> -->
<!--                               	 </td> -->
<%--                               </c:when> --%>
                                <tr>
                                    <td style="vertical-align:middle">
                                        <div style="display:  inline-block; vertical-align:middle;">
										<a href="../reward?item_code=<c:out value="${list.item_code}"/>" class="table-link" >
                                           <c:out value="${list.title}"/>
                                        </a>

                                    	</div>
                                    </td>
                                    <c:choose>
                                   
                                        <c:when test="${list.success eq '0'}">
                                         <td class="text-center" style="vertical-align:middle; text-align:center;">
                                        <span class="label label-default">진행중</span>
                                         </td>
                                       	</c:when>
                                       	<c:when test="${list.success eq '1'}">
                                        <td class="text-center" style="vertical-align:middle; text-align:center;">
                                        <span class="label label-default">성공</span>
                                         </td>
                                       	</c:when>
                                       	<c:otherwise>
                                       	 <td class="text-center" style="vertical-align:middle; text-align:center;">
                                        <span class="label label-default">실패</span>
                                         </td>
                                       	</c:otherwise>
                                   
                                    </c:choose>
                                    <td style="vertical-align:middle; text-align:center;">
                                        <c:out value="${list.nickname}"/>
                                    </td>
                                    <td style="vertical-align:middle; text-align:center;">
                                        <c:out value="${list.price}"/>
                                    </td>
                                    <td style="vertical-align:middle; text-align:center;"><c:out value="${list.pur_date}"/></td>
                                    <td style="vertical-align:middle; text-align:center;">
	                                        <a href="../member_ordereach/<c:out value="${list.merchant_uid}"/>"
											target="popup"
											onclick="window.open('../member_ordereach/<c:out value="${list.merchant_uid}"/>', 'popup',
											'width=600, height=680'); return false;"><span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x" style="color:royalblue"></i>
                                                <i class="fa fa-search-plus fa-stack-1x fa-inverse" ></i>
                                            </span></a>
<!-- 	                                        <a href="#" class="table-link"> -->
<!-- 	                                            <span class="fa-stack"> -->
<!-- 	                                                <i class="fa fa-square fa-stack-2x" style="color:royalblue"></i> -->
<!-- 	                                                <i class="fa fa-pencil fa-stack-1x fa-inverse"></i> -->
<!-- 	                                            </span> -->
<!-- 	                                        </a>		 -->
                                    </td>
                              
                                </tr>
                                </c:forEach>
                                <c:choose>
                             <c:when test="${list.size() eq 0}">
                             	<tr><td colspan="5">주문 내역이 없습니다.</td></tr>
                             </c:when>
                             </c:choose>
                            </tbody>
                             
                            <!-- 테스트코드 끝 -->
        <!-- 여기부터          <tbody style="background:#ffffff;">
                            	<c:forEach items="${orderlist}" var="orderlist">
                                <tr>
                                    <td style="vertical-align:middle">
                                        <img src="${orderlist.THUMBNAIL}" alt="" style="width:120px;vertical-align:middle">
                                        <div style="display:  inline-block; vertical-align:middle;">
                                        	<a href="${root}detail.do?product_code=${orderlist.PRODUCT_CODE}" class="user-link" style=" color: #3498db;font-size: 1.25em;vertical-align:middle;">${orderlist.SUBJECT}</a>
                                    		<!-- <div>상품정보</div>
                                    		<span>price : </span>
                                    		<span>q'ty : </span> --
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

                            </tbody>여기까지 원본-->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>		
			</div><!-- ENDS WRAPPER -->
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


				</main><!-- #main -->


		</div><!-- #content -->





		<div id="sidebar-footer" class="footer-widgets" role="complementary">
			<div class="container">
				<div class="row">
					<div class="sidebar-column col-md-4">
						<section id="text-2" class="widget widget_text">
							<div class="textwidget">
								<p><strong>02-111-1111</strong></p>
							</div>
						</section>
					</div>

					<div class="sidebar-column col-md-4">
						<section id="athemes_social_widget-2" class="widget widget_athemes_social_widget">
							<div class="menu-social-container">
								<ul id="menu-social" class="menu social-media-list clearfix">
									<li id="menu-item-47" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-47"><a href="https://facebook.com"><span class="screen-reader-text">Facebook</span></a></li>
									<li id="menu-item-48" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-48"><a href="https://twitter.com"><span class="screen-reader-text">Twitter</span></a></li>
									<li id="menu-item-49" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-49"><a href="https://instagram.com"><span class="screen-reader-text">Instagram</span></a></li>
									<li id="menu-item-50" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-50"><a href="https://youtube.com"><span class="screen-reader-text">Youtube</span></a></li>
									<li id="menu-item-51" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-51"><a href="https://linkedin.com"><span class="screen-reader-text">Linkedin</span></a></li>
								</ul>
							</div>
						</section>
					</div>

					<div class="sidebar-column col-md-4">
						<section id="text-3" class="widget widget_text">
							<div class="textwidget">
								<p><strong>earlybud@gmail.com</strong></p>
							</div>
						</section>
					</div>

				</div>
			</div>
		</div>
		<footer id="colophon" class="site-footer">
			<div class="container">
				<div class="row">

					<div class="site-info col-md-12">

						<a href="">얼리버드(주) | 대표 얼리버드 010-1111-1111 | 서울시 중구 비트캠프 7층 | 통신판매업 2019-서울중구-1919 | 대표전화 02-0000-0000</a>
						
						</div><!-- .site-info -->

				</div>
			</div>
		</footer><!-- #colophon -->
	</div><!-- #page -->

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

</body>

</html>
