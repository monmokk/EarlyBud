<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<form action="/earlybud/login" method="post" id="form">
	<input type="hidden" name="username" value="${email}"/>
	<input type="hidden" name="password" value="${pw}"/>
	</form>
	<script type="text/javascript">
		document.getElementById("form").submit();
	</script>
</html>