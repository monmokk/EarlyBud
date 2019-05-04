<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 주문서 양식 -->
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
		<link rel="stylesheet" media="all" href="${root}css/mypage/style.css"/>
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
		<link rel="stylesheet" href="${root}css/mypage/lof-slider.css" media="all"  />
		<!-- ENDS slider -->

		<!-- Tweet -->
		<link rel="stylesheet" href="${root}css/mypage/jquery.tweet.css" media="all"  />
		<script src="${root}js/tweet/jquery.tweet.js" ></script>
		<!-- ENDS Tweet -->

		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="${root}css/mypage/superfish.css" />
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
		<link rel="stylesheet" media="all" href="${root}css/mypage/skin.css"/>

		<!-- Less framework -->
		<link rel="stylesheet" media="all" href="${root}css/mypage/lessframework.css"/>

		<!-- jplayer -->
		<link href="${root}player-skin/jplayer-black-and-yellow.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${root}js/jquery.jplayer.min.js"></script>

		<!-- flexslider -->
		<link rel="stylesheet" href="${root}css/mypage/flexslider.css" >
		<script src="${root}js/jquery.flexslider.js"></script>


		<!-- reply move form -->
		<script src="${root}js/moveform.js"></script>

		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

	 <style>
	 html,body{
  //height:100%;
}
body{
  text-align:center;
}
body:before{
  content:'';
  height:100%;
  display:inline-block;
  vertical-align:middle;
}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

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
	<!-- 주문서 끝 -->


	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="http://gmpg.org/xfn/11">

	<style id="kirki-css-vars">:root{}</style>
	<title>EarlyBud</title>
	<link rel='dns-prefetch' href='//s.w.org' />
	<link rel="alternate" type="application/rss+xml" title="Atu &raquo; Feed" href="https://demo.athemes.com/airi-portfolio/feed/" />
	<link rel="alternate" type="application/rss+xml" title="Atu &raquo; Comments Feed" href="https://demo.athemes.com/airi-portfolio/comments/feed/" />
<script type="text/javascript">
	$(function(){
		$('.project-filter').mouseenter(function(){
			$('.project-filter').css("background-color", #cfbaf4)
		});
	});
</script>
	<script type="text/javascript">
		window._wpemojiSettings = {
			"baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/11\/72x72\/",
			"ext": ".png",
			"svgUrl": "https:\/\/s.w.org\/images\/core\/emoji\/11\/svg\/",
			"svgExt": ".svg",
			"source": {
				"concatemoji": "https:\/\/demo.athemes.com\/airi-portfolio\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.9.9"
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
						return !(b = d([55356, 56826, 55356, 56819], [55356, 56826, 8203, 55356, 56819])) && (b = d([55356, 57332, 56128, 56423, 56128, 56418, 56128, 56421, 56128, 56430, 56128, 56423, 56128, 56447], [55356, 57332, 8203, 56128, 56423, 8203, 56128,
							56418, 8203, 56128, 56421, 8203, 56128, 56430, 8203, 56128, 56423, 8203, 56128, 56447
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
		.active{
			background-color: #cfbaf4 !important;
		}
		.elementor-size-sm{
			background-color: #cfbaf4 !important;
			border: none !important;
		}
	</style>
	<link rel='stylesheet' id='airi-bootstrap-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/css/bootstrap/bootstrap.min.css?ver=1' type='text/css' media='all' />
	<link rel='stylesheet' id='contact-form-7-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.0.2' type='text/css' media='all' />
	<link rel='stylesheet' id='airi-style-css' href='css/mypage/ewwww.css' type='text/css' media='all' />
	<link rel='stylesheet' id='airi-font-awesome-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/css/font-awesome/css/font-awesome.min.css?ver=4.9.9' type='text/css' media='all' />
	<link rel='stylesheet' id='elementor-icons-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/eicons/css/elementor-icons.min.css?ver=3.8.0' type='text/css' media='all' />
	<link rel='stylesheet' id='elementor-animations-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/animations/animations.min.css?ver=2.2.6' type='text/css' media='all' />
	<link rel='stylesheet' id='elementor-frontend-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/css/frontend.min.css?ver=2.2.6' type='text/css' media='all' />
	<link rel='stylesheet' id='elementor-post-4-css' href='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/uploads/sites/92/elementor/css/post-4.css?ver=1540206708' type='text/css' media='all' />
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

		.menuStyle4 .contact-area .contact-block .contact-icon,
		button,
		.button,
		input[type="button"],
		input[type="reset"],
		input[type="submit"] {
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
		input[type="submit"],
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
			color: #000000;
		}

		.widget a {
			color: #595959;
		}
	</style>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
	<script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
	<link rel='https://api.w.org/' href='https://demo.athemes.com/airi-portfolio/wp-json/' />
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="https://demo.athemes.com/airi-portfolio/xmlrpc.php?rsd" />
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
	</style>
</head>
</html>
