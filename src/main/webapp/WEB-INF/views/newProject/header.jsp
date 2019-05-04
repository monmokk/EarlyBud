<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!doctype html>
<html lang="en-US">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- include jquery -->
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
  <link rel="profile" href="http://gmpg.org/xfn/11">


  <!-- include libs stylesheets -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.css" />
  <script src="http://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.5/umd/popper.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.js"></script>

  <style id="kirki-css-vars">:root{}</style>
  <title>EarlyBud &#8211; MyPage</title>
  <link rel='dns-prefetch' href='//s.w.org' />
  <link rel="alternate" type="application/rss+xml" title="Atu &raquo; Feed" href="https://demo.athemes.com/airi-shop/feed/" />
  <link rel="alternate" type="application/rss+xml" title="Atu &raquo; Comments Feed" href="https://demo.athemes.com/airi-shop/comments/feed/" />
  <link rel="alternate" type="application/rss+xml" title="Atu &raquo; Hello world! Comments Feed" href="https://demo.athemes.com/airi-shop/2018/08/20/hello-world/feed/" />
  <!--datepicker  -->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  <script type="text/javascript">
    $(function(){
    	$("#startDate1").datepicker({dateFormat: 'yy-mm-dd'});
        $("#endDate1").datepicker({ dateFormat: 'yy-mm-dd' });
    });
  </script>
  <script type="text/javascript">
    window._wpemojiSettings = {
      "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/11\/72x72\/",
      "ext": ".png",
      "svgUrl": "https:\/\/s.w.org\/images\/core\/emoji\/11\/svg\/",
      "svgExt": ".svg",
      "source": {
        "concatemoji": "https:\/\/demo.athemes.com\/airi-shop\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.9.9"
      }
    };
    ! function(a, b, c) {
      function d(a, b) {
        var c = String.fromCharCode;
        l.clearRect(0, 0, k.width, k.height), l.fillText(c.apply(this, a), 0, 0);
        var d = k.toDataURL();
        l.clearRect(0, 0, k.width, k.height), l.fillText(c.apply(this, b), 0, 0);
        var e = k.toDataURL();
        return d === e
      }

      function e(a) {
        var b;
        if (!l || !l.fillText) return !1;
        switch (l.textBaseline = "top", l.font = "600 32px Arial", a) {
          case "flag":
            return !(b = d([55356, 56826, 55356, 56819], [55356, 56826, 8203, 55356, 56819])) && (b = d([55356, 57332, 56128, 56423, 56128, 56418, 56128, 56421, 56128, 56430, 56128, 56423, 56128, 56447], [55356, 57332, 8203, 56128, 56423, 8203,
              56128, 56418, 8203, 56128, 56421, 8203, 56128, 56430, 8203, 56128, 56423, 8203, 56128, 56447
            ]), !b);
          case "emoji":
            return b = d([55358, 56760, 9792, 65039], [55358, 56760, 8203, 9792, 65039]), !b
        }
        return !1
      }

      function f(a) {
        var c = b.createElement("script");
        c.src = a, c.defer = c.type = "text/javascript", b.getElementsByTagName("head")[0].appendChild(c)
      }
      var g, h, i, j, k = b.createElement("canvas"),
        l = k.getContext && k.getContext("2d");
      for (j = Array("flag", "emoji"), c.supports = {
          everything: !0,
          everythingExceptFlag: !0
        }, i = 0; i < j.length; i++) c.supports[j[i]] = e(j[i]), c.supports.everything = c.supports.everything && c.supports[j[i]], "flag" !== j[i] && (c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && c.supports[j[i]]);
      c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && !c.supports.flag, c.DOMReady = !1, c.readyCallback = function() {
        c.DOMReady = !0
      }, c.supports.everything || (h = function() {
        c.readyCallback()
      }, b.addEventListener ? (b.addEventListener("DOMContentLoaded", h, !1), a.addEventListener("load", h, !1)) : (a.attachEvent("onload", h), b.attachEvent("onreadystatechange", function() {
        "complete" === b.readyState && c.readyCallback()
      })), g = c.source || {}, g.concatemoji ? f(g.concatemoji) : g.wpemoji && g.twemoji && (f(g.twemoji), f(g.wpemoji)))
    }(window, document, window._wpemojiSettings);
  </script>
  <style type="text/css">
  	.comment-form-email input[type="file"]{
  		position: absolute !important;
  		width: 1px !important;
  		height: 1px !important;
  		padding: 0 !important;
  		margin: -1px !important;
  		overflow: hidden !important;
  		clip:rect(0,0,0,0) !important;
  		border: 0 !important;
  	}
  	.cat_select{
  		width: 550px;
  	}
  	.dateC{
      width: 270px !important;
    }
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
    .file{
      background-color: #ffffff !important;
      border: none !important;
      padding: 0 !important;
    }
    .active {
      background-color: #cfbaf4 !important;
    }

    .elementor-size-sm {
      background-color: #cfbaf4 !important;
      border: none !important;
    }

    form{
      position: relative !important;
      left: 100px !important;
    }

    form .form-submit{
      position: relative !important;
      top: 50px !important;
    }
  </style>
  <link rel='stylesheet' id='airi-bootstrap-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/css/bootstrap/bootstrap.min.css?ver=1' type='text/css' media='all' />
  <link rel='stylesheet' id='contact-form-7-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.0.2' type='text/css' media='all' />
  <link rel='stylesheet' id='woocommerce-layout-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/css/woocommerce-layout.css?ver=3.4.3' type='text/css' media='all' />
  <link rel='stylesheet' id='woocommerce-smallscreen-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.css?ver=3.4.3' type='text/css' media='only screen and (max-width: 768px)' />
  <link rel='stylesheet' id='woocommerce-general-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/css/woocommerce.css?ver=3.4.3' type='text/css' media='all' />
  <style id='woocommerce-inline-inline-css' type='text/css'>
    .woocommerce form .form-row .required {
      visibility: visible;
    }
  </style>
  <link rel='stylesheet' id='airi-style-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/style.css?ver=4.9.9' type='text/css' media='all' />
  <link rel='stylesheet' id='airi-font-awesome-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/css/font-awesome/css/font-awesome.min.css?ver=4.9.9' type='text/css' media='all' />
  <link rel='stylesheet' id='kirki-styles-airi-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/kirki/assets/css/kirki-styles.css?ver=3.0.33' type='text/css' media='all' />
  <style id='kirki-styles-airi-inline-css' type='text/css'>
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    .site-title {
      font-family: "Work Sans", Helvetica, Arial, sans-serif;
      font-weight: 500;
    }

    body {
      font-family: "Work Sans", Helvetica, Arial, sans-serif;
      font-weight: 400;
      font-size: 16px;
    }

    .site-title {
      font-size: 36px;
    }

    .site-description {
      font-size: 16px;
    }

    .main-navigation ul ul li {
      font-size: 13px;
    }

    .single-post .entry-title {
      font-size: 36px;
      color: #191919;
    }

    .widget-area .widget-title {
      font-size: 24px;
    }

    .widget-area .widget {
      font-size: 16px;
    }

    .sidebar-column .widget-title {
      font-size: 20px;
    }

    .sidebar-column .widget {
      font-size: 16px;
    }

    .site-info {
      font-size: 13px;
    }

    .athemes-blog:not(.airi_athemes_blog_skin) .posted-on a,
    .athemes-blog:not(.airi_athemes_blog_skin) .byline a:hover,
    .testimonials-section.style1:before,
    .single-post .read-more-link .gt,
    .blog-loop .read-more-link .gt,
    .single-post .posted-on a,
    .blog-loop .posted-on a,
    .entry-title a:hover,
    .airi_recent_entries .post-date,
    .menuStyle3 .top-bar .contact-item .fa,
    .menuStyle4 .contact-area .contact-block .contact-icon,
    .widget_categories li:hover::before,
    .widget_categories li:hover a {
      color: #cfbaf4;
    }
	input[type="submit"] {
      border-color: #ffffff;
      background-color: #e1e1e1;
      position: relative !important;
      left: 500px !important;
    }
    .menuStyle4 .contact-area .contact-block .contact-icon,
    button,
    .button,
    input[type="button"],
    input[type="reset"]{
      border-color: #cfbaf4;
    }

    .menuStyle2 .main-navigation a:hover:after,
    .menuStyle2 .main-navigation .current-menu-item:after,
    .comments-area .comment-reply-link:hover,
    .menuStyle4 .main-navigation .header-cta:before,
    .menuStyle4 .main-navigation .header-cta,
    button,
    .button,
    input[type="button"],
    input[type="reset"],
    .menuStyle3 .main-navigation a:hover:after,
    .menuStyle3 .main-navigation .current-menu-item:after {
      background-color: #cfbaf4;
    }

    .menuStyle2 .site-title a {
      color: #191919;
    }

    .menuStyle2 .sticky-wrapper.is-sticky .site-title a {
      color: #191919;
    }

    .menuStyle2 .site-description {
      color: #707070;
    }

    .menuStyle2 .sticky-wrapper.is-sticky .site-description {
      color: #707070;
    }

    .menuStyle2 .main-navigation a {
      color: #191919;
    }

    .menuStyle2 .sticky-wrapper.is-sticky .main-navigation a {
      color: #191919;
    }

    .menuStyle2 .site-header {
      background-color: #fff;
    }

    .menuStyle2 .is-sticky .site-header {
      background-color: #ffffff;
    }

    #site-navigation ul ul li a {
      color: #1c1c1c;
    }

    #site-navigation ul ul li {
      background-color: #f7f7f7;
    }

    .entry-title a {
      color: #191919;
    }

    .single-post .post-cat,
    .blog-loop .post-cat {
      background-color: #eff1f4;
    }

    .single-post .entry-meta,
    .blog-loop .entry-meta {
      color: #bfbfbf;
    }

    .single-post .entry-meta .byline a,
    .blog-loop .entry-meta .byline a {
      color: #595959;
    }

    .single-post .entry-content,
    .blog-loop .entry-content {
      color: #595959;
    }

    .widget .widget-title {
      color: #191919;
    }

    .widget {
      color: #707070;
    }

    .widget a {
      color: #595959;
    }
  </style>
  <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
  <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
  <link rel='https://api.w.org/' href='https://demo.athemes.com/airi-shop/wp-json/' />
  <link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://demo.athemes.com/airi-shop/xmlrpc.php?rsd" />
  <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="https://demo.athemes.com/airi-shop/wp-includes/wlwmanifest.xml" />
  <meta name="generator" content="WordPress 4.9.9" />
  <meta name="generator" content="WooCommerce 3.4.3" />
  <link rel="canonical" href="https://demo.athemes.com/airi-shop/2018/08/20/hello-world/" />
  <link rel='shortlink' href='https://demo.athemes.com/airi-shop/?p=1' />
  <link rel="alternate" type="application/json+oembed" href="https://demo.athemes.com/airi-shop/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.athemes.com%2Fairi-shop%2F2018%2F08%2F20%2Fhello-world%2F" />
  <link rel="alternate" type="text/xml+oembed" href="https://demo.athemes.com/airi-shop/wp-json/oembed/1.0/embed?url=https%3A%2F%2Fdemo.athemes.com%2Fairi-shop%2F2018%2F08%2F20%2Fhello-world%2F&#038;format=xml" />

  <!-- Google Webmaster Tools plugin for WordPress -->

  <link rel="pingback" href="https://demo.athemes.com/airi-shop/xmlrpc.php"> <noscript>
    <style>
      .woocommerce-product-gallery {
        opacity: 1 !important;
      }
    </style>
  </noscript>
  <style type="text/css">
    .recentcomments a {
      display: inline !important;
      padding: 0 !important;
      margin: 0 !important;
    }
  </style>
  <style type="text/css" id="wp-custom-css">
    .instagram-feed ul {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .instagram-feed li {
      float: left;
      width: 20%;
    }

    @media (max-width: 991px) {
      .shop-cats-grid {
        height: auto;
      }
    }

    @media (max-width: 600px) {
      .shop-grid {
        display: block;
      }

      .cats-grid-item {
        min-height: 200px;
      }

      .instagram-feed li {
        width: 50%;
      }

      .startup-subscribe input[type="email"] {
        width: 100%;
        min-width: auto;
        border-radius: 30px;
        display: block;
      }

      .startup-subscribe {
        display: block;
      }

      .startup-subscribe input[type="submit"] {
        border-radius: 30px;
        margin: 15px auto 0;
        display: block;
        border: none;
      }
    }

    .startup-subscribe input[type="email"] {
      border-top-left-radius: 30px;
      border-bottom-left-radius: 30px;
    }

    .startup-subscribe input[type="submit"] {
      border-top-right-radius: 30px;
      border-bottom-right-radius: 30px;
    }

    .footer-widgets {
      padding-top: 60px;
      padding-bottom: 60px;
      border-top: 1px solid #ebebeb;
    }
  </style>
</head>

<body class="post-template-default single single-post postid-1 single-format-standard wp-custom-logo woocommerce-no-js menuStyle2 menuNotContained sticky-header woocommerce-active elementor-default">
  <div id="page" class="site">
    <a class="skip-link screen-reader-text" href="#content">Skip to content</a>


    <header id="masthead" class="site-header">

      <div class="container-fluid">
        <div class="row">
          <div class="site-branding col-md-4 col-sm-6 col-9">
            <a href="/../earlybud/main" class="custom-logo-link" rel="home" itemprop="url"><img width="100" height="60" src="${pageContext.request.contextPath}/images/earlybud.png" class="custom-logo" alt="Atu" itemprop="logo" /></a> </div><!-- .site-branding -->

          <div class="header-mobile-menu col-md-8 col-sm-6 col-3">
            <button class="mobile-menu-toggle" aria-controls="primary-menu">
              <span class="mobile-menu-toggle_lines"></span>
              <span class="sr-only">Toggle mobile menu</span>
            </button>
          </div>

          <nav id="site-navigation" class="main-navigation col-md-8">
            <div class="menu-menu-container">
              <ul id="primary-menu" class="menu">
               <li id="menu-item-43" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-43"><a href="/../earlybud/main">Home</a></li>
									<li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/category">소개</a></li>
									<li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/category">카테고리</a></li>

									 <sec:authorize access="isAnonymous()">
									 	<li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-78"><a href="/../earlybud/login">로그인/회원가입</a></li>
									 	<li id="menu-item-78" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-78"><a href="/../earlybud/login">마이페이지</a></li>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">
										<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-78"><sec:authentication property="principal.member.nickname"/>님 환영합니다</li>
										<li id="menu-item-44" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-44"><a href="/../earlybud/customLogout">로그아웃</a></li>
										<li id="menu-item-79" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-79">마이페이지
										<ul>
										<li><a href="/../earlybud/mypage/modify">개인정보 수정</a></li>
										<li><a href="/../earlybud/mypage/<sec:authentication property="principal.member.email"/>">좋아요한 프로젝트/판매자</a></li>
										<li><a href="/../earlybud/member_orderlist/<sec:authentication property="principal.member.email"/>">주문조회</a></li>
										<li><a href="/../earlybud/message/<sec:authentication property="principal.member.email"/>" targe="popup"
										onclick="window.open('/../earlybud/message/<sec:authentication property="principal.member.email"/>',	'popup', 'width=1000, height=750'); return false;">판매자 문의</a></li>
										</ul>
									</li>
									</sec:authorize>


				</ul>

          </nav><!-- #site-navigation -->

        </div>
      </div>
      <div class="header-search-form">
        <form role="search" method="get" class="search-form" action="https://demo.athemes.com/airi-shop/">
          <label>
            <span class="screen-reader-text">Search for:</span>
            <input type="search" class="search-field" placeholder="Search &hellip;" value="" name="s" />
          </label>
          <input type="submit" class="search-submit" value="Search" />
        </form>
      </div>

    </header><!-- #masthead -->
