window.wadiz = window.wadiz || {};
var ua = navigator.userAgent.toLowerCase();
var isIos = /iphone|ipad|ipod/.test(ua);
var isAndroid = /android/.test(ua);
var isIosApp = /ioswadiz(\/([0-9.]+))?/.test(ua);
var isAndroidApp = /androidbrowser/.test(ua) || /androidwadiz(\/([0-9.]+))?/.test(ua);

(function($) {
  var $window = $(window);
  var $html = $(document.documentElement);
  var $body;

  // dom ready
  $(document).ready(function(){
    $body = $(document.body);

    // Header
    var navCheckbox = $("#globalNavOpener, #globalSubNavOpener, #myMenuOpener");
    $html = $(document.documentElement);
    navCheckbox.on('change', function(){
      if(navCheckbox.is(":checked")) {
        $html.addClass('opened-nav');
      }else{
        $html.removeClass('opened-nav');
      }
    });
    $(window).on("beforeunload", function() {
      $('#mynews-opener').prop('checked', false);
    });

    // IE 구버전일 경우 메시지 표시
    var isOldIE = ua.match(/MSIE (\d+)/i);
    if (isOldIE && parseInt(isOldIE[1], 10) <= 10) {
      oldIEMessage();
    }

    // 검색 엔터키 리스너
    $("#headSearchForm").submit(function(e){
      e.preventDefault();
      var keyword = $("#headSearchInput").val();
      if(keyword.length <= 1){
        alertify.alert('검색어는 2자이상 입력해주세요.');
      }else{
        location.href=encodeURI('/web/wcampaign/search?keyword='+keyword);
      }
    });

    //HEADER 1depth서브메뉴 열림 - 모바일에만 해당
    $('#newHeader .btn-gnb-open button').click(function(){
      var $idNewHeader = $('#newHeader');
      var $newHeaderWrap = $('.new-header-wrap');
      if($('button.gnb-login-btn').hasClass('active')){
        $('.gnb-login-menu').hide();
        $('button.gnb-login-btn').removeClass('active');
      }
      if($idNewHeader.hasClass('active')){
        $idNewHeader.removeClass('active');
        $idNewHeader.removeClass('activeM');
        if($(window).scrollTop() < 50){
          $newHeaderWrap.css('position','relative');
          $('#mainContainer, #newContainer, #container').css('padding-top', 0);
        }
        $newHeaderWrap.css('top', 0);
      }else{
        $idNewHeader.addClass('active');
        $idNewHeader.addClass('activeM');
        if($(window).scrollTop() < 50){
          $newHeaderWrap.css('position','absolute');
          $('#mainContainer, #newContainer, #container').css('padding-top', 50);
          if($('#newTopBanner').hasClass('active')){
            $newHeaderWrap.css('top', 55);
          }
        }
      }
    });
    //HEADER 2depth서브메뉴 열림
    $('#newHeader .gnb .gnb-info a').click(function(){
      var $idNewHeader = $('#newHeader');
      var $newHeaderWrap = $('.new-header-wrap');
      var $parent = $(this).parent();
      if($idNewHeader.hasClass('active')){
        //모바일화면
        if($idNewHeader.hasClass('activeM')){
          if($parent.hasClass('active')){
            $parent.removeClass('active');
          }else{
            $parent.addClass('active');
          }
        }else{
          $idNewHeader.removeClass('active');
          $parent.removeClass('active');
          if($(window).scrollTop() < 50){
            //$('#mainContainer, #newContainer, #container').css('padding-top','0');
            //$newHeaderWrap.css('top','0');
            //$newHeaderWrap.css('position','relative');
          }
        }
      }else{
        $idNewHeader.addClass('active');
        $parent.addClass('active');
        if($(window).scrollTop() < 67){
          //$newHeaderWrap.css('position','fixed');
          //$('#mainContainer, #newContainer, #container').css('padding-top','67px');
          if($('#newTopBanner').hasClass('active')){
          //	$newHeaderWrap.css('top','55px');
          }
        }
      }

    });
    //HEADER 마이메뉴 열림
    $('button.gnb-login-btn').click(function(){
      var $this = $(this);
      if($('#newHeader').hasClass('activeM')){
        var $idNewHeader = $('#newHeader');
        var $newHeaderWrap = $('.new-header-wrap');
        $idNewHeader.removeClass('active');
        $idNewHeader.removeClass('activeM');
        if($(window).scrollTop() < 50){
          //$newHeaderWrap.css('position','relative');
          //$('#mainContainer, #newContainer, #container').css('padding-top','0');
        }
        $newHeaderWrap.css('top','0');
      }
      if($this.hasClass('active')){
        $('.gnb-login-menu').hide();
        $this.removeClass('active');
      }else{
        $('.gnb-login-menu').show();
        $this.addClass('active');
      }
    });

    //임시- SBS카톡링크 PC시 알림
    $('#shareSBSLinkKaKao').click(function(){
      if(!isIos && !isAndroid){
        alert("카카오톡 공유는 모바일에서만 가능합니다.");
      }
    });

    /*포인트쿠폰 확인*/
    $('.gnb-login-btn').on('click', function(event) {
      setMyPointCouponInfo();
    });

    /* 검색 Action */
    $('#headSearchForm').each(function() {
      var $form = $(this),
          $btn = $form.prev(),
          $input = $form.find('.search-text'),
          activeClassName = 'active';
      $btn.on('click', function() {
        var clientWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
        //if (isIos || isAndroid) {
        if (clientWidth < 1100) {
          // width가 1100 이하일 경우 검색페이지로 이동
          location.href = "/web/wcampaign/search";
        } else if ($form.hasClass(activeClassName)) {
          $form.removeClass(activeClassName);
        } else {
          $form.addClass(activeClassName);
          $input.trigger('focus');
        }
      });
      $input.on('focusout', function() {
        var value = $input.val();
        if (!value) {
          $form.removeClass(activeClassName);
        }
      });
    });

    $('[data-intercom-message]').on('click', function() {
      if (window.Intercom) {
        var message = $(this).data('intercom-message');
        window.Intercom('showNewMessage', message || '');
      }
      return false;
    });

    $('a[data-external-link]').each(function() {
      var $this = $(this).attr('rel', 'noopener noreferrer');
      var href = $.trim($this.attr('href'));
      var isProtocol = /^https?:\/\//i.test(href);
      if (!isProtocol) {
        $this.attr('href', 'http://' + href);
      }
    });

    // TOP 버튼 제어
    var $pageTop = $('#page-top,#pagetop').hide();
    if ($pageTop.length) {
      var disableMove = $pageTop.data('disable-move');
      var $docs = $(document);
      var $window = $(window);
      var $footer = $('#footer');
      var footerHeight = $footer.outerHeight() || 0;
      var lastTop = 0;
      $window.on('scroll', function() {
        var winH = $window.height();
        var top = $window.scrollTop();

        if (!disableMove) {
          var pageTop = ($docs.height() - winH - footerHeight - top) + 70;
          $pageTop.css('bottom', pageTop < 0 ? (Math.abs(pageTop) + 88) : '');
        }
        if (top > (winH/1.5)) {
          $pageTop.fadeIn();
        } else {
          $pageTop.fadeOut();
        }
        // 모바일 && 페이지 스크롤이 상단으로 이동할 때
        if (wdzLink.isMobileSize()) {
          if (lastTop >= top ) {
            $('#page-top').css({'opacity': '1' , 'z-index': '1000'});
          } else {
            $('#page-top').css({'opacity': '0', 'z-index': '-1'});
          }
          lastTop = top;
        }

      });
      $window.on('resize', function() {
        footerHeight = $footer.height() || 0;
      });
      $pageTop.on('click', function() {
        $('html,body').animate({ scrollTop: 0 }, 150);
      });
    }

    $('[data-sticky=true]').each(function() {
      var $window = $(window);
      var $this = $(this);
      var $parent = $this.offsetParent();
      var height = $this.outerHeight();
      var offsetTop = $this.offset().top;
      var offsetLeft = $this.offset().left;
      var stickyTop = offsetTop - $this.position().top;
      var minWidth = parseInt($this.data('sticky-min-width'), 10);
      var boxFixed = function boxFixed() {
        var top = $window.scrollTop();
        var isMin = minWidth ? minWidth < $window.width(): true;
        var max = $parent.height() - height;
        if (isMin && top > stickyTop && top < max) {
          $this.css({ position: 'fixed', top: (offsetTop - stickyTop), left: offsetLeft });
        } else if (isMin && top >= max) {
          $this.css({ position: 'fixed', top: (max - top), left: offsetLeft });
        } else {
          $this.css({ position: '', top: '', left: '' });
        }
      };
      $window.on('resize.sticky', function() {
        offsetLeft = ($parent.outerWidth() + $parent.offset().left) - $this.outerWidth();
        boxFixed();
      });
      $window.on('scroll.sticky', function() {
        boxFixed();
      });
    });

    // 리워드 상세 영상 재생
    $('.reward-video-container,.main-video-container,.video-container').each(function() {
      var $this = $(this);
      var $cover = $this.find('>.video-cover');
      var isMobile = /ip(od|hone)/i.test(ua) || /android/i.test(ua);
      var autoplay = isMobile ? '0' : '1';
      var url = $this.data('video-url');
      var cover = $cover.data('cover-url');
      var embed = parseVideoEmbed(url);
      if (embed.cover) {
        $('<img>').attr('src', embed.cover).on('load', function() {
          if (this.naturalWidth > 600) {
            $cover.css('background-image', 'url(' + embed.cover + ')');
          } else if (cover) {
            $cover.css('background-image', 'url(' + cover + ')');
          }
        });
      } else if (cover) {
        $cover.css('background-image', 'url(' + cover + ')');
      }
      $cover.on('click', function() {
        if (/\?/.test(url)) {
          url = url.replace(/\?.+$/i, '');
        }
        if (embed.type === 'youtube') {
          url = embed.url + '?autoplay=' + autoplay + '&amp;rel=0&amp;showinfo=0&amp;color=white&amp;playsinline=1';
        } else if (embed.type === 'vimeo') {
          url = embed.url + '?autoplay=' + autoplay + '&amp;autopause=0&amp;title=false&amp;byline=false';
        }
        var iframe = $('<iframe>').attr({
          src: url,
          width: '100%',
          height: '100%',
          frameborder: '0',
          allowfullscreen: 'true'
        }).on('load', function() {
          $cover.remove();
          $this.removeClass('wz-loader');
        });
        $this.addClass('wz-loader').append(iframe);
      });
      if (isMobile) {
        $cover.trigger('click');
      }
    });

    // 알림이 열리면 인터컴 버튼을 숨긴다!
    $('#mynews-opener').on('change', function() {
      if (this.checked) {
        $body.addClass('blockScroll');
      } else {
        $body.removeClass('blockScroll');
      }
    });

    // $.fn.pop
    $('[ui-pop-for]').each(function() {
      var $this = $(this);
      var popId = $this.attr('ui-pop-for');
      var popClassName = $this.attr('ui-pop-show-class');
      var $target = $(document.getElementById(popId));
      function toggle() {
        if (popClassName) {
          $target.toggleClass(popClassName);
        } else {
          $target.toggle();
        }
      }
      function outsideHidden(event) {
        if ($this[0] === event.target || $.contains($this[0], event.target)) return;
        if ($target[0] === event.target || $.contains($target[0], event.target)) return;
        if ($target.is(':visible')) {
          toggle();
        }
      }
      $this.on('click', function() {
        toggle();
      });
      $body.on('click.' + popId, outsideHidden);
      $body.on('touchend.' + popId, outsideHidden);
    });
  }); // dom ready

  // 비디오 ID Parsing
  function parseVideoEmbed(url) {
    var type = null;
    var videoId = null;
    // youtube
    if (/youtube\.com\/watch/i.test(url)) {
      type = 'youtube';
      videoId = url.match(/v=([a-z0-9_-]+)/i)[1];
    } else if (/youtube\.com\/embed/i.test(url)) {
      type = 'youtube';
      videoId = url.match(/embed\/([a-z0-9_-]+)/i)[1];
    } else if (/youtu\.be/i.test(url)) {
      type = 'youtube';
      videoId = url.match(/be\/([a-z0-9_-]+)/i)[1];
    }

    // vimeo
    else if (/vimeo\.com/.test(url)) {
      type = 'vimeo';
      videoId = url.match(/\/([0-9]+)/i)[1];
    }

    if (type === 'youtube') {
      return {
        type: type,
        videoId: videoId,
        url: 'https://www.youtube.com/embed/' + videoId,
        shorturl: 'https://youtu.be/' + videoId,
        cover: 'https://img.youtube.com/vi/' + videoId + '/sddefault.jpg'
      }
    } else if (type === 'vimeo') {
      return {
        type: type,
        videoId: videoId,
        url: 'https://player.vimeo.com/video/' + videoId,
        shorturl: 'https://vimeo.com/' + videoId,
        cover: null
      }
    }
    return {};
  }
  if (window.wadiz && !wadiz.parseVideoEmbed) {
    wadiz.parseVideoEmbed = parseVideoEmbed;
  }

  // 타이틀 변경
  (function(location) {
    if (/google/i.test(ua)) return;
    if (/^(|www\.)wadiz/i.test(location.host) && /^(\/|\/web\/wmain)$/i.test(location.pathname)) {
      document.title = '와디즈 - 라이프스타일 투자플랫폼';
    }
  })(window.location);

  // window.wadiz
  window.wadiz = window.wadiz || {};

  // 숫자 3자리수마다 ,(콤마)를 붙인다.
  var WadizNumberUtil = function WadizNumberUtil(value) {
    this.value = Number(value);
  };
  WadizNumberUtil.prototype = {
    format: function() {
      var reg = /(^[+-]?\d+)(\d{3})/;
      var n = (this.value + '');
      while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
      return n;
    },
    valueOf: function() {
      return this.value;
    }
  };
  wadiz.number = function(n) {
    return new WadizNumberUtil(n);
  };

  // 로그인 메시지
  if (!wadiz.requireLogin) {
    wadiz.requireLogin = function(message) {
      var href = location.href;
      if (!location.hash) {
        var scrollTop = $(window).scrollTop();
        href = href + '#afterLogin_' + scrollTop;
      }
      var loginConfirm = wadiz.confirm({
        basic: false,
        labelApprove: '로그인',
        message: message || '로그인이 필요합니다.'
      }, function() {
        var loginPage = '/web/waccount/wAccountLogin';
        location.href = loginPage + '?returnURL=' + encodeURIComponent(href);
      });
      return loginConfirm;
    };
    (function(hash) {
      if (!hash) return;
      var afterLogin = hash.match(/^#afterLogin\_([0-9]+)$/);
      if (afterLogin && afterLogin[1]) {
        $(document).ready(function() {
          $(window).scrollTop(afterLogin[1]);
          if (window.history.replaceState) {
            var path = location.href.replace(afterLogin[0], '');
            window.history.replaceState(null, null, path);
          }
        });
      }
    })(location.hash);
  }

  // 액션바 반응형 적용시 show/hide 설정
  if (!wadiz.handleActionBar) {
    wadiz.handleActionBar = function(options) {
      var breakpointMinWidth = options.breakpointMinWidth || 1096;
      var $main = $(options.main);
      var $actionBar = $(options.actionBar);
      if (!$main.length) return;
      function actionBarHandler() {
        var hideActionBar;
        var display = $actionBar.css('display');
        var position = $actionBar.css('position');
        if (display !== 'none' && position === 'fixed') {
          var top = $window.scrollTop();
          var contentTop = $main.offset().top || options.startTop;
          var contentStart = ($window.height() - contentTop) + ($actionBar.height() * 2); // 콘텐츠 시작점(194) - 뷰포트 높이 + 액션바 높이의 두배
          var contentEnd = (contentTop + $main.outerHeight()) - $window.height();
          hideActionBar = top < contentStart || top > contentEnd;
        } else {
          hideActionBar = true;
        }
        $main.trigger((hideActionBar ? 'hide' : 'show') + '.actionbar');
        if (wadiz._showingActionBar !== !hideActionBar) {
          var changeEvent = new CustomEvent('visibility:actionbar', {
            bubbles: true,
            detail: { visible: !hideActionBar }
          });
          if ($actionBar.length) {
            $actionBar[0].dispatchEvent(changeEvent);
          }
        }
        wadiz._showingActionBar = !hideActionBar;
      }
      $window.on('scroll.actionbar resize.actionbar', actionBarHandler);
      actionBarHandler();
      return $main;
    };
  }

  // 전화번호 포멧
  $.fn.inputTelFormat = function() {
    // 숫자키인지 확인
    function isNumberKey(keyCode) {
      return (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105);
    }
    function isFuncKey(keyCode) {
      return keyCode === 8 || keyCode === 9 || keyCode === 37 || keyCode === 39;
    }
    return this.each(function() {
      // 이벤트
      $(this).on({
        'keydown': function(event) {
          var maxLength = 13;
          if (this.value.match(/^02/)) {
            // 서울(02)일 경우 11자리까지 허용
            maxLength = 11;
          }

          var numberKey = isNumberKey(event.keyCode);
          if (this.value.length > maxLength && numberKey) {
            // BLOCK
            event.preventDefault();
            return false;
          }

          // allow key list
          // 8 backspace
          // 9 tab
          // 37 left arrow
          // 39 right arrow
          // 48~57 number
          // 96~105 number (우측 번호키)
          if (numberKey || isFuncKey(event.keyCode)) {
            // ALLOW
          } else {
            // BLOCK
            event.preventDefault();
            return false;
          }
        },
        'keyup': function(event) {
          // 기능키일 경우 해당 함수 실행 안 함
          if (isFuncKey(event.keyCode)) {
            event.preventDefault();
            return false;
          }

          // 번호일 경우 아래 함수 실행
          var value = this.value.replace(/-/g, ''),
              format = '';
          if (value.length > 0 && value.length < 4) {
            format = value;
          } else {
            if (value.match(/^02/)) {
              // 서울(02)일 경우 포맷을 변경
              if (value.length < 6) {
                format = value.replace(/^(\d{2})(\d{0,3})/, '$1-$2');
              } else if (value.length < 10) {
                format = value.replace(/^(\d{2})(\d{0,3})(\d{0,3})/, '$1-$2-$3');
              } else {
                format = value.replace(/^(\d{2})(\d{0,4})(\d{0,4})/, '$1-$2-$3');
              }
            } else {
              // 서울 이외지역
              if (value.length < 7) {
                format = value.replace(/^(\d{3})(\d{0,3})/, '$1-$2');
              } else if (value.length < 11) {
                format = value.replace(/^(\d{3})(\d{0,3})(\d{0,3})/, '$1-$2-$3');
              } else {
                format = value.replace(/^(\d{3})(\d{0,4})(\d{0,4})/, '$1-$2-$3');
              }
            }
          }
          this.value = format;
        }
      });
    });
  };

  // IE10 이하에 메시지 삽입
  function oldIEMessage() {
    if (getCookie("wadizOldIEMsg") === 'N') {
      return;
    }

    var ieUpdateURL = 'https://windows.microsoft.com/en-us/internet-explorer/download-ie';
    var chromeInstallURL = 'https://www.google.co.kr/intl/ko/chrome/browser/desktop/';

    var html = '<div class="old-ie-msg" style="position:relative;left:0;top:0;z-index:99999;width:100%;height:55px;background-color:#f5f7fa;line-height:55px;color:#34383a;font-size:13px;overflow:hidden">';
    html += '<p style="padding-left:24px;padding-right:80px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;"><span style="color:#fc4d54">Internet Explorer 하위 버전</span>을 사용하고 있습니다. 안전한 펀딩을 위해 <span style="color:#4462ee">최신 브라우저로 업그레이드</span> 하거나 <span style="color:#4462ee">새로운 브라우저</span>를 사용하세요.<span>';
    html += '<a href="' + ieUpdateURL + '" target="_blank" style="border:2px solid #babdc0;padding:5px;margin-left:10px;">익스플로러 업그레이드</a><a href="' + chromeInstallURL + '" target="_blank" style="border:2px solid #babdc0;padding:5px;margin-left:4px;">크롬 설치</a></span></p>';
    html += '<button type="button" style="cursor:pointer;z-index:100000;border:0;position:absolute;top:0;right:0;width:55px;height:55px;background:#f5f7fa;padding-top:4px" onclick="closeOldIEMsg()">';
    html += '<i class="wadizicon wa-close" style="font-size:16px"></i></button></div>';
    var $msg = $(html);
    if ($('#wadizTopBanner').is('.active')) {
      $msg.css('position', 'absolute').prependTo(document.body);
    } else {
      $msg.prependTo(document.body);
    }
  }
  function closeOldIEMsg(){
    $('.old-ie-msg').remove();
    //setTopBannerCookie("wadizOldIEMsg", "N", null);
    document.cookie = "wadizOldIEMsg=N;path=/";
  }
  window.closeOldIEMsg = closeOldIEMsg;
})(jQuery);

function setTopBannerCookie(cookieName, value, exdays, path) {
  var cookie = [cookieName + '=' + escape(value)];
  cookie.push('path=' + (path || '/'));
  if (exdays) {
      var exdate = new Date();
      exdate.setDate(exdate.getDate() + exdays);
    cookie.push('expires=' + exdate.toGMTString());
  }
  document.cookie = cookie.join(';');
}

var $popupScrollTop;

/*공통레이어팝업열기*/
function showLyPop(popName){
  var scrollbarWidth = window.innerWidth - document.documentElement.clientWidth;
  var $body = $('body');
  var $lypop = $('#'+popName+'Lypop');

  $popupScrollTop = $(window).scrollTop();
  $('.black-bg-wrap').show();
  if ($lypop.hasClass('ui-flex-box')) {
    if ($(document.documentElement).hasClass('msie')) {
      $lypop.css('display', 'block');
    } else {
      $lypop.css('display', 'flex');
    }
  } else {
    $lypop.show().focus();
  }
//  $body.css({ position: 'fixed', width: '100%', height: 'auto', minHeight: 'unset', top: -($popupScrollTop) });;
//  $('html').addClass('lypop').css('overflow-y','hidden');

  // 스크롤 처리
//  if (scrollbarWidth) {
//    $body.css({ paddingRight: scrollbarWidth, boxSizing: 'border-box' });
//    $lypop.css({ overflowY: 'scroll' });
//  }

  window.lyPopOpened = true;
}

/*공통레이어팝업닫기*/
function closeLyPop(popName){
  if ($('#couponRegisterViewr').length > 0) {
    $('#couponRegisterViewr').attr('onClick', 'ajaxRegisterCoupon()');
  }

  $('.black-bg-wrap').hide();
  $('#'+popName+'Lypop').css({ overflowY: '' }).hide();
  $('body').css({ position: '', width: '', height: '', minHeight: '', top: '', paddingRight: '', boxSizing: '' });
  $('html').removeClass('lypop').css('overflow-y','');
  setTimeout(function() {
    $(window).scrollTop($popupScrollTop);
  }, 0);

  window.lyPopOpened = false;
}

/*포인트쿠폰 확인*/
function setMyPointCouponInfo() {
  var sessionUser = "${requestScope.USER_INFO.encIntUserId}";
  if (sessionUser.length > 0) {
      $.ajax({
        url: "/web/wpoint/pointInquiry/ajaxGetMyPointInquirySummary",
        type: 'POST',
        success: function(result) {
            if ("true" == result.success) {
              var point = result.possessionPoint;
              $('#ssPoint').html(point.format()); // 보유 포인트
            } else {
            	$('#ssPoint').html("- "); // 보유 포인트
            }
        }
      });
      $.ajax({
        url: "/web/wpoint/pointInquiry/ajaxGetMyCouponInquirySummary",
        type: 'POST',
        success: function(result) {
            if ("true" == result.success) {
              var coupon = result.possessionCouponCnt;
              $('#ssCouponCnt').html(coupon.format()); // 보유 쿠폰
            } else {
              $('#ssCouponCnt').html("- "); // 보유 쿠폰
              }
          }
      });
    }

  /*숫자 타입에서 쓸 수 있도록 format() 함수 추가*/
  Number.prototype.format = function(){
      if(this==0) return 0;
      var reg = /(^[+-]?\d+)(\d{3})/;
      var n = (this + '');
      while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
      return n;
  };

  /* 문자열 타입에서 쓸 수 있도록 format() 함수 추가*/
  String.prototype.format = function(){
      var num = parseFloat(this);
      if( isNaN(num) ) return "0";
      return num.format();
  };
}

function getCookie(cookieName) {
  cookieName = cookieName + '=';
  var cookieData = document.cookie;
  var start = cookieData.indexOf(cookieName);
  var cookieValue = '';
  if (start != -1) {
      start += cookieName.length;
      var end = cookieData.indexOf(';', start);
      if (end == -1) end = cookieData.length;
      cookieValue = cookieData.substring(start, end);
  }
  return unescape(cookieValue);
}

function loginLink(loginAfterFunc){
  if ($("#forwardForm #returnURL").val().length == 0) {
    if (loginAfterFunc) {
      var param = (location.search ? (location.search + '&') : '?') + '_signin_after_func=' + loginAfterFunc;
      $("#forwardForm #returnURL").val(location.origin + location.pathname + param + location.hash);
    } else {
      $("#forwardForm #returnURL").val(location.href);
    }
  }
  $("#forwardForm").attr("action", "/web/waccount/wAccountLogin").submit();
}

function loginEquityLink(){
  if ($("#forwardForm #returnURL").val().length == 0) {
    $("#forwardForm #returnURL").val(location.href);
  }
  $("<input>", { type: 'hidden', name: 'joinType', value: 'equity' }).appendTo('#forwardForm');
  $("#forwardForm").attr("action", "/web/waccount/wAccountLogin").submit();
}

function registerLink(joinType){
  $("#forwardForm #returnURL").val(location.href);
  if (joinType) {
    $("<input>", { type: 'hidden', name: 'joinType', value: joinType }).appendTo('#forwardForm');
  }
  $("#forwardForm").attr("action", "/web/waccount/wAccountRegistIntro").submit();
}

function wcampaignSearch(){
  var keyword = $("#newSearchInput").val();

  location.href='/web/wcampaign/search?keyword='+keyword;
}

//와디즈 앱 설치 및 열기
function launchWadizApp(){
    var androidUrl = "intent://www.wadiz.kr/main#Intent;scheme=http;package=com.markmount.wadiz;end;";
  var androidAppStore = "android-app://com.markmount.wadiz/http/www.wadiz.kr/main";
    var g_intent = "scheme=MYAPP;package=com.markmount.wadiz;end"; //see notes below

  if(isAndroid){
    if(navigator.userAgent.match(/Chrome/)) {
           var intent = androidUrl.replace('MYAPP', 'intent') + '#Intent;' + g_intent; //see notes below
           document.location = androidUrl;
      }
      else if (navigator.userAgent.match(/Firefox/)) {
           launchWadizWebkitApproach(androidUrl, androidAppStore);
           setTimeout(function () {
                launchWadizIframeApproach(androidUrl, androidAppStore);
           }, 1500);
      }
      else {
          launchWadizIframeApproach(androidUrl, androidAppStore);
      }
  }
  else if(isIos){
        setTimeout(function(){
          location.href = 'itms-apps://itunes.apple.com/kr/app/wadijeu/id1107828621?l=enmt=8';
      }, 200);
      setTimeout(function(){
          location.href = 'wadiz://';
      }, 100);
  }else{
    window.open("https://play.google.com/store/apps/details?id=com.markmount.wadiz");
  }
}
function launchWadizIframeApproach(url, alt) {
    var iframe = document.createElement("iframe");
    iframe.style.border = "none";
    iframe.style.width = "1px";
    iframe.style.height = "1px";
    iframe.onload = function() {
        document.location = alt;
    }
    document.body.appendChild(iframe);
}
function launchWadizWebkitApproach(url, alt) {
    document.location = url;
    timer = setTimeout(function () {
        document.location = alt;
    }, 2500);
}

//커뮤니티 이동
function goCommunity(){
//	if(isIos || isAndroid){
//		location.href = "/web/m/ftcommunity/main";
//	}else{
//		location.href = "/web/ftcommunity/main";
//	}
  location.href = "/web/wcast/main";
}

//동부신규계좌 이동
function goNewDongbuAccount(){
  if(isIos || isAndroid){
    window.open('https://mo.dongbuhappy.com/api/rqisms.dongbu','_blank');
  }else{
    window.open('https://new.dongbuhappy.com/online/nfn/on_Non_face_viw01.dongbu','_blank');
  }
}

//마이페이지 이동
function goMyPage(args, param) {
  if ((param != '' && param != undefined) && args == 'coupon') {
    var html = "/web/wmypage/mybenefit/couponlist?rewardValue=" + param;
    location.href = html;
  }
}

//펀딩결제내역 이동
function goWadizBackedInfoList(){
  if(isIos || isAndroid){
    if($(window).width() < 768){
      location.href = "/web/m/account/backedInfoList";
    }else{
      location.href = "/web/account/my?viewType=history";
    }
  }else{
    location.href = "/web/account/my?viewType=history";
  }
}

//이용약관 이동
function goUserTerms(type){
  if (type == 'reward') {
    location.href = "/web/wterms/service_reward";
  } else {
    location.href = "/web/wterms/service_invest";
  }
}

//개인정보처리방침 이동
function goPersonalTerms(type){
  if (type == 'reward') {
    location.href = "/web/wterms/privacy_reward";
  } else {
    location.href = "/web/wterms/privacy_invest";
  }
}

//운영정책-수수료정책 이동
function goOperationTerms(){
  location.href = "/web/wterms/reward";
}

//easycard 이동
function easycardLink(num){
  $("#forwardForm #returnURL").val(location.href);
  $("#forwardForm").attr("action", "/web/wsub/easycard/"+num).submit();
}

//SBS 초대코드
function makeSBSInviteCode(){
  if(sessionUser.length > 0){
    $('#sbsEventCodeBtn').hide();
    $('#sbsEventCodeNum').show();
  }else{
    loginLink();
  }
}

//SBS URL복사
function copySBSUrlwithCode(){
  var SBSJoinLink = $('#sbsEventLink').val();
  if(sessionUser.length > 0){
    var clipboard = new Clipboard('#sbsEventLinkBtn', {
        text: function() {
            return SBSJoinLink;
        }
    });
    if(isIos || isAndroid){
      $('#sbsEventHiddenLink').show();
    }else{
      clipboard.on('success', function(e) {
           alert('클립보드에 복사되었습니다!');
        });
    }
  }else{
    loginLink();
  }
}
//SBS 페이스북 공유하기
function shareSBSLinkFacebook(){
  var SBSJoinLink = $('#sbsEventLink').val();
  if(sessionUser.length > 0){
    window.open('http://www.facebook.com/sharer/sharer.php?u='+SBSJoinLink,'_blank');
  }else{
    loginLink();
  }
}

//SBS 트위터 공유하기
function shareSBSLinkTwitter(){
  var SBSJoinLink = $('#sbsEventLink').val();
  if(sessionUser.length > 0){
    window.open('https://twitter.com/intent/tweet?text=친구 초대하면 와디즈가 펀딩비를 쏩니다! 지금 바로 친구 초대 하고, 리워드형 크라우드펀딩 에서 자유롭게 사용할 수 있는 펀딩비 받아가세요  &url='+SBSJoinLink,'_blank');
  }else{
    loginLink();
  }
}

//15분마다 sessionConfirmFlag 체크 후
//입력값 있을 시 자동 Session 갱신.
//입력값 없을 시 자동 로그아웃.
var sessionConfirmFlag = 'N';
var sessionLoginStatus = '';
function useSessionConfirm(){
   $('body').keyup(function() {
     sessionConfirmFlag = 'Y';
  });

    setTimeout(function () {
      if(sessionConfirmFlag == 'Y'){
          $.ajax({
                url: "/web/waccount/refresh",
                type: 'POST',
                success: function(result) {}
            });
          sessionConfirmFlag = 'N';
          useSessionConfirm();
      }else{
        sessionLoginStatus = 'N';
       alertify.alert('30분동안 사용되지 않아<br/>로그아웃 되었습니다.<br/><br/>계속 작성하시려면 재로그인 후 이용해주세요.', function(e) {
         var sessionUser = "${requestScope.USER_INFO.encIntUserId}";

            if(e){
            if (sessionUser.length > 0) {
                  location.href = "/web/waccount/logout";
            }else{
              location.reload();
            }
            }
         });
      }
   }, 1500000);
}

function goUserProfile(encUserId){
  var loginSession = $("#sessionLoginCheck").val();
  if (loginSession == "true") {
   $.ajax({
          url: "/web/wmypage/myprofile/ajaxGetDropUserYn",
          type: 'POST',
          data:{"encUserId" : encUserId},
          success: function(result) {
             if ("SUSS000" == result.code && "true" == result.success) {
                if(result.message == 'Y'){
                  alertify.alert("탈퇴한 회원입니다.");
                }else{
                location.href = "/web/wmypage/myprofile/fundinglist/" + encUserId;
                }
             }
          }
      });
  }else{
    var targetUrl = location.protocol + "//" + location.host + "/web/wmypage/myprofile/fundinglist/" + encUserId;
    $("#forwardForm #returnURL").val(targetUrl);
    loginLink();
  }
}

function goMakerProfile(encUserId){
  var loginSession = $("#sessionLoginCheck").val();
  if (loginSession == "true") {
   $.ajax({
          url: "/web/wmypage/myprofile/ajaxGetDropUserYn",
          type: 'POST',
          data:{"encUserId" : encUserId},
          success: function(result) {
             if ("SUSS000" == result.code && "true" == result.success) {
                if(result.message == 'Y'){
                  alertify.alert("탈퇴한 회원입니다.");
                }else{
                location.href = "/web/wmypage/myprofile/makinglist/" + encUserId;
                }
             }
          }
      });
  }else{
    loginLink();
  }
}

(function($) {
  // Wmask
  var maskStyle = {
    position: 'fixed',
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    background: 'rgba(0,0,0,.7)',
    zIndex: 99999
  };
  var spinnerStyle = {
    textAlign: 'center',
    position: 'absolute',
    left: '50%',
    top: '50%',
    transform: 'translate(-50%,-50%)'
  };
  var mask = $('<div>').css(maskStyle);
  var spinner = $('<div>').addClass('wz-loader large').css(spinnerStyle);
  window.Wmask = {
    on: function(opts) {
      var options = opts || {};
      if (this._mask) return;
      this._mask = mask.appendTo(document.body);
      if (options.spinnerText) {
         spinner.addClass('text').css('color', '#fff').text(options.spinnerText);
      }
      if (options.spinner) {
        spinner.appendTo(this._mask);
      }
      return spinner;
    },
    off: function() {
      if (!this._mask) return;
      this._mask.remove();
      this._mask = null;
    }
  };

  // IE Detect
  var isIE = ua.match(/MSIE (\d+)/i) || ua.match(/(Trident)\/(\d+)/i);
  if (isIE) {
    var IEVer = parseInt(isIE[1], 10);
    if (isIE[1] === 'trident' && isIE[2] === '7') {
      IEVer = 11;
    }
    $(document.documentElement).addClass('msie msie' + IEVer);
  }
})(jQuery);
