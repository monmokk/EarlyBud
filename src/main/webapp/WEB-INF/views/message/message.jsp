<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!doctype html> 
<html lang="ko">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<head>
<%
	String email = null;
	if (session.getAttribute("email") != null) {
		email =  (String) session.getAttribute("email");
	}
	String receiver = null;
	if (request.getParameter("receiver") != null){
		receiver = (String) request.getParameter("receiver");
	}

%>


<link href="${pageContext.request.contextPath}/css/message/message.css" type="text/css" rel="stylesheet">

</head>
<body>
<div class="container">
<h3 class=" text-center">EarlyBud 판매자 문의</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
               
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> 

</button>
                </span> </div>
            </div>
          </div>
          
          <div class="inbox_chat">
          <sec:authentication property="principal.member.email" var="myEmail"/>
          <c:forEach items="${listM}" var="listM">

			            <div class="chat_list active_chat">
			              <div class="chat_people">
			                <div class="chat_img"> <img src="${pageContext.request.contextPath}/uploads/member/profile/<c:out value="${listM.IMAGE}"/>" alt="sunil"> </div>
			                <div class="chat_ib">
			                  <h5><a href="../${myEmail}/${listM.EMAIL}">${listM.NICKNAME}</a></h5>
			                  <plow>${listM.INFO}</plow>
			                </div>
			              </div>
			            </div>
          </c:forEach>


          </div>
        </div>
        
        
        <div class="mesgs">
          <div class="msg_history">

        <c:forEach items="${listS}" var="listS">
        <c:choose>
        	<c:when test="${listS.RECEIVER eq myEmail}">
        	<div class="incoming_msg">
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p><c:out value="${listS.CONTENT}"/></p>
                  <fmt:formatDate value="${listS.SEND_DATE}" pattern="HH:mm       |     MMM dd"/>일</div>
              </div>
            </div>
            </c:when>
            <c:otherwise>
            	<div class="outgoing_msg">
             	 <div class="sent_msg">
                <p><c:out value="${listS.CONTENT}"/></p>
                <fmt:formatDate value="${listS.SEND_DATE}" pattern="HH:mm       |      MMM dd"/>일</div>
            	</div>
            </c:otherwise>
            </c:choose>
        </c:forEach>
</div>
           <div class="type_msg">
            <div class="input_msg_write">

					<textarea id="contentA" name="contentA" cols="65" rows="2"></textarea>
					 <a href="javascript:myFunction()"><button class="msg_send_btn" type="submit"></button></a>
            </div>
          </div> 
        </div>
    
      
      
      <p class="text-center top_spac"> Design by <a target="_blank" href="#">Sunil Rajput</a></p>
      
    </div></div>
    <script type="text/javascript">
    	$(".msg_history").scrollTop($(document).height());

    	function myFunction(){
    		location.href=window.location.href+"/"+$("#contentA").val();
    	}
    </script>
    </body>
    

    <script type = "text/javascript">
    
    
	console.log("message module...");
		
		
		$(".msg_send_btn").click(function add(){
			console.log("add message.......");
			var content= document.getElementById("contentA");
			console.log("content: "+content);
			$.ajax({
				type : 'post',
				url : 'new',
				data : {
					"content": $("#contentA").val(),
					"email" : this.email,
					"receiver" : this.receiver
				},
				contentType : "application/json; charset=utf-8"
			})
		
	      });

</script>
</html>