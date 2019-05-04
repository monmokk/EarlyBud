<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*,com.earlybud.model.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="header.jsp"%>
      
<!-- CONTENT START HERE -->
      
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-envelope-o"></i> Sent Messagebox</h1>
          <p>Sent Messagebox</p>
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item"><a href="#">Sent Messagebox</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-3">
            <button type="button" class="mb-2 btn btn-primary btn-block" id="emailBtn1">메일쓰기</button>
          <div class="tile p-0">
            <h4 class="tile-title folder-head">보낸메세지 함</h4>
            <div class="tile-body">
              <ul class="nav nav-pills flex-column mail-nav">
                <li class="nav-item active"><a class="nav-link" ><i class="fa fa-inbox fa-fw"></i>
                Inbox 새로온메세지<span class="badge badge-pill badge-primary float-right">${newMsg}</span></a>      
                </li>
                  
                <li class="nav-item"><a class="nav-link" href='page_mailbox?email=<sec:authentication property="principal.username"/>'><i class="fa fa-envelope-o fa-fw"></i> Receive 받은메세지함</a></li>
                  
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-9">
          <div class="tile">
            <div class="mailbox-controls">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text"></span>
                </label>
              </div>
              <div class="btn-group">
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-trash-o"></i></button>
                <button id="emailBtn2" class="btn btn-primary btn-sm" type="button"><i class="fa fa-reply"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-refresh"></i></button>
              </div>
            </div>
            <div class="table-responsive mailbox-messages">
            
              <table class="table table-hover sortable paginated" id="tbl">
              	<thead>
                  <tr>
                    <td class='sort-basic'></td>
                    <td class='sort-basic'>받는사람</td>
                    <td class='sort-basic'>내용</td>
                    <td class='sort-basic'></td>
                    <td class='sort-ranking'>날짜</td>
                  </tr>
                </thead>  
                <tbody>
                  <c:forEach items="${listSentMsg}" var="Msg"> 
                  <tr>
                    <td>
                      <div class="animated-checkbox">
                        <label>
                          <input class="msg_check" type="checkbox" name="chkbox" value="${Msg.receiver}"><span class="label-text">${Msg.message_code}</span>
                        </label>
                      </div>
                    </td>
                    <td class="user_email">${Msg.receiver}</td>
                    <td class="hidetext"><a data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#msg_modal" class="request"><b>${Msg.content}</b></a></td>
                    <td>
                    <c:choose>
                    	<c:when test = "${Msg.read_check eq 0}">
                    		<i  class="fa fa-envelope-o"></i>
                    	</c:when>
                    	<c:otherwise>
                    		<i class="fa fa-envelope-open-o"></i>
                    	</c:otherwise>
                    </c:choose>
                    <input type="hidden" name="msg_code" value="${Msg.message_code}">
                    </td>
                    <td>${Msg.send_date}</td>
                  </tr>
                  </c:forEach>            
                </tbody>             
              </table>
              
            </div>
            <div class="text-right"><span class="text-muted mr-2"></span><span class="text-muted">Total - ${listSentMsg.size()} 메세지   </span>
              <div class="btn-group">
                <button class="btn btn-primary btn-sm" id="left" type="button"><i class="fa fa-chevron-left"></i></button>
                <button class="btn btn-primary btn-sm" id="right" type="button"><i class="fa fa-chevron-right"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
  
  <!-- Modal -->
  <div class="modal fade" id="sendEmail" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">관리자이메일보내기</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <p>Send Email</p>
            <form name="email_modal" method="post" action="email/send">
                <input id="mailfrom" name="mailfrom" class="form-control" value='<sec:authentication property="principal.username"/>' type="hidden" >
                <div class="form-group">
                  <label class="control-label">제목</label>
                  <input id="mailsubject" name="mailsubject" class="form-control" type="text" >
                </div>
                <div class="form-group">
                  <label class="control-label">Email</label>
                  <input id="mailto" name="mailto" class="form-control" type="text" >
                </div>
                <div class="form-group">
                  <label class="control-label">참조 CC</label>
                  <input id="mailcc" name="mailcc" class="form-control" type="text" >
                </div>
                <div class="form-group">
                  <label class="control-label">숨은참조 BCC</label>
                  <input id="mailbcc" name="mailbcc" class="form-control" type="text" >
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea id="mailcontent" name="mailcontent" class="form-control" rows="4" ></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" id="send" class="btn btn-default" >Send</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal2 -->
  <div class="modal fade" id="msg_modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal2 content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">답변 메세지보기</h4>
        <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <p>Reply Message</p>
            <form name="msg_form" method="post" action="email/send">
                <div class="form-group">
                  <label class="control-label">To</label>
                  <input id="msg_from" name="msg_from" class="form-control" readonly >
                </div>
                <div class="form-group">
                  <label class="control-label">Date</label>
                  <input id="msg_date" name="msg_date" class="form-control" readonly >
                </div>
                <div class="form-group">
                  <label class="control-label">내용</label>
                  <textarea id="msg_content" name="msg_content" class="form-control" rows="4" readonly></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" id="reply" class="btn btn-default" data-dismiss="modal" >Reply</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
    <script src="${pageContext.request.contextPath}/js/admin/paging.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="${pageContext.request.contextPath}/js/admin/plugins/pace.min.js"></script>
    <!-- Page specific javascript-->
    <script type="text/javascript">   
        var modal1 = $("#sendEmail");
        var modal2 = $("#msg_modal");
        var email = {};
        jQuery.fn.serializeObject = function() {
            var obj = null;
            try {
                if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
                    var arr = this.serializeArray();
                    if (arr) {
                        obj = {};
                        jQuery.each(arr, function() {
                            obj[this.name] = this.value;
                        });
                    }//if ( arr ) {
                }
            } catch (e) {
                alert(e.message);
            } finally {
            }
         
            return obj;
        };
      $(document).ready(function(){
          $("#emailBtn1").click(function(){
        	  var items=[];
        	  $('input[name="chkbox"]:checkbox:checked').each(function(){items.push($(this).val());});
        	  var select_val = items.join(','); 
        	  
              modal1.find("input").val("");
              modal1.find("textarea").val("");
              modal1.find("#mailto").val(select_val);
              $("#sendEmail").modal({backdrop: 'static', keyboard: false});
              
         }); 
          
          $("#reply").click(function(){
              $('#mailto').val(msg_form.msg_from.value);
              $("#sendEmail").modal({backdrop: 'static', keyboard: false});
         });
          
         $("#send").click(function(){
        	 var form = $("#email_modal").serializeObject();
             
             console.log("before send email");
             console.log("form: "+form);
             console.log("JSON.stringify(form): "+JSON.stringify(form));
             $.ajax({
               method: 'post',
               url: '../send_mail', 
               data: JSON.stringify(form),
               dataType: "json",
               contentType: "application/json",
               success: function(){
                   alert("mail sent!!");
               }
           });
           modal1.modal("hide");
        });
         
      });  
      $(".request").click(function(){
    	  var tr = $(this).parent().parent();
  			var receiver = tr.find("td").eq(1).text();
  			var content = tr.find("td").eq(2).text();
  			var senddate = tr.find("td").eq(4).text();
  			console.log("reciever에 담긴 값 : "+receiver);
          $('#msg_from').val(receiver);
          $('#msg_date').val(senddate);
          $('#msg_content').val(content);
      });
    </script>
  </body>
</html>