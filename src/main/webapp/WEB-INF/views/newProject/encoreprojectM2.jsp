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
                  <h1 class="entry-title">프로젝트 수정</h1>
                </header><!-- .entry-header -->
                <div id="respond" class="comment-respond">
                  <form action="../encoreprojectModify3" method="post" enctype="multipart/form-data" id="myproject" class="comment-form" novalidate>
                    <p class="comment-form-comment"><label for="cat_code">프로젝트 카테고리<span class="required">*</span></label>
                    		<select id="cat_code" name="cat_code">
							    <option value="">    카테고리 선택하기       </option>
							    <option value="1">테크</option>
							    <option value="2">홈리빙</option>
							    <option value="3">푸드</option>
							    <option value="4">패션</option>
							    <option value="5">디자인</option>
							    <option value="6">출판</option>
							    <option value="7">취미</option>
							    <option value="8">공연/컬처</option>
							    <option value="9">캠페인</option>
							</select>
                    </p>
                    <p class="comment-form-author"><label for="author">프로젝트 제목<span class="required">*</span></label>
                    	<input id="title" name="title" type="text" value="${seller.title}" size="30" maxlength="245" required='required' /></p>
                    <p class="comment-form-email"><label for="main_image">프로젝트 대표이미지<span class="required">*</span></label>
                    	<input id="main_image" name="image_name" type="text" class="upload-name" value="${seller.main_image}" size="30" maxlength="245" required='required' onclick="check()" readonly/>
                    	<input id="image_file" name="main_image" type="file" id="submit" class="file-hidden" value="file" required="required"></p>
                    <p class="comment-form-url">
                	    <span>
                        <label for="startDate1">시작일<span class="required">*</span></label>
                          <input class = "dateC" type="text" id="startDate1" name="opendate" value="${seller.opendate}" required='required'/>
                      </span>
                      &nbsp;&nbsp;&nbsp;&nbsp;
                      <span>
                        <label for="endDate1">마감일<span class="required">*</span></label>
                          <input class = "dateC" id="endDate1" type="text" name="closingdate" value="${seller.closingdate}" required='required'/>
                      </span>
                     </p>
                    <section id="categories-2" class="widget widget_categories">
                      <ul>
						<input name="item_code" type="hidden" value="${seller.item_code}"/>
                        <input name="submit" type="submit" class="submit" value="다음페이지" />
                      </ul>
                    </section>
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
    	$("#cat_code").val("${seller.cat_code}");
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
		  fileTarget.on('change', function(){
			  if(window.FileReader){
				  var filename = $(this)[0].files[0].name;
			  } else {
				  var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			}
		  $(this).siblings('.upload-name').val(filename);
		  });
	 });
	  </script>
	</body>

</html>
