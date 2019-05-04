<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
    <div id="content" class="site-content">
      <div class="container">
        <div class="row">
          <div id="primary" class="content-area layout-default col-lg-8">
            <main id="main" class="site-main">
              <article id="post-1" class="post-1 post type-post status-publish format-standard hentry category-uncategorized">
                <header class="entry-header">
                  <span class="posted-on">EarlyBud</span>
                  <h1 class="entry-title">프로젝트 올리기</h1>
                </header><!-- .entry-header -->
                <div id="respond" class="comment-respond">
                  <form action="newprojectDetail2" method="post" id="commentform" enctype="multipart/form-data" class="comment-form" novalidate>
                    <p class="comment-form-email"><label for="image">진행자 프로필이미지<span class="required">*</span></label>
                    	<input id="image" name="image_name" type="text" class="upload-name" value="" size="30" maxlength="245" required='required' onclick="check()" readonly/>
                    	<input id="image_file" name="image" type="file" id="submit" class="file-hidden" value="file" required="required"></p>
                    <p class="comment-form-comment"><label for="author">진행자 소개<span class="required">*</span></label> 
                    	<input id="info" name="info" type="text" value="" size="30" maxlength="245" required='required' /></p>
                    <p class="comment-form-author"><label for="email">진행자 활동 지역</label> 
                    	<input id="seller_loc" name="seller_loc" type="text" value="" size="30" maxlength="100" aria-describedby="email-notes" required='required' /></p>
                    <p class="comment-form-url"><label for="url">계좌 등록하기<span class="required">*</span></label> 
                    	<input id="seller_account" name="seller_account" type="text" value="" size="30" maxlength="200" /></p>
                    <p class="form-submit"><input name="submit" type="submit" id="submit" class="submit" value="다음 페이지" /> <input type='hidden' name='comment_post_ID' value='1' id='comment_post_ID' />
                      <input type='hidden' name='comment_parent' id='comment_parent' value='0' />
                    </p>
                    <p style="display: none;"><input type="hidden" id="akismet_comment_nonce" name="akismet_comment_nonce" value="b0c1d8b81d" /></p>
                    <p style="display: none;"><input type="hidden" id="ak_js" name="ak_js" value="63" /></p>
                  </form>
                </div><!-- #respond -->
          </div><!-- #comments -->
          </main><!-- #main -->
        </div><!-- #primary -->
      </div><!-- #page -->

      <script type="text/javascript">
        var c = document.body.className;
        c = c.replace(/woocommerce-no-js/, 'woocommerce-js');
        document.body.className = c;
      </script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/elementor/assets/lib/slick/slick.min.js?ver=1.8.1'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/airi-pro//js/elementor.js?ver=20181010'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/imagesloaded.min.js?ver=3.2.0'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/vendor/navigation.js?ver=20180717'></script>
      <script type='text/javascript'>
        /* <![CDATA[ */
        var wpcf7 = {
          "apiSettings": {
            "root": "https:\/\/demo.athemes.com\/airi-shop\/wp-json\/contact-form-7\/v1",
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
      <script type='text/javascript'>
        /* <![CDATA[ */
        var wc_add_to_cart_params = {
          "ajax_url": "\/airi-shop\/wp-admin\/admin-ajax.php",
          "wc_ajax_url": "\/airi-shop\/?wc-ajax=%%endpoint%%",
          "i18n_view_cart": "View cart",
          "cart_url": "https:\/\/demo.athemes.com\/airi-shop",
          "is_cart": "",
          "cart_redirect_after_add": "no"
        };
        /* ]]> */
      </script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/js/frontend/add-to-cart.min.js?ver=3.4.3'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/js/jquery-blockui/jquery.blockUI.min.js?ver=2.70'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/js/js-cookie/js.cookie.min.js?ver=2.1.4'></script>
      <script type='text/javascript'>
        /* <![CDATA[ */
        var woocommerce_params = {
          "ajax_url": "\/airi-shop\/wp-admin\/admin-ajax.php",
          "wc_ajax_url": "\/airi-shop\/?wc-ajax=%%endpoint%%"
        };
        /* ]]> */
      </script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/js/frontend/woocommerce.min.js?ver=3.4.3'></script>
      <script type='text/javascript'>
        /* <![CDATA[ */
        var wc_cart_fragments_params = {
          "ajax_url": "\/airi-shop\/wp-admin\/admin-ajax.php",
          "wc_ajax_url": "\/airi-shop\/?wc-ajax=%%endpoint%%",
          "cart_hash_key": "wc_cart_hash_c5a0d8ee19d1bc2cabc0f451f4f6d11f",
          "fragment_name": "wc_fragments_c5a0d8ee19d1bc2cabc0f451f4f6d11f"
        };
        /* ]]> */
      </script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/woocommerce/assets/js/frontend/cart-fragments.min.js?ver=3.4.3'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/vendor/skip-link-focus-fix.js?ver=20151215'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/vendor/scripts.js?ver=20180223'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/themes/airi/js/custom/custom.min.js?ver=20180223'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/comment-reply.min.js?ver=4.9.9'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-includes/js/wp-embed.min.js?ver=4.9.9'></script>
      <script type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/kirki/modules/webfont-loader/vendor-typekit/webfontloader.js?ver=3.0.28'></script>
      <script type='text/javascript'>
        WebFont.load({
          google: {
            families: ['Work Sans:500,400:cyrillic,cyrillic-ext,devanagari,greek,greek-ext,khmer,latin,latin-ext,vietnamese,hebrew,arabic,bengali,gujarati,tamil,telugu,thai']
          }
        });
      </script>
      <script async="async" type='text/javascript' src='https://mk0athemesdemon3j7s5.kinstacdn.com/wp-content/plugins/akismet/_inc/form.js?ver=4.0.8'></script>
	<script type="text/javascript">
	  function eventOccur(evEle, evType){
	   if (evEle.fireEvent) {
	   evEle.fireEvent('on' + evType);
	   } else {
	   var mouseEvent = document.createEvent('MouseEvents');
	   mouseEvent.initEvent(evType, true, false);
	   var transCheck = evEle.dispatchEvent(mouseEvent);
	   }
	  }

	  function check(){
	   eventOccur(document.getElementById('image_file'),'click');
	  }
	  </script>
	  <script type="text/javascript">
	  $(document).ready(function(){ 
		  var fileTarget = $('.comment-form-email .file-hidden'); 
		  fileTarget.on('change', function(){ // 값이 변경되면 
			  if(window.FileReader){ // modern browser 
				  var filename = $(this)[0].files[0].name; 
			  } else { // old IE 
				  var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
		  // 추출한 파일명 삽입 
		  $(this).siblings('.upload-name').val(filename); 
		  }); 
	 }); 
	  </script>
</body>

</html>
