<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*,com.earlybud.model.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp"%>
      
<!-- CONTENT START HERE -->
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> Member Data Table</h1>
          <p>회원 조회, 관리, 강제 탈퇴</p>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">Tables</li>
          <li class="breadcrumb-item active"><a href="#">Member Data Table</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <table id="memberTable" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>Email</th>
                    <th>Nickname</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Joindate</th>
                    <th>Authority</th>
                    <th></th>
                  </tr>
                </thead>
        <!-- no need tbody tag when using DataTables -->
                <tbody>
                <c:forEach items="${listM}" var="Member">
	                 <tr>
	                    <td>${Member.email}</td>
	                    <td>${Member.nickname}</td>
	                    <td>${Member.phone}</td>
	                    <td>${Member.addr}</td>
	                    <td>${Member.joindate}</td>
	                    <td><c:forEach items="${Member.authList}" var="auth"> 
								${auth.authority}
							</c:forEach>
						</td>
						<td></td>
	                  </tr>
	             </c:forEach>
                 </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <!-- Essential javascripts for application to work-->
    <script src="${pageContext.request.contextPath}/js/admin/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="${pageContext.request.contextPath}/js/admin/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
	$(document).ready(function() {
	    var table = $('#memberTable').DataTable( {
	        "columnDefs": [ {
	            "targets": -1,
	            "data": null,
	            "defaultContent": "<button>회원삭제</button>"
	        } ]
	    } );
	 
	    $('#memberTable tbody').on( 'click', 'button', function () {
	        var data = table.row( $(this).parents('tr') ).data();
			if(confirm( data[0] +"회원을 정말 삭제하시겠습니까?") == true){
				location.href='delete_member/'+ encodeURIComponent( data[0] ) ;
	        }else{
	            return false;
	        }
	    });
	});
    </script>
  </body>
</html>