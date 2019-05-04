<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="profile" href="http://gmpg.org/xfn/11">

<!-- 추가1 -->	
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no,user-scalable=no,viewport-fit=cover">
<meta name="description" content="크라우드펀딩, 스타트업투자, 영화투자, 아이디어제품, 신제품런칭, 임팩트투자">
<meta property="fb:app_id" content="190622721088710">
<meta property="og:type" content="website">
<meta property="og:locale" content="ko_KR">
<meta property="og:site_name" content="와디즈">
<meta property="og:url" content="https://www.wadiz.kr">
<meta property="og:description" content="크라우드펀딩, 스타트업투자, 영화투자, 아이디어제품, 신제품런칭, 임팩트투자">
<meta property="og:image" content="https://cdn.wadiz.kr/resources/static/img/layout/share_image_1200.jpg"/>
<meta property="og:image:width" content="1200"/>
<meta property="og:image:height" content="630"/>
<meta property="og:image" content="https://cdn.wadiz.kr/resources/static/img/layout/share_image.jpg"/>
<meta property="og:image:width" content="600"/>
<meta property="og:image:height" content="600"/>
<meta name="twitter:card" content="summary">
<meta name="twitter:site" content="@Wadiz_official">
<meta name="twitter:url" content="https://www.wadiz.kr/">
<meta name="twitter:title" content="와디즈">
<meta name="twitter:description" content="크라우드펀딩, 스타트업투자, 영화투자, 아이디어제품, 신제품런칭, 임팩트투자">
<meta name="twitter:image" content="https://cdn.wadiz.kr/resources/static/img/layout/share_image_1200.jpg/wadiz/optimize">
<meta name="format-detection" content="telephone=no">
<meta name="naver-site-verification" content="bee718c14a77c283448ac836bb76286cb6fee07d">
<meta name="google-site-verification" content="QjRhzKeCwF3iLHm520JGwnPJQ3oD4nPF1QYZW4cLJ9U" />
<!-- 추가끝 -->

   <style id="kirki-css-vars">:root{}</style>
   <title>EarlyBud</title>
   <link rel='dns-prefetch' href='//s.w.org' />
   <link rel="alternate" type="application/rss+xml" title="Atu &raquo; Feed" href="https://demo.athemes.com/airi-portfolio/feed/" />
   <link rel="alternate" type="application/rss+xml" title="Atu &raquo; Comments Feed" href="https://demo.athemes.com/airi-portfolio/comments/feed/" />

   
<script type="text/javascript">
			window._wpemojiSettings = {"baseUrl":"https:\/\/s.w.org\/images\/core\/emoji\/11\/72x72\/","ext":".png","svgUrl":"https:\/\/s.w.org\/images\/core\/emoji\/11\/svg\/","svgExt":".svg","source":{"concatemoji":"https:\/\/demo.athemes.com\/airi-portfolio\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.9.9"}};
			!function(a,b,c){function d(a,b){var c=String.fromCharCode;l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,a),0,0);var d=k.toDataURL();l.clearRect(0,0,k.width,k.height),l.fillText(c.apply(this,b),0,0);var e=k.toDataURL();return d===e}function e(a){var b;if(!l||!l.fillText)return!1;switch(l.textBaseline="top",l.font="600 32px Arial",a){case"flag":return!(b=d([55356,56826,55356,56819],[55356,56826,8203,55356,56819]))&&(b=d([55356,57332,56128,56423,56128,56418,56128,56421,56128,56430,56128,56423,56128,56447],[55356,57332,8203,56128,56423,8203,56128,56418,8203,56128,56421,8203,56128,56430,8203,56128,56423,8203,56128,56447]),!b);case"emoji":return b=d([55358,56760,9792,65039],[55358,56760,8203,9792,65039]),!b}return!1}function f(a){var c=b.createElement("script");c.src=a,c.defer=c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var g,h,i,j,k=b.createElement("canvas"),l=k.getContext&&k.getContext("2d");for(j=Array("flag","emoji"),c.supports={everything:!0,everythingExceptFlag:!0},i=0;i<j.length;i++)c.supports[j[i]]=e(j[i]),c.supports.everything=c.supports.everything&&c.supports[j[i]],"flag"!==j[i]&&(c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&c.supports[j[i]]);c.supports.everythingExceptFlag=c.supports.everythingExceptFlag&&!c.supports.flag,c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.everything||(h=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",h,!1),a.addEventListener("load",h,!1)):(a.attachEvent("onload",h),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),g=c.source||{},g.concatemoji?f(g.concatemoji):g.wpemoji&&g.twemoji&&(f(g.twemoji),f(g.wpemoji)))}(window,document,window._wpemojiSettings);
</script>
   
   <script src="https://demo.athemes.com/airi-portfolio/wp-includes/js/wp-emoji-release.min.js?ver=4.9.9" type="text/javascript" defer=""></script>
		<style type="text/css">
		
img.wp-smiley,
img.emoji {
	display: inline !important;
	border: none !important;
	box-shadow: none !important;
	height: 1em !important;
	width: 1em !important;
	margin: 0 .07em !important;
	vertical-align: -0.1em !important;
	background: none !important;
	padding: 0 !important;
}
</style>

<link rel="stylesheet" id="airi-bootstrap-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/css/bootstrap/bootstrap.min.css?ver=1" type="text/css" media="all">
<link rel="stylesheet" id="contact-form-7-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.0.2" type="text/css" media="all">
<link rel="stylesheet" id="airi-style-css" href="../css/mypage/ewwww.css" type="text/css" media="all">

<link rel="stylesheet" id="airi-font-awesome-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/css/font-awesome/css/font-awesome.min.css?ver=4.9.9" type="text/css" media="all">
<link rel="stylesheet" id="elementor-icons-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=3.8.0" type="text/css" media="all">
<link rel="stylesheet" id="elementor-animations-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/animations/animations.min.css?ver=2.2.6" type="text/css" media="all">
<link rel="stylesheet" id="elementor-frontend-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=2.2.6" type="text/css" media="all">
<link rel="stylesheet" id="elementor-post-66-css" href="../css/aboutus/post-66.css" type="text/css" media="all">
<link rel="stylesheet" id="kirki-styles-airi-css" href="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/kirki/assets/css/kirki-styles.css?ver=3.0.33" type="text/css" media="all">


<!-- 추가2 -->
	<link rel="dns-prefetch" href="https://cdn.wadiz.kr">
	<link rel="dns-prefetch" href="https://cdnjs.cloudflare.com">
	<link rel="icon" href="../images/main/logo.png" sizes="16x16" type="image/png">
	<link rel="icon" href="../images/main/logo.png" sizes="32x32" type="image/png">
	<link rel="apple-touch-icon-precomposed" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="60x60" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="158x158" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="167x167" href="../images/main/logo.png">
	<link rel="apple-touch-icon-precomposed" sizes="180x180" href="../images/main/logo.png">
	<link rel="apple-touch-icon" sizes="192x192" href="../images/main/logo.png">
	<link rel="icon" sizes="192x192" href="../images/main/logo.png">
	<link rel="mask-icon" href="../images/main/logo.png" color="#00CCA3">
	<link rel="shortcut icon" href="../images/main/logo.png">
	<script type="text/javascript">
	window.wadizWebManifest={"0":"equity-feedback.js?543e2719c82224c0cf5b","1":"equity-update-news.js?44d4674ab5c1bffc9817","2":"equity-w9-membership.js?bb0afd0a3bd010cf80e1","3":"reward-comment-app.js?5b061d94cde928f3a043","4":"reward-supporter-list-app.js?e6d34aa1f120bbe08ff9","5":"5.js?52d90970ce07d33e422d","6":"6.js?38cd1d78a22a27c536f4","7":"7.js?09e8428ae03b4c8fa199","8":"8.js?1d2c9bd6ce5af63c4cc5","9":"9.js?96f38514a3834dc2b384","10":"equity.js?ba4a59078f4ac7697352","11":"reward.js?e337ab95a32d72c7aa25","12":"landing.js?58480fea0ae45fe4547e","13":"coming.js?7f4059d8898d4924b31a","14":"equity-payment.js?9ddefa864fc858d4c761","15":"common.js?3441e2f6ee1fcac27a0e","16":"personal-message.js?3e57f726d36016907517","17":"account.js?0aded497b4b375998049","18":"studio.js?3c5f622faed521c5f3a8","19":"support-signature.js?a27535229cf39a168c04","20":"static/equity-join.js?93caf5bc1beed61afc2e","21":"equity-pre-quiz.js?c87fa3d0998b713c1b80","22":"static/openfunding.js?6e2c3b91b13273e46047","23":"static/wadiz2017.js?a4fb2ee339442ec6152b","24":"static/reward-open.js?3dabf8f27601e2c8aa2f","25":"static/equity-open.js?d47dd54b51347b9b1be1","26":"social.js?7f3ffdb4f9228d482664"};
	window.wadiz = window.wadiz || {};window.wadiz.sessionUser="";</script>
	<link rel="stylesheet" href="https://cdn.wadiz.kr/resources/assets/vendor.css?966a1957dbe0ea1e47a26794a40b2772"><link rel="stylesheet" href="css/main/common.css"><script type="text/javascript" src="https://cdn.wadiz.kr/resources/assets/vendor.js?33b07d8ab3089c7ecb0c"></script><script type="text/javascript" src="https://cdn.wadiz.kr/resources/assets/common.js?3441e2f6ee1fcac27a0e"></script>
	<!-- 추가끝 -->
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic&subset=korean');
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR');
		
	</style>
	
	
	
	
	
<style id="kirki-styles-airi-inline-css" type="text/css">
h1,h2,h3,h4,h5,h6,.site-title{font-family: 'Nanum Gothic', sans-serif;font-weight: 300;}
body{font-family:'Nanum Gothic', sans-serif;font-weight:300;font-size:16px;}
.site-title{font-size:36px;}
.site-description{font-size:16px;}
.main-navigation ul ul li{font-size:13px;}
.single-post .entry-title{font-size:36px;color:#191919;}
.widget-area .widget-title{font-size:24px;}
.widget-area .widget{font-size:16px;}
.sidebar-column .widget-title{font-size:20px;}
.sidebar-column .widget{font-size:16px;}
.site-info{font-size:13px;}.athemes-blog:not(.airi_athemes_blog_skin) .posted-on a,.athemes-blog:not(.airi_athemes_blog_skin) .byline a:hover,.testimonials-section.style1:before,.single-post .read-more-link .gt,.blog-loop .read-more-link .gt,.single-post .posted-on a,.blog-loop .posted-on a,.entry-title a:hover,.airi_recent_entries .post-date,.menuStyle3 .top-bar .contact-item .fa,.menuStyle4 .contact-area .contact-block .contact-icon,.widget_categories li:hover::before,.widget_categories li:hover a{color:#cfbaf4;}.menuStyle4 .contact-area .contact-block .contact-icon,button,.button,input[type="button"],input[type="reset"],input[type="submit"]{border-color:#cfbaf4;}.menuStyle2 .main-navigation a:hover:after, .menuStyle2 .main-navigation .current-menu-item:after,.comments-area .comment-reply-link:hover,.menuStyle4 .main-navigation .header-cta:before,.menuStyle4 .main-navigation .header-cta,button,.button,input[type="button"],input[type="reset"],input[type="submit"],.menuStyle3 .main-navigation a:hover:after,.menuStyle3 .main-navigation .current-menu-item:after{background-color:#cfbaf4;}.menuStyle2 .site-title a{color:#191919;}.menuStyle2 .sticky-wrapper.is-sticky .site-title a{color:#191919;}.menuStyle2 .site-description{color:#707070;}.menuStyle2 .sticky-wrapper.is-sticky .site-description{color:#707070;}.menuStyle2 .main-navigation a{color:#191919;}.menuStyle2 .sticky-wrapper.is-sticky .main-navigation a{color:#191919;}.menuStyle2 .site-header{background-color:#fff;}.menuStyle2 .is-sticky .site-header{background-color:#ffffff;}#site-navigation ul ul li a{color:#1c1c1c;}#site-navigation ul ul li{background-color:#f7f7f7;}.entry-title a{color:#191919;}.single-post .post-cat, .blog-loop .post-cat{background-color:#eff1f4;}.single-post .entry-meta, .blog-loop .entry-meta{color:#bfbfbf;}.single-post .entry-meta .byline a, .blog-loop .entry-meta .byline a{color:#595959;}.single-post .entry-content, .blog-loop .entry-content{color:#595959;}.widget .widget-title{color:#191919;}.widget{color:#000000;}.widget a{color:#595959;}
</style>
   
<script type="text/javascript" src="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery.js?ver=1.12.4"></script>
<script type="text/javascript" src="https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1"></script>
<link rel="https://api.w.org/" href="https://demo.athemes.com/airi-portfolio/wp-json/">
<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://demo.athemes.com/airi-portfolio/xmlrpc.php?rsd">
<link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://demo.athemes.com/airi-portfolio/wp-includes/wlwmanifest.xml"> 
<meta name="generator" content="WordPress 4.9.9">
<link rel="canonical" href="https://demo.athemes.com/airi-portfolio/about-us/">
<link rel="shortlink" href="https://demo.athemes.com/airi-portfolio/?p=66">
<link rel="alternate" type="application/json+oembed" href="https://demo.athemes.com/airi-portfolio/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.athemes.com%2Fairi-portfolio%2Fabout-us%2F">
<link rel="alternate" type="text/xml+oembed" href="https://demo.athemes.com/airi-portfolio/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.athemes.com%2Fairi-portfolio%2Fabout-us%2F&amp;format=xml">


   <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
   <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
   <link rel='https://api.w.org/' href='https://demo.athemes.com/airi-portfolio/wp-json/' />
   <link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://demo.athemes.com/airi-portfolio/xmlrpc.php?rsd"/>
   <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://demo.athemes.com/airi-portfolio/wp-includes/wlwmanifest.xml" />
   <meta name="generator" content="WordPress 4.9.9" />
   <link rel="canonical" href="https://demo.athemes.com/airi-portfolio/" />
   <link rel='shortlink' href='https://demo.athemes.com/airi-portfolio/' />
   <link rel="alternate" type="application/json+oembed" href="https://demo.athemes.com/airi-portfolio/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.athemes.com%2Fairi-portfolio%2F" />
   <link rel="alternate" type="text/xml+oembed" href="https://demo.athemes.com/airi-portfolio/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.athemes.com%2Fairi-portfolio%2F&#038;format=xml" />

   <!-- Google Webmaster Tools plugin for WordPress -->

   <style type="text/css">
      .recentcomments a {
         display: inline !important;
         padding: 0 !important;
         margin: 0 !important;
      }
   </style>
   <style type="text/css" id="wp-custom-css">
      .footer-widgets {
         padding-top: 30px;
         padding-bottom: 30px;
         text-align: center;
      }

      ul.social-media-list li {
         float: none;
         display: inline-block;
      }

      .social-media-list a::before {
         background-color: #fcf6f3 !important;
         color: #404040 !important;
      }

      .site-footer {
         text-align: center;
      }

      .site-header {
         box-shadow: 0 2px 24px 0 rgba(51, 71, 86, 0.15);
      }
      .front_all {
           position:absolute;
           top50px;
           z-index:100;
         }
      
   </style>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:500,400&amp;subset=cyrillic,cyrillic-ext,devanagari,greek,greek-ext,khmer,latin,latin-ext,vietnamese,hebrew,arabic,bengali,gujarati,tamil,telugu,thai" media="all">
	</head>
   
 


<c:if test="false"><link rel="stylesheet" href=""></c:if>
<link href="${pageContext.request.contextPath}/css/mypage/wmypage.css?v=20181115" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/mypage/util.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/mypage/wprojectcard.css" rel="stylesheet">

    

<!-- 여기부터 와디즈 판매자 리스트 내용 -->

<body class="home page-template page-template-page-templates page-template-template_page-builder page-template-page-templatestemplate_page-builder-php page page-id-4 wp-custom-logo menuStyle2 menuContained sticky-header elementor-default elementor-page elementor-page-4">
   <div id="page" class="site">
      <a class="skip-link screen-reader-text" href="#content">Skip to content</a>
      <div id="masthead-sticky-wrapper" class="sticky-wrapper" style="height: 87px; min-height: 87px;">
         <header id="masthead" class="site-header">
   
            <div class="container">
               <div class="row">
                  <div class="site-branding col-md-4 col-sm-6 col-9">
                     <a href="/../earlybud/main" class="custom-logo-link" rel="home" itemprop="url">
                        <img width="80" height="50" src="${pageContext.request.contextPath}/images/main/earlybud.png" class="custom-logo" alt="Atu" itemprop="logo">
                     </a>         
                  </div><!-- .site-branding -->
         
                  <div class="header-mobile-menu col-md-8 col-sm-6 col-3">
                     <button class="mobile-menu-toggle" aria-controls="primary-menu">
                        <span class="mobile-menu-toggle_lines"></span>
                        <span class="sr-only">Toggle mobile menu</span>
                     </button>
                  </div>

                  <nav id="site-navigation" class="main-navigation col-md-8">
                     <div class="menu-menu-container">
                        <ul id="primary-menu" class="menu">
                           <li id="menu-item-43" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home"><a href="/../earlybud/main">Home</a></li>
                           <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/category">소개</a></li>
                           <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/category">카테고리</a></li>

                            <sec:authorize access="isAnonymous()">
                               <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/login">로그인/회원가입</a></li>
                               <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/login">마이페이지</a></li>
                           </sec:authorize>
                           <sec:authorize access="isAuthenticated()">
                              <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><sec:authentication property="principal.member.nickname"/>님 환영합니다</li>
                              <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/customLogout">로그아웃</a></li>
                              <li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44 current-menu-item page_item page-item-4 current_page_item menu-item-43">마이페이지
                              <ul class="front_all">
                              <li><a href="/../earlybud/mypage/modify">개인정보 수정</a></li>
                              <li><a href="/../earlybud/mypage/<sec:authentication property="principal.member.email"/>">좋아요한 프로젝트/판매자</a></li>
                              <li><a href="/../earlybud/mypage/sellerPage">내가만든 프로젝트</a></li>
                              <li><a href="/../earlybud/member_orderlist/<sec:authentication property="principal.member.email"/>">주문조회</a></li>
                              <li><a href="/../earlybud/message/<sec:authentication property="principal.member.email"/>" targe="popup"
                              onclick="window.open('/../earlybud/message/<sec:authentication property="principal.member.email"/>',   'popup', 'width=1000, height=750'); return false;">판매자 문의</a></li>
                              </ul>
                           </li>
                           </sec:authorize>


                           </ul>
                           </div>
                           </nav><!-- #site-navigation -->
            </div>
         </div>
   </header>
