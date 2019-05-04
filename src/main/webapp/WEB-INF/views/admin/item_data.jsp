<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*,java.sql.Date,com.earlybud.model.Item"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="header.jsp"%>

  <!--  MAIN CONTENT START HERE  -->    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-dashboard"></i> Item List Page</h1>
          <p>상품 리스팅 승인,반려. 상품검색</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Item List Page</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <!-- CONTENT START HERE -->
                <div class="product-status mg-b-15">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="product-status-wrap">
                                    <h4>Item List</h4>
                                    <div>
                                       <!--  <a href="#">카테고리정렬</a>  class="add-product"-->
                                        <label>상태정렬</label>
					                    <select id="statu">
					                        <option value="all" >전체</option>
					                        <option value="active" >진행중</option>
					                        <option value="finished" >완료</option>
					                        <option value="due" >오픈예정</option>
					                        <option value="wait" >승인대기</option>
					                        <option value="reject" >거정됨</option>
					                    </select>
                                    </div>
                                    <div class="asset-inner">
                                        <table class="table table-hover sortable paginated" id="tbl">
                                        <thead>
                                        	<tr>
                                                <th>상품코드</th>
                                                <th>Image</th>
                                                <th>타이틀</th>
                                                <th>상태</th>
                                                <th>판매자</th>
                                                <th>달성률(%)</th>
                                                <th>현재금액</th>
                                                <th>목표금액</th>
                                                <th>관리자승인</th>
                                            </tr>
                                        </thead>
                        <!-------------------------------------------------->
                        			<tbody>
                        				<c:forEach items="${listItem}" var="Item">
                                            <tr><td>${Item.item_code}</td>
                                                <td><img src="${pageContext.request.contextPath}/uploads/reward/${Item.main_image}" alt="" /></td>
                                                <td><a href="../reward?item_code=${Item.item_code}">${Item.title}</a></td>
                                                <td>
 <!-- 날짜계산 -->                                                   
<fmt:parseDate value="${Item.opendate}" var="strPlanDate" pattern="yyyy-MM-dd"/>
<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
<fmt:parseDate value="${Item.closingdate}" var="endPlanDate" pattern="yyyy-MM-dd"/>
<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
<fmt:parseDate value="${now}" var="nowDateformat" pattern="yyyy-MM-dd" />
<fmt:parseNumber value="${nowDateformat.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"></fmt:parseNumber>
<c:choose>
	<c:when test = "${endDate - nowDate < 0}">
		<button class="dp-setting finished">완료</button>
	</c:when>
	<c:otherwise>
		<c:choose>
			<c:when test = "${strDate - nowDate >= 0}">
				<c:choose>
					<c:when test = "${Item.admincall eq 0}">
						<button class="ds-setting wait">승인대기</button>
					</c:when>
					<c:when test = "${Item.admincall eq 2}">
						<button class="ds-setting reject">거절됨</button>
					</c:when>
					<c:otherwise>
						<button class="ps-setting due">오픈예정</button>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<button class="pd-setting active">진행중</button>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>
<!-- ${nowDate}/${endDate}/${strDate}  -->                                                                                       
                                                </td>
                                                <td>${Item.email}</td>
                                                <td><fmt:formatNumber value="${Item.cur_sum/Item.target_sum * 100 }" pattern=".00" />%</td>
                                                <td><fmt:formatNumber value="${Item.cur_sum}" type="number"/></td>
                                                <td><fmt:formatNumber value="${Item.target_sum}" type="number"/></td>
                                                <td>
                                                	<c:choose>
                                                	<c:when test="${Item.admincall eq 0}">
                                                    	<button data-toggle="tooltip" title="Approve" class="pd-setting-ed approve_btn"><i class="fa fa-check" aria-hidden="true"></i></button>
                                                    	<button data-toggle="tooltip" title="Reject" class="pd-setting-ed reject_btn"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i></button>
                                                    </c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                         </c:forEach>
                        <!-------------------------------------------------->
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="custom-pagination">                       
                                            <button class="page-link" id="previous">Previous</button>
                                            <button class="page-link" id="next">Next</button>
                                            <span class="text-right"><span class="text-muted mr-2"></span><span class="text-muted">Total - ${listItem.size()} 아이템   </span></span>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              
              
              </div>
          </div>
        </div>
      </div>
      
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="${pageContext.request.contextPath}/js/admin/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/main.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/pagingItems.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="${pageContext.request.contextPath}/js/admin/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Google analytics script-->
    <script type="text/javascript">
    $('.approve_btn').on('click',function(){
    	var row = $(this).parent().parent().find("td");
    	var code = row.eq(0).text();
    	var seller = row.eq(4).text();
		var item = row.eq(2).text();
    	console.log("this itemCode: "+code);
    	$.ajax({
            method: 'post',
            url: '../admin/approveItem', 
            data: "item_code="+code,
            success: function(){
                console.log("update admincall!!");
                row.eq(3).find("button").text("오픈예정");
                row.eq(3).find("button").removeClass("ds-setting wait");
                row.eq(3).find("button").addClass("ps-setting due");
                row.eq(8).hide();
              //console.log("판매자 이메일: "+seller);
                $.ajax({
            		type:'post',
                    url: '/earlybud/send_mail',
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                    	"mailto": seller,
                    	"mailsubject": "얼리버드 상품 관리자 승인 되었습니다.",
                    	"mailcontent": "상품 "+ item +" 오픈예정됩니다.  마이페이지에서 확인가능합니다."
                    	}),
                    success: function(){
                        console.log("확인 메일&메세지 보냄");
                    }
                });
            }
  	  });
    });
    
	$('.reject_btn').on('click',function(){
		var row = $(this).parent().parent().find("td");
		var code = row.eq(0).text();
		var seller = row.eq(4).text();
		var item = row.eq(2).text();
    	console.log("this itemCode: "+code);
    	$.ajax({
            method: 'post',
            url: '../admin/rejectItem', 
            data: "item_code="+code,
            success: function(){
                console.log("update reject admincall!!");
                row.eq(3).find("button").text("거절됨");
                row.eq(3).find("button").removeClass("ds-setting wait");
                row.eq(3).find("button").addClass("ds-setting reject");
                row.eq(8).hide();
                //console.log("판매자 이메일: "+seller);
                $.ajax({
            		type:'post',
                    url: '/earlybud/send_mail',
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                    	"mailto": seller,
                    	"mailsubject": "얼리버드 상품 승인이 거절되었습니다.",
                    	"mailcontent": " 상품 "+ item +" 을 다시 수정해주세요. 궁금하신점은 관리자에게 메세지를 보내주세요."
                    	}),
                    success: function(){
                        console.log("확인 메일&메세지 보냄");       
                    }
                });
            }
  	  });
    });
    
    </script>

  </body>
</html>