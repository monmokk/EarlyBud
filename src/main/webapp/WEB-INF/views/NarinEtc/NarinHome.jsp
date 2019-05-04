<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html> 
<html class="no-js">

<head>
	<title>Home</title>
</head>
<body>
<h1>
	나린 담당 페이지들  
</h1>

<P> The time on the server is ${serverTime}. </P>
<P> 이부분은 연습용 부분들임. 미사용. </P>
<a href="airi">AIRI 기본틀</a><br/>
<a href="seller_list">판매자 리스트 틀</a><br/>
<a href="seller_list2">판매자 리스트 딱 그 부분만</a><br/>
<a href="like_seller_each">한 판매자의 상품 리스트</a><br/>
<a href="message22">쪽지창 예시(네이버쇼핑)</a><br/>


<br/><br/><br/><br/>
<P>이 밑의 부분들이 실제 사용하는 페이지임</P>
<a href="liked_things">좋아요한 상품/판매자리스트(개인정보수정, 주문조회로 넘어갈 수 있는 탭 만들어야 함)</a><br/>
<!-- <a href="seller_items">한 판매자 상품리스트</a><br/> -->
<!-- <a href="message/red@gmail.com/blue@gmail.com">쪽지테스트-red@gmail.com</a><br/> -->
<a href="message/red@gmail.com/blue@gmail.com"	target="popup"	onclick="window.open('message/red@gmail.com/blue@gmail.com', 'popup',
											'width=1000, height=750'); return false;">쪽지테스트-red@gmail.com</a><br/>
<!-- <a href="message">쪽지</a><br/> -->
<a href="member_orderlist/red@gmail.com">회원별 주문확인창-red@gmail.com</a><br/>
<!-- <a href="member_ordereach">주문별 주문서 확인창</a><br/> -->

</body>
</html>
