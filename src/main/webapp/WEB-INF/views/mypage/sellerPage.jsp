<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="seller_items_header.jsp" %>
<%@include file="header2.jsp" %>

<!doctype html> 
<html class="no-js">
<!doctype html>
<html lang="en-US">
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
      <div class="changable-content">
        <div class="b-avatar has-pad-bottom-dot5 is_vaporable" style="width: 96px">
		  <div class="b-avatar__frame b-avatar__frame--bordered" style="width:96px; height:96px">
		  
		  <c:choose>
		  	<c:when test="${seller.image ne null}">
			    <img alt="6e65e28f-55c7-435a-a6c7-9b70c09f2233.jpg?ixlib=rb-1.1.0&amp;w=200&amp;h=250&amp;auto=format%2ccompress&amp;fit=facearea&amp;facepad=2" class="b-avatar__pic"
			    src='${pageContext.request.contextPath}/uploads/member/profile/${seller.image}' />
		    </c:when>
		    <c:otherwise>
		    	<img alt="6e65e28f-55c7-435a-a6c7-9b70c09f2233.jpg?ixlib=rb-1.1.0&amp;w=200&amp;h=250&amp;auto=format%2ccompress&amp;fit=facearea&amp;facepad=2" class="b-avatar__pic"
		    src='${pageContext.request.contextPath}/uploads/member/profile/basic.jpg' />
		    </c:otherwise>
		   </c:choose>
		    
			</div>
			</div>
        <h1 class="headline text-size_3xl is_vaporable">
          <sec:authentication property="principal.member.nickname"/>
        </h1>
      <ul class="b-meta is_vaporable">
          <li class="b-meta__item is_first">
            <a class="b-meta__link" data-toggle="tooltip" title="판매자 정보 수정하기" data-placement="top" href="../newproject/newprojectModify1">
              <i class="b-fontello b-fontello--tag "></i>
              ${seller.info}
            </a>
            </li > 
        </ul>
        <div class="elementor-button-wrapper">
			<a href="../newproject/newproject" class="elementor-button-link elementor-button elementor-size-sm" role="button">
				<span class="elementor-button-content-wrapper">
					<span class="elementor-button-text">지금 프로젝트 만들기</span>
				</span>
			</a>
		</div>
          <br/>
      </div>
      </div>
  </div>
</div>
</div>



<div class="b-content b-content--clean">
<div class="container">   
  
<div class="b-main b-main--extended b-main--centered" id="" role="main"> 
	<h2 class="mypage-top-title">진행중인 프로젝트</h2>
    <div class="row has-pad-bottom">
				<c:forEach items="${item}" var="item">
				 <div class="b-project-card">
				  <figure class="b-project-card__head">
				    <a class="b-project-card__head__link" href="../reward?item_code=${item.item_code}">
				      <div class="b-project-card__head__link__inner">
				        <div class="b-project-card__head__filter"></div>
				        <img src='${pageContext.request.contextPath}/uploads/reward/<c:out value="${item.main_image}"/>' alt="" class="b-project-card__head__pic" />
				 
				      </div>
				    </a>
				  </figure>
				
				  <div class="b-project-card__body"> 
				    <h3 class="b-project-card__title">
				      <a href="../reward?item_code=${item.item_code}" class="[ yoke yoke--theme_light ]"><c:out value="${item.title}"/></a>
				    </h3>
				    <p class="b-project-card__creator">
				     <sec:authentication property="principal.member.nickname"/>의 프로젝트
				    </p>
				    <p class="b-project-card__blurb">
				    <c:out value="${item.summary}"/>
				    </p>
				  </div> 
				  <div class="b-project-card__gauge [ b-gauge ]">
				  
				  <c:choose>
				     <c:when test="${item.cur_sum/item.target_sum * 100 > 100}">
				       <div class="b-gauge__liquid" style="width:100%"></div>
				    </c:when>
				    <c:otherwise>
				    <div class="b-gauge__liquid" style='width: <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%'></div>
				    </c:otherwise>
				 </c:choose>
				  </div> 
				  <div class="b-project-card__figures">
				
				    <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
				      <span class="b-project-card__figure-title">모인 금액</span>
				      <span class="b-project-card__figure-item">
				        <fmt:formatNumber value="${item.cur_sum}" type="number"/> 원
				        <span class="b-project-card__percentage">
				        <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%
				        </span>
				      </span>
				    </div>
				    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
				        <span class="b-project-card__figure-title">남은 시간</span>
				        <span class="b-project-card__figure-item">
				        
				        <c:choose>                                 
				           <c:when test="${item.success > 0}">
				                 <span class="days">마감됨</span>                                      
				           </c:when>
				           <c:otherwise>
				           		<fmt:parseDate value="${item.closingdate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
				                 <span class="days"><c:out value="${endPlanDate}"/>일 까지</span> 
				           </c:otherwise>
				        </c:choose>
				        </span>
				    </div> 
				  </div>
				</div>
				</c:forEach>
			</div>
<!------------------------------------------------------------------------------  -->	
			<hr/>
			<h2 class="mypage-top-title">현재 만들고있는 프로젝트</h2>
			<div class="row has-pad-bottom">
				<c:forEach items="${itemEdit}" var="item">
				 <div class="b-project-card">
				  <figure class="b-project-card__head">
				   <a class="b-project-card__head__link" href="../newproject/newprojectModify2/${item.item_code}">
				      <div class="b-project-card__head__link__inner">
				        <div class="b-project-card__head__filter"></div>
				        <img src='${pageContext.request.contextPath}/uploads/reward/<c:out value="${item.main_image}"/>' alt="" class="b-project-card__head__pic" />			 
				      </div>
				    </a>
				  </figure>
				
				  <div class="b-project-card__body"> 
				    <h3 class="b-project-card__title">
				      <a href="../reward?item_code=${item.item_code}" class="[ yoke yoke--theme_light ]"><c:out value="${item.title}"/></a>
				    </h3>
				    <p class="b-project-card__creator">
				     <sec:authentication property="principal.member.nickname"/>의 프로젝트
				    </p>
				    <p class="b-project-card__blurb">
				    <c:out value="${item.summary}"/>
				    </p>
				  </div> 
				  
				  <c:choose>
				     <c:when test="${item.admincall eq 0}">
				     	<div>&nbsp;&nbsp;관리자 승인중 </div>
				    </c:when>
				    <c:otherwise>
				    	<div>&nbsp;&nbsp;<button data-toggle="tooltip" title="관리자에게 승인요청" data-placement="top" class="btn apply_btn" value="${item.item_code}"><i class="fa fa-check" aria-hidden="true"></i></button></div>

				    </c:otherwise>
				 </c:choose>
				  <div class="b-project-card__gauge [ b-gauge ]">
				  
				  <c:choose>
				     <c:when test="${item.cur_sum/item.target_sum * 100 > 100}">
				       <div class="b-gauge__liquid" style="width:100%"></div>
				    </c:when>
				    <c:otherwise>
				    <div class="b-gauge__liquid" style='width: <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%'></div>
				    </c:otherwise>
				 </c:choose>
				  </div> 
				  <div class="b-project-card__figures">
				
				    <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
				      <span class="b-project-card__figure-title">모인 금액</span>
				      <span class="b-project-card__figure-item">
				        <fmt:formatNumber value="${item.cur_sum}" type="number"/> 원
				        <span class="b-project-card__percentage">
				        <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%
				        </span>
				      </span>
				    </div>
				    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
				        <span class="b-project-card__figure-title">남은 시간</span>
				        <span class="b-project-card__figure-item">
				        
				        <c:choose>                                 
				           <c:when test="${item.success > 0}">
				                 <span class="days">마감됨</span>                                      
				           </c:when>
				           <c:otherwise>
				           		<fmt:parseDate value="${item.closingdate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
				                 <span class="days"><c:out value="${endPlanDate}"/>일 까지</span> 
				           </c:otherwise>
				        </c:choose>
				        </span>
				    </div> 
				  </div>
				</div>
				</c:forEach>
			</div>
<!------------------------------------------------------------------------------  -->			
			<hr/>
			<h2 class="mypage-top-title">앵콜가능 프로젝트</h2>
			<div class="row has-pad-bottom">
				<c:forEach items="${itemEncore}" var="item">
				 <div class="b-project-card">
				  <figure class="b-project-card__head">
				   <a class="b-project-card__head__link" href="../reward?item_code=${item.item_code}">
				      <div class="b-project-card__head__link__inner">
				        <div class="b-project-card__head__filter"></div>
				        <img src='${pageContext.request.contextPath}/uploads/reward/<c:out value="${item.main_image}"/>' alt="" class="b-project-card__head__pic" />			 
				      </div>
				    </a>
				  </figure>
				
				  <div class="b-project-card__body"> 
				    <h3 class="b-project-card__title">
				      <a href="../reward?item_code=${item.item_code}" class="[ yoke yoke--theme_light ]"><c:out value="${item.title}"/></a>
				    </h3>
				    <p class="b-project-card__creator">
				     <sec:authentication property="principal.member.nickname"/>의 프로젝트
				    </p>
				    <p class="b-project-card__blurb">
				    <c:out value="${item.summary}"/>
				    </p>
				  </div> 
				  <div>&nbsp;&nbsp;<button data-toggle="tooltip" title="재업로드하기" data-placement="top" class="btn encore_btn" value="${item.item_code}"><i class="fa fa-check" aria-hidden="true"></i></button></div>
				  <div class="b-project-card__gauge [ b-gauge ]">
				  
				  <c:choose>
				     <c:when test="${item.cur_sum/item.target_sum * 100 > 100}">
				       <div class="b-gauge__liquid" style="width:100%"></div>
				    </c:when>
				    <c:otherwise>
				    <div class="b-gauge__liquid" style='width: <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%'></div>
				    </c:otherwise>
				 </c:choose>
				  </div> 
				  <div class="b-project-card__figures">
				
				    <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
				      <span class="b-project-card__figure-title">모인 금액</span>
				      <span class="b-project-card__figure-item">
				        <fmt:formatNumber value="${item.cur_sum}" type="number"/> 원
				        <span class="b-project-card__percentage">
				        <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%
				        </span>
				      </span>
				    </div>
				    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
				        <span class="b-project-card__figure-title">남은 시간</span>
				        <span class="b-project-card__figure-item">
				        
				        <c:choose>                                 
				           <c:when test="${item.success > 0}">
				                 <span class="days">마감됨</span>                                      
				           </c:when>
				           <c:otherwise>
				           		<fmt:parseDate value="${item.closingdate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
				                 <span class="days"><c:out value="${endPlanDate}"/>일 까지</span> 
				           </c:otherwise>
				        </c:choose>
				        </span>
				    </div> 
				  </div>
				</div>
				</c:forEach>
			</div>
			
			<hr/>
			<h2 class="mypage-top-title">마감된 프로젝트</h2>
			<div class="row has-pad-bottom">
				<c:forEach items="${itemEnd}" var="item">
				 <div class="b-project-card">
				  <figure class="b-project-card__head">
				    <a class="b-project-card__head__link" href="../reward?item_code=${item.item_code}"">
				      <div class="b-project-card__head__link__inner">
				        <div class="b-project-card__head__filter"></div>
				        <img src='${pageContext.request.contextPath}/uploads/reward/<c:out value="${item.main_image}"/>' alt="" class="b-project-card__head__pic" />			 
				      </div>
				    </a>
				  </figure>
				
				  <div class="b-project-card__body"> 
				    <h3 class="b-project-card__title">
				      <a href="../reward?item_code=${item.item_code}" class="[ yoke yoke--theme_light ]"><c:out value="${item.title}"/></a>
				    </h3>
				    <p class="b-project-card__creator">
				     <sec:authentication property="principal.member.nickname"/>의 프로젝트
				    </p>
				    <p class="b-project-card__blurb">
				    <c:out value="${item.summary}"/>
				    </p>
				  </div> 
				  <div class="b-project-card__gauge [ b-gauge ]">
				  
				  <c:choose>
				     <c:when test="${item.cur_sum/item.target_sum * 100 > 100}">
				       <div class="b-gauge__liquid" style="width:100%"></div>
				    </c:when>
				    <c:otherwise>
				    <div class="b-gauge__liquid" style='width: <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%'></div>
				    </c:otherwise>
				 </c:choose>
				  </div> 
				  <div class="b-project-card__figures">
				
				    <div class="[ b-project-card__figure b-project-card__figure_for_amount ]">
				      <span class="b-project-card__figure-title">모인 금액</span>
				      <span class="b-project-card__figure-item">
				        <fmt:formatNumber value="${item.cur_sum}" type="number"/> 원
				        <span class="b-project-card__percentage">
				        <fmt:formatNumber value="${item.cur_sum/item.target_sum * 100 }" pattern=".00" />%
				        </span>
				      </span>
				    </div>
				    <div class="[ b-project-card__figure b-project-card__figure_for_day ]">
				        <span class="b-project-card__figure-title">남은 시간</span>
				        <span class="b-project-card__figure-item">
				        
				        <c:choose>                                 
				           <c:when test="${item.success > 0}">
				                 <span class="days">마감됨</span>                                      
				           </c:when>
				           <c:otherwise>
				           		<fmt:parseDate value="${item.closingdate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
				                 <span class="days"><c:out value="${endPlanDate}"/>일 까지</span> 
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
  </div>
            </main><!-- #main -->
            
            
           
            
            
            
            
         <!-- #primary -->
      </div><!-- #content -->
      
    
      
   </div><!-- #page -->
   
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script>
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
		
		$('.encore_btn').on( 'click',function() {
	        var data = this.value;
	        console.log(data);
			if(confirm("아이템을 정말 재업로드하시겠습니까?") == true){
                   location.href='../newproject/encoreprojectModify2/'+data ;
	        }else{
	            return false;
	        }
	    });	
	
		$('.apply_btn').on( 'click',function() {
	        var data = this.value;
	        console.log(data);
			if(confirm("아이템을 정말 관리자에게 승인요청하시겠습니까? 승인요청하시면 더이상 수정하실수 없습니다.") == true){
	               location.href='../newproject/applyItem/'+data ;
	        }else{
	            return false;
	        }
	    });

	</script>



</body>




</html>