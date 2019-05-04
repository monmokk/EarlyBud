<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--   page import="soo.mjk.model.Member"-->
<%@include file="header3.jsp" %>
<!doctype html> 
<html class="no-js">
<style>
.photo1{
    width: 100px; height: 100px;
    object-fit: cover;
    border-radius: 50%;
}
</style>



<body class="home page-template page-template-page-templates page-template-template_page-builder page-template-page-templatestemplate_page-builder-php page page-id-4 wp-custom-logo menuStyle2 menuContained sticky-header elementor-default elementor-page elementor-page-4">
	<div id="page" class="site">
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>


		
		<div id="content" class="site-content">


			<div id="primary" class="content-area">
				<main id="main" class="site-main" role="main">

					<div class="elementor elementor-4">
						<div class="elementor-inner">
							<div class="elementor-section-wrap">
								<section data-id="49c46783" class="elementor-element elementor-section-boxed elementor-section-height-default elementor-section-height-default elementor-section elementor-top-section" data-element_type="section">
									<div class="elementor-container elementor-column-gap-default">
										<div class="elementor-row">
											<div data-id="22bb505b" class="elementor-element elementor-element-22bb505b elementor-column elementor-col-100 elementor-top-column" data-element_type="column">
												<div class="elementor-column-wrap elementor-element-populated">
													<div class="elementor-widget-wrap">
														<div data-id="6f6ccfa" class="elementor-element elementor-element-6f6ccfa elementor-widget elementor-widget-athemes-portfolio" data-element_type="athemes-portfolio.default">
															<div class="elementor-widget-container">
													<div class="athemes-project-wrap portfolio-section style1">
	
																			
<div id="mypageWrap">
	<div class="myfunding-wrap">
		<h2 class="mypage-top-title">좋아한 프로젝트</h2>
		
		<div class="mypage-project bg ">
			<div class="tab-list">
				
			</div>
			<div class="project-list">
				<div id="projectCardList" class="card-list">


					<p class="top-notice"><i>좋아하는 프로젝트로 설정한 프로젝트가 보여집니다.</i></p>
	<ul>
		<c:forEach items="${list}" var="list">
			<li class="reward">
					<a href="/../earlybud/reward?item_code=${list.ITEM_CODE}">
					<div class="project-card">
						<div class="card-img-section">
							<em class="project-img" style="background-image:url('${pageContext.request.contextPath}/uploads/reward/<c:out value="${list.MAIN_IMAGE}')"/>"></em>
						
							<em class="project-type reward">리워드</em>
							                                    
							
							<div class="progressbar-wrap">
								<dl><dt>
									<span style="width:<c:out value="${list.PERCENT}"/>%">
									</span>
								</dt><dd>
										<span class="percent">
										<c:out value="${list.PERCENT}"/>%
										</span><br> 
									&nbsp; &nbsp;&nbsp;<span class="amount">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${list.NOW_SUM}"/>원 달성</span>
									</dd>
								</dl>
							</div>
							
						</div>
						<div class="card-info-section">
							<h4><c:out value="${list.SUMMARY}"/></h4>
							<h5><c:out value="${list.NICKNAME}"/></h5>
							<div class="card-category">
										<span class="category1"><c:out value="${list.CAT_NAME}"/></span>
										<span class="category2">
								<c:choose>
                                 <c:when test="${list.TIME > 0}">
                                 <span class="days"><c:out value="${list.TIME}"/>일 남음</span> 
                                 </c:when>                                 
                                 <c:when test="${list.TIME < 0}">
                                       <span class="days">마감됨</span>                                      
                                 </c:when>
                                 <c:otherwise>
                                       <span class="days">오늘 자정까지</span>
                                 </c:otherwise>
                              </c:choose>
										</span>
							</div>
							
						</div>
					</div>
				</a>
			</li>	
			</c:forEach>
			</ul>	
				</div><!--  // .card-list -->
			</div>
		</div>
	
	</div>
</div>
		</div><!-- // #wadizContainer -->
    <div id="mypageWrap">
				<div class="myfunding-wrap">
					<h2 class="mypage-top-title">즐겨찾는 판매자</h2>
					<div class="mypage-project bg ">
						<div class="tab-list">
						</div>
<!-- 								<p class="top-notice"><i>즐겨찾기에 등록한 판매자가 보여집니다.</i></p> -->
											
<div id="page-container">
<!-- 판매자 리스트 시작 -->
<div id="page-container">
<main class="landing-bestmaker2018">


    
  <section id="maker-all" class="maker-all">
      
    <div class="maker-all-container">
   

      <div class="funding-box2">
     <strong>  &nbsp;<br/>&nbsp;  </strong> 
        <ul class="list-maker-all2">
        <c:forEach items="${listS}" var="listS">
          <li>
 			&nbsp; &nbsp;
 			<img style="width: 67px; height: 67px; border: 1px grey; border-radius: 90px; -moz-border-radius: 90px;
 				-khtml-border-radius: 90px; -webkit-border-radius: 90px;" src="${pageContext.request.contextPath}/uploads/member/profile/<c:out value="${listS.IMAGE}"/>"/>
 				&nbsp; &nbsp;
 				<span style="font-size:1.5em;"><a href='/../earlybud/seller_items/<c:out value="${listS.EMAIL}"/>'><c:out value="${listS.NICKNAME}"/></a></span><br><br>			
          </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</main>


<div id="wadiz-app-banner"></div>



</div>
<!-- S : page script area -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/countup.js/1.9.3/countUp.min.js"></script>


<script type="text/javascript">
  (() => {
    const $window = $(window);
    const landingAwards = $('.landing-bestmaker2018');
    const $tabWrap = $('.tab-wrap', landingAwards);
    const $btnNextTab = $('.tab-next', $tabWrap);
    const $btnPrevTab = $('.tab-prev', $tabWrap);
    const $panels = $('section', landingAwards);
    const $panelList = [];

    // 비주얼 섹션 카운트 애니메이션
    const countOptions = {
      useEasing: true,
      useGrouping: true,
      separator: ',',
      decimal: '.',
    };
    const countValue = new CountUp('count-value', 0, 60165964718, 0, 3, countOptions);
    const countProject = new CountUp('count-project', 0, 3436, 0, 3, countOptions);

    if (!countValue.error) {
      countValue.start();
    } else {
      console.error(countValue.error);
    }
    if (!countProject.error) {
      countProject.start();
    } else {
      console.error(countProject.error);
    }

   

    // 탭 클릭 체인지 이벤트
    $panels.each(function() {
      $panelList[this.id] = $(this);
    });

    function activeTab(target, href) {
      const $activeTab = $('a[href="'+href+'"]');
      $tabWrap.find('.active').removeClass('active');
      $tabWrap.find($activeTab).parent().addClass('active');
      $panels.filter(':visible').hide();
      target.show();
    }

    $('nav a, .maker-all a, .tab-panel .btn-next-section', landingAwards).on('click', function (e) {
      const $tab = $(this);
      const $tabHref = $tab.attr('href');
      const $target = $panelList[$tab.data('target')];
      const tabOffsetTop = $panels.filter(':visible').offset().top - 70;
      activeTab($target, $tabHref);
      e.preventDefault();
      window.history.pushState(null, null, this.href);
      $window.scrollTop(tabOffsetTop);
    });

    $btnNextTab.on('click', () => {
      $tabWrap.addClass('next');
    });

    $btnPrevTab.on('click', () => {
      $tabWrap.removeClass('next');
    });
  })();
</script>

<!-- E : page script area -->
<!-- S : page tracking code area -->

<input type="hidden" id="gaUserId" value="">
<script type="text/javascript">
(function (i, s, o, g, r, a, m) {
  i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
    (i[r].q = i[r].q || []).push(arguments)
  }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');


var gaEvt = (function() {
return {
  trackingCode: {
    
    master:'UA-41051680-1',
    master_coming_soon:'UA-41051680-11',
    master_reward_qna:'UA-41051680-12',
    master_equity_campaign: 'UA-41051680-25',
    master_reward_campaign: 'UA-41051680-24',
    master_exclude_reward_campaign: 'UA-41051680-26',
    event:'UA-41051680-10'
    
  },
  property: {
    wadiz_event: 'wadizEvent',
    wadiz_ga_shard: 'wadizShard',
    wadiz_coming_soon: 'wadizComingsoon',
    wadiz_reward_qna: 'wadizRewardQna',
    wadiz_equity_campaign: 'wadizEquityCampaign',
    wadiz_reward_campaign: 'wadizRewardCampaign',
    wadiz_exclude_reward_campaign: 'wadizExcludeRewardCampaign'
  },
  dimension: {
    in_app_mark: 'dimension2',
    user_id: 'dimension3',
    accnt_type: 'dimension4'
  },
  metric: {
    user_count: 'metric1'
  },
  category: {
    registerSchool: {
      name: 'regSchool',
      actions: {
        click_registerBtn: 'click_registerBtn',
        click_completeBtn: 'click_completeBtn'
      }
    },
    topBanner: {
      name: 'topBanner',
      actions: {
        click: 'click_top_banner'
      }
    },
    investScroll: {
      name: 'invest_detail'
    }
  },
  callbackWithTimeout: function(callback, opt_timeout) {
    var called = false;
    setTimeout(callback, opt_timeout || 1000);
    return function() {
      if (!called) {
        called = true;
        callback();
      }
    };
  }, //form.submit() 등을 위해 사용
  send: function(category, action, label, value, callback, propertyName) {
    var params = {noneInteraction: 1};
    if(typeof(callback) === 'string') {
      if(callback) { //주소가 유효한 경우에만 링크 연결
        params.hitCallback = function(){location.href = callback};
        params.hitCallbackFail = function(){location.href = callback};
      }
    } else {
      params.hitCallback = callback;
      params.hitCallbackFail = callback;
    }
    if(propertyName != null) {
      ga(propertyName+'.send', 'event', category, action, label || 'not set', value || 0, params);
    } else {
      ga('send', 'event', category, action, label || 'not set', value || 0, params);
    }
    ga(gaEvt.property.wadiz_ga_shard+'.send', 'event', category, action, label || 'not set', value || 0, params);

    ga(function() {
      var comingsoon = ga.getByName(gaEvt.property.wadiz_coming_soon);
      if (comingsoon !== undefined) {
        ga(gaEvt.property.wadiz_coming_soon+'.send', 'event', category, action, label || 'not set', value || 0, params);
      }
      var rewardQna = ga.getByName(gaEvt.property.wadiz_reward_qna);
      if (rewardQna !== undefined) {
        ga(gaEvt.property.wadiz_reward_qna+'.send', 'event', category, action, label || 'not set', value || 0, params);
      }
      var equitydCampaign = ga.getByName(gaEvt.property.wadiz_equity_campaign);
      if (equitydCampaign !== undefined) {
        ga(gaEvt.property.wadiz_equity_campaign+'.send', 'event', category, action, label || 'not set', value || 0, params);
      }
      var rewardCampaign = ga.getByName(gaEvt.property.wadiz_reward_campaign);
      if (rewardCampaign !== undefined) {
        ga(gaEvt.property.wadiz_reward_campaign+'.send', 'event', category, action, label || 'not set', value || 0, params);
      }
      var rewardExcludeCampaign = ga.getByName(gaEvt.property.wadiz_exclude_reward_campaign);
      if (rewardExcludeCampaign !== undefined) {
        ga(gaEvt.property.wadiz_exclude_reward_campaign+'.send', 'event', category, action, label || 'not set', value || 0, params);
      }
    });
  },
  sendWadizEvent: function(category, action, label, value, callback) {
    this.send(category, action, label, value, callback, this.property.wadiz_event);
  },
  sendEcommerce: function(transaction, item) {
    ga('require', 'ecommerce', 'ecommerce.js');
    ga('ecommerce:addTransaction', transaction);
    ga('ecommerce:addItem', item);
    ga('ecommerce:send');

    ga(gaEvt.property.wadiz_ga_shard+'.require', 'ecommerce', 'ecommerce.js');
    ga(gaEvt.property.wadiz_ga_shard+'.ecommerce:addTransaction', transaction);
    ga(gaEvt.property.wadiz_ga_shard+'.ecommerce:addItem', item);
    ga(gaEvt.property.wadiz_ga_shard+'.ecommerce:send');

    ga(function() {
      var comingsoon = ga.getByName(gaEvt.property.wadiz_coming_soon);
      if (comingsoon !== undefined) {
        ga(gaEvt.property.wadiz_coming_soon + '.require', 'ecommerce', 'ecommerce.js');
        ga(gaEvt.property.wadiz_coming_soon + '.ecommerce:addTransaction', transaction);
        ga(gaEvt.property.wadiz_coming_soon + '.ecommerce:addItem', item);
        ga(gaEvt.property.wadiz_coming_soon + '.ecommerce:send');
      }

      var rewardQna = ga.getByName(gaEvt.property.wadiz_reward_qna);
      if (rewardQna !== undefined) {
        ga(gaEvt.property.wadiz_reward_qna + '.require', 'ecommerce', 'ecommerce.js');
        ga(gaEvt.property.wadiz_reward_qna + '.ecommerce:addTransaction', transaction);
        ga(gaEvt.property.wadiz_reward_qna + '.ecommerce:addItem', item);
        ga(gaEvt.property.wadiz_reward_qna + '.ecommerce:send');
      }

      var equitydCampaign = ga.getByName(gaEvt.property.wadiz_equity_campaign);
      if (equitydCampaign !== undefined) {
        ga(gaEvt.property.wadiz_equity_campaign + '.require', 'ecommerce', 'ecommerce.js');
        ga(gaEvt.property.wadiz_equity_campaign + '.ecommerce:addTransaction', transaction);
        ga(gaEvt.property.wadiz_equity_campaign + '.ecommerce:addItem', item);
        ga(gaEvt.property.wadiz_equity_campaign + '.ecommerce:send');
      }

      var rewardCampaign = ga.getByName(gaEvt.property.wadiz_reward_campaign);
      if (rewardCampaign !== undefined) {
        ga(gaEvt.property.wadiz_reward_campaign + '.require', 'ecommerce', 'ecommerce.js');
        ga(gaEvt.property.wadiz_reward_campaign + '.ecommerce:addTransaction', transaction);
        ga(gaEvt.property.wadiz_reward_campaign + '.ecommerce:addItem', item);
        ga(gaEvt.property.wadiz_reward_campaign + '.ecommerce:send');
      }

      var rewardExcludeCampaign = ga.getByName(gaEvt.property.wadiz_exclude_reward_campaign);
      if (rewardExcludeCampaign !== undefined) {
        ga(gaEvt.property.wadiz_exclude_reward_campaign + '.require', 'ecommerce', 'ecommerce.js');
        ga(gaEvt.property.wadiz_exclude_reward_campaign + '.ecommerce:addTransaction', transaction);
        ga(gaEvt.property.wadiz_exclude_reward_campaign + '.ecommerce:addItem', item);
        ga(gaEvt.property.wadiz_exclude_reward_campaign + '.ecommerce:send');
      }
    });
  },
  getShardNo: function() {
    
    var trackingShardCode = (document.cookie.match(/_ga=GA[0-9.]+([0-9])(;|$)/) || [])[1];
    var trackingShard = parseInt(trackingShardCode, 10) + 13;
    if(!trackingShard || isNaN(trackingShard)) {
      trackingShard = Math.floor(Math.random()*10) + 13; // random
    }
    return 'UA-41051680-' + trackingShard;
  }
};
})();



var trackingCode = gaEvt.trackingCode.master;
var trackingCodeShard = gaEvt.getShardNo();
var trackingCodeEvent = gaEvt.trackingCode.event;
var isTrackingComingsoon = /^\/web\/wcomingsoon/i.test(location.pathname);
var isTrackingRewardQna = /^\/web\/campaign\/(qa|detailPost)\//i.test(location.pathname);
var isTrackingEquityCampaign = /^\/web\/(equity\/campaign|wpayment)\//i.test(location.pathname);
var isTrackingRewardCampaign = /^\/web\/(campaign|wpurchase)\//i.test(location.pathname);

ga('create', trackingCode, { sampleRate: 50 });
ga('create', trackingCodeShard, 'auto', gaEvt.property.wadiz_ga_shard);
ga('create', trackingCodeEvent, 'auto', gaEvt.property.wadiz_event);
if (isTrackingComingsoon) {
  ga('create', gaEvt.trackingCode.master_coming_soon, 'auto', gaEvt.property.wadiz_coming_soon);
}
if (isTrackingRewardQna) {
  ga('create', gaEvt.trackingCode.master_reward_qna, 'auto', gaEvt.property.wadiz_reward_qna);
}
if (isTrackingEquityCampaign) {
  ga('create', gaEvt.trackingCode.master_equity_campaign, 'auto', gaEvt.property.wadiz_equity_campaign);
}
if (isTrackingRewardCampaign) {
  ga('create', gaEvt.trackingCode.master_reward_campaign, 'auto', gaEvt.property.wadiz_reward_campaign);
} else {
  ga('create', gaEvt.trackingCode.master_exclude_reward_campaign, 'auto', gaEvt.property.wadiz_exclude_reward_campaign);
}

var ua = navigator.userAgent || navigator.vendor || window.opera;
var dimensionKeyword;
if ((ua.indexOf("FBAN") > -1) || (ua.indexOf("FBAV") > -1) || (ua.indexOf("FB4A") > -1)) {
  dimensionKeyword = "Facebook";
} else if (ua.indexOf("ioswadiz") > -1 || (ua.indexOf("androidwadiz") > -1)) {
  dimensionKeyword = "WadizApp";
} else if (ua.indexOf("KAKAOTALK") > -1) {
  dimensionKeyword = "KakaoTalk";
} else if (ua.indexOf("Twitter") > -1) {
  dimensionKeyword = "Twitter";
} else if (ua.indexOf("Instagram") > -1) {
  dimensionKeyword = "Instagram";
} else if (ua.indexOf("NAVER") > -1) {
  dimensionKeyword = "NaverApp";
} else {
  dimensionKeyword = "unknown";
}

ga('set', gaEvt.dimension.in_app_mark, dimensionKeyword);
ga('send', 'pageview');

ga(gaEvt.property.wadiz_ga_shard + '.set', gaEvt.dimension.in_app_mark, dimensionKeyword);
ga(gaEvt.property.wadiz_ga_shard + '.send', 'pageview');

if (isTrackingComingsoon) {
  ga(gaEvt.property.wadiz_coming_soon + '.set', gaEvt.dimension.in_app_mark, dimensionKeyword);
  ga(gaEvt.property.wadiz_coming_soon + '.send', 'pageview');
}
if (isTrackingRewardQna) {
  ga(gaEvt.property.wadiz_reward_qna + '.set', gaEvt.dimension.in_app_mark, dimensionKeyword);
  ga(gaEvt.property.wadiz_reward_qna + '.send', 'pageview');
}
if (isTrackingEquityCampaign) {
  ga(gaEvt.property.wadiz_equity_campaign + '.set', gaEvt.dimension.in_app_mark, dimensionKeyword);
  ga(gaEvt.property.wadiz_equity_campaign + '.send', 'pageview');
}
if (isTrackingRewardCampaign) {
  ga(gaEvt.property.wadiz_reward_campaign + '.set', gaEvt.dimension.in_app_mark, dimensionKeyword);
  ga(gaEvt.property.wadiz_reward_campaign + '.send', 'pageview');
} else {
  ga(gaEvt.property.wadiz_exclude_reward_campaign + '.set', gaEvt.dimension.in_app_mark, dimensionKeyword);
  ga(gaEvt.property.wadiz_exclude_reward_campaign + '.send', 'pageview');
}
</script>
<script>
if(typeof fbq === 'undefined') {
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '1129096333844762'); // 리워드
fbq('init', '535249203534732');  // 투자
fbq('track', "PageView");
fbq("track", "ViewContent");
} else {
fbq('track', "PageView");
fbq("track", "ViewContent");
}
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1129096333844762&ev=PageView&noscript=1"
/></noscript>
<script type="text/javascript">

var google_conversion_id = 875479031;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt=""
src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/875479031/?v
alue=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<script type="text/javascript">
(function(w, d, a){
	w.__beusablerumclient__ = {
		load : function(src){
			var b = d.createElement("script");
			b.src = src; b.async=true; b.type = "text/javascript";
			d.getElementsByTagName("head")[0].appendChild(b);
		}
	};w.__beusablerumclient__.load(a);
})(window, document, '//rum.beusable.net/script/b180227e095823u236/8038910d93');
</script>
<script type="text/javascript">
window._tfa = window._tfa || [];
window._tfa.push({notify: 'event', name: 'page_view', id: 1172520});
!function(t, f, a, x) {if (!document.getElementById(x)) {
t.async = 1;t.src = a;t.id=x;f.parentNode.insertBefore(t, f);
}}(document.createElement('script'),
document.getElementsByTagName('script')[0],
'//cdn.taboola.com/libtrc/unip/1172520/tfa.js',
'tb_tfa_script');
</script>
<noscript><img src="//trc.taboola.com/1172520/log/3/unip?en=page_view" width="0" height="0" style="display:none"/></noscript>


<!-- E : page tracking code area -->

<script type="text/javascript">
window.intercomSettings={app_id:"lmfb1tir",hide_default_launcher:true,horizontal_padding:95};
(function(){var w=window;var ic=w.Intercom;if(typeof ic==="function"){ic('reattach_activator');ic('update',intercomSettings);}else{var d=document;var i=function(){i.c(arguments)};i.q=[];i.c=function(args){i.q.push(args)};w.Intercom=i;function l(){var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://widget.intercom.io/widget/rbpfw0z2';var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s,x);}if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})()
</script>
<!-- 판매자 리스트 끝 -->
</div>
</body>

</html>
