<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import= "java.util.*"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.earlybud.model.Member"%>
<%@include file="itemheader.jsp" %>



<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<style>
.undercontent {
    display: none;
}
</style>

   <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.username" var="loginEM"/>
      <sec:authentication property="principal.member.nickname" var="loginN"/>
   </sec:authorize>

<!-- 여기 -->
   <main id="omcContainer" class="cont_support">
        
            <h2 id="omcBody" class="screen_out">후원형 프로젝트</h2>
            <div class="cMain">
                <article id="mContent" class="project_intro">
                    <div class="top_box">
                        <header class="head_cont">                        
                            <h1><c:out value="${item.TITLE}"/></h1>  
                            <div class="project_sorting">
                                <div class="tag_rel">
                                        <span class="screen_out">관련 태그</span>
                                        <a href="/../earlybud/category/${item.CAT_CODE}" class="link_tag"> #${item.CAT_NAME}  </a>
                                </div>
                            </div>
                        </header>
                        <div class="summary_cont">
                            <div class="project_info">                                
                                    <div id="main_image_slide" uk-slideshow="ratio: 5:3; animation: fade" class="uk-slideshow">
                                        <ul class="uk-slideshow-items" style="height: 415px;">                                            
                                                <li class="uk-active uk-transition-active" style="z-index: -1;">
                                                    <img src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${item.MAIN_IMAGE}"/>" class="img_g">
                                                </li>                                            
                                                        
                                        </ul>                                        
                                            <div class="main_image_nav_wrapper">
                                                <div class="main_image_nav">                                                    
                                                        <img class="selected" src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${item.MAIN_IMAGE}"/>" data-index="0">
                                                        
                                                </div>
                                            </div>
                                        
                                    </div>
                                
                              <div class="author_profile">
                                    <div class="user_profile">
                                        <span class="img_profile">
                                        
                                            <img src="${pageContext.request.contextPath}/uploads/member/profile/<c:out value="${item.IMAGE}"/>">
                                        
                                        </span>
                                        <div class="author_cont">
                                            <div class="builder_profile_wrapper">
                                                <p><span class="txt_name"><c:out value="${item.NICKNAME}"/></span></p>
                                                <span class="txt_mail"><c:out value="${item.EMAIL}"/></span>
                                                
                                                    <span class="sns_area">
                                                        <span class="box_links">
                                                            <span class="screen_out">프로젝트SNS</span>
                                                            
                                                                <a href="http://omywish.imweb.me/" target="_blank" class="link_home">
                                                                    <span class="ico_comm"></span>
                                                                    <span class="sns_name"></span>
                                                                </a>
                                                                                                                        
                                                                <a href="http://www.facebook.com/" target="_blank" class="link_facebook">
                                                                    <span class="ico_comm"></span>
                                                                    <span class="sns_name"></span>
                                                                </a>
                                                       </span>
                                                    </span>
                                            </div>
                                        </div>
                                    </div>                                 
                                    
                                    
                                    <div class="mms_profile">                                        
                                        <a href="/../earlybud/seller_items/${item.EMAIL}" class="link_mms" id="link_profile">프로필보기</a>
                                       
                                       
                                       <sec:authorize access="isAnonymous()">
                                  <a href="/../earlybud/login" class="link_profile" id="link_message">개설자문의</a>
                              </sec:authorize>
                              <sec:authorize access="isAuthenticated()">
                              
                                  
                                  <a href="/../earlybud/message/${loginEM}/${item.EMAIL}" target="popup" onclick="window.open('/../earlybud/message/${loginEM}/${item.EMAIL}', 'popup', 'width=1000, height=750'); return false;" class="link_profile" id="link_message">개설자문의</a>
                              </sec:authorize>                                       
                                    </div>
                                </div>
                            </div>
                            <div class="project_details">
                                <div class="item_state">
                                    <p><span class="txt_statetitle">모인금액</span></p>
                                    <span class="screen_out">현재 참여금액</span><span class="num_value"><c:out value="${item.NOW_SUM}"/></span> <span class="txt_value">원&nbsp;모금</span>
                                </div>
                                <div class="state_project">
                                    <div class="graph_support">
                                        <span class="screen_out">참여율</span>
                                        
                                    <c:choose>
                              <c:when test="${item.PERCENT > 100}">
                                     <span class="bar_graph" style="width:100%;"></span>
                              </c:when>
                              <c:otherwise>
                                    <span class="bar_graph" style="width:<c:out value="${item.PERCENT};"/>%"></span>
                              </c:otherwise>
                           </c:choose>
                                        
                                        
                                        <span class="num_per"><c:out value="${item.PERCENT}"/>%</span>
                                    </div>

                                    <div class="item_state">
                                        <p><span class="txt_statetitle">참여인원</span></p>
                                        <span class="screen_out">참여자 수</span>
                                        
                                        
                                     <c:choose>
                              <c:when test="${item.TOTAL_PUR eq null}">
                                     <span class="num_value">
                                              0
                                           </span> 
                                           <span class="txt_value">명 참여</span>
                              </c:when>
                              <c:otherwise>
                                 <span class="num_value">
                                              <c:out value="${item.TOTAL_PUR}"/> 
                                           </span> 
                                           <span class="txt_value">명 참여</span>
                                        </c:otherwise>
                           </c:choose>
                                    </div>

                                    <div class="item_state">
                                        <p><span class="txt_statetitle">남은기간</span></p>
                                        
                                        <c:choose>
                                           <c:when test="${item.TIME == 999}">
                                              <span class="num_value">
                                               <fmt:formatDate value="${item.OPENDATE}" var="OPEN" pattern="yyyy년 MM월 dd일"/>
                                                 ${OPEN} 자정에 오픈                                                 
                                              </span>
                                              <span class="link_join">오픈 예정</span>
                                           </c:when>
                                 <c:when test="${item.TIME > 0}">
                                     <span class="num_value">
                                                 D-<span class="screen_out">Day</span><c:out value="${item.TIME}"/>
                                              </span>
                                              <span class="txt_value"> 일 남음</span>   
                                              <span class="link_join">펀딩 진행중</span>                                     
                                 </c:when>                                 
                                 <c:when test="${item.TIME < 0}">
                                       <span class="num_value">종료</span>
                                       
                                       <sec:authorize access="isAnonymous()">
                                           <span class="link_join"><a href="/../earlybud/login" class="link_join fixed">앵콜 요청하기</a></span>      
                                        </sec:authorize>
                                       <sec:authorize access="isAuthenticated()">
                                          <span class="link_join"><a href="javascript:void(0);" onclick="encore()" class="link_join fixed">앵콜 요청하기</a></span>      
                                       </sec:authorize>   
                                                                                                               
                                 </c:when>
                                 <c:otherwise>
                                       <span class="num_value">오늘 자정까지</span>
                                       <span class="link_join">펀딩 진행중</span>      
                                 </c:otherwise>
                              </c:choose>                              
                                    </div>
                                                            
                        
                        <script type="text/javascript">
                           var em = "";
                           var itemcode = ${item_code};   
                           console.log("로그인한 사람은 "+em);
                           console.log("템코드는 "+itemcode);
                           
                        function encore(){
                             var data = {}
                             data["em"] = "${loginEM}";                             
                             data["itemcode"] ="${item_code}";                             
                             
                             $.ajax({
                              type: 'post',
                               url: '/../earlybud/reward/encore',
                               headers : {
                                    "Content-Type" : "application/json",
                                    "X-HTTP-Method-Override" : "POST"
                              },
                               dataType: 'json',
                               data : JSON.stringify(data),
                               success: function(data) {   
                                  console.log("data는 "+data);
                                 if(data == 1){
                                    console.log("성공");
                                    alert("앵콜 요청되었습니다.");
                                 } else {      
                                    console.log("실패");
                                    alert("이미 앵콜 요청한 프로젝트입니다.");
                                 }
                               }
                             });
                           }
                                                                     
                        </script>
                       
                                    
                                        <div class="txt_notice ">
                                            
                                                        <span class="sign_notice">성공해야<br>리워드</span>
                                                        <span class="txt">
                                                                                      목표액<c:out value="${item.TARGET}"/>원에 미달하면 결제가 진행되지 않습니다.<br>
                                                                                      결제는 목표액달성시 <c:out value="${item.DEADLINE}"/>에 진행됩니다.
                                              </span>
                                        </div>
                                </div>

                                <div class="item_btns">
                                    <a href="#none" class="link_share" id="link_share">공유 <span class="btn_icon"><img src="${pageContext.request.contextPath}/images/item/share.jpg"></span><span class="num_count" id="share_num_count">
                                    
                                            0                                    
                                </span></a>
                                    <input type="hidden" id="like_count" value="5">
                                    <input type="hidden" id="interest_seq" value="">
                                    
                                    
                                                <sec:authorize access="isAnonymous()">
                                           <a href="/../earlybud/login" class="btn_like" id="btn_like">관심                                       
                                                       <span id="icon_like"><img src="${pageContext.request.contextPath}/images/item/good.jpg"></span>
                                                       <span class="num_count" id="like_num_count"><c:out value="${likes}"/></span>                                    
                                                   </a>      
                                        </sec:authorize>
                                       <sec:authorize access="isAuthenticated()">
                                          <a href="javascript:void(0);" class="btn_like" id="btn_like" onclick="likes()">관심                                       
                                                       <span id="icon_like"><img src="${pageContext.request.contextPath}/images/item/good.jpg" id='like_img'></span>
                                                       <span class="num_count" id="like_num_count"><c:out value="${likes}"/></span>                                    
                                                   </a>      
                                       </sec:authorize>   
                                </div>
                                
                                <script type="text/javascript">
                           var em = "";
                           var itemcode = ${item_code};   
                           console.log("로그인한 사람은 "+em);
                           console.log("템코드는 "+itemcode);
                           
                        function likes(){
                             var data = {}
                             data["em"] = "${loginEM}";                             
                             data["itemcode"] ="${item_code}";                             
                             
                             $.ajax({
                              type: 'post',
                               url: '/../earlybud/reward/like',
                               headers : {
                                    "Content-Type" : "application/json",
                                    "X-HTTP-Method-Override" : "POST"
                              },
                               dataType: 'json',
                               data : JSON.stringify(data),
                               success: function(data) {   
                                  console.log("data는 "+data);
                                 if(data.likecheck == 1){
                                    console.log("관심등록");                                    
                                    $('#like_num_count').html(data.count);
                                    alert("관심 프로젝트로 등록되었습니다.");
                                 } else {      
                                    console.log("관심취소");                                    
                                    $('#like_num_count').html(data.count);
                                    alert("관심 프로젝트에서 제외되었습니다.");
                                 }
                               }
                             });
                           }
                                                                     
                        </script>
                                
                            </div>
                        </div>
                        
                    </div>
                    
                  
                    
                 
                    <div class="primary_cont">
                        <div class="box_details_cont">
                            <section class="section_cont">
                                <nav class="sticky_bar"> <!-- 헤더랑 만나는 순간 fixed 추가 -->
                                    <h2 class="screen_out">프로젝트 상세 탭메뉴</h2>
                                    <div class="tab_box">
                                        <ul class="list_tab">
                                            <li class="tablinks introB <c:if test="${reply eq null}">on</c:if>">
                                                 <a class="link_tab" onclick="openCity2(event, 'intro')" onfocus='blur()' href="javascript:void(0);">소개</a>
                                            </li>
                                            <li class="tablinks newsB">
                                                <a class="link_tab" onclick="openCity2(event, 'news')" onfocus='blur()' href="javascript:void(0);">공지</a>
                                            </li>
                                            <li class="tablinks qnaB">
                                                <a class="link_tab" onclick="openCity2(event, 'qna')" onfocus='blur()' href="javascript:void(0);">Q&amp;A</a>
                                            </li>
                                            <li class="tablinks refundB">
                                                <a class="link_tab" onclick="openCity2(event, 'refund')" onfocus='blur()' href="javascript:void(0);">환불 및 교환</a>
                                            </li>
                                                                                        
                                        </ul>
                                                                                
                                    </div>
                                </nav>
 <script type="text/javascript">
   function bluring(){
   if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
   }
   document.onfocusin=bluring;
</script>                               
                                
                                <!-- 탭이 눌려질 때 동적으로 페이지를 로드한다. 상세설명/공지/큐엔에이페이지 로딩될것임-->
                                <div id="reward_tab_content">
                           <!--[if IE 8 ]> <html lang="ko" class="ie8"> <![endif]-->
                           <!--[if IE 9 ]> <html lang="ko" class="ie9"> <![endif]-->
                           
                           <div id="intro" class="undercontent" <c:if test="${reply eq null}">style="display: block"</c:if> >
                              <h2 class="screen_out">소개</h2>
                              <div class="article_intro">
                                 <p>${item.CONTENT}</p>
                              </div>
                              <div id="accordionCont" class="accordion_g">
                                 <h2 class="screen_out">프로젝트 주요안내</h2>
                                 
                              </div>
                              <!-- 2017-09-24 추가 -->
                              <div class="cont_process">
                                 <h2 class="tit_process">얼리버드 <em class="txt_emph">후원형 프로젝트</em> 참여 절차</h2>
                                 <p class="txt_process">여러분들의 관심과 참여로 더 나은 세상을 만들어 나가는 프로젝트가 실행됩니다.</p>
                                 <ol class="list_order">
                                    <li>
                                       <img src="${pageContext.request.contextPath}/images/step1.PNG"/><br><br>
                                       <span class="txt_order">1.회원가입</span>
                                       <span class="fa fa-angle-right"></span>
                                    </li>
                                    <li>
                                       <img src="${pageContext.request.contextPath}/images/step2.PNG"/><br><br>
                                       <span class="txt_order">2.프로젝트 선택</span>
                                       <span class="fa fa-angle-right"></span>
                                    </li>
                                    <li>
                                       <img src="${pageContext.request.contextPath}/images/step3.PNG"/><br><br>
                                       <span class="txt_order">3.참여하기</span>
                                       <span class="fa fa-angle-right"></span>
                                    </li>
                                    <li>
                                       <img src="${pageContext.request.contextPath}/images/step4.PNG"/><br><br>
                                       <span class="txt_order">4.결제</span>
                                       <span class="fa fa-angle-right"></span>
                                    </li>
                                    <li>
                                       <img src="${pageContext.request.contextPath}/images/step5.PNG"/><br><br>
                                       <span class="txt_order">5.리워드 수령</span>
                                    </li>
                                 </ol>
                              </div>
                           </div>
                           <div id="news" class="undercontent">
                              <section class="section_cont">
                              <h2 class="screen_out">최근소식</h2>
                              <article class="post_cont">
                                 <header class="entry_head project_article_header">
                                    <h1>공지제목</h1>
                                    <span class="num_time">공지올린날짜</span>
                                    <span class="txt_author">
                                                      
                                          글쓴이이름            
                                    
                                    </span>
                                 </header>
                                 <div class="entry_content">
                                       <p style="margin-bottom: 6px; background-color: rgb(255, 255, 255);">글 내용</p>
                                 </div>
                                 <header class="entry_head project_article_header"></header>
                              </article>
                              </section>                     
                           
                                    <div class="comment_cont">
                                       
                                       <div id="paging" class="paging_comm">
                                             <a href="?pageIndex=1" onclick="link_page(1);return false; " class="link_fst">
                                             <span class="fa fa-angle-double-left" aria-hidden="true"></span></a>&nbsp;
                                             <a href="?pageIndex=1" onclick="link_page(1);return false; " class="link_prev">
                                             <span class="fa fa-angle-left" aria-hidden="true"></span></a>&nbsp;
                                             <a class="link_page on">1</a>&nbsp;
                                                      <a href="?pageIndex=2" onclick="link_page(2);return false; " class="link_page">2</a>
                                                      &nbsp;
                                                      <a href="?pageIndex=3" onclick="link_page(3);return false; " class="link_page">3</a>
                                                      &nbsp;
                                                      <a href="?pageIndex=4" onclick="link_page(4);return false; " class="link_page">4</a>
                                                      &nbsp;
                                                      <a href="?pageIndex=5" onclick="link_page(5);return false; " class="link_page">5</a>
                                                      &nbsp;
                                                      <a href="?pageIndex=6" onclick="link_page(6);return false; " class="link_next">
                                                      <span class="fa fa-angle-right"></span></a>&nbsp;
                                                      <a href="?pageIndex=7" onclick="link_page(7);return false; " class="link_lst">
                                                      <span class="fa fa-angle-double-right"></span></a>&nbsp;
                                 
                                             <input id="pageIndex" name="pageIndex" type="hidden" value="1">
                                       </div>
                                       <script type="text/javascript">                   
                                           function link_page( pageNo )
                                           {
                                            //   var projectSeq = $("#projectSeq").val();
                                             //  var value = "/reward/"+ projectSeq +"/news?&pageIndex=" + pageNo + "&mockFlag=N";
                                             //  area = $("#reward_tab_content");
                                             //  area.load(value, function() {
                                              //     if (UI.Project.isTabMenuFixed()) {
                                               //        UI.RewardProject.scrollInnerContent();
                                                //   }
                                              // });
                                           }                  
                                       </script>
                                    </div>
                        </div>
                        <div id="qna" class="undercontent">
                              <section class="section_cont">
                                 <h2 class="screen_out">Q&amp;A</h2>
                                 <div class="box_qna">
                                    <p class="qna_info">안녕하세요 <span class="txt_name">
                                    
                                       
                                       <c:out value="${item.TITLE}"/> 프로젝트 개설자
                                    
                                    </span>입니다.<br>궁금한 점이 있다면 질문을 남겨주세요!</p>
                                    <ul class="list_qna">
                                       <li>얼리버드 Q&amp;A 게시판은 회원으로 로그인한 분만 글을 작성할 수 있으며 프로젝트 개설자는 참여자들의 참여 관련 질문과 의견을 임의로 삭제하거나 수정하지 않습니다.</li>
                                       <li>홈페이지의 건전한 운영을 위하여 운영기준 상 부적절하거나 문제의 소지가 있는 게시물이 게재될 경우 (예: 명예훼손, 광고, 음란성 글 등) 얼리버드 관리자가 이를 삭제 또는 변경할 수 있습니다.</li>
                                    </ul>
                                 </div>
                              </section>

                              <div class="comment_cont">
                                 <form action="#">
                                    <fieldset>
                                       <legend class="screen_out">댓글달기</legend>
                                       <div class="comment_form_group">
                                          <div class="comment_input_box">
                                             <textarea cols="30" rows="5" class="tf_cmt login_required" title="댓글 작성" placeholder="질문을 남겨주세요."></textarea>
                                             
                                          </div>
                                          <div>
                                             <input type="submit" class="btn_submit point_color" value="등록" title="등록">
                                          </div>
                                       </div>
                                    </fieldset>
                                 </form>
                                 <h2 class="screen_out">댓글</h2>
                                 <ul class="list_cmt">
                                    <li>
                                       <div class="cmt_output">
                                          <span class="user_profile">
                                              <span class="img_profile">
                                              </span>
                                              <span class="txt_name">황정희</span>
                                          </span>
                                          <span class="txt_time">2017-03-23 12:51</span>
                                          <!-- 댓글 보이기 -->
                                          <div class="cmt_content">
                                             <p class="cont_cmt">댓글내용입니다아아아악</p>
                                             
                                          </div>
                                          <!-- 댓글 수정  -->
                                          <div class="edit_cmt" style="display:none">
                                             <fieldset>
                                                <legend class="screen_out">댓글달기</legend>
                                                <div class="cmt_comm">
                                                   <div class="box_cmt">
                                                      <input type="hidden" name="commentSeq" value="14937">
                                                      <input type="hidden" name="updateId" value="142287">
                                                      <textarea cols="30" rows="5" class="tf_cmt" title="댓글 작성">댓글내용입니다아아아악</textarea>
                                                      <div class="cmt_info"><span class="num_byte"><em>20</em> / 500byte</span></div>
                                                      <input type="submit" class="btn_submit" value="수정" title="수정">
                                                   </div>
                                                </div>
                                             </fieldset>
                                          </div>
                                       </div>
                                       <ul class="list_reply">
                                          <li>
                                             <div class="cmt_reply">
                                                <span class="ico_comm">댓글의 답글</span>
                                                <span class="user_profile">
                                                    <span class="img_profile clear_empty_picture">
                                                       <img src="${pageContext.request.contextPath}/uploads/member/profile/<c:out value="${item.IMAGE}"/>" style="background: rgb(255, 255, 255);">
                                                    </span>
                                                    <span class="txt_name"><c:out value="${item.NICKNAME}"/></span>
                                                </span>
                                                <span class="txt_time">2017-03-28 10:48</span>
                                                <p class="cont_cmt">황정희님 안녕하세요. 이번주 수요일부터 9차캠페인을 시작할 예정입니다. 감사합니다. </p>
                                             </div>
                                          </li>
                                       </ul>
                                    </li>
                                 </ul>

                           <div id="paging" class="paging_comm">
                              <a href="?pageIndex=1" onclick="link_page(1);return false; " class="link_fst"><span class="fa fa-angle-double-left" aria-hidden="true"></span></a>&nbsp;<a href="?pageIndex=1" onclick="link_page(1);return false; " class="link_prev"><span class="fa fa-angle-left" aria-hidden="true"></span></a>&nbsp;<a class="link_page on">1</a>&nbsp;<a href="?pageIndex=2" onclick="link_page(2);return false; " class="link_page">2</a>&nbsp;<a href="?pageIndex=3" onclick="link_page(3);return false; " class="link_page">3</a>&nbsp;<a href="?pageIndex=4" onclick="link_page(4);return false; " class="link_page">4</a>&nbsp;<a href="?pageIndex=5" onclick="link_page(5);return false; " class="link_page">5</a>&nbsp;<a href="?pageIndex=6" onclick="link_page(6);return false; " class="link_next"><span class="fa fa-angle-right"></span></a>&nbsp;<a href="?pageIndex=35" onclick="link_page(35);return false; " class="link_lst"><span class="fa fa-angle-double-right"></span></a>&nbsp;
                        
                              <input id="pageIndex" name="pageIndex" type="hidden" value="1">
                           </div>
                        </div>
                        
<script type="text/javascript">
    $(document).ready(function(){
        $('.login_required').focus(function() {
            if(!fnLoginCheck()) {
                fnShowLoginPopup();
                return false;
            }
        });

        //댓글 등록
        $(".btn_submit").on("click",function(){

            if(!fnLoginCheck())
            {
                fnShowLoginPopup();

                return false;
            }

            if($(this).val()=="등록")
            {
                var createId = $(this).parent().parent().find("input[name=createId]").val();
                var inputBox = $(this).parent().parent().find('.tf_cmt');
                var content = inputBox.val();
                var projectSeq = $("#projectSeq").val();

                if(typeof createId !== 'string' || !createId.length) {
                    fnShowLoginPopup();
                    return false;
                }

                if(content.length == 0){
                    alert("댓글을 입력해주세요.");
                    inputBox.focus();
                    return false;
                }

                $.ajaxSetup({ cache: false });
                $.ajax({
                    type : "post",
                    dataType : "json",
                    url : "/reward/qnaInsertAjax.do",
                    data : {
                        "content" : content
                        ,"projectSeq" : projectSeq
                        ,"createId" : createId
                    },
                    success : function(data) {
                        if(data.updateCnt=="1"){
                            //alert("답변이 등록 되었습니다.");
                            link_page($("#pageIndex").val());
                            $("#cmt_cnt").html("<em>0</em> / 500byte")
                        }else{
                            alert("댓글 등록에 실패 했습니다.");
                        }
                    },
                    error : function(e) {
                        alert("오류가 발생했습니다.");
                    }
                });
            }
            else if($(this).val()=="수정")
            {
                var updateId = $(this).parent().children("input[name=updateId]").val();
                var commentSeq = $(this).parent().children("input[name=commentSeq]").val();
                var inputBox = $(this).parent().children('.tf_cmt');
                var content = inputBox.val();

                if(content.length == 0){
                    alert("댓글을 입력해주세요.");
                    inputBox.focus();
                    return false;
                }
                $.ajaxSetup({ cache: false });
                $.ajax({
                    type : "post",
                    dataType : "json",
                    url : "/reward/qnaUpdateAjax.do",
                    data : {
                        "content" : content
                        ,"commentSeq" : commentSeq
                        ,"updateId" : updateId
                    },
                    success : function(data) {
                        if(data.updateCnt=="1"){
                            //alert("답변이 수정 되었습니다.");
                            link_page($("#pageIndex").val());
                        }else{
                            alert("댓글 수정에 실패 했습니다.");
                        }
                    },
                    error : function(e) {
                        alert("오류가 발생했습니다.");
                    }
                });
            }
            return false; //폼 액션 막기
        });

        $(".btn_del").on("click",function(){
            var updateId = $(this).parent().children("input[name=updateId]").val();
            var commentSeq = $(this).parent().children("input[name=commentSeq]").val();

            if(confirm("삭제하시겠습니까?"))
            {
                $.ajaxSetup({ cache: false });
                $.ajax({
                    type : "post",
                    dataType : "json",
                    url : "/reward/qnaDeleteAjax.do",
                    data : {
                        "commentSeq" : commentSeq,
                        "updateId" : updateId
                    },
                    success : function(data) {
                        if(data.deleteCnt=="1"){
                            //alert("글이 삭제 되었습니다.");
                            link_page($("#pageIndex").val());
                        }else{
                            alert("댓글 삭제에 실패 했습니다.");
                        }
                    },
                    error : function(e) {
                        alert("오류가 발생했습니다.");
                    }
                });
            }
        });

        //댓글 등록 및 수정 길이 체크
        $(".tf_cmt").on("keyup",function(){
            var contentLength = getByteLength($(this).val());
            if( contentLength > 500){
                alert("500byte 글자수를 초과하였습니다.");
                $(this).val(cutByLen( $(this).val() , 500 ));
                $(this).focus();
            }
        });

        //댓글 수정 버튼 클릭시
        $(".btn_edit").on("click",function(){
            $(this).parent().parent().parent('div').children('.cmt_content').hide();
            $(this).parent().parent().parent('div').children('.edit_cmt').show();
        });
    });

    function link_page( pageNo )
    {
        var projectSeq = $("#projectSeq").val();
        var value = "/reward/"+ projectSeq +"/qna?pageIndex=" + pageNo + "&isPreview=Y&mockFlag=N";
        area = $("#reward_tab_content");
        area.load(value, function() {
            if (UI.Project.isTabMenuFixed()) {
                UI.RewardProject.scrollInnerContent();
            }
        });
    }

</script>
         
                        </div>
                                                
                        <div id="refund" class="undercontent">
                              <section class="section_cont">
                                 <h2 class="screen_out">Q&amp;A</h2>
                                 <div class="box_qna">
                                    <p class="qna_info">이 프로젝트의 <span class="txt_name">                                 
                                       환불 및 교환                                 
                                    </span>정책</p>
                                    <ul class="list_qna">
                                       <li>단순 변심에 의한 환불은 불가능한 점 양해 부탁드립니다.</li>
                                       <li>예상 전달일로부터 32일 이상 전달 지연시, 수수료 공제 후 환불 가능합니다.</li>
                                       <li>파손, 불량품 수령시 최대 14일 이내로 교환이 가능합니다. 교환시 발생하는 배송비는 진행자 부담입니다.</li>
                                       <li>후원자의 배송지 기재 오류, 후원자가 진행자에게 사전 고지 없이 배송지를 수정해 배송사고가 발생할 경우 진행자는 최대 3번까지 재발송 해드립니다. 후원자의 실수에 의한 오배송의 경우 배송비 부담은 후원자에게 있습니다. 진행자의 실수인 경우 배송비는 진행자가 부담합니다.</li>
                                    </ul>
                                 </div>
                              </section>
                        </div>   



<script>
   function openCity2(evt, cityName) {
       var i, tabcontent, tablinks;
       console.log("도큐먼트 내용은"+document);
       tabcontent = document.getElementsByClassName("undercontent");
       for (i = 0; i < tabcontent.length; i++) {
           tabcontent[i].style.display = "none";
       }
       tablinks = document.getElementsByClassName("tablinks");
       console.log("탭링크 내용은"+tablinks);
       for (i = 0; i < tablinks.length; i++) {
           tablinks[i].className = tablinks[i].className.replace(" on", "");
       }
       document.getElementById(cityName).style.display = "block";
    //   evt.currentTarget.className += " on";
       $("."+cityName+"B").addClass(' on');
   }
</script>
                           
                           
                         </div>   <!-- 언더콘텐트 끝 -->
                        
                        
                  
                        
                        
                        
                        
                        
                            </section>
                        </div>

                        
                            <div class="box_reward_select">
                                <form name="rewardForm" id="rewardForm" action="">
                                    <fieldset>
                                  
   <ul class="list_reward">
      <c:forEach items="${item.getOptionList()}" var="oplist">
            <!-- 리워드 수량이 무한한 경우 -->
            <li>
            	<c:choose>
	                 <c:when test="${item.TIME < 0}">	                 
	                 	<a href="javascript:void(0);" onclick="endMessage()" class="box_reward">	  
	                 		<strong class="tit_reward">${oplist.OP_PRICE}원 펀딩</strong>
		                    <p class="txt_desc">${oplist.NAME}</p>
		                    <span class="info_dely"><span class="txt_info">${oplist.INFO}</span></span>
		                    <span class="txt_satea"><em class="num_state">${oplist.PURNUM}명</em> 참여하였습니다.</span> 
                   		</a>             
	                </c:when>
	                <c:when test="${item.TIME == 999}">
                       <a href="javascript:void(0);" onclick="openMessage()" class="box_reward">	  
	                 		<strong class="tit_reward">${oplist.OP_PRICE}원 펀딩</strong>
		                    <p class="txt_desc">${oplist.NAME}</p>
		                    <span class="info_dely"><span class="txt_info">${oplist.INFO}</span></span>
		                    <span class="txt_satea"><em class="num_state">${oplist.PURNUM}명</em> 참여하였습니다.</span> 
                   		</a> 
                    </c:when>
	                <c:otherwise>
	                	<a href="payment/input/${oplist.TYPE_CODE}" class="box_reward">
			                <strong class="tit_reward">${oplist.OP_PRICE}원 펀딩</strong>
		                    <p class="txt_desc">${oplist.NAME}</p>
		                    <span class="info_dely"><span class="txt_info">${oplist.INFO}</span></span>
		                    <span class="txt_satea"><em class="num_state">${oplist.PURNUM}명</em> 참여하였습니다.</span>
		                </a>
	                </c:otherwise>
                </c:choose>
                	
            </li> 
        </c:forEach>

	</ul>
		
<script type="text/javascript">
	function endMessage(){
		alert("이미 종료된 프로젝트입니다.");
	}
	function openMessage(){
		alert("오픈 예정인 프로젝트입니다. 오픈 날짜를 확인해주세요.");
	}
</script>
			
	

                                    </fieldset>
                                </form>
                            </div>
                        
                    </div>

                                        

                </article>
            </div> <!-- end CMain -->
        </main>
<!-- 끝 -->      
      


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