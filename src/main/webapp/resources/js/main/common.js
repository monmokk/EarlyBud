
/**
 * 즉시실행함수 (공통으로 쓸 커스텀 플러그인)
 * 
 * author : 성일만
 */ 
(function() {
	/**
	 * 데이트 피커 초기화 플러그인
	 */
	jQuery.fn.initDatePicker = function(options) {
		var ele = this.selector;
		
		// default option.
		options = jQuery.extend({
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			changeYear : true,
			yearRange : "c-70:c+7"
		}, options);
		
		$(ele).datepicker(options);
	}
	
	/**
	 * 폼의 모든 input 초기화
	 */
	jQuery.fn.clearForm = function() {
		var ele = this.selector;
		
		$(ele + " :input").each(function(){
			var id = $(this).attr("name");
			var ele = "#" + id;
			$(ele).val("");
		});
		
	}
	/**
	 * 다이어로그 팝업 초기화 플러그인
	 */
	jQuery.fn.initDialog = function(options) {
		var ele = this.selector;

		// default option.
		options = jQuery.extend({
			autoOpen: false,
		    width: 397,
		    height: 300,
		    resizable: false,
		    closeOnEscape: false,
		    open: function() { 
		    	$(".ui-dialog-titlebar", $(this).parent()).hide(); 
		    } 
		}, options);
		
		$(ele).dialog(options);
	}
	
	/**
	 * 문자열의 Byte를 가져온다.
	 */
	jQuery.fn.getByteLength = function() {
		
		var l= 0;
		var _this = $(this).val();
	     
	    for(var idx=0; idx < _this.length; idx++) {
	        var c = escape(_this.charAt(idx));
	         
	        if( c.length==1 ) l ++;
	        else if( c.indexOf("%u")!=-1 ) l += 2;
	        else if( c.indexOf("%")!=-1 ) l += c.length/3;
	    }
	     
	    return l;
	}
	
	/**
	 * 특수문자 포함여부
	 */
	jQuery.fn.isSpecialLetters = function() {
		var result = false;
		
		re = /[~!@\#$%^&*\()\-=+_']/gi; 
		
		var temp = $(this).val();
		if(re.test(temp)){ //특수문자가 포함되면 삭제하여 값으로 다시셋팅
   	 		//$(this).val(temp.replace(re,""));
			result = true;
   	 	}
		
		return result;
	}
	
	/**
	 * jQuery validate 날짜 형식
	 */
//	jQuery.validator.addMethod("date", function(value, element, params) {
//		if(this.optional(element)) {
//			return true;
//		};
//		
//		var result = false;
//		
//		try{
//			$.datepicker.parseDate('yy-mm-dd', value);
//			result = true;
//		}catch(err){
//			result = false;
//		}
//		
//		return result;
//	},"");
	
	//Validate 경고메세지를 alertify로 
//	jQuery.validator.setDefaults({
//		onkeyup:false,
//		onclick:false,
//		onfocusout:false,
//		showErrors:function(errorMap, errorList){
//			if(this.numberOfInvalids()) {
//				if (null != errorList[0]) {
//					alertify.alert(errorList[0].message);
//				}
//	        }
//		}
//	});
	
})();

/**
 * AJax 요청
 * @param params
 * @param url
 */

/**
 * author : 김종성
 * 
 * @ param : reqParams, url, callBack,  
 */
function ajaxRequest(params, url, callBack, async) {
	async = async || true;
	
	$.ajax({
		type: "POST",
		url: url,
		data: params,
		async : async
	}).done(function(result){
		try {
			var jsonObj = $.parseJSON(result);
		} catch (error) {
			var jsonObj = result;
		}
		if (jsonObj.success == 'true') {
			if (callBack && typeof callBack === 'function') {
				callBack(jsonObj);
			}
		} else {
			failureFunc(jsonObj);
		}
	});
}

function failureFunc(response) {
  setTimeout(function(){ 
    // 에러
    Wmask.off();
    alert("데이터 처리를 실패하였습니다.");
    location.reload();
  }, 5000);
}

var common =  {
	isNotEmpty : function(_str){
		obj = String(_str);
		if(obj == null || obj == undefined || obj == 'null' || obj == 'undefined' || obj == '' ) return false;
		else return true;
	},
	isEmpty : function(_str){
		return !common.isNotEmpty(_str);
	},
	
	comma : function(str){
		str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	},
	
	dateDash : function(str){
		str = String(str);
		if(str.length == 8){
			str = str.substring(0,4) + '-' + str.substring(4).replace(/(\d)(?=(?:\d{2})+(?!\d))/g, '$1-'); 
		}
	    //return str.replace(/(\d)(?=(?:\d{2})+(?!\d))/g, '$1-');
		
		return str;
	},
	
//	emailCheck : function(str){
//		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
//		  
//		if(regex.test(str) === false) {  
//		    return false;  
//		}
//		return true;
//	},
	
	sessionIsNotEmpty : function(session){
		obj = String(session);
		if(obj == null || obj == undefined || obj == 'null' || obj == 'undefined' || obj == '' ) return false;
		else return true;
	},
	
	/**
	 * 해당 input 값의 max value 만큼 텍스트 카운트를 센다
	 */
	textCounter : function(input, em){
		$(em).text($(input).val().length + "/" + $(input).attr("maxlength"));
		$(input).keyup(function (e) {
			$(em).text($(input).val().length + "/" + $(input).attr("maxlength"));
	    });
	}
};


/**
 * ckeditor 툴바, 제외할 버튼 설정
 */
var myEditor = {
	/**
	 * 에디터 생성
	 * @param textareaName : 적용할 textarea의 이름
	 * @param width : 에디터 넓이
	 * @param height : 에디터 높이
	 * @returns
	 */
	createEditor : function(textareaName, width, height){
		return CKEDITOR.replace(textareaName, {//해당 이름으로 된 textarea에 에디터를 적용
			toolbarGroups : myEditor.toolbarGroup,
			removeButtons : myEditor.removeButtons,
			width : width,  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
			height : height,  // 입력창의 높이
			filebrowserImageBrowseUrl: '/web/campaign/editsample/uploadPartial',
			filebrowserImageUploadUrl: '/web/campaign/imageUpload2' //여기 경로로 파일을 전달하여 업로드 시킨다.
		});
	},
	/**
	 * 툴바 위치 정보
	 */
	toolbarGroup : [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		'/',
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		'/',
		'/',
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	],
	/**
	 * 사용하지 않을 버튼 정의
	 */
	removeButtons : 'Font,Source,Save,Print,Paste,PasteFromWord,Find,SelectAll,Scayt,Replace,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,BidiRtl,Language,CreateDiv,Flash,Smiley,PageBreak,Iframe,Maximize,ShowBlocks,About,NewPage,Preview,Templates,RemoveFormat,Table,Copy,Cut,BidiLtr,Format,Styles'
}

/**
 * 쿠키 관련
 * 
 * author : 성일만
 */
var cookie = {
	/**
	 * 쿠키를 가져온다.
	 * @returns {String}
	 */
	get : function(){
		return document.cookie + ";";
	},
	
	/**
	 * 쿠키에 정보를 저장한다.
	 * @param name 저장할 이름
	 * @param value 저장할 값
	 * @param expiredays 기간 (ex : 7일 경우 오늘로부터 7일)
	 */
	set : function(name, value, expiredays){
		var today = new Date();
		today.setDate( today.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
	},
	
	/**
	 * 쿠키에 유저아이디를 저장한다.
	 * @param id
	 */
	setUserId : function(id){
		if(id != "") {
			// userid 쿠키에 id 값을 7일간 저장
			cookie.set("userid", id, 7);
		}else{
			// userid 쿠키 삭제
			cookie.set("userid", id, -1);
		}
	},
	
	/**
	 * 쿠키에 저장된 유저 아이디를 가져온다.
	 * @returns {String}
	 */
	getUserId : function(){
		// userid 쿠키에서 id 값을 가져온다.
		var cook = cookie.get();
		var idx = cook.indexOf("userid", 0);
		var val = "";

		if(idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape(cook.substring(begin, end));
		}
		return val;
	},
	getTarget : function(target){
		// userid 쿠키에서 id 값을 가져온다.
		var cook = cookie.get();
		var idx = cook.indexOf(target, 0);
		var val = "";
		
		if(idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape(cook.substring(begin, end));
		}
		return val;
	}
}

/**
 * 스크롤을 화면 상단으로 이동
 */
function scrollToTop() {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
}

/**
 * 메뉴 변화
 * @param submenuid
 */
function changesubmenu(submenuid) {
    $(".sub-menu").hide();
    $("#submenu" + submenuid).show();
}

/**
 * url short load
 * 사용할 페이지에서 
 * <script src="https://apis.google.com/js/client.js?onload=initUrlShort"></script> 명시 후
 * makeShortUrl(바꿀 주소) 호출
 */
function initUrlShort(){
    //Get your own Browser API Key from  https://code.google.com/apis/console/
    gapi.client.setApiKey('AIzaSyBXpW5mbysxLk1zFCwPx7UaPNNqIM75mHw');
    gapi.client.load('urlshortener', 'v1',function(){});
}

/**
 * short url
 * @param target
 * @param targetEle
 */
function makeShortUrl(target, targetEle){
	var longUrl=target;
    var request = gapi.client.urlshortener.url.insert({
    	'resource': {
    		'longUrl': longUrl
    	}
	});
    request.execute(function(response){
    	if(response.id != null){
    		$("#" + targetEle).val(response.id);
    	}else{
    		alert("error: creating short url n"+ response.error);
        }
    });
 }

/**
 * 파일 확장자 체크
 * @param file
 * @returns {Boolean}
 */
function fileCheck(file) {
	var fileName = file;
	fileName = fileName.split('.').pop().toLowerCase();

//	if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){
		//alert("이미지 파일은 (jpg, png, gif, bmp) 형식만 등록 가능합니다.");
	if(fileName != "jpg" && fileName != "png" && fileName != "gif"){
		alert("이미지 파일은 (jpg, png, gif) 형식만 등록 가능합니다.");
		return false;
	}
	return true;
}

// (수정해야함)
function getWriteTime(param){
	var parseDate = function parseDate(str) {
	  var d = str.match(/^(\d{0,4})[\/|\-](\d{0,2})[\/|\-](\d{0,2})\s(\d{0,2}):(\d{0,2}):?(\d{0,2})?/);
	  return new Date(d[1], d[2]-1, d[3], d[4], d[5], d[6] || '00');
	}

	var date = new Date();
	var date2 = new Date(param.replace(/-/g, '/'));
	if (isNaN(date2.getTime())) {
	  date2 = parseDate(param);
	}
	
	var curTime = date.getTime();
	var regTime = date2.getTime();
	var diffTime = (curTime - regTime) / 1000;
	var result = "";

	hour = parseInt(diffTime / 3600);
	min = parseInt((diffTime % 3600) / 60);
	sec = diffTime % 60;

	date.setHours(0,0,0,0);
	date2.setHours(0,0,0,0);
  day = (date - date2) / (1000 * 60 * 60 * 24);

  if (1 <= day && 7 > day) {
  	result = day + "일 전"
  } else if (7 <= day) {
		var divisionWeek = Math.floor(day / 7);

    if (4 < divisionWeek && 12 > divisionWeek) {
      result = Math.floor(divisionWeek / 4) + "달 전";
    }else if(12 < divisionWeek){
      result = param.substring(0,10);
    }else{
      result = divisionWeek + "주 전";
    }
  } else if (0 == hour) {
		if(1 > min){
			result = "방금 전";
		}else{
			result = min + "분 전";
		}
	} else {
		if(24 == hour){
			result = "어제";
		}else{
			result = hour + "시간 전";
		}
	}
	return result;
}

/**
 *  숫자만 입력가능
 */
function numOnly() {
	$('.numOnly').css('imeMode','disabled').keypress(function(event) { //ie처리
		if(event.which && (event.which < 48 || event.which > 57) && event.which != 8 ) {
			if (event.preventDefault()) {
				event.preventDefault();
			} else {
				event.returnValue = false;
			}
		}
	}).keyup(function(){ //크롬, 파폭 처리
		var  $this = $(this)
		if( $this.val() != null && $this.val() != '' ) {
			$this.val( $this.val().replace(/[^0-9]/g, '') );
		}
	});
}

$(document).ready(function(){
	/*숫자만 입력되도록 처리*/
	numOnly()
});


// jquery로 URL parameter 확보
$.urlParam = function(name) {
	var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
	if (!results) { return null; }
	return results ? results[1] || null : 0;
}


// 모바일 웹(웹뷰) 링크를 위한 공통 함수 모듈
var wdzLink = {
	userAgent : function () {
		return navigator.userAgent.toLowerCase();
	}
	,isWebView : function () {
		var ua = this.userAgent();
		
		if (this.isFacebookApp() || this.isKakaotalkApp() || this.isNaverApp()) {
			return true;
		} else if(this.isIosApp() || this.isAndroidApp()) { 
			return true;
		} else { 
			return false;
		}
	}
	,isMobileSize : function() {
	 return  (window.innerWidth || $(window).width() ) < 768 ? true : false;
	}
	,isNotWindow : function () {
    return (/windows/.test(this.userAgent()) || /win16/.test(this.userAgent()) || /win32/.test(this.userAgent()) || /win64/.test(this.userAgent())) ? false : true;
  }
	,isIosApp : function () {
		return (/ioswadiz/.test(this.userAgent())) ? true : false;
	}
	,isAndroidApp : function () {
		return (/androidbrowser/.test(this.userAgent()) || /androidwadiz/.test(this.userAgent())) ? true : false;
	}
	,isFacebookApp : function () {
		return (/fb_iab/.test(this.userAgent()) || /fbios/.test(this.userAgent())) ? true : false;
	}
	,isKakaotalkApp : function () {
		return (/kakaotalk/.test(this.userAgent())) ? true : false;
	}
	,isNaverApp : function () {
		return (/naver/.test(this.userAgent())) ? true : false;
	}
	,open : function (url, mode) {
		if (url == "") return;

		mode = mode || "default";
		mode = mode.toUpperCase();

		var _url = (/^http|https/.test(url)) ? url : "http://" + url; // http(s) 여부 확인후 url 링크 보완

		if (mode == "LAYERPOPUP") { // 지정된 라이브러리 사용한 동작
			
		} else if (mode =="WADIZAPP") { // WadizApp에서 컨트롤하도록 동작   

		} else {
			if (this.isWebView()) { // 웹뷰에서의 동작
				location.href = _url;
			} else { // 기본 모바일 웹에서의 동작
				window.open(_url, '_blank');
			}
		}
	}
	,close : function (url) {
		if (this.isIosApp()) {
			location.href= "wadiz://webcommand/webInterface.close";
		} else if(this.isAndroidApp()) {
			WebInterface.close();
		} else {
			location.href = url;
		}
	}
};

/* trim input, textarea 2017-04-10 */
(function($) {
	
	$.fn.trimInput = function() {
		return this.each(function() {
			var $el = $(this), value = $el.val();
			if (value) {
				$el.val($.trim(value));
			}
		});
	};
	
})(jQuery);

/* TextArea Autosize Module 2017-04-07 */
(function(){'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var TextAreaAutoResize = function () {
  function TextAreaAutoResize(element, options) {
    _classCallCheck(this, TextAreaAutoResize);

    if (!element && !element.nodeName && element.nodeName !== 'TEXTAREA') {
      return;
    }

    this.element = element;
    this.setOptions(options);
    this.init();

    // event bind
    element.addEventListener('input', this, false);
    element.addEventListener('keyup', this, false);
  }

  _createClass(TextAreaAutoResize, [{
    key: 'setOptions',
    value: function setOptions() {
      var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};

      this.maxHeight = options.maxHeight || null;
    }
  }, {
    key: 'init',
    value: function init() {
      // 초기 높이값 캐싱
      this.initHeight();

      // 내용이 입력되어 있을 수 있으니 최초에 한번 계산
      this.calculateHeight();
    }
  }, {
    key: 'handleEvent',
    value: function handleEvent(event) {
      // IE에서 일부 `input`이벤트가 원할하지 않아 keyup을 함께 호출 후
      // 앞에 input이벤트가 실행 되었을 경우에는 실행하지 않음
      if (event.type !== 'keyup' || this.calledEvent !== 'input') {
        this.calculateHeight(event.target);
      }
      this.calledEvent = event.type;
    }
  }, {
    key: 'initHeight',
    value: function initHeight() {
      // Max Height (`0` === 지정 안함)
      this.maxHeight = parseInt(this.getData('maxheight') || this.maxHeight, 10);

      // computed style

      var _window$getComputedSt = window.getComputedStyle(this.element),
          boxSizing = _window$getComputedSt.boxSizing,
          height = _window$getComputedSt.height,
          paddingTop = _window$getComputedSt.paddingTop,
          paddingBottom = _window$getComputedSt.paddingBottom,
          borderTopWidth = _window$getComputedSt.borderTopWidth,
          borderBottomWidth = _window$getComputedSt.borderBottomWidth;

      // init


      this.initRows = this.getRows();
      this.initHeight = parseInt(height, 10);
      this.changeOverflow('hidden');

      // offset height
      if (boxSizing === 'content-box') {
        this.offsetHeight = -(parseInt(paddingTop, 10) + parseInt(paddingBottom, 10));
      } else {
        this.offsetHeight = parseInt(borderTopWidth, 10) + parseInt(borderBottomWidth, 10);
      }
    }
  }, {
    key: 'getRows',
    value: function getRows() {
      var rows = this.element.getAttribute('rows');
      return parseInt(rows, 10) || null;
    }
  }, {
    key: 'getData',
    value: function getData(dataProp) {
      var dataset = this.element.dataset;
      if (dataset) {
        return dataset[dataProp] || 0;
      }
      return this.element.getAttribute('data-' + dataProp) || 0;
    }
  }, {
    key: 'getLineLength',
    value: function getLineLength() {
      var lineMatch = this.element.value.match(/\n/g);
      return lineMatch && lineMatch.length || 0;
    }
  }, {
    key: 'calculateHeight',
    value: function calculateHeight() {
      var target = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : this.element;

      if (!target.scrollHeight) return;

      // 스크롤 높이를 구함
      var scrollHeight = target.scrollHeight + this.offsetHeight;

      // 높이가 줄어들 경우 다시 계산
      if (this.cachedHeight === scrollHeight) {
        this.cachedHeight = null;
        this.changeOverflow();
        this.calculateHeight(target);
        return;
      }

      // if
      var isHeight = this.initHeight !== scrollHeight;
      var isCachedHeight = this.cachedHeight !== scrollHeight;
      if (isHeight && isCachedHeight) {
        this.setHeight(scrollHeight);
      }
    }
  }, {
    key: 'setHeight',
    value: function setHeight(height) {
      if (this.maxHeight && this.maxHeight < height && !this.forceUpdate) {
        this.element.style.overflowY = 'auto';

        // 값이 미리 입력되어 있는 경우는 최대값으로 변경
        if (!this.cachedHeight) {
          this.changeHeight(this.maxHeight);
        }
        return;
      }

      this.changeOverflow('hidden');
      this.changeHeight(height);
    }
  }, {
    key: 'changeOverflow',
    value: function changeOverflow() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 'auto';

      this.element.style.height = null;
      this.element.style.overflowY = value;
    }
  }, {
    key: 'changeHeight',
    value: function changeHeight() {
      var height = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;

      this.element.style.height = null || height + 'px';
      this.cachedHeight = height; // caching...
    }

    // 외부에서 강제로 변경 할 경우

  }, {
    key: 'update',
    value: function update(options) {
      this.setOptions(options);
      this.calculateHeight();
    }
  }]);

  return TextAreaAutoResize;
}();

/* global jQuery */
// jQuery 지원


if (window.jQuery) {
  jQuery.fn.textAreaAutoResize = function jQueryTextAreaAutoResize(options) {
    return this.each(function jQueryTextAreaAutoResizeEach() {
      var $element = jQuery(this);
      var autosize = $element.data('_autosize');
      // 중복실행을 막기 위해 data에 담아둔 값으로 체크
      if (autosize) {
        autosize.update(options);
      } else {
        $element.data('_autosize', new TextAreaAutoResize(this, options));
      }
    });
  };
}

})();

// WUserAgent
if (window.UAParser && !window.WUserAgent) {
	window.WUserAgent = (function($) {
		if ($.ua) { return $.ua; }
		var result = new UAParser();
		return result.getResult();
	})(jQuery);
}