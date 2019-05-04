<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html> 
<html class="no-js">

<!DOCTYPE html>
<html lang="ko" data-phase="real">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
	<meta name="format-detection" content="telephone=no, address=no, email=no">
	<meta name="referrer" content="origin">
    <title>EARLYBUD 문의</title>
    <link rel="stylesheet" href="css/message/font-nav.css">
    <link rel="stylesheet" href="css/message/font-nav-booking.css">
    <link rel="stylesheet" href="css/message/font-nav-shopping.css">
    <link rel="stylesheet" href="css/message/font-nav-talk.css">
    <link rel="stylesheet" href="/static/front/rebrand/css/font-nav-newtalk.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/talk_common.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/talk_chatting.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/talk_message.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css-custom/chat-custom.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/talk_alarm.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/talk_friends.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/css/jquery.scrollbar.css">
    <script>
		document.domain='naver.com';
	</script>
	<!--[if lt IE 9]>
	<script src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/respond.min.js"></script>
	<![endif]-->
</head>
	<body onload="getGNB();">
		<div id="wrap"><!-- [D] footer 미노출시(높이값 800px 이하) class="footer_hide" 추가 -->
	        <!-- header -->
	        <!-- u_skip -->
	        <div id="u_skip">
	            <a role="button" href="#snb" class="u_skip_snb" onclick="document.getElementById('snb').tabIndex=-1;document.getElementById('snb').focus();return false;"><span>대화목록으로 바로가기</span></a>
	            <a role="button" href="#content" class="u_skip_content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>채팅방으로 바로가기</span></a>
	            <a role="button" href="#aside" class="u_skip_aside" onclick="document.getElementById('aside').tabIndex=-1;document.getElementById('aside').focus();return false;"><span>톡톡친구로 바로가기</span></a>
	        </div>
	        <!-- //u_skip -->

	
	        <!-- container -->
	        <div id="container">
			    <div id="snb" class="_chatListMain">
<div class="section_alarm">
    
<!-- alarm_area_header -->
<div class="alarm_header _noti_header">
    <h2 class="blind">대화목록 메뉴</h2>
    <ul class="category_area">
        <li class="list _list_all_button on"> <!-- [D] 활성화시 class="on" 추가-->
            <a href="#" role="button" class="link" data-event="SHOW_ALL_NOTI">
                <i class="ico_alarm_talk_alarm" aria-label="전체"></i>
                <strong class="text_alarm" aria-hidden="true">전체</strong>
            </a>
        </li>
        <li class="list _list_unread_button">
            <a href="#" role="button" class="link" data-event="SHOW_NEW_NOTI_ONLY">
                <span class="alarm_count _noti_new_cnt" aria-label="안읽음" data-count="0">0</span>
                <strong class="text_alarm" aria-hidden="true">안읽음</strong>
            </a>
        </li>
    </ul>
    <div class="search_area _search_area"> <!-- [D] input창 클릭 시 class="input_active"추가, 텍스트 입력시 class="text_on" 추가 -->
        <input type="text" title="search" class="input_search _search_txt_input">
        <strong class="friends_search">대화방 이름 검색<i class="ico_alarm_search"></i></strong>
        <strong class="enter_search">검색어 입력</strong>
		<a href="#" class="go_search_delete" role="button" data-event="RESET_SEARCH_INPUT">
			<i class="ico_alarm_search_delete" aria-label="검색 취소"></i>
		</a>
		<a href="#" class="go_search" role="button" data-event="LIST_SEARCH">
			<i class="ico_alarm_search _go_search_icon" aria-label="검색"></i> <!-- [D] 텍스트 입력시 class="ico_alarm_search_on" 변경 -->
		</a>
    </div>
    <!-- 토스트 메시지 -->
	<!-- [D] 활성화시 class="hide" 삭제-->
    <div class="toast_area _toast_area hide">
        <p>모두 읽으셨습니다.</p>
        <span class="bg_opacity"></span>
    </div>
    <!-- //토스트 메시지 -->
</div>
<!-- alarm_area_header -->

    
<div class="alarm_list _noti_list">
	 <h2 class="blind">대화목록</h2>
     <ul class="list_basic _list_cont">
     </ul>
     <a href="#" class="search_back _search_back" data-event="INIT_LIST" role="button" style="display: none;">
         <span class="text_back">돌아가기</span>
         <i class="ico_alarm_search_back"></i>
     </a>
</div>

    
<div class="_empty_area"style="display:none;">
    <div class="alarm_list_empty_area new_alarm _empty_new_area">
        <h2 class="blind">대화목록 없음</h2>
        <div class="text_area">
            <span class="title_area">새로운 톡톡이 없습니다.</span>
            <span class="dsc_area">톡톡에서 나의 활동소식, 관심사를<br>한 번에 받아보세요.</span>
<!--             <a href="#" class="go_alarm_setting _emptyAlarmSetting" role="button"> -->
<!--                 알림 설정하기 -->
<!--                 <i class="ico_alarm_setting"></i> -->
<!--             </a> -->
        </div>
    </div>

    <div class="alarm_list_empty_area no_search _empty_search_area" style="display: none;">
        <h2 class="blind">대화목록 검색결과 없음</h2>
        <div class="text_area">
			<span class="title_area _empty_search_text_area">
				<strong class="search_key">스타일</strong>에 대한<br>검색결과가 없습니다.
			</span>
            <a href="#" class="go_total_list" role="button" data-event="INIT_LIST">
                전체 목록보기
                <i class="ico_alarm_right_arrow_blue"></i>
            </a>
        </div>
    </div>
</div>

    
<!-- inc_alarm_area_footer -->
<div class="alarm_footer _noti_footer">
    <!-- [D] 노출시 class="hide" 삭제 -->
    <div class="alarm_checkbox_area _delete_mode_ui hide">
            <span class="input_box" data-event="ALL_CHECK_CLICK">
                <!-- [D] 체크시 class="checked" 추가-->
                <input type="checkbox" id="all-delete" name="delete-all" value="alldelete" data-event="ALL_CHECK_CLICK" class="_delete_all_checkbox">
                <span class="img_checkbox"></span>
            </span>
    </div>
    <div class="right_area">
        <!-- [D] 비노출시 class="hide"/ 노출시 hide 삭제
        <label for="all-delete">
            <a href="#" class="button_txt_delete _delete_mode_ui hide" role="button" data-event="DELETE_MARKED_NOTIS">
            <strong class="_delete_target_count">0개</strong> 삭제하기</a>
        </label>
         -->
		<!-- [D] 비노출시 class="hide" 추가 / 노출시 hide 삭제 -->
		<label for="all-delete" class="_delete_action_ui hide"> <!-- [D] 체크가 안되어있으면 class="hide" 추가 1개 이상 체크되면 class="hide" 제거 -->
			<a href="#" class="button_txt_delete" role="button" data-event="DELETE_MARKED_NOTIS"><strong class="_delete_target_count">3개</strong> 삭제하기</a>
			<span class="bar_vertical"></span>
		</label>
		
        <a href="#" class="button_txt_cancel _delete_mode_ui hide" role="button" data-event="DELETE_MODE_OFF">취소</a>
        <a href="#" class="button_delete _delete_mode_on_button" role="button" data-event="DELETE_MODE_ON">
            <i class="ico_alarm_delete" aria-label="삭제"></i>
            <span class="blind" role="alert">대화목록에서 선택해주세요</span>
        </a>
    </div>
   
</div>	<!-- inc_alarm_area_footer -->

</div>
</div>
			    <!-- 여기부터 없애면 오른쪽 톡톡친구찾기 사라짐 
			    <div id="aside" role="complementary" class="_friendMain">

<div class="section_friends no_friends open">  [D] 톡톡친구가 하나도 없으면(모든 class="wrap_list"에 class="hide" 추가되어있으면) class="no_friends" 추가 
    <div class="_friend_list">

	
	
	 전체 검색결과 없음 : wrap_list, search_back_area  hide해야함
	<div class="friends_no_search_area hide">
		<h2 class="blind">검색 결과없음</h2>
		<div class="text_area">
			<span class="search_key">스타일</span><span class="text">에 대한<br>검색결과가 없습니다.</span>
			<a href="#" class="go_total_list" role="button">
				전체 목록보기
				<i class="ico_friends_right_arrow"></i>
			</a>
		</div>
	</div>
	
	<div class="friends_border">
		<div class="friends_list_area">

			<!-- 새 톡톡친구
			<div class="wrap_list _newFriendArea on hide"> <!-- [D] 리스트가 없으면 class="hide" 추가 
				<div class="wrap_inner">
					<h3 class="list_title_area">
						<strong class="title">새 톡톡친구</strong>
						<em class="count"></em>
						<a href="#" class="toggle_list" role="button"> <!-- [D] 토글시 'wrap_list' 클래스에 class="on" 추가 -->
							<!-- [D] 접기 : class="ico_friends_toggle_on" aria-lable="접기"
							 	   펼처보기 : class="ico_friends_toggle_off aria-lable="펼처보기"
							<i class="ico_friends_toggle_off" aria-label="펼처보기"></i>
						</a>
					</h3>
					<ul class="friends_list">
						<!-- template\pc\friend\friend_list.html
					</ul>
				</div>
			</div>

			<!-- 즐겨찾기 
			<div class="wrap_list _bookmarkFriendArea on hide">
				<div class="wrap_inner">
					<h3 class="list_title_area">
						<em class="title">즐겨찾기</em>
						<strong class="count"></strong>
						<a href="#" class="toggle_list" role="button">
							<i class="ico_friends_toggle_off" aria-label="펼처보기"></i>
						</a>
					</h3>
					<ul class="friends_list">
						<!-- template\pc\friend\friend_list.html
					</ul>
				</div>
			</div>
			
			<!-- 네이버 공식계정 
			<div class="wrap_list _officialFriendArea on hide">
				<div class="wrap_inner">
					<h3 class="list_title_area">
						<em class="title">네이버 공식계정 톡톡친구</em>
						<strong class="count"></strong>
						<a href="#" class="toggle_list" role="button">
							<i class="ico_friends_toggle_off" aria-label="펼처보기"></i>
						</a>
					</h3>
					<ul class="friends_list">
						<!-- template\pc\friend\friend_list.html 
					</ul>
				</div>
			</div>

			<!-- 톡톡친구 
			<div class="wrap_list last_list _myFriendArea on hide">
				<div class="wrap_inner">
					<h3 class="list_title_area">
						<em class="title">내 톡톡친구</em>
						<strong class="count"></strong>
						<a href="#" class="toggle_list" role="button">
							<i class="ico_friends_toggle_off" aria-label="펼처보기"></i>
						</a>
					</h3>
					<p class="no_search_area hide">검색결과가 없습니다.</p>
					<ul class="friends_list">
						<!-- template\pc\friend\friend_list.html
					</ul>
				</div>
			</div>
			
			<!-- 추천친구
			<div class="wrap_list _allFriendArea on hide">
				<div class="wrap_inner">
					<h3 class="list_title_area">
						<em class="title">추천 톡톡친구</em>
						<strong class="count"></strong>
						<a href="#" class="toggle_list" role="button">
							<i class="ico_friends_toggle_off" aria-label="펼처보기"></i>
						</a>
					</h3>
					<ul class="friends_list">
						<!-- template\pc\friend\friend_list.html 
					</ul>
				</div>
			</div>

			<div class="search_back_area hide">
				<span class="back_line_top"></span>
				<a href="#" class="go_back" role="button">
					<span class="text_back">돌아가기</span>
					<i class="ico_friends_search_back"></i>
				</a>
			</div>
	
			
		</div> <!-- end friends_list_area --
		<div class="total_border"></div>
	</div><!-- end friends_border --
	
	<div class="_friend_rcmd">
		<div class="wrap_more_friends wrap_list_count_0">
			<!-- [D] wrap_list 갯수의 따른 class 분기처리
				wrap_list 0개 : class="wrap_list_count_0" 추가
				wrap_list 1개 : class="wrap_list_count_1" 추가
				wrap_list 2개 : class="wrap_list_count_2" 추가
				wrap_list 3개 : class="wrap_list_count_3" 추가
				wrap_list 4개 : class="wrap_list_count_4" 추가
				wrap_list 5개 : 클래스 없음
			--

		</div></div>
	
	<div class="more_friends_list_area button_bottom"> <!-- [D] 클릭시 section_friends 클래스에 class="open" 추가 --
	<h3 class="list_title_area">
		<a href="#" class="title _openRcmdBox" role="button">친구 추가 없이 문의하세요!</a>
	</h3>
</div></div>
    <div class="layer_info_area _partner_info hide"></div>
</div></div>근데 문제는..톡 내용도 사라짐.. -->
			    <div id="content" role="main" class="_chatMain">
<div class="section_chatting _chat  ">
	<div class="chat_info _chatInfo ">







	


<div class="inr" data-possible-friend="true">
	<div class="chat_thmb_area">
		<div class="chat_thmb">
			<img src="/shop1.phinf.naver.net/20180130_288/talk_1517289651373nawaR_PNG/image.PNG?type=f164" alt="스윗릴리플라워" width="41" class="_userImage">
			<span class="mask"></span>
		</div>
		<a href="#" role="button" class="bookmark _bookmarkBtn  hide"><i class="ico_star" aria-label="즐겨찾기"></i></a>
	</div>
	
	<!-- [D] : 아이콘이 3개 일 경우 .chat_title_area에 .size_sm 추가 / 4개 일경우 size_xs 추가 -->
	<!--
	<div class="chat_title_area _titleArea">
		<p class="title">ㅓㅓㅓㅏㅏ
			<span><span class="_userName">스윗릴리플라워</span>
				<a href="http://www.sweetlily-flower.com" target="_blank" title="새 창" class="home _userHome N=a:cht.home "><i class="ico_home" aria-label="홈"></i></a>
			</span>
		</p>
		<div class="sub_title _subTitle hide">
			<a href="#" role="button" class="view _moreInfoBtn">
				<p class="text_response"><span class="_responseInfo"></span>
					<i class="btn_fold _moreInfoIcon " aria-label="상세보기"></i>
				</p>
			</a>
			<div class="inr _detaiInfo">
				
			</div>
		</div>
	</div>
	-->
	
	<div class="chat_title_area _titleArea">
		<div class="title">
			<strong class="blind">이름</strong>
			<!-- [D] :  이름 옆 아이콘 1개 추가시 .text_name에 .icon_one추가, 이름 옆 아이콘 2개 추가시 .text_name에 .icon_two추가 -->
			<span class="text_name _userName">스윗릴리플라워</span>
			<span class="title_icon_area _titleIconArea">
				<i class="ico_common_official _officialIcon hide"><span class="blind">공식계정</span></i>
				<a href="http://www.sweetlily-flower.com" class="ico_home _userHome N=a:cht.home " target="_blank" title="새창"><span class="blind">홈페이지</span></a>
			</span>
		</div>
		<div class="sub_title _subTitle hide">
			<a href="#" class="view _moreInfoBtn"><!-- [D] 판매자인포 펼칠때 on 클래스 추가 -->
				<p class="text_response">
					<span class="_responseInfo"></span>
					<i class="btn_fold _moreInfoIcon " aria-label="상세보기"></i>
				</p>
			</a>
			<div class="inr _detaiInfo">
			</div>
		</div>
	</div>
	
	<span class="friend_num _friendCount hide">친구 <em class="count _count"></em></span>
	
	<!-- [D] 버튼 클릭 시 btn_chat_header 클래스에 on 클래스 추가 -->
	<a href="#" class="btn_chat_header ico_friend _friendBtn  " role="button">
		<i class="icon"><span class="blind">친구혜택 상세보기</span></i>
		<div class="layer_friend _benefit hide">
			<span class="text">친구맺기<em class="_text"></em></span>
		</div>
	</a>
	<a href="#" class="btn_chat_header ico_social _pcShareBtn naver-splugin" id="spiButton" role="button" data-style="unity" data-title="" data-prevent-short-url="on">
		<i class="icon naver-splugin-c"><span class="blind">공유하기</span></i>
	</a>
	<a href="#" class="btn_chat_header ico_menu _settingBtn" role="button">
		<i class="icon"><span class="blind">채팅 설정</span></i>
	</a>
	<div class="chat_layer _chatSetting hide" style="top:41px;right:19px">




<div class="ly_setting_wrap">
	<div class="ly_setting_title _infoTitle _defaultTitle hide"><h2>알림 설정</h2></div>
	<div class="ly_setting_title _infoTitle _nidInfoTitle hide"><h2>네이버회원 필수 알림</h2></div>
	<div class="ly_setting_area">
		<ul class="lst_setting_menu _settings">
		<!-- [D] 알림 영역 클릭 시에 setting_alarm 클래스에 active 클래스 추가 -->
		<li class="_setting _badgeAlarm setting_alarm hide active">
			<div>
				<a href="#" role="button" class="menu_item _alarmBtn">알림</a>
				<!-- [D] 인포아이콘 클릭 시 setting_info클래스에 active 클래스 추가 -->
				<div class="setting_info _tooltip v2">
					<a href="#" role="button" class="_alarmInfo"><i aria-label="안내"></i></a>
					<p><a href="#" role="button" class="_alarmClose">소리와 진동없이 아이콘에<br>숫자로 표시되는 알림입니다.</a><i class="setting_info_close _alarmClose"></i><i class="setting_info_tail"></i></p>
				</div>
				<!-- [D] 클릭 시 btn_toggle클래스에 active 클래스 추가 -->
				<a href="#" role="button" class="btn_toggle _alarmBtn _toggleBtn"></a>
			</div>
		</li>
		
		<!-- [D] 알림 영역 클릭 시에 setting_alarm 클래스에 active 클래스 추가 -->
		<li class="_setting _pushAlarm setting_alarm hide active">
			<div>
				<a href="#" role="button" class="menu_item _alarmBtn">푸시알림</a>
				<!-- [D] 인포아이콘 클릭 시 setting_info클래스에 active 클래스 추가 -->
				<div class="setting_info _tooltip">
					<a href="#" role="button" class="_alarmInfo"><i aria-label="안내"></i></a>
					<p><a href="#" role="button" class="_alarmClose">네이버앱을 통해 소리와<br>진동으로 알려드립니다.</a><i class="setting_info_close _alarmClose"></i><i class="setting_info_tail"></i></p>
				</div>
				<!-- [D] 클릭 시 btn_toggle클래스에 active 클래스 추가 -->
				<a href="#" role="button" class="btn_toggle _alarmBtn _toggleBtn active"></a>
			</div>
		</li>
		
		<li class="_setting _payAlarm hide"><a href="#" onclick="window.open('http:\/\/pay.naver.com\/mypage\/orderReceiveUpdatePopup', 'paySetting', 'resizable=yes,scrollbars=yes,titlebar=no,status=no,width=450,height=420'); return false;" target="_blank" title="새 창" class="menu_item _payNotiMethodText">네이버페이 알림 수신 설정</a><span class="ico_link_arrow2"></span></li>
		<li class="_setting _block hide"><a href="#" role="button" class="menu_item">차단하기</a><a href="#" role="button" class="btn_toggle _toggleBtn"></a></li>
		<li class="_setting _report hide"><a href="#" class="menu_item" onclick="window.open('https:\/\/help.naver.com\/support\/alias\/talk\/talks.naver', 'report', 'titlebar=no,status=no,resizable=yes,scrollbars=yes,width=1050,height=890');return false;">신고하기</a></li>
		<li class="_setting _leave hide"><a href="#" role="button" class="menu_item">채팅방 나가기</a></li>
		</ul>
		<div class="txt_alarm_info _infoArea hide">
            <p class="_info _nidNotiInfo hide">※ 네이버 아이디의 주요정보 변경 및 <br>보안과 관련된 필수알림</p>
			<p class="_info _payInfo hide">※ 네이버페이 관련 중요 알림은<br>전체 <span>알림 <em>OFF</em> 상태에서도 발송</span>됩니다.</p>
			<p class="_info _reservationInfo hide">※ 네이버예약 관련 중요 알림은<br>전체 <span>알림 <em>OFF</em> 상태에서도 발송</span>됩니다.</p>
            <p class="_info _nidInfo hide">※ 회원정보 관련 중요 알림은<br>전체 <span>알림 <em>OFF</em> 상태에서도 발송</span>됩니다.</p>
            <p class="_info _payCenter hide">네이버앱을 통해<br>소리와 진동으로 알려드립니다.<br>단, <span>에티켓 시간(21:00 ~ 09:00)</span> 에는 <br>푸시알림은 발송되지 않습니다.</p>
			<!-- <p class="_info _settingInfo hide">※ 네이버앱으로 알림을 받으시면<br>구매확정시 <span>포인트 <em>100</em>원을 적립</span>해드립니다.</p> -->
			<!-- <a class="_info _settingInfo hide" href="#" onclick="window.open('http:\/\/pay.naver.com\/mypage\/orderReceiveUpdatePopup', 'paySetting', 'resizable=yes,scrollbars=yes,titlebar=no,status=no,width=450,height=420'); return false;" target="_blank" title="새 창">설정하러 가기<i class="ico_link_arrow"></i></a> -->
		</div>
	</div>
	<a href="#" role="button" class="ly_chat_setting_close _closeBtn" aria-labe="설정 닫기"><span></span></a>
</div></div>
	
</div>
<!-- 쇼핑봇 상단 알림 -->
<div class="chat_message_noti _laonEnable hide">
	<i class="sp_chat_chatting"></i>
	<span>자동응답중입니다.</span>
	<a href="#" role="button" class="chat_important _laonInfoBtn hide">
		<i class="sp_chat_info" aria-label="안내문구"></i>
	</a>
	<a href="#" role="button" class="btn_close _laonDisableBtn hide"><em class="blind">닫기</em></a>
	<div class="dimmed"></div>
</div>
<!-- //쇼핑봇 상단 알림 -->

</div>
	
	<div class="chat_ly_banner shoppingbot _shoppingBotStartBanner _shoppingBotStartBannerTop hide" style="top:115px;right: 12px;left:auto">
		<a href="#" class="btn_shoppingbot _shoppingBotStartBtn">
			<span class="blind">쇼핑챗봇 시작하기</span>
		</a>
		<div class="layer_tooltip left _shoppingBotTooltip hide" style="top:-2px;width:155px;">
			안녕하세요. <strong>상담을 <br>도와드릴 쇼핑챗봇</strong>입니다.
			<button class="btn_toolip_close _shoppingBotTooltipClose"><span class="blind">닫기</span></button>
		</div>
	</div>
	
	<!-- [D] 로딩중 일때 hide 클래스 추가 -->
	<div class="chat_area _customScrollArea _chatWindow">
<ul class="group_message_balloon">

</ul>
	</div>
	<!-- 로딩중 페이지 -->
	<div class="loading hide _loading" aria-label="로딩중"></div>
	<!-- //로딩중 페이지 -->
	
	<div class="chat_tooltip _buddyGuide" style="left:54px;bottom:56px;display:none;">
		<p>톡톡으로 감사 인사를 보내세요!</p>
		<button class="btn_close"><i><span class="blind">닫기</span></i></button>
		<i class="tooltip_tail arr_bottom"></i>
	</div>

	<div class="imageview _imageView hide">
<div class="inr">
	<img class="_image" alt="이미지">
	<div class="btn_area">
		<a href="#" role="button"><i class="btn_close _closeBtn" aria-label="닫기"></i></a>
	</div>
</div>
<div class="image_util_area _imagePageing">
	<div class="btn_wrap">
		<span class="inner paging" aria-label="페이지">
			<span class='_pageInfo'></span>
			<a href="#" class="prev _prevBtn"><i aria-label="이전"></i></a>
			<a href="#" class="next _nextBtn"><i aria-label="다음"></i></a>
		</span>
		<i class="chat_mask mask_left"></i>
		<i class="chat_mask mask_right"></i>
	</div>
	<div class="btn_wrap">
		<a href="#" class="inner btn_original _viewOriginal" target="_blank">원본보기</a>
		<i class="chat_mask mask_left"></i>
		<i class="chat_mask mask_right"></i>
	</div>
</div>
<div class="dimmed"></div>
</div>
	<div class="chat_widget _chatFooter">


<div class="chat_ly_banner shoppingbot_start _shoppingBotStartBanner _shoppingBotStartBannerBottom hide">
	<a href="#" class="btn_shoppingbot_start _shoppingBotStartBtn">
		쇼핑챗봇에게 물어보세요!
	</a>
	<a href="#" class="btn_close ico_close_white_xm _shoppingBotBannerClose"><i aria-label="닫기"></i></a>
</div>
<div class="chat_composite_option_area _bottom _quickLayer hide">
<div class="_scroll">
	<strong class="blind">옵션 사항을 선택해주세요</strong>
	<ul class="list_btn_option _quickList">
	</ul>
</div></div>

<div class="chat_layer_sticker _chatSticker hide _bottom" style="right:-1px;bottom: 49px;left:-1px;">
	<div class="chat_sticker">
		<div class="chat_sticker_tab">
			<!-- [D] 더 이상 앞으로 넘어 갈 수 없을 경우 .disabled class 추가 -->
			<button type="button" title="이전" class="chat_sticker_prev _prevPackBtn"><i></i><span>이전</span><em></em></button>
			
			<!-- [D] 선택되었을 때 li class="on" 추가 -->
			<ul class="chat_lst_sticker_set _stickerPackTab">
			</ul>
			<div id="stickerPopLayer" class="stickerPopLayer _stickerPreviewLayer hide" style="display: block;">
				<div class="bg"></div>
				<div id="dimmedLayer" class="pop-layer" style="left: 8px; top: 15px;">
					<img src="data:image/gif;base64,R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs=" width="108" height="100">
				</div>
			</div>
			<a href="http://m.gfmarket.naver.com/sticker/home" target="_blank" class="btn_cross_more">
				<i class="ico_sticker_new"><span class="blind">NEW</span></i>
				<span class="blind">더보기</span>
			</a>
			<!-- [D] 더 이상 뒤로 넘어 갈 수 없을 경우 disabled class 추가 -->
			<button type="button" title="다음" class="chat_sticker_next _nextPackBtn"><i></i><span>다음</span><em></em></button>
		</div>
	</div>	
</div>
<div class="ly_fixedmenu type_chatting _persistentMenu hide"></div>
<div class="ly_chat_toast _messageToast" style="display: none;">
</div> 
<div class="toast _toast" style="display: none;">
	<p></p>
	<span class="bg_opacity"></span>
</div>
<div class="_chatBanner hide">
<div class="chat_ly_banner circle hide _circleType">
	<a href="#" class='_chatBannerLink' target="_blank" title="새창"><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="_chatBannerImage" alt="" width="170" height="170"></a>
	<a href="#" class="btn_close ico_close_black _closeBtn"><i aria-label="닫기"></i></a>
</div>
<div class="chat_ly_banner offset _bottom hide _bottomType">
	<a href="#" class="chat_banner type_border _chatBannerLink bg_blue" target="_blank" title="새창">
		<span class="visible_block"><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="_chatBannerImageLeft" width="" height="" alt=""></span>
		<span class="img_banner"><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" class="_chatBannerImageRight" width="" height="" alt=""></span>
		<a href="#" class="btn_close ico_close_white _closeBtn hide"><i aria-label="닫기"></i></a>
	</a>
</div></div>
<div class="faq_toast _faqIntro hide">
	<span class="bg_opacity"></span>
	<p>자주 묻는 질문들을 미리 확인해보세요.</p>
	<a href="#" class="btn_close _faqCloseBtn" role="button"><i>닫기</i></a>
</div>
<div class="chat_faq _chatFaq hide">
<div class="scroll-x _scroll" style="opacity: 0.9;	filter: alpha(opacity=90);	background-color: #f0f2f5;">
	<!-- [D] 한줄에 보이게끔 처리한 임의로 넣은 width값입니다. -->
	<ul class="lst_guide_message _faqList">
	</ul>
</div>
<i class="border_top"></i></div>
<div class="chat_guide_message _chatGuide hide">
<div class="bg_opacity"></div>
<div class="scroll-x _scroll">
	<!-- [D] 한줄에 보이게끔 처리한 임의로 넣은 width값입니다. -->
	<ul class="lst_guide_message _guideList" style="width:20000px;">
	</ul>
</div>
<i class="border_top"></i>
					</div>
<!-- [D] 두줄일 경우 v3클래스를 추가해주세요 -->

<div class="chat_write _chatWrite ">
	

<div class="chat_write_area _writeArea _bottom">
	<a href="#" class="chat_write_btn _persistentMenuToggleBtn hide"><i class="ico_fixedmenu" aria-hidden="true"></i><span class="blind">챗봇 고정메뉴</span></a>
	<label for="imageUploadForm" class="chat_write_btn _imageUploadBtn "><i class="ico_photo" aria-hidden="true"></i><span class="blind">사진</span></label>
	<a href="https://pay.naver.com/mygift/s" class="chat_write_btn _giftBtn hide" target="_blank"><i class="ico_gift" aria-hidden="true"></i><span class="blind">선물함</span></a>
	<a href="#" role="button" class="chat_write_btn _vphoneBtn "><i class="ico_phone" aria-hidden="true"></i><span class="blind">전화</span></a>
	<a href="#" role="button" class="chat_write_btn _stickerBtn "><i class="ico_sticker" aria-hidden="true"></i><span class="blind">스티커</span></a>
	<div class="text">
		<textarea name="" placeholder="메시지를 입력하세요." title="메시지 입력창" class="_textarea scrollbar-macosx"></textarea>
	</div>
	<a href="#" class="btn_faq _faqBtn hide">FAQ</a>
	<a href="#" class="btn_submit _sendBtn"><i class="ico_submit" aria-hidden="true"></i><span class="blind">전송</span></a>
	<div style="position:absolute;width:0px;height:0px;overflow:hidden;">
		<form id="imageUploader" method="post" enctype="multipart/form-data" >
			<input type="file" id="imageUploadForm" class="N=a:wid.pic" accept="image/*" name="files[]" multiple="multiple" style="" title="파일선택"/>
		</form>
	</div>
</div>

</div>
<div class="chat_write _newsPartnerWrite _bottom hide">
	

<a href="http://www.sweetlily-flower.com" target="_blank" title="새 창" class="_partnerUrl _newsPartnerUrl store_account N=a:chb.home">
	<img class="_payIcon hide" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/img/ico_services/ico_checkout.png" width="40" height="40" alt="" role="presentation">
	<span class="text _partnerName">스윗릴리플라워</span>
</a>

</div>

<div class="chat_write disabled _chatDisabled hide">
	
<i class="border_top"></i>
<div class="chat_write_area _bottom">
	<div class="text _text _stop hide">사용이 중지된 파트너입니다.</div>
	<a href="#" role="button" class="btn_out _btn _leave _stop hide">나가기</a>
	<div class="text _text _block _hide">차단 해제 후 대화가 가능합니다.</div>
	<a href="#" role="button" class="btn_out _btn _block hide">차단해제</a>
	<div class="text _text _partnerBlock hide">차단되어 대화할 수 없습니다.</div>
	<a href="#" role="button" class="btn_out _btn _leave _partnerBlock hide">나가기</a>
	<div class="text _text _end hide">대화가 종료되었습니다.</div>
	<a href="#" role="button" class="btn_out _btn _leave _end hide">나가기</a>
</div>
</div>

<div class="chat_write store_account_fixedmenu _bottom hide _payPersistentMenu">
	<ul class="list_account_btn layout_fluid">
		<li class="item_account_btn home column_middle">
			<a href="https://pay.naver.com?frm=me" class="btn_account N=a:chb.home" target="_blank">
				<i class="sp_home_account"></i>
				<span class="blind">해당 공식계정 페이지로 이동</span>
			</a>
		</li>
		<li class="item_account_btn column_middle">
			<a href="https://order.pay.naver.com/home" class="btn_account" target="_blank">
				<span class="text_account">결제내역</span>
			</a>
		</li>
		<li class="item_account_btn column_middle">
			<a href="https://order.pay.naver.com/home?tabMenu=POINT_TOTAL" class="btn_account" target="_blank">
				<span class="text_account">포인트내역</span>
			</a>
		</li>
		<li class="item_account_btn column_middle">
			<a href="https://pay.naver.com/send/p/list/s" class="btn_account" target="_blank">
				<span class="text_account">송금내역</span>
			</a>
		</li>
	</ul>
</div>
</div>
	<div class="chat_ly_banner _absentBanner hide" style="bottom: -80px;">


<div class="shopping_bot _laon hide" aria-rabel="상담원 부재중 쇼핑챗봇 메시지">
	<strong>상담원이 자리를 비웠습니다.</strong>
	<span>쇼핑챗봇 beta가 간단한 요청사항을 도와드리겠습니다.</span>
</div>
<div class="_normal " aria-rabel="상담원 부재중 메시지">
	<strong>상담원이 자리를 비웠습니다.</strong>
	<span>문의 내용을 남겨주시면 들어와서 바로 답변드리겠습니다.</span>
</div>
<i class="border_top"></i></div>	
	<div class="chat_popup _vphone hide on" style="top: 50%; left: 50%; margin: -218.5px 0px 0px -149px;">
<div class="ly_box info_msg _step0 hide">
	<div class="box_content">
		<i class="ico_safecall_2"></i>
		<p class="tit_safecall">안심전화번호란?</p>
		<p class="desc"><strong>본인의 전화번호를 공개하지 않고<br>1회용 연락처를 발급받아 상담을요청하는<br> <span class="point">개인 정보 보호용 전화상담 서비스</span>입니다.</strong></p>
		<div class="btn_area">
			<a href="#" class="btn btn_use _close_step0" role="button">안심전화번호 사용하기<i class="ico_arr_rgt"></i></a>
		</div>
	</div>
	<div class="box_footer">
		<span class="ir_chk">
			<input type="checkbox" id="vphoneinfonolook" class="_nolookInfo">
			<label for="vphoneinfonolook" class="btn_chked _nolookInfoClick" aria-label="다시 보지않기 활성화/비활성화"></label>
		</span>
		다시보지 않기
	</div>
	<a href="#" role="button" class="sp_safecall btn_clse_ly _close_step0" aria-label="닫기"></a>
</div>
<div class="ly_box safecall _step1 hide">
	<div class="box_content">
		<i class="ico_safecall_1"></i>
		<p class="desc"><strong>현재 사용중인 <span class="point">안심번호가 없습니다</span></strong>	</p>
		<p class="msg">아래에 연락 받으실 전화번호를 입력 후 <br>안심번호 생성 버튼을 눌러주세요.<br>안심번호는 <em class="point"><span class="_step1_expireDate"></span>일까지 사용</em>이 가능합니다.</p>
		<p class="hp"><input type="text" placeholder="전화번호를 입력하세요." class="input_text _inputTel" title="전화번호" maxlength="12"></p>
		<div class="agree">
			<input type="checkbox" name="groups" id="vphoneagree"><i class="ipt_chk _agree"></i>
			<label for="vphoneagree" class="_agree">
				<span class="txt">안심번호 이용을 위한 전화번호 수집에 동의합니다. 전화번호는 90일 후 삭제됩니다. <a href="#" role="button" class="link_show _show_step3">보기<i class="sp_safecall ico_show"></i></a></span>
			</label>
		</div>
	</div>
	<div class="box_footer">
		<span class="btn_area">
			<a href="#" role="button" class="btn _create">안심번호 생성</a>
		</span>
	</div>
	<a href="#" role="button" class="btn_clse_ly _close" aria-label="닫기"></a>
</div>
<div class="ly_box safecall request _step2 hide">
	<div class="box_content">
		<i class="sp_safecall ico_safecall_3"></i>
		<p class="desc"><span class="expire">유효기간 : <em class="_expireDate">2016.05.26</em></span><strong class="tel _vphoneNum">0507-3400-9550</strong></p>
		<p class="msg">연결 전화번호: <em class="_realNum">010-3783-8318</em><br>생성된 안심번호로<br>상담 요청을 하시겠습니까?</p>
		<a href="#" role="button" class="btn_ref _delete"><i class="ico_ref"></i>번호 다시받기</a>
	</div>
	<div class="box_footer">
		<span class="btn_area">
			<a href="#" role="button" class="btn request _send"><i class="ico_phone"></i>상담요청하기</a>
		</span>
		<a href="#" role="button" class="sp_safecall btn_clse_ly _close" aria-label="닫기"></a>
	</div>
</div>
<div class="ly_box ly_safecall _step3 hide">
	<dl class="safecall_info">
		<dt>안심번호 서비스 이용 안내</dt>
		<dd>
			<p><strong>안심번호 서비스는 네이버 회원의 개인정보보호를 위해 안심번호 상담 시, 실제 전화번호가 톡톡 대화상대인 사업자 (톡톡 파트너)에게 노출되지 않도록 일회용 안심번호를 발급해 드리는 서비스입니다.</strong></p>
			<ol>
				<li><b>1.</b>개인 전화번호 대신 일회용 안심번호가 사용됩니다. 사업자는 실제 전화번호를 알 수 없으며 안심번호만으로 회원님께 연락 드립니다.</li>
				<li><b>2.</b>안심번호는 톡톡 대화창에서 확인하실 수 있습니다.</li>
				<li><b>3.</b>톡톡 안심번호를 통한 상담일로부터 90일 이후에 안심번호는 자동으로 해지됩니다.</li>
				<li><b>4.</b>안심번호 사용 시, 사업자가 개인적으로 발송하는 SMS가 전달되지 않을 수 있습니다.</li>
				<li><b>5.</b>안심번호 발급을 위해 세종텔레콤에 회원님이 입력하신 전화번호가 처리위탁됩니다.</li>
			</ol>
		</dd>
	</dl>
	<div class="pop_btn_area"><a href="#" role="button" class="_close_step3">확인</a></div>
	<a href="#" role="button" class="btn_clse_ly _close_step3" aria-label="닫기"></a>
</div>
<div class="ly_box info_msg _stepDelete hide">
	<div class="box_content">
		<i class="ico_safecall_4"></i>
		<p class="tit_safecall">안심번호를 변경하시겠습니까?</p>
		<p class="desc"><strong><span class="point">안심번호 변경시,<br>기존 사용하던 안심번호는 사용이 불가</span>합니다.<br>번호를 변경하시겠습니까?</strong></p>
	</div>
	<div class="box_footer v2">
		<span class="btn_area">
			<a href="#" class="btn btn_confirm _deleteConfirm" role="button">확인</a>
			<a href="#" class="btn btn_disabled _deleteCancel" role="button">취소</a>
		</span>
	</div>
	<a href="#" class="sp_safecall btn_clse_ly _deleteCancel" aria-label="닫기" role="button"></a>
</div></div>
	<div class="chat_popup _chatPopup on hide" style="top: 50%; left: 50%; margin: -219px 0px 0px -149px;"></div>
	<div class="chat_popup _laonInfo on hide" style="top: 50%; left: 50%; margin: -179.5px 0px 0px -153px;">
<div class="chat_popup_shoppingbot_profile ly_box ">
	<div class="img_area"><img src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/front/rebrand/img/shoppingbot_74.png" width="74" height="74" alt=""></div>
	<h4>쇼핑챗봇이란?</h4>
	<div class="text_shoppingbot">
		<p>안녕하세요. 상담을 도와드릴 쇼핑챗봇입니다.<br><em>상품구매, 스토어인기상품, 취소, 교환, 반품관련<br>간단한 문의</em>는 저를 이용해보세요.</p>
		<p>판매자님께 직접 문의를 원하시면<br>쇼핑챗봇 종료 버튼을 눌러주세요.</p>
	</div>
	<a class="btn_close _closeBtn" href="#" role="button">닫기</a>
	<a class="ly_close _closeBtn" href="#"></a>
</div>
<div class="dimmed"></div></div>
	<div class="_deliveryTrace hide">
<div class="chat_popup on _deliveryTraceInner" style="top:50%;left:50%;margin-left:-200px;">
	<div class="chat_popup_delivery_trace">
	<p class="title">배송조회</p>
	<div class="delivery_area _mCustomScrollbar">
		<table class="delivery_list" summary="처리일시,처리장소,배송상태를 알려주는 목록이다.">
			<caption class="blind">배송조회 목록</caption>
			<colgroup>
				<col style="width:100px">
				<col>
				<col style="width:100px">
			</colgroup>
			<thead class="blind">
			<tr>
				<th scope="col">처리일시</th>
				<th scope="col">처리장소</th>
				<th scope="col">배송상태</th>
			</tr>
			</thead>
			<tbody class="_deliveryTraceList">
			
			</tbody>
		</table>
	</div>
	<p class="text">
		본 정보는 배송사와의 제휴하에 (주)굿스플로와 (주)스윗트래커에서 제공하는 정보로<br>실제 배송상황과 다를 수 있습니다.
	</p>
	<div class="btn_close">
		<a href="#" class="_closeBtn" aria-label="닫기"></a>
	</div>
</div>
<div class="dimmed"></div>
</div></div>
</div>
<div class="section_chatting _chatEmpty">
	<!-- 채팅목록, 친구목록 미선택 화면 페이지 -->
	<div class="chat_message_empty">
		<i class="bg_message_default"></i>
		<h3>대화내역이 없습니다.</h3>
		<p>
			<span class="txt_size_small">쇼핑몰 판매자, 작가, 부동산중개인과 직접 대화하는 '네이버톡톡'<br>지금 바로 대화를 시작해보세요!</span>
		</p>
	</div>
	<!-- //채팅목록, 친구목록 미선택 화면 페이지 -->
</div>
</div>
	        </div>
	        
	        <div class="chat_popup _talk_confirm" style="z-index:10000;top: 50%; left: 50%; margin: -90px 0px 0px -153px;">
	        	
<div class="layer_alert _ui_confirm " role="alertdialog">
	<h4 class="alert_title _ui_title"></h4>
	
	<p class="alert_text _ui_content"></p>
	
	<div class="btn_area _ui_btnArea">
		<button type="button" class="btn_default _ui_leftBtn">취소</button>
		<button type="button" class="btn_primary _ui_rightBtn">확인</button>
	</div>
	<button type="button" class="btn_alert_close _ui_closeBtn"><i class="ico_common_x"><span class="blind">닫기</span></i></button>
</div>
</div>
	        
	        <div id="footer" role="contentinfo">
				<p class="talk_copyright">
					Copyright ©
					<strong>
						<a href="http://www.naver.com/" target="_blank" title="새 창">NAVER Corp.</a>
					</strong>
					All Rights Reserved.
				</p>
			</div>
        </div>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery-1.11.2.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.tmpl.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery-dateFormat.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.client.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.cookie.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.visible.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/linkify.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/socket.io.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.mousewheel.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.mCustomScrollbar.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.scrollbar.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/jquery.placeholder.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/eg-1.2.0.min.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/lcslog.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/require.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/front/BizTalk.Utils.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/front/BizMarketing.ClickLog.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/nclk_evt_biztalk.user.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/common/share_pc.js" charset="UTF-8"></script>
		<script type="text/javascript" src="https://ssl.pstatic.net/static.talk/biztalk/201901101525/js/build-pc/pc/talk-main.js" charset="UTF-8"></script>
			

<script type="text/javascript" charset="UTF-8">
var URLS = {
	'frontUrl' : 'https://talk.naver.com/',
	'chatbotPlatform' : 'https://bot.talk.naver.com',
	'bookingApiDomain' :'bookingapi.naver.com',
	'payDeliveryTracking' :'https://order.pay.naver.com/delivery/tracking/biztalk/',
	'payDeliveryTrackingMobile' :'http://m.pay.naver.com/o/delivery/tracking/biztalk/',
	'bookingPartnerWidgetDomain' :'https://partner.booking.naver.com',
	'bookingPartnerWidgetDomainMobile' :'https://m-partner.booking.naver.com',
	"" : ""
};
</script>
<script>
			var _debug = eval("false");
			var _phase = "real";
			var _config = JSON.parse('{\"firstMessages\":[{\"typeName\":\"GREETING_MESSAGE\",\"type\":{\"newChatOnly\":true,\"showYn\":true,\"sendYn\":true},\"messageContent\":{\"sender\":\"partner\",\"contentType\":\"greeting\",\"greetingContent\":{\"userTitle\":\"\uC5B4\uC11C\uC624\uC138\uC694. \'\uC2A4\uC717\uB9B4\uB9AC\uD50C\uB77C\uC6CC\' \uC785\uB2C8\uB2E4.\\n\uAD81\uAE08\uD55C \uB0B4\uC6A9\uC774 \uC788\uC73C\uC2DC\uBA74 \uBA54\uC2DC\uC9C0\uB97C \uB0A8\uACA8\uC8FC\uC138\uC694\",\"greetingText\":\"\uC5B4\uC11C\uC624\uC138\uC694. \'\uC2A4\uC717\uB9B4\uB9AC\uD50C\uB77C\uC6CC\' \uC785\uB2C8\uB2E4.\\n\uAD81\uAE08\uD55C \uB0B4\uC6A9\uC774 \uC788\uC73C\uC2DC\uBA74 \uBA54\uC2DC\uC9C0\uB97C \uB0A8\uACA8\uC8FC\uC138\uC694\"},\"statistics\":{\"msgType\":\"gret\",\"msgFrom\":\"uncat\"}}}],\"serviceCode\":\"ct\",\"talkConnection\":{\"server\":\"https:\/\/ssio08.nchat.naver.com:443?auth=OnIahBjeEHCWB4GuJ39hwIHxVHHzJCEJpZy-UeDX8xwU4fAaQJgookhDUUwcSPGrsJATyCNvARazUXX7L2KGvqrVu9wMZQbVSFp0GQGCUS9n09dyuMecbAI6KKjF_BvB\",\"channel\":\"member_3ZUJY\"},\"naverId\":\"iluvct\",\"reportUrl\":\"https:\/\/help.naver.com\/support\/alias\/talk\/talks.naver\",\"marketFrontUrl\":\"http:\/\/m.gfmarket.naver.com\",\"isPc\":true,\"readCount\":30,\"userId\":\"3ZUJY\",\"widgetList\":[{\"type\":\"PRODUCT_INQUIRY\"},{\"type\":\"SHOPPING_SEARCH\"}],\"payGiftUrl\":\"https:\/\/pay.naver.com\/mygift\/s\",\"payOrderUrl\":\"https:\/\/order.pay.naver.com\/orderStatus\",\"isPartner\":false,\"marketImageUrl\":\"https:\/\/ssl.phinf.net\/gfmarket\",\"partner\":{\"isPayCsPartner\":false,\"counselWeekDayList\":[\"MONDAY\",\"TUESDAY\",\"WEDNESDAY\",\"THURSDAY\",\"FRIDAY\",\"SATURDAY\",\"SUNDAY\"],\"isNotiPartner\":false,\"type\":null,\"isUseFaq\":false,\"isTextContentOnlyPartner\":false,\"mapWebUrl\":\"http:\/\/map.naver.com\/?lng=126.6483783&lat=37.3666491&dlevel=13&title=%EC%8A%A4%EC%9C%97%EB%A6%B4%EB%A6%AC%ED%94%8C%EB%9D%BC%EC%9B%8C\",\"imageUrl\":\"\/shop1.phinf.naver.net\/20180130_288\/talk_1517289651373nawaR_PNG\/image.PNG?type=f164\",\"notiPartnerCode\":null,\"frontFeatures\":{},\"absent\":false,\"counselStartTime\":\"08:00:00\",\"introduction\":\"\uB2EC\uCF64\uD55C \uD589\uBCF5\uC744 \uB4DC\uB9BD\uB2C8\uB2E4\",\"notice\":null,\"counselEndTime\":\"23:00:00\",\"isPossibleFriend\":true,\"banner\":{\"type\":\"PROFILE\",\"url\":\"http:\/\/shop1.phinf.naver.net\/20180130_288\/talk_1517289651373nawaR_PNG\/image.PNG?type=f164\"},\"telephone\":\"01097787153\",\"url\":\"http:\/\/www.sweetlily-flower.com\",\"partnerChannels\":[{\"url\":\"http:\/\/www.sweetlily-flower.com\",\"attributes\":{\"channelTypeName\":\"\uD648\uD398\uC774\uC9C0\",\"order\":-1,\"home\":true}},{\"type\":\"SHOPPINGSELLER\",\"url\":\"http:\/\/smartstore.naver.com\/sweetlily_flower\",\"attributes\":{\"channelTypeName\":\"\uC2A4\uB9C8\uD2B8\uC2A4\uD1A0\uC5B4\",\"order\":18}}],\"shoppingBotUsable\":false,\"isNewsPartner\":false,\"name\":\"\uC2A4\uC717\uB9B4\uB9AC\uD50C\uB77C\uC6CC\",\"isBotPartner\":false,\"location\":{\"address\":\"\uC778\uCC9C\uAD11\uC5ED\uC2DC \uC5F0\uC218\uAD6C \uC1A1\uB3C4\uB3D9 \uC1A1\uB3C4\uBBF8\uB798\uB85C 30 \uC1A1\uB3C4 BRC \uC2A4\uB9C8\uD2B8\uBC38\uB9AC \uC9C0\uC2DD\uC0B0\uC5C5\uC13C\uD130\",\"detailAddress\":\"C\uB3D9\",\"latitude\":37.3666491,\"longitude\":126.6483783},\"channelAttributes\":{\"payCoupon\":false,\"payChannel\":true,\"merchantNo\":false},\"partnerAttributes\":[],\"isCsPartner\":false,\"status\":\"NORMAL\"},\"messageList\":[{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uB2A6\uC5B4\uB3C4 \uC5B8\uC81C \uC8FC\uBB38\uD574\uC57C \uD560\uAE4C\uC694~?\",\"userTitle\":\"\uB2A6\uC5B4\uB3C4 \uC5B8\uC81C \uC8FC\uBB38\uD574\uC57C \uD560\uAE4C\uC694~?\"},\"id\":\"11\",\"date\":1540367339613,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"11\uC6D4 15\uC77C\uAE4C\uC9C0 \uC8FC\uBB38\uD574\uC8FC\uC2DC\uBA74 \uC88B\uC744\uB4EF\uD574\uC694!\",\"userTitle\":\"11\uC6D4 15\uC77C\uAE4C\uC9C0 \uC8FC\uBB38\uD574\uC8FC\uC2DC\uBA74 \uC88B\uC744\uB4EF\uD574\uC694!\"},\"id\":\"12\",\"date\":1540367428122,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uC544 11\uC6D414\uC77C\uC694!\u314E\u314E\u314E\",\"userTitle\":\"\uC544 11\uC6D414\uC77C\uC694!\u314E\u314E\u314E\"},\"id\":\"13\",\"date\":1540367445067,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"link\",\"linkContent\":{\"inflow\":true,\"title\":\"\uC2A4\uC717\uB9B4\uB9AC\uD50C\uB77C\uC6CC\",\"description\":\"\uB2EC\uCF64\uD55C \uD589\uBCF5\uC744 \uB4DC\uB9BD\uB2C8\uB2E4. -SWEETLILY FLOWER-\",\"image\":{\"imageUrl\":\"http:\/\/shop1.phinf.naver.net\/20180111_130\/tn5535_1515634077744d0c47_PNG\/38940042262805045_-2043768142.png\",\"height\":160,\"width\":160},\"link\":{\"url\":\"https:\/\/smartstore.naver.com\/sweetlily_flower\",\"mobileUrl\":\"https:\/\/m.smartstore.naver.com\/sweetlily_flower\"},\"userTitle\":\"\uB9C1\uD06C\uB97C \uC804\uC1A1\uD569\uB2C8\uB2E4.\"},\"id\":\"14\",\"date\":1540367542682,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uB124\uB124 \uC54C\uACA0\uC2B5\uB2C8\uB2E4\",\"userTitle\":\"\uB124\uB124 \uC54C\uACA0\uC2B5\uB2C8\uB2E4\"},\"id\":\"15\",\"date\":1540367542731,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uAC10\uC0AC\uD574\uC694 \uD55C \uC8FC \uC798 \uBCF4\uB0B4\uC138\uC694~!!\",\"userTitle\":\"\uAC10\uC0AC\uD574\uC694 \uD55C \uC8FC \uC798 \uBCF4\uB0B4\uC138\uC694~!!\"},\"id\":\"16\",\"date\":1540367546921,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"^^\",\"userTitle\":\"^^\"},\"id\":\"17\",\"date\":1540367551675,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uB135 \uACE0\uAC1D\uB2D8\uB3C4 \uC88B\uC740 \uD558\uB8E8 \uBCF4\uB0B4\uC138\uC694!\\n\uAC10\uC0AC\uD569\uB2C8\uB2E4:)\",\"userTitle\":\"\uB135 \uACE0\uAC1D\uB2D8\uB3C4 \uC88B\uC740 \uD558\uB8E8 \uBCF4\uB0B4\uC138\uC694!\\n\uAC10\uC0AC\uD569\uB2C8\uB2E4:)\"},\"id\":\"18\",\"date\":1540367571627,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"product\",\"productContent\":{\"inflow\":true,\"messageType\":\"ORDERINQUIRY\",\"userTitle\":\"\uC8FC\uBB38\uC744 \uBB38\uC758\uD569\uB2C8\uB2E4.\",\"order\":{\"id\":\"2018111710976711\",\"status\":\"\uACB0\uC81C\uC644\uB8CC\",\"quantity\":1,\"url\":\"http:\/\/order.pay.naver.com\/orderStatus\/2018111710976711?frm=me\",\"mobileUrl\":\"http:\/\/m.pay.naver.com\/o\/orderStatus\/2018111710976711?frm=me\",\"repProductOrder\":{\"name\":\"\uBE44\uB204\uAF43 \uBBF8\uB2C8\uD654\uD658 4color \uACB0\uD63C\uC120\uBB3C \uAC1C\uC5C5\uC120\uBB3C \uC2B9\uC9C4\uC120\uBB3C\",\"thumbUrl\":\"http:\/\/shop1.phinf.naver.net\/20180707_151\/tn5535_1530953940068OpD2r_JPEG\/54261099689604860_1139918256.JPG\",\"option\":\"\uB9AC\uBCF8 \uBA54\uC2DC\uC9C0(\uC88C\uCE21): \uC790\uB791\uC2A4\uB7F0 \uB098\uC740\uACF5\uC8FC \/ \uB9AC\uBCF8 \uBA54\uC2DC\uC9C0(\uC6B0\uCE21): \uCD95\u2764\uFE0F \uC878 \uC804 \/ \uC0C9\uC0C1\uC120\uD0DD: \uD53C\uCE58\uD551\uD06C\",\"quantity\":1}}},\"id\":\"19\",\"date\":1542433980742,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uD310\uB9E4\uC790\uB2D8 \uC608\uC804\uC5D0 \uBB38\uC758\uB4DC\uB838\uC5C8\uB294\uB370 \uBC14\uBE60\uC11C \uB2A6\uAC8C \uC8FC\uBB38\uD574\uBC84\uB838\uB124\uC694\u315C\u315C\uD654\uC694\uC77C\uAE4C\uC9C0 \uBC1B\uC744 \uC218 \uC788\uC744\uAE4C\uC694~?\uC218\uC69C \uC77C\uCC0D \uB4E4\uACE0\uAC00\uACE0 \uC2F6\uC5B4\uC11C\uC694...!\",\"userTitle\":\"\uD310\uB9E4\uC790\uB2D8 \uC608\uC804\uC5D0 \uBB38\uC758\uB4DC\uB838\uC5C8\uB294\uB370 \uBC14\uBE60\uC11C \uB2A6\uAC8C \uC8FC\uBB38\uD574\uBC84\uB838\uB124\uC694\u315C\u315C\uD654\uC694\uC77C\uAE4C\uC9C0 \uBC1B\uC744 \uC218 \uC788\uC744\uAE4C\uC694~?\uC218\uC69C \uC77C\uCC0D \uB4E4\uACE0\uAC00\uACE0 \uC2F6\uC5B4\uC11C\uC694...!\"},\"id\":\"20\",\"date\":1542433980782,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uD5D9 \uC81C\uAC00 19\uC77C\uAE4C\uC9C0 \uC8FC\uBB38\uD558\uBA74 \uB41C\uB2E4\uACE0 \uAE30\uC5B5\uD588\uB294\uB370 15\uC77C\uAE4C\uC9C0\uC600\uB124\uC694 \uC5B4\uB5A1\uD558\uC8E0?\u315C\u315C\u315C\",\"userTitle\":\"\uD5D9 \uC81C\uAC00 19\uC77C\uAE4C\uC9C0 \uC8FC\uBB38\uD558\uBA74 \uB41C\uB2E4\uACE0 \uAE30\uC5B5\uD588\uB294\uB370 15\uC77C\uAE4C\uC9C0\uC600\uB124\uC694 \uC5B4\uB5A1\uD558\uC8E0?\u315C\u315C\u315C\"},\"id\":\"21\",\"date\":1542434009427,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uC548\uB155\uD558\uC138\uC694~!!!\",\"userTitle\":\"\uC548\uB155\uD558\uC138\uC694~!!!\"},\"id\":\"22\",\"date\":1542434051030,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uB2E4\uC74C\uC8FC \uD654\uC694\uC77C\uB0A0 \uBC1B\uC73C\uC2E4\uC218 \uC788\uAC8C \uC900\uBE44\uD574 \uB4DC\uB9B4\uAE4C\uC694~??^^\",\"userTitle\":\"\uB2E4\uC74C\uC8FC \uD654\uC694\uC77C\uB0A0 \uBC1B\uC73C\uC2E4\uC218 \uC788\uAC8C \uC900\uBE44\uD574 \uB4DC\uB9B4\uAE4C\uC694~??^^\"},\"id\":\"23\",\"date\":1542434068260,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uC6D4\uC694\uC77C\uB0A0 \uBC30\uC1A1\uAC00\uB2A5\uD558\uC138\uC694~~^^\",\"userTitle\":\"\uC6D4\uC694\uC77C\uB0A0 \uBC30\uC1A1\uAC00\uB2A5\uD558\uC138\uC694~~^^\"},\"id\":\"24\",\"date\":1542434087084,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uADF8\uB7FC \uD654\uC694\uC77C\uB0A0 \uB3C4\uCC29\uD560\uAC70\uC608\uC694~~!!\",\"userTitle\":\"\uADF8\uB7FC \uD654\uC694\uC77C\uB0A0 \uB3C4\uCC29\uD560\uAC70\uC608\uC694~~!!\"},\"id\":\"25\",\"date\":1542434130194,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"product\",\"productContent\":{\"inflow\":true,\"messageType\":\"ORDERINQUIRY\",\"userTitle\":\"\uC8FC\uBB38\uC744 \uBB38\uC758\uD569\uB2C8\uB2E4.\",\"order\":{\"id\":\"2018111710976711\",\"status\":\"\uACB0\uC81C\uC644\uB8CC\",\"quantity\":1,\"url\":\"http:\/\/order.pay.naver.com\/orderStatus\/2018111710976711?frm=me\",\"mobileUrl\":\"http:\/\/m.pay.naver.com\/o\/orderStatus\/2018111710976711?frm=me\",\"repProductOrder\":{\"name\":\"\uBE44\uB204\uAF43 \uBBF8\uB2C8\uD654\uD658 4color \uACB0\uD63C\uC120\uBB3C \uAC1C\uC5C5\uC120\uBB3C \uC2B9\uC9C4\uC120\uBB3C\",\"thumbUrl\":\"http:\/\/shop1.phinf.naver.net\/20180707_151\/tn5535_1530953940068OpD2r_JPEG\/54261099689604860_1139918256.JPG\",\"option\":\"\uB9AC\uBCF8 \uBA54\uC2DC\uC9C0(\uC88C\uCE21): \uC790\uB791\uC2A4\uB7F0 \uB098\uC740\uACF5\uC8FC \/ \uB9AC\uBCF8 \uBA54\uC2DC\uC9C0(\uC6B0\uCE21): \uCD95\u2764\uFE0F \uC878 \uC804 \/ \uC0C9\uC0C1\uC120\uD0DD: \uD53C\uCE58\uD551\uD06C\",\"quantity\":1}}},\"id\":\"26\",\"date\":1542435459609,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uB124\uB124!! \uADF8\uB798\uC8FC\uC2DC\uBA74 \uC815\uB9D0 \uAC10\uC0AC\uD569\uB2C8\uB2E4..\u315C\u315C\u315C\",\"userTitle\":\"\uB124\uB124!! \uADF8\uB798\uC8FC\uC2DC\uBA74 \uC815\uB9D0 \uAC10\uC0AC\uD569\uB2C8\uB2E4..\u315C\u315C\u315C\"},\"id\":\"27\",\"date\":1542435459647,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"sticker\",\"stickerContent\":{\"packCode\":\"shopcustomer_01\",\"stickerCode\":\"shopcustomer_01-1\",\"imageUrl\":\"https:\/\/storep-phinf.pstatic.net\/shopcustomer_01\/original_1.png?type=p100_100\",\"height\":160,\"width\":185,\"userTitle\":\"\uC2A4\uD2F0\uCEE4\uB97C \uC804\uC1A1\uD569\uB2C8\uB2E4.\"},\"id\":\"28\",\"date\":1542435465945,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"partner\",\"senderName\":\"\uAE40\uC218\uC815\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uC54C\uACA0\uC2B5\uB2C8\uB2E4!!\uAC10\uC0AC\uD569\uB2C8\uB2E4~ :)\\n\uD3B8\uC548\uD55C \uC8FC\uB9D0 \uBCF4\uB0B4\uC138\uC694!!^^\",\"userTitle\":\"\uC54C\uACA0\uC2B5\uB2C8\uB2E4!!\uAC10\uC0AC\uD569\uB2C8\uB2E4~ :)\\n\uD3B8\uC548\uD55C \uC8FC\uB9D0 \uBCF4\uB0B4\uC138\uC694!!^^\"},\"id\":\"29\",\"date\":1542435510890,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}},{\"sender\":\"user\",\"contentType\":\"text\",\"textContent\":{\"text\":\"\uB124 \uC815\uB9D0 \uACE0\uB9D9\uC2B5\uB2C8\uB2E4\u315C\u315C\u315C \uBD80\uD0C1\uB4DC\uB9B4\uAC8C\uC694 \uC8FC\uB9D0 \uC798 \uBCF4\uB0B4\uC138\uC694~!^^\",\"userTitle\":\"\uB124 \uC815\uB9D0 \uACE0\uB9D9\uC2B5\uB2C8\uB2E4\u315C\u315C\u315C \uBD80\uD0C1\uB4DC\uB9B4\uAC8C\uC694 \uC8FC\uB9D0 \uC798 \uBCF4\uB0B4\uC138\uC694~!^^\"},\"id\":\"30\",\"date\":1542437490739,\"statistics\":{\"msgType\":\"uncat\",\"msgFrom\":\"uncat\"}}],\"chat\":{\"no\":\"1542437491000\",\"name\":\"\uC2A4\uC717\uB9B4\uB9AC\uD50C\uB77C\uC6CC\",\"nickname\":\"\uC2A4\uC717\uB9B4\uB9AC\uD50C\uB77C\uC6CC\",\"imageUrl\":\"http:\/\/shop1.phinf.naver.net\/20180130_288\/talk_1517289651373nawaR_PNG\/image.PNG?type=f164\",\"chatUrl\":\"ct:wc6ihl\",\"text\":\"\uB124 \uC815\uB9D0 \uACE0\uB9D9\uC2B5\uB2C8\uB2E4\u315C\u315C\u315C \uBD80\uD0C1\uB4DC\uB9B4\uAC8C\uC694 \uC8FC\uB9D0 \uC798 \uBCF4\uB0B4\uC138\uC694~!^^\",\"date\":1542437491000,\"count\":0,\"block\":false,\"partnerBlock\":false,\"partnerEnd\":true,\"userEnd\":false,\"notify\":true,\"leave\":false,\"friend\":false,\"display\":true,\"partnerStatus\":\"NORMAL\",\"readMessageId\":30,\"lastSenderType\":\"user\",\"hasTopic\":false},\"marketApiUrl\":\"http:\/\/api.gfmarket.naver.com\",\"connection\":{\"server\":\"https:\/\/ssio10.nchat.naver.com:443?auth=OnIahBjeEHCWB4GuJ39hwL5DBMereQfOTjb2XaIL7Sx2jOP4zJ5g46SvlPcsF9CTj3fUMbxYSYT-fHEbYG_4qZ8iJ7n5YxXfNoFORBmurStP7VxAEKZk6eZWdvR-OsrA\",\"channel\":\"member_ct-wc6ihl-3ZUJY\"},\"partnerId\":\"wc6ihl\",\"focusId\":null,\"persistentMenu\":null}');
			var _static = 'https:\/\/ssl.pstatic.net\/static.talk\/biztalk\/201901101525';
			
			function footerHide() {
				if(BizTalk.Utils.clientSize().height <= 800){
					$('#wrap').addClass('footer_hide');
				}else{
					$('#wrap').removeClass('footer_hide');
				}
			}
			$(function() {
				window.console = (window.console && window.console.debug) ? window.console : {
					log:function(){},
					info:function(){},
					dir:function(){}, 
					trace:function(){}, 
					debug:function(){},
					clear:function(){},
					warn:function(){},
					error:function(){}
				};
				
				if (typeof String.prototype.trim !== 'function') {
					String.prototype.trim = function() {
						return this.replace(/^\s+|\s+$/g, '');
					};
				}
				
				footerHide();
				require([ 'pc/talk-main' ]);
			});
			
			//브라우저 높이값에 따른 footer 노출 여부 설정
			$(window).resize(footerHide);
			
			if (!_config.isPartner) {
				try {
					btClick.initialize({phase : (_phase == 'real' ? '' : _phase), clickRoot : '._chatWindow'});
				} catch(e) {}
			}
		</script>
	</body>
</html>