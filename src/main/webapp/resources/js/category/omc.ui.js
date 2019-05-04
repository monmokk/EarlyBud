/**
 * UI 제어 관련 헬퍼 함수 모음
 * @desc 화면 제어 함수의 상당수는 실제 HTML 구조와 매우 연관성이 높다.
 */
var UI = UI || {
    /**
     * 프로젝트 상세 페이지 관련 : 후원형(모의투자 포함), 증권형 공통
     */
    Project: {
        /**
         * 상세 페이지의 탭메뉴가 상단 고정 상태인지 확인
         * return boolean
         */
        isTabMenuFixed: function() {
            return $('.sticky_bar').hasClass('fixed');
        }
    },
    /**
     * 후원형 프로젝트 상세 페이지
     */
    RewardProject: {
        /**
         * 상세 페이지의 위 공통 영역을 제외한 컨텐츠 영역이 최상단으로 위치하도록 스크롤
         */
        scrollInnerContent: function() {
            var heightProjectHeader = $('#omcHead').height() + $('.sticky_bar').height();
            $(document).scrollTop($('#reward_tab_content').offset().top - heightProjectHeader);
        },
        /**
         * 상세 페이지에서 응원 한마디 영역이 최상단으로 오도록 스크롤
         * 주의 : 참여자 응원글이 아님
         */
        scrollCheerContent: function() {
            var heightProjectHeader;

            // 현재 스크롤 상태에 따라 스크롤 해야할 위치가 다르다.
            if ($('#omcHead').hasClass('fixed')) {
                heightProjectHeader = $('#omcHead').height() * 2 + $('.sticky_bar').height() + 10;
            } else {
                heightProjectHeader = $('#omcHead').height() * 2 + $('.sticky_bar').height() + 110;
            }

            $(document).scrollTop($('.tit_cheer').offset().top - heightProjectHeader);
        }
    },
    /**
     * 증권형 프로젝트 상세 페이지
     */
    InvestProject: {
        /**
         * 상세 페이지의 위 공통 영역을 제외한 컨텐츠 영역이 최상단으로 위치하도록 스크롤
         */
        scrollInnerContent: function() {
            var heightProjectHeader = $('#omcHead').height() + $('.sticky_bar').height();
            $(document).scrollTop($('.stock_main_cont').offset().top - heightProjectHeader);
        }
    },
    /**
     * 프로젝트 목록 조회 페이지
     */
    ProjectList: {
        /**
         * 현재 화면에서 선택되있는 정렬 조건 값을 조회
         * @returns {string}
         */
        getSortingValue: function() {
            var $sorting = $('#sorting');
            return ($sorting.length) ? $sorting.val() : '';
        },
        /**
         * 현재 화면에서 선택되있는 카테고리의 코드를 조회
         * @return {string} 선택된 카테고리 코드, DB에서 분류하는 코드와 동일한 값을 사용한다.
         */
        getSelectedCategoryCode: function() {
            var $selectedCategory = $('#category_list').find('li.on');
            return ($selectedCategory.length === 1) ? $selectedCategory.eq(0).data('category-code') : '';
        },
        /**
         * 특정 카테고리에 선택 효과를 준다
         * @param categoryCode {string} 프로젝트 카테고리 코드
         */
        changeSelectedCategory: function(categoryCode) {
            var $categoryList = $('#category_list');
            $categoryList.find('li').each(function() {
                if ($(this).data('category-code') === categoryCode) {
                    $(this).addClass('on');
                } else {
                    $(this).removeClass('on');
                }
            });

            if ($categoryList.find('li.on').length < 1) {
                $categoryList.children('li:first').addClass('on');
            }
        }
    },
    Component: {
        /**
         * 레이어 팝업 방식의 경고창을 띄운다.
         * @desc commonUtil.js의 openLayerAlert() 함수를 컴포넌트화하고 대체하기 위해 만들어졌다.
         * @param options.bodyMessage {string} 본문 내용, HTML 태그 사용 가능
         * @param options.confirmMessage {string} 확인버튼 텍스트
         * @param options.onClickConfirm {function} 확인버튼 클릭 이벤트 핸들러
         * @param options.useCancel {boolean} 취소버튼 사용 여부 (default : false)
         * @param options.cancelMessage {string} 취소버튼 텍스트
         * @param options.onClickCancel {function} 취소버튼 클릭 이벤트 핸들러
         * @param options.onClickClose {function} 닫기버튼 클릭 이벤트 핸들러
         */
        LayerAlert: function(options) {
            function destroyLayerAlert() {
                $('.omc_layer_alert').remove();
            }

            destroyLayerAlert();

            if (!options) {
                return;
            }
            
            var html = ''
                + '<div class="modal color_support omc_layer_alert">'
                + '<div class="modal_body">'
                + '<div class="modal_container">'
                + '<h1 class="screen_out"><a href="#none" class="modal_fir_focus"></a></h1>'
                + '<div id="bodyMsg" class="modal_cont static">'
                + (options.bodyMessage || '')
                + '</div>'
                + '<div class="modal_btn">'
                + '<button type="button" id="confirmMsg" class="modal_btn_confirm omc_layer_alert_confirm">'
                + (options.confirmMessage || '확인')
                + '</button>'
                + ' '
                + '<button type="button" id="cancelMsg" class="omc_layer_alert_cancel" style="display:none">'
                + (options.cancelMessage || '취소')
                + '</button>'
                + '</div>'
                + '<button type="button" class="modal_btn_close modal_last_focus omc_layer_alert_close">'
                + '<img src="/omc/asset/images/modal_btn_close.png" alt="닫기">'
                + '</button>'
                + '</div>'
                + '</div>'
                + '</div>';
            $('body').append(html);

            if (options.hasOwnProperty('useCancel') && options.useCancel) {
                $('.omc_layer_alert_cancel').show();
                // 취소버튼 색상 옵션이 있을 경우 해당색상으로 백그라운드를 입힌다.
                if(options.hasOwnProperty('cancelBtnColor')  && options.cancelBtnColor ){
                	$('.omc_layer_alert_cancel').css('background-color', options.cancelBtnColor);	
                }
                
            }

            $('.omc_layer_alert_confirm, .omc_layer_alert_cancel, .omc_layer_alert_close').click(destroyLayerAlert);

            if (options.hasOwnProperty('onClickConfirm') && typeof options.onClickConfirm === 'function') {
                $('.omc_layer_alert_confirm').click(options.onClickConfirm);
            }

            if (options.hasOwnProperty('onClickCancel') && typeof options.onClickCancel === 'function') {
                $('.omc_layer_alert_cancel').click(options.onClickCancel);
            }
            if (options.hasOwnProperty('onClickClose') && typeof options.onClickClose === 'function') {
            	$('.omc_layer_alert_close').click(options.onClickClose);
            }
        }
    },
    TEXT: {
        ID_NOT_FOUND: '아이디(이메일)를 입력해주세요.',
        ID_LENGTH_TOO_SHORT: '아이디는 4자 이상이여야 합니다.',
        ID_NOT_VALID: '이메일형식이 아닙니다.',
        ID_ALREADY_USED: '해당 계정은 이미 등록된 회원입니다.',
        PASSWORD_NOT_FOUND: '비밀번호를 입력해주세요.',
        PASSWORD_NOT_VALID: '비밀번호는 영문,숫자,특수문자를 포함한 10~16자리 입니다.',
        PASSWORD_NOT_MATCH: '설정하신 비밀번호와 다릅니다.',
        NAME_NOT_FOUND: '이름을 입력 해주세요.',
        CELL_NUMBER_NOT_FOUND: '휴대폰번호를 입력 해주세요.',
        CELL_NUMBER_NOT_NUMBER: '휴대폰번호는 숫자만 입력 해주세요.',
        CELL_NUMBER_NOT_VALID: '휴대폰번호를 정확히 입력해주세요. 휴대폰번호는 10~11자리 입니다.',
        SEND_AUTH_MAIL: '인증메일을 먼저 발송해주세요.',
        AUTH_CODE_NOT_FOUND: '입력하신 이메일 수신함을 확인하고 인증번호를 입력해주세요.',
        AUTH_CODE_NOT_MATCH: '인증번호가 일치하지 않습니다.',
        AUTH_CODE_SENDING_SUCCESS: '입력하신 메일로 인증메일을 발송했습니다. 유효시간 20분 안에 일련번호를 입력 해주세요.',
        MEMBER_NOT_FOUND: '등록된 정보와 일치하지 않습니다.<br />다시 입력해주세요.',
        CORPORATE_NAME_NOT_FOUND: '기업명을 입력 해주세요.',
        BUSINESS_NAME_NOT_FOUND: '사업자명을 입력 해주세요',
        CEO_NAME_NOT_FOUND: '대표자명을 입력 해주세요.',
        BUSINESS_NUMBER_NOT_FOUND: '사업자등록번호를 입력 해주세요.',
        BUSINESS_NUMBER_NOT_VALID: '사업자등록번호 10자리를 입력 해주세요.',
        CHECK_BUSINESS_NUMBER_DUPLICATION: '사업자등록번호 중복확인을 해주세요.',
        BUSINESS_TEL_NOT_FOUND: '대표전화번호를 입력 해주세요.',
        BUSINESS_TEL_NOT_NUMBER: '대표전화번호는 숫자만 입력 해주세요.',
        CORPORATE_NUMBER_NOT_FOUND: '법인등록번호를 입력 해주세요.',
        CORPORATE_NUMBER_NOT_NUMBER: '법인등록번호는 숫자만 입력 해주세요.',
        CORPORATE_NUMBER_NOT_VALID: '법인등록번호 13자리를 입력 해주세요.',
        CHECK_CORPORATE_NUMBER_DUPLICATION: '법인등록번호 중복확인을 해주세요.'
    },
    hideTawkTo: function() {
        if (!Tawk_API || !Tawk_API.hasOwnProperty('hideWidget') || typeof Tawk_API.hideWidget !== 'function') {
            return;
        }
        Tawk_API.hideWidget();
    },
    showTawkTo: function() {
        if (!Tawk_API || !Tawk_API.hasOwnProperty('showWidget') || typeof Tawk_API.showWidget !== 'function') {
            return;
        }
        Tawk_API.showWidget();
    }
};

/**
 * 컨텐츠 목록 더보기의 다이나믹 로딩을 지원한다.
 * 현재 프로젝트 목록의 프로젝트 카드 로드에만 사용
 * 로딩 표시 및 이중 로딩 방지를 위한 잠금을 수동으로 해야한다는 단점이 있다.
 * @type {DynamicPageHelper}
 */
UI.DynamicPageHelper = (function() {
    var DynamicPageHelper = function() {
        this.isAppendedScrollHanlder = false;   // 스크롤 핸들러 이중 등록 방지
        this.prevPageLoader = null;             // 이전 페이지 로드 콜백
        this.nextPageLoader = null;             // 다음 페이지 로드 콜백
        this.isLockedLoader = false;            // 페이지 로딩 잠금 플래그
        // 로딩 이미지 템플릿
        this.loadingTemplate =
            '<div class="ui-dynamic-loading-progress" style="text-align: center; padding: 0 20px; margin: 40px;">' +
            '<img src="/omc/asset/images/loading.gif"/>' +
            '</div>';
        // 로딩 화면 템플릿
        var paddingTop = window.innerHeight / 5 * 2;
        this.initLoadingTemplate =
            '<div class="ui-dynamic-loading-progress init-loading" ' +
            'style="position: fixed; width: 100%; height: 3000px; top: 0; left: 0; text-align: center;' +
            ' background-color: #f7f7f7; z-index: 999; padding-top: ' + paddingTop + 'px;">' +
            '<img src="/omc/asset/images/loading.gif">' +
            '</div>';
    };

    /**
     * 다이나믹 로딩을 활성화한다.
     * @param initPage {number} 최초 로딩 페이지, 이 값을 기반으로 앞뒤 로드해야할 페이지를 판단한다.
     * @desc
     *  Usage 1) initPage를 1로 하고 nextPageLoader를 설정해서 기본적인 더보기를 사용할 수 있다.
     *  Usage 2) initPage를 hash fragment에 있는 페이지 값을 넘겨주고 prevPageLoader, nextPageLoader를 설정해서
 *              마지막으로 로드했던 페이지를 저장, 상하단 목록을 동적으로 로드하는 다이나믹 로딩을 사용할 수 있다.
     */
    DynamicPageHelper.prototype.on = function(initPage) {
        var _self = this;

        _self.resetInitPage(initPage);

        if (!_self.isAppendedScrollHanlder) {

            var lastScrollTop = 0;

            $(window).scroll(function() {
                var scrollTop = $(this).scrollTop();
                var direction;

                // 스크롤 방향 탐지
                if (scrollTop > lastScrollTop) {
                    direction = 'down';
                } else {
                    direction = 'up';
                }

                lastScrollTop = scrollTop;

                // 로딩 잠금 상태면 스킵
                if (_self.isLockedLoader) {
                    return;
                }

                var preloadHeight = screen.height,  // 사전 로드, 이 크기(px)만큼 화면 상하단 끝에 도착하기 전에 로드한다.
                    scrollTop = $(document).scrollTop(),
                    pageHeight = $(document).height(),
                    topThreshold = scrollTop - preloadHeight,
                    bottomThreshold = scrollTop + $(window).height() + preloadHeight;

                if (direction === 'up' && typeof _self.prevPageLoader === 'function'
                    && topThreshold <= 0) {
                    // 페이지 스크롤이 최상단에 도달
                    _self.prevPageLoader();
                }

                if (direction === 'down' && typeof _self.nextPageLoader === 'function'
                    && bottomThreshold >= pageHeight) {
                    // 페이지 스크롤이 최하단에 도달, 로드할 페이지가 남아있다.
                    _self.nextPageLoader();
                }
            });

            _self.isAppendedScrollHanlder = true;
        }
    };

    /**
     * 이전 페이지 로더를 설정한다.
     * @param loader 이전 페이지 로드에 사용할 콜백
     */
    DynamicPageHelper.prototype.setPrevPageLoader = function(loader) {
        if (loader && typeof loader === 'function') {
            this.prevPageLoader = loader;
        }
    };


    /**
     * 다음 페이지 로더를 설정한다.
     * @param loader 다음 페이지 로드에 사용할 콜백
     */
    DynamicPageHelper.prototype.setNextPageLoader = function(loader) {
        if (loader && typeof loader === 'function') {
            this.nextPageLoader = loader;
        }
    };

    /**
     * 페이지 로딩을 잠금, 이중 로딩 방지
     */
    DynamicPageHelper.prototype.lockLoad = function() {
        this.isLockedLoader = true;
    };

    /**
     * 페이지 로딩을 잠금을 해제
     */
    DynamicPageHelper.prototype.unlockLoad = function() {
        this.isLockedLoader = false;
    };

    /**
     * 다음 로드해야할 이전 페이지 번호를 조회
     * @return {number} 이전 페이지 번호
     */
    DynamicPageHelper.prototype.getPrevPageNumber = function() {
        if (this.lastTopPage && typeof this.lastTopPage === 'number') {
            this.lastTopPage -= 1;
        } else {
            this.lastTopPage = 1;
        }
        return this.lastTopPage;
    };

    /**
     * 다음 로드해야할 페이지 번호를 조회
     * @return {number} 다음 페이지 번호
     */
    DynamicPageHelper.prototype.getNextPageNumber = function() {
        if (this.lastBottomPage && typeof this.lastBottomPage === 'number') {
            this.lastBottomPage += 1;
        } else {
            this.lastBottomPage = 1;
        }
        return this.lastBottomPage;
    };

    /**
     * 최초 페이지를 초기화
     * @param initPage {number} 최초 페이지
     */
    DynamicPageHelper.prototype.resetInitPage = function(initPage) {
        this.lastTopPage = initPage;
        this.lastBottomPage = initPage;
    };

    /**
     * 대상 엘리먼트에 로딩 이미지를 표시
     * @param $element {object} jQuery element, 로딩 이미지를 표시할 타겟
     * @param order {string} 로딩 이미지가 표시될 위치, 리스트의 상단 또는 하단 (default : 하단, prev : 상단)
     */
    DynamicPageHelper.prototype.showLoading = function($element, order) {
        if (!$element || $('.ui-dynamic-loading-progress').length) {
            return;
        }

        if (order && order === 'prev') {
            $element.prepend(this.loadingTemplate);
        } else {
            $element.append(this.loadingTemplate);
        }
    };

    /**
     * 화면 전체를 덮는 로딩 화면 표시
     * @param $element {object} jQuery element
     */
    DynamicPageHelper.prototype.showInitLoading = function($element) {
        if (!$element || $('.ui-dynamic-loading-progress').length) {
            return;
        }
        $element.append(this.initLoadingTemplate);
    };

    /**
     * 모든 로딩 화면이나 로딩 이미지를 제거
     */
    DynamicPageHelper.prototype.hideLoading = function() {
        $('.ui-dynamic-loading-progress').remove();
    };

    return new DynamicPageHelper();
})();