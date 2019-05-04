<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="header2.jsp" %>
    <div id="content" class="site-content">

      <div class="container">
        <div class="row">
          <div id="primary" class="content-area layout-default col-lg-8">
            <main id="main" class="site-main">
              <article id="post-1" class="post-1 post type-post status-publish format-standard hentry category-uncategorized">
                <header class="entry-header">
                  <span class="posted-on"></span>
                  <h1 class="entry-title">회원정보수정</h1>
                </header><!-- .entry-header -->
                <div id="respond" class="comment-respond">
                  <form id="mypage" action="memberUpload" method="post" id="commentform" class="comment-form" novalidate>
                  <p class="comment-form-comment"><label for="comment">이메일<span class="required">*</span></label> 
                  	<input id="email" name="email" type="text" size="30" value="${user.email}" maxlength="245" readonly></p>
                  <p class="comment-form-author"><label for="author">비밀번호 <span class="required">*</span></label> 
                  	<input class="pwd" id="pwd" name="pwd" type="password" value="<sec:authentication property="principal.password"/>" size="30" maxlength="245" required='required' /></p>
                  <p class="comment-form-address"><label for="email">주소 <span class="required">*</span></label>
                    <input id="addr" name="addr" type="text" required onclick="goPopup();" value="${user.addr}" readonly/></p>
	                	<input class="addrD" id="detail_addr" name="detail_addr" type="text" required value="${user.detail_addr}" />&emsp;
	                    <input class="addrD" id="zipNo" name="zipNo" type="text" value="" required readonly/>
	              <p class="comment-form-url"><label for="phone">핸드폰 번호</label> 
	              	<input id="phone" name="phone" type="text" value="${user.phone}" required size="30" maxlength="200" /></p>
                  <p class="form-submit">
                  <input name="nickname" type="hidden" value="${user.nickname}">
                    <input name="submit" type="submit" id="submit" class="submit" value="수정하기" /> 
                    </p>
                    <p style="display: none;"><input type="hidden" id="akismet_comment_nonce" name="akismet_comment_nonce" value="b0c1d8b81d" /></p>
                    <p style="display: none;"><input type="hidden" id="ak_js" name="ak_js" value="63" /></p>
                  </form>
                </div><!-- #respond -->
          </div><!-- #comments -->
          </main><!-- #main -->
          <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
          <script type="text/javascript" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
          <script type="text/javascript">
         	$(":input").inputmask();
          	$("#phone").inputmask({"mask": "999-9999-9999"});
          </script>
<%@include file="footer.jsp" %>