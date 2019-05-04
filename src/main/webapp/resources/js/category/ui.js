(function($){
    jQuery(document).ready(function(){
        function initialize(){
            gnb();
            myaccount();
            search();
            placeholder();
            accordion();
            tab();
            tablist();
            colseTab();
            rewardOrder();
            arcodian();
            fileInput();
            checkedFnc();
            imgReplace();
            openSnsLayer();
            statusByRegion();
            contantUs();
            omcSlider();
            list_accordion();
            sticky();
            toolTip();
            audioPlay();
            btnTop();
            imgProfile();
        };
        // bx slider
        function omcSlider(){
            $(".slider").bxSlider({
                mode: 'fade',
                captions: false,
                pager:($(".slider > li").length > 1) ? true: false,
                controls:($(".slider > li").length > 1) ? true: false
            });
            $(".visual_slider").filter(':not(.do_not_use_bxSlider)').bxSlider({
                mode: 'horizontal',
                controls:false,
                auto: true,
                autoControls:true,
                captions: false
            });
            if ($(".list_bnr").children("li").length > 1) {
                $(".list_bnr").bxSlider({
                    mode: 'horizontal',
                    controls:false,
                    auto: true,
                    autoControls:true,
                    captions: false
                });
            }
            $(".list_notice").bxSlider({
                mode: 'vertical',
                auto: true,
                autoDelay:0.1,
                pager:false,
                slideMargin: 5,
                touchEnabled:false
            });

        };
        // sticky
        function sticky() {
            var head = $("#omcHead"),
                win = $(window),
                btn = $(".project_details .link_join"),
                bar = $(".sticky_bar");

            if (!bar.length) {
                return false;
            }
            var tabHeight = bar.offset().top - 180;

            win.on("scroll",function(){
                if (win.scrollTop() > 1) {

                    head.addClass("fixed");
                    btn.addClass("fixed");

                    if(tabHeight <= win.scrollTop()) {
                        bar.addClass("fixed");
                    }else {
                        bar.removeClass("fixed");
                    };

                }else {
                    head.removeClass("fixed");
                    btn.removeClass("fixed");
                }
            });
        }
        // mobile gnb
        function gnb(){
            var body = $("body");
            var gnbBtn = $(".btn_menu");
            var gnbContestList = $('.list_gnb_contest');
            var gnbTagList = $('#gnb_tag_list');

            var getContestHtml = function(contest) {
                var link;

                switch (contest.contestType) {
                    case 'E':
                    case 'P':
                    	link = '/partnership/' + contest.contestSeq + '/reward';
                    	// #552 파트너십+전용관 대회의 후원형 프로젝트 수가 없다면 증권형으로 이동 
                    	if(contest.rewardProjectCount <= 0){
                    		link = '/partnership/' + contest.contestSeq + '/invest';
                    	}                    	
                        break;
                    case 'S':
                        link = '/partnership/' + contest.contestSeq + '/mock';
                        break;
                    default:
                        link = '#';
                }

                var html = [
                    '<li><a href="' + link + '" class="link_menu">',
                    contest.contestName,
                    '</a></li>'
                ].join('');
                return html;
            };

            var getTagHtml = function(tag) {
                var html = [
                    '<a href="#none" class="link_tag">#',
                    tag.tagName,
                    '</a>'
                ].join('');
                return html;
            };

            gnbBtn.on("click",function() {
                if(body.hasClass("gnb_on")) {
                    body.removeClass("gnb_on");
                }else {
                    $.ajax({
                        url: '/main/gnbDataAjax',
                        success: function(res) {
                            // 대회 처리
                            gnbContestList.find('li:not(:first)').remove();
                            if (Array.isArray(res.mainContestList) && res.mainContestList.length) {
                                res.mainContestList.forEach(function(contest) {
                                    gnbContestList.append(getContestHtml(contest));
                                });
                                gnbContestList.show();
                            } else {
                                gnbContestList.hide();
                            }
                            
                            // 태그 처리
                            gnbTagList.find('a').remove();
                            if (Array.isArray(res.tagList) && res.tagList.length) {
                                res.tagList.forEach(function(tag) {
                                    gnbTagList.append(getTagHtml(tag));
                                });
                                gnbTagList.show();
                                $('#gnb_tag_list').find('.link_tag').on('click', function(event){
                                    event.preventDefault();
                                    var tag = $(this).text().trim().replace('#','');
                                    var $form = $('<form></form>');
                                    $form.attr('action', '/main/search');
                                    $form.appendTo('body');
                                    var keyword = $('<input type="hidden" value='+ tag +' name="searchKeyword">');
                                    $form.append(keyword);
                                    $form.submit();
                                });
                            } else {
                                gnbTagList.hide();
                            }

                            gnbTagList.find('.link_tag').on('click', function(event){
                                event.preventDefault();
                                var form = document.tagForm;
                                form.searchKeyword.value= $(this).text().replace('#', '');
                                form.action = '/main/search';
                                form.submit();
                            });
                        },
                        complete: function() {
                            body.addClass("gnb_on");
                        }
                    });
                }
            });
        }
        // mobile myaccount bar
        function myaccount(){
            var vw = $(window).width();
            var body = $("body");
            var myBtn = $(".btn_mypage");
            var closeBtn = $(".my_account .btn_close");

            var vh = $(window).height();
            var scrollpanel = $('.wrap_scroll');
            var PanelHeight = vh - 208;


            myBtn.on("click",function() {
                body.addClass("myaccount_on");
                scrollpanel.css('height',PanelHeight);
                if(body.hasClass("gnb_on")) {
                    body.removeClass("gnb_on");
                }
            });
            closeBtn.on("click",function() {
                body.removeClass("myaccount_on");
            });
        };
        // search
        function search(){
            var searchWrap = $(".search_g");
            // var btnSearch = $(".btn_search");
            var btnClose = $(".btn_close");

            // btnSearch.on("click",function() {
            //     searchWrap.addClass("on");
            // });
            btnClose.on("click",function() {
                searchWrap.removeClass("on");
            });
        }
        // accordion
        function accordion(){
            var acc = $(".btn_accordion");
            var panel = $(".panel");
            acc.click(function(){
                if($(this).parent().hasClass("active")) {
                    $(this).parent().removeClass("active");
                }else{
                    panel.removeClass("active");
                    $(this).parent().addClass("active");
                }
            })
        };

        // tab
        function tab(){

            var tabOn = $(".list_cate .on a, .menu_list .on a"),
                btnSelect = $(".btn_select"),
                tabOnName = tabOn.text();
            btnSelect.html(tabOnName);

            function tabmenu(){
                var ww = $(window).width(),
                    tab = $(".list_cate, .menu_list"),
                    tabMenuItem = $(".list_cate li, .menu_list li"),
                    tabMenu = $(".list_cate .link_cate, .menu_list li a, .list_cate a"),
                    tabFstMenu = $(".list_cate li:first-child .link_cate, .menu_list li:first-child a");

                if(tab.parents().hasClass("section_part")){
                    //console.log('dddd')
                    if(ww < 1024 || isMobile.any){
                        btnSelect.on("click",function() {

                            tab.toggleClass("open");
                            event.stopPropagation();

                        });
                        tabMenu.on("click",function() {
                            var tabName = $(this).text();
                            btnSelect.html(tabName);
                            tabMenuItem.removeClass("on");
                            $(this).parent(tabMenuItem).addClass("on");
                            tab.removeClass("open");
                        });
                    }else{

                        tabMenu.on("click",function() {
                            tabMenuItem.removeClass("on");
                            $(this).parent(tabMenuItem).addClass("on");
                        });

                    }
                }else if(tab.parents().hasClass("select_cate")){

                    //console.log('dddd')
                    if(ww < 768 || isMobile.any){
                        btnSelect.on("click",function() {

                            tab.toggleClass("open");
                            event.stopPropagation();

                        });
                        tabMenu.on("click",function() {
                            var tabName = $(this).text();
                            btnSelect.html(tabName);
                            tabMenuItem.removeClass("on");
                            $(this).parent(tabMenuItem).addClass("on");
                            tab.removeClass("open");
                        });
                    }else{

                        tabMenu.on("click",function() {
                            tabMenuItem.removeClass("on");
                            $(this).parent(tabMenuItem).addClass("on");
                        });

                    }
                } else {
                    //console.log(ww);
                    if(ww < 640 || isMobile.any){
                        btnSelect.on("click",function() {

                            tab.toggleClass("open");
                            event.stopPropagation();

                        });
                        tabMenu.on("click",function() {
                            var tabName = $(this).text();
                            btnSelect.html(tabName);
                            tabMenuItem.removeClass("on");
                            $(this).parent(tabMenuItem).addClass("on");
                            tab.removeClass("open");
                        });
                    }else{

                        tabMenu.on("click",function() {
                            tabMenuItem.removeClass("on");
                            $(this).parent(tabMenuItem).addClass("on");
                        });

                    }
                }
            }

            $(window).on({
                load : function() {
                    tabmenu();
                }
            });
        }
        function tablist(){
            var ww = $(window).width();
            btnTabList = $(".btn_tablist"),
                TabList = $(".list_tablist"),
                TabListItem = $(".list_tablist li"),
                TabListLink = $(".list_tablist .link_tablist"),
                TabListFstMenu = $(".box_tablist .list_tablist li:first-child .link_tablist");

            //console.log("ccc");
            btnTabList.on("click",function() {
                if(TabList.hasClass("open")) {
                    TabList.removeClass("open");

                }else{
                    //console.log('1133311');
                    TabList.addClass("open");
                    TabListFstMenu.focus();
                }
            });
            TabListLink.on("click",function() {
                var tabName = $(this).text();
                btnTabList.html(tabName);

                TabList.removeClass("open");
            });

        }
        function colseTab(){
            $(document).on({
                click: function(e) {
                    if ($(e.target).closest("div").hasClass("box_category") == false) {

                        //console.log('1111');
                        $(".list_cate").removeClass("open");
                    }
                    if ($(e.target).closest("div").hasClass("box_tablist") == false) {

                        //console.log('1111');
                        $(".list_tablist").removeClass("open");
                    }
                    if ($(e.target).closest("div").hasClass("sns_area") == false) {

                        //console.log('1111');
                        $(".box_links").removeClass("on");
                    }
                    if ($(e.target).closest("div").hasClass("select_cate") == false) {

                        //console.log('1111');
                        $(".menu_list").removeClass("open");
                    }
                }
            });
        }
        // rewardOrder
        function rewardOrder(){

            var chkBalance = $(".data_balance #chkUse");
            var balanceBar = $(".use_balance");

            chkBalance.on("click",function(){
                if(balanceBar.hasClass("on")){
                    balanceBar.removeClass("on");
                }else{
                    balanceBar.addClass("on");
                }

            });
        }
        //arcodian
        function arcodian(){
            var $list1 = $(".arco_list"),$list2 = $(".arcodian_cont");
            $list1.find(".arco_menu a").on('click',function(e){
                var $this = $(this);
                e.preventDefault();
                if($this.parents(".arco_list").hasClass('on')){
                    $this.attr('title','내용펼침')
                    $this.parents(".arco_list").removeClass('on')
                }else{
                    $this.attr('title','내용접기')
                    $this.parents(".arco_list").addClass('on')
                }
            })
            $list2.find(".arcodian_head a").on('click',function(e){
                var $this = $(this);
                e.preventDefault();
                if($this.parents(".arcodian_cont").hasClass('on')){
                    $this.attr('title','내용펼침')
                    $this.parents(".arcodian_cont").removeClass('on')
                }else{
                    $this.attr('title','내용접기')
                    $this.parents(".arcodian_cont").addClass('on')
                }
            })
        }
        //input file customizing
        function fileInput(){
            var $file = $("input[type='file']")
                ,	$fileBtn = $(".label_file_search");
            $file.hide();
            $fileBtn.click(function(e){
                var getId = $(this).attr('for');
                $("#" + getId).on('change',function(){
                    if(window.FileReader){
                        var filename = $(this)[0].files[0].name;
                    } else {
                        var filename = $(this).val().split('/').pop().split('\\').pop();
                    }
                    $(this).siblings('.upload_name').val(filename)
                })
            })
        }

        //투자자 유형에 따른 제출서류 안내 show hide
        function checkedFnc(){
            var $inputRadio = $(".select_detailed_type").find("input:radio");
            $inputRadio.on('click',function(){
                var idx = $(this).parents().index();
                $(this).parents(".fld_type1").find(".documents_submit_type").find('> dl').eq(idx).removeClass('hide').siblings().addClass("hide");

                //.eq(idx).removeClass("hide").siblings().addClass("hide");
            })
        }

        //sns layer
        function openSnsLayer(){

            var ww = $(window).width();
            btnOpen = $(".btn_sns_open"),
                snsLayer = $(".box_links");

            if(ww < 640 || isMobile.any){
                btnOpen.on("click",function() {
                    if(snsLayer.hasClass("on")) {
                        snsLayer.removeClass("on");

                    }else{
                        snsLayer.addClass("on");
                    }
                });
            }
        }

        //modal common function
        var ModalFnc = function(){
            this.el = '';
            this.parseEl = '';
            this.openBtn = '';
            this.firFocus = '';
            this.lastFocus = '';
            this.parseEl = '';
            this.scrollY = '';
            this.getAddClass = '';
            var that = this;
            $.get('/omc/html/layer/modal_bundle.jsp',function(data){
                that.parseEl = $(document.createElement('div')).html(data);
            })
            /**
             *
             * @param layer : 오픈할 Id (필수)
             * @param openedBtn : default "this" (필수)
             * @param addClass : .modal에 추가할 클래스 (선택)
             *
             * @example modal.open("layerPop",this);
             */
            this.open = function(layer,openedBtn,addClass){
                this.scrollY = window.pageYOffset || document.documentElement.scrollTop || window.scrollY;
                this.el =  "#" + layer;
                this.openBtn = openedBtn;
                this.getAddClass = addClass;
                $("body").append($(this.el,this.parseEl).clone().addClass(addClass)).addClass('lock').css('top',- this.scrollY + 'px');
                this.firFocus = $(this.el).find(".modal_fir_focus");
                this.lastFocus = $(this.el).find(".modal_last_focus");
                this.firFocus.focus();
                this.close();
                this.loop();
                placeholder();
            };
            this.close = function(){
                var that = this;
                $(this.el).find('.modal_btn_close, .modal_btn_confirm').click(function(){
                    $(that.el).removeClass(that.getAddClass).remove();
                    that.openBtn.focus();
                    $("body").removeClass("layer_open").removeClass('lock');
                    $(window).scrollTop(that.scrollY)
                })
            };
            this.loop = function(){
                var that = this;
                this.firFocus.on('keydown',function(e){
                    if (e.type == "keydown" && e.keyCode == 9 && e.shiftKey) {
                        that.lastFocus.focus();
                        return false;
                    }
                });
                this.lastFocus.on('keydown',function(e){
                    if (e.type == "keydown" && e.keyCode == 9 && e.shiftKey) {
                    }else if(e.keyCode == 9){
                        that.firFocus.focus();
                        return false;
                    }
                })
            }
        };
        function imgReplace(){
            var wW = $(window).width();
            var changedImg = $(".img_rwd");
            //var changedImgSrc = $(".img_rwd").attr('src');
            function responImg(wH){
                if(changedImg.length > 0){
                    changedImg.each(function(index){
                        var ImgSrc = $(this).attr('src');
                        if(wW <= 640){
                            var _replace = ImgSrc.replace('_pc','_m');
                            $(this).attr('src',_replace)
                        }else{
                            var _replace = ImgSrc.replace('_m','_pc');
                            $(this).attr('src',_replace)
                        }
                    });
                }
            }
            responImg(wW);
            $(window).resize(function(){
                wW = $(window).width();
                responImg(wW);
            })
        };
        function statusByRegion(){
            function active(_this){
                _this.addClass("active").siblings().removeClass('active')
            }
            $("#areaList").find('tr').attr('tabindex',0).css('cursor','pointer');
            $("#areaList").find('tr').on({
                "click":function(){
                    active($(this));
                },
                'keydown':function(e){
                    var key = e.keyCode ? e.keyCode : e.which;
                    if(key == 13){
                        active($(this));
                    }
                }
            });

            var getIdx = '';
            $(".m_only_tab li a").click(function(){
                var idx = $(this).parent().index();
                getIdx = idx;
                $(this).parent().addClass('on').siblings().removeClass("on");
                chkTab(idx);
            });

            function chkTab(i){
                if(i == 0){
                    $(".area_list").hide();
                    $(".area_map").show();
                }else{
                    $(".area_list").show();
                    $(".area_map").hide();
                }
            }

            $(window).resize(function(){
                wW = $(window).width();
                if(wW > 768){
                    $(".area_list").show();
                    $(".area_map").show();
                }else{
                    chkTab(getIdx)
                }
            })
        };

        function contantUs(){
            $(".related_questions li a").on({
                "click":function(){
                    var txt = $(this).find('.relation_txt').text();
                    $(this).parent().addClass('on').siblings().removeClass('on');
                    $("#inpTit").val('[' + txt + '] ').attr('value','[' + txt + '] ').focus();
                    $('html, body').animate({scrollTop : $("#inpTit").offset().top},300)
                }
            })
        }
        window.modal = new ModalFnc();

        initialize();

        function list_accordion(){
            $(".list_accor .tit_accor").on("click",function(){
                if($(this).parent().hasClass("down")){
                    //console.log("닫힌당~");
                    $(this).siblings('.cont_accor').stop().slideUp(300);
                    $(".list_accor>li").removeClass("down");
                }else{
                    //console.log("열린다~");
                    $(".list_accor>li.down").find('.cont_accor').stop().slideUp(300);
                    $(this).siblings('.cont_accor').stop().slideDown(300);
                    $(".list_accor>li").removeClass("down");
                    $(this).parent().addClass("down");
                }
            });
        }

        function toolTip(){
            $(".box_question .ico_question").click(function(){
                if($(this).siblings('.cont_q').hasClass("active")){
                    $(this).siblings('.cont_q').removeClass("active");
                }else{
                    $(this).siblings('.cont_q').addClass("active");
                }
            });
        }

        function btnTop(){
            $(".link_top").click(function(){
                $(".sticky_bar").removeClass("fixed");
            });
        }
    });
    /***********************************************
     * page load
     ************************************************/
    $(document).ready(function(){
        checkPlaceholder();
    });
})(jQuery);
function imgProfile(){
    //2018-01-28 png 프로필 이미지 대응 .
    $(".img_profile").each(function(){
        if($(this).find("img").attr("src") !=""){
            $(this).find("img").css('background','#FFF');
        }
    });
}
// placeholder
function placeholder(){
    var inputCont = $(".tf_cont");
    var txtPlaceholder = $(".placehoder");

    txtPlaceholder.click(function(){
        $(this).siblings(inputCont).focus();
    });
    inputCont.focusin(function(){
        //console.log($(this).siblings(".placehoder"));
        $(this).siblings(".placehoder").addClass("hide");
    });
    inputCont.focusout(function(){
        var value = $(this).val();
        if(value == false) {
            $(this).siblings(".placehoder").removeClass("hide");
        }
    });
};
function checkPlaceholder(){
    //console.log('들어오니3');
    var tfBox  = $('.tf_comm .tf_cont');
    var txtPlaceholder = $(".placehoder");
    //var userInputId = getCookie("userInputId");
    var agent = navigator.userAgent.toLowerCase();

    tfBox.each(function(){
        // if( userInputId.length != 0){
        // 	$('#memberId').siblings(".placehoder").addClass("hide")
        // }
        // if( $(this).val().length != 0){
        // 	if(!$(this).siblings(".placehoder").hasClass("hide")){
        // 		//console.log('들어오니4');
        // 		$(this).siblings(".placehoder").addClass("hide")
        // 	}
        // }
        if($(this).val().length != 0){
            if(!$(this).siblings(".placehoder").hasClass("hide")){
                //console.log('들어오니4');
                $(this).siblings(".placehoder").addClass("hide")
            }
        }
        // if ( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
        // 	if( $(this).val().length != 0){
        // 		if(!$(this).siblings(".placehoder").hasClass("hide")){
        // 			//console.log('들어오니4');
        // 			$(this).siblings(".placehoder").addClass("hide")
        // 		}
        // 	}
        // }else {
        // 	if( $(this).val().length != 0){
        // 		if(!$(this).siblings(".placehoder").hasClass("hide")){
        // 			//console.log('들어오니4');
        // 			$(this).siblings(".placehoder").addClass("hide")
        // 		}
        // 	}

        // 		if ($('.login_system .tf_cont:-webkit-autofill')) {
        // 			if(!$(this).siblings(".placehoder").hasClass("hide")){
        // 				//console.log('들어오니5');
        // 				$(this).siblings(".placehoder").addClass("hide")
        // 			}
        // 		}

        // }

    });
}
function audioPlay(){
    var boxAudio = $("#boxAudioCaptcha");
    var btnAudio = $('#repeatCaptchaAudio');

    var agent = navigator.userAgent.toLowerCase();

    btnAudio.on("click",function(){
        if ( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
            // ie일 경우
            var playSoundSrc = $('#captchaEmbed').attr("src");
            var parent = $('embed#captchaEmbed').parent();
            var newImage = "<embed id=\"captchaEmbed\" hidden=\"true\" autostart=\"true\" src=\"" + playSoundSrc + "\" type=\"audio/x-wav\"/>";
            var newElement = $(newImage);

            $('embed#captchaEmbed').remove();
            parent.append(newElement);
        }else{
            // ie가 아닐 경우
            var AudioCont = $('#captchaAudio');
            AudioCont.trigger("play");
        }

    });
}
function rewardHeight(){
    $(document).ready(function(){
        var rewardBar = $(".box_reward_select").height(),
            rewardWrap = $(".primary_cont");
        //console.log(rewardBar)
        rewardWrap.css("min-height",rewardBar + 80);
    });
}
function shortcutNav(){
    if (window.initShortcutNav && window.initShortcutNav === true) {
        return;
    }

    window.initShortcutNav = true;
    console.log('init shortcutNav');

    var idx=0;
    var shortcutMenu = {
        shortY : $(".shortcuts_nav").offset().top - 180
    };
    shortcutMenu.temp = shortcutMenu.shortY;
    var btnLength = $(".shortcuts_nav .shortcut_btn").length;

    window.pannelY = [];
    var panelY = window.pannelY;

    $("#prj_detail .pannel").each(function(){
        pannelY.push($(this).offset().top - 300);
    });

    window.addEventListener('scroll', function () {
        var scroll = $(window).scrollTop() + 300;
        var topMargin = 0;
        if (scroll >= shortcutMenu.shortY) {
            $(".shortcuts_nav").addClass('fixed');
            topMargin = 160;
        } else if (scroll < shortcutMenu.temp) {
            $(".shortcuts_nav").removeClass('fixed');
            topMargin = 0;
        }

        window.pannelY = [];
        $("#prj_detail .pannel").each(function(){
            window.pannelY.push($(this).offset().top - 160 + topMargin);
        });

        for (var i = 0; i < btnLength; i++) {
            if (pannelY[i + 1] > scroll) {
                // console.log(pannelY[i]+"/"+scroll);
                idx = i;
                $(".shortcuts_nav .shortcut_btn").eq(idx).addClass('active').siblings().removeClass('active');
                return idx;
            } else if (pannelY[btnLength - 1] <= scroll) {
                $(".shortcuts_nav .shortcut_btn").eq(btnLength - 1).addClass('active').siblings().removeClass('active');
            }
        }
    });
    $(".shortcuts_nav button").on('click',function(e){
        var idx = $(this).parent().index();
        var topMargin = 0;

        window.pannelY = [];
        $("#prj_detail .pannel").each(function(){
            window.pannelY.push($(this).offset().top - 160);
        });

        if (!$('.sticky_bar').hasClass('fixed') && window.pannelY[idx] >= 1030) {
            topMargin = 70;
        }

        $('html, body').animate({
            scrollTop: window.pannelY[idx] + 10 - topMargin
        }, 300);
        return idx;
    });
}