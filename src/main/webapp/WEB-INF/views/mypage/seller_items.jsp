<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="seller_items_header.jsp" %>
<%@include file="header.jsp" %>
<!doctype html>
<html class="no-js">
<style>
.b-flag {
z-index: 1 !important;
}
</style>
<body>

 <nav class="b-nav-global">
  <ul class="b-nav-global__items">

  </ul>
</nav> <!-- end .b-nav-global -->

<div class="b-flag b-flag--h is_dent">
  <div class="container">

<div style="left:0px" class="b-valign text-align_center fitin ">
  <div class="b-valign__inner">

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal.member.email" var="loginEmail"/>
</sec:authorize>
<c:forEach items="${OneList}" var="OneList" end="0">

 <div class="b-avatar has-pad-bottom-dot5 is_vaporable" style="width: 96px">
  <div class="b-avatar__frame b-avatar__frame--bordered" style="width:96px; height:96px">
    <img alt="6e65e28f-55c7-435a-a6c7-9b70c09f2233.jpg?ixlib=rb-1.1.0&amp;w=200&amp;h=250&amp;auto=format%2ccompress&amp;fit=facearea&amp;facepad=2" class="b-avatar__pic"
    src='${pageContext.request.contextPath}/uploads/member/profile/${OneList.IMAGE}' />
</div>
</div>

        <h1 class="headline text-size_3xl is_vaporable">
          ${OneList.NICKNAME}
        </h1>
      <ul class="b-meta is_vaporable">

          <li class="b-meta__item is_first">
            <span class="b-meta__link">
              <i class="b-fontello b-fontello--tag "></i>
              ${OneList.INFO}
            </span>
            </li >
        </ul>
       <c:set value="${OneList.EMAIL}" var="seller"/>
      <sec:authorize access="isAnonymous()">
            <a href="/../earlybud/login"><img style="width: 45px; height: 33px; border: 1px grey;" src="${pageContext.request.contextPath}/images/like/envelope.JPG"/>
            </a>&nbsp;
            <a href="/../earlybud/login"><img style="width: 45px; height: 42px; border: 1px grey;" src="${pageContext.request.contextPath}/images/like/follow.png"/></a>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
            <a href="/../earlybud/message/<sec:authentication property="principal.member.email"/>/${OneList.EMAIL}"   target="popup"   onclick="window.open('../message/<sec:authentication property="principal.member.email"/>/${OneList.EMAIL}', 'popup',
                                       'width=1000, height=750'); return false;">
                  <img style="width: 45px; height: 33px; border: 1px grey;" src="${pageContext.request.contextPath}/images/like/envelope.JPG"/>
            </a>&nbsp;
            <a href="/../earlybud/seller_items/like/${seller}"><img style="width: 45px; height: 43px; border: 1px grey;" src="${pageContext.request.contextPath}/images/like/follow.png"/></a>
      </sec:authorize>
      <br/>
          <br><br>

      </c:forEach>
      </div>


      </div>
  </div>
</div>



<div class="b-content b-content--clean">
  <div class="container">

<div class="b-main b-main--extended b-main--centered" id="" role="main">

<div class="row has-pad-bottom">
<c:forEach items="${OneList}" var="OneList">
 <div class="b-project-card">
  <figure class="b-project-card__head">
    <a class="b-project-card__head__link" href="../reward?item_code=${OneList.ITEM_CODE}">
      <div class="b-project-card__head__link__inner">
        <div class="b-project-card__head__filter">
        <img src='${pageContext.request.contextPath}/uploads/reward/<c:out value="${OneList.MAIN_IMAGE}"/>' alt="" class="b-project-card__head__pic" />
      </div>
    </a>
  </figure>

  <div class="b-project-card__body">
    <h3 class="b-project-card__title">
      <a href="../reward?item_code=${OneList.ITEM_CODE}" class="[ yoke yoke--theme_light ]"><c:out value="${OneList.TITLE}"/></a>
    </h3>
    <p class="b-project-card__creator">
     <c:out value="${OneList.NICKNAME}"/>의 프로젝트 "${OneList.ITEM_CODE}"
    </p>
    <p class="b-project-card__blurb">
    <c:out value="${OneList.SUMMARY}"/>
    </p>
  </div>
  <div class="b-project-card__gauge [ b-gauge ]">
  <c:choose>
     <c:when test="${OneList.PERCENT > 100}">
       <div class="b-gauge__liquid" style="width:100%"></div>
    </c:when>
    <c:otherwise>
    <div class="b-gauge__liquid" style="width:<c:out value="${OneList.PERCENT}"/>%"></div>
    </c:otherwise>
 </c:choose>
  </div>
  <div class="b-project-card__figures">

    <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
      <span class="b-project-card__figure-title">모인 금액</span>
      <span class="b-project-card__figure-item">
        <c:out value="${OneList.NOW_SUM}"/> 원
        <span class="b-project-card__percentage">
        <c:out value="${OneList.PERCENT}"/>%
        </span>
      </span>
    </div>
    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
        <span class="b-project-card__figure-title">남은 시간</span>
        <span class="b-project-card__figure-item">
        <c:choose>
           <c:when test="${OneList.TIME > 0}">
           <span class="days"><c:out value="${OneList.TIME}"/>일 남음</span>
           </c:when>
           <c:when test="${OneList.TIME < 0}">
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
</c:forEach>
</div>
    </div>
   </div>
 </div>


            </main><!-- #main -->
         <!-- #primary -->
      </div><!-- #content -->

   </div><!-- #page -->



</body>

</html>
