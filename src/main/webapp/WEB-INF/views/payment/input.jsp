<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*,com.earlybud.model.Type,com.earlybud.model.Item"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Payment</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Create forms comprising or involving several steps or stages." />
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- style CSS for ITEM LIST //
      ============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payment/admin4b.min.css">
  </head>
  <body class="app sidebar-mini rtl">

<title>Earlybud · Multi step form</title>
<!-- @@close -->
<!-- @@block = body -->
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item">결제정보 등록</li>
    <li class="breadcrumb-item active" aria-current="page">주문하기</li>
  </ol>
</nav>
<div class="container-fluid">

  <div class="callout callout-info">
    선택하신 상품 : <a href="#">${itemMap.get("TITLE")}</a> /
    타입 : ${itemMap.get("NAME")} /
    금액 : <fmt:formatNumber value='${itemMap.get("PRICE")}' type="number"/> 원 /
  <fmt:formatDate value='${itemMap.get("CLOSINGDATE-1")}' var="endPlanDate" pattern="yyyy-MM-dd"/>
    펀딩 마감일 : ${endPlanDate}
  </div>
  <div class="nav-tabs-responsive">
    <ul class="nav nav-tabs-progress nav-tabs-4 mb-4">
      <li class="nav-item">
        <a href="#account" class="nav-link active" data-toggle="tab">
          <span class="font-lg">1.</span> 회원정보
          <small class="d-block text-secondary">
            얼리버드 회원 확인
          </small>
        </a>
      </li>
      <li class="nav-item">
        <a href="#personal" class="nav-link" data-toggle="tab">
          <span class="font-lg">2.</span> 배송지정보
          <small class="d-block text-secondary">
            받는사람 주소지
          </small>
        </a>
      </li>
      <li class="nav-item">
        <a href="#payment" class="nav-link" data-toggle="tab">
          <span class="font-lg">3.</span> 결제정보
          <small class="d-block text-secondary">
            카카오페이 or 카드결제
          </small>
        </a>
      </li>
      <li class="nav-item">
        <a href="#confirmation" class="nav-link" data-toggle="tab">
          <span class="font-lg">4.</span> 확인
          <small class="d-block text-secondary">
            Confirm your detail
          </small>
        </a>
      </li>
    </ul>
    <form id="formOrder" class="tab-content">
      <div id="account" class="tab-pane show active">
        <div class="mb-3">
          <a href="#account-collapse" data-toggle="collapse">
            <span class="font-lg">1.</span> 회원정보
            <small class="d-block text-secondary">
              Lorem ipsum dolor sit amet, venenatis adipiscing
            </small>
          </a>
        </div>
        <input type="hidden" class="form-control" id="amount" name="amount" value='${itemMap.get("PRICE")}'>
        <input type="hidden" class="form-control" id="schedule_at" name="schedule_at" value="${endPlanDate}">
        <input type="hidden" class="form-control" id="type_code" name="type_code" value="${type_code}">
        <input type="hidden" class="form-control" id="item_code" name="item_code" value='${itemMap.get("ITEM_CODE")}'>
        <div id="account-collapse" class="collapse show" data-parent="#formOrder">
          <div class="text-secondary mb-3">
            <small>Step 1 of 4</small>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 col-lg-6">
              <div class="form-group">
                <label>Nick name</label>
                <input type="text" class="form-control whiteinput" id="nickname" name="nickname" value='<sec:authentication property="principal.member.nickname"/>' readonly>
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-6">
              <div class="form-group">
                <label>E-mail</label>
                <input type="text" class="form-control whiteinput" id="email" name="email" value='<sec:authentication property="principal.username"/>' readonly>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 col-lg-6">
              <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" id="pwd" name="pwd">
              </div>
            </div>
            <div class="col-12 col-md-6 col-lg-6">
                <br/>
              <span id="pwd_ok"></span>
            </div>
          </div>
          <div class="d-none d-md-block">
            <hr>
            <div class="d-flex mb-3">
              <button type="button" class="btn ml-auto" data-form-step="#personal">
                회원정보 확인 &nbsp;
                <i class="icon-arrow-right font-sm"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div id="personal" class="tab-pane">
        <div class="mb-3">
          <a href="#personal-collapse" data-toggle="collapse">
            <span class="font-lg">2.</span> 배송지 정보
            <small class="d-block text-secondary">
              받는사람 주소지
            </small>
          </a>
        </div>
        <div id="personal-collapse" class="collapse" data-parent="#formOrder">
          <div class="text-secondary mb-3">
            <small>Step 2 of 4</small>
          </div>
          <div class="row">
            <div class="col-12 col-lg-6">
              <div class="form-group">
                <label>받는사람 이름</label>
                <input type="text" class="form-control" id="del_name" name="del_name">
              </div>
            </div>
            <div class="col-12 col-lg-6">
             <div class="form-group">
                <label>폰번호</label>
                <input type="text" class="form-control" id="del_phone" name="del_phone" maxlength="11">
             </div>
            </div>
          </div>

          <div class="row">
            <div class="col-12 col-lg-6">
              <div class="row">
                <div class="col-12 col-md-6 col-lg-6">
                  <div class="form-group">
                    <label>우편번호</label>
                    <input type="text" class="form-control" id="zip_code" name="zip_code" onClick="goPopup()">
                  </div>
                </div>
                <div class="col-12 col-md-6 col-lg-6">
                  <div class="form-group">
                    <label>도로명주소</label>
                    <input type="text" class="form-control whiteinput" id="addr1" name="addr1" readonly>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-lg-6">
              <div class="form-group">
                <label>상세주소</label>
                <input type="text" class="form-control whiteinput" id="addr2" name="addr2" readonly>
              </div>
            </div>
          </div>
          <div class="d-none d-md-block">
            <hr>
            <div class="d-flex mb-3">
              <button type="button" class="btn btn-outline-success" data-form-step="#account">
                <i class="icon-arrow-left font-sm"></i>
                &nbsp; 회원정보확인
              </button>
              <button type="button" class="btn btn-success ml-auto" data-form-step="#payment">
                결제정보 &nbsp;
                <i class="icon-arrow-right font-sm"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div id="payment" class="tab-pane">
        <div class="mb-3">
          <a href="#payment-collapse" data-toggle="collapse">
            <span class="font-lg">3.</span> 결제정보
            <small class="d-block text-secondary">
              Lorem ipsum dolor sit amet, venenatis adipiscing
            </small>
          </a>
        </div>
        <div id="payment-collapse" class="collapse" data-parent="#formOrder">
          <div class="text-secondary mb-3">
            <small>Step 3 of 4</small>
          </div>
          <div class="row">
            <div class="col-12 col-md-8 col-lg-7">
              <div class="form-group">
                <label>카드번호</label>
                <input type="text" class="form-control" id="cardnum" name="cardnum" data-inputmask="'mask': '9999-9999-9999-9999'">
              </div>
            </div>
            <div class="col-12 col-md-4 col-lg-5">
              <div class="form-group">
                <label>카드소지자 이름</label>
                <input type="text" class="form-control" id="card_owner" name="card_owner">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-lg-7">
              <div class="form-group">
                <label>생년월일 6자리</label>
                <input type="text" class="form-control" id="birthdate" name="birthdate" placeholder="ex ) 190213" maxlength="6">
              </div>
            </div>
            <div class="col-12 col-lg-5">
              <div class="row">
                <div class="col-12 col-md-4 col-lg-6">
                  <div class="form-group">
                    <label>카드 유효기간 월 Month</label>
                    <input type="text" class="form-control" id="exp_month" name="exp_month" placeholder="ex ) 07" maxlength="2">
                  </div>
                </div>
                <div class="col-12 col-md-4 col-lg-6">
                  <div class="form-group">
                    <label>카드 유효기간 년 Year</label>
                    <input type="text" class="form-control" id="exp_year" placeholder="ex ) 2019" name="exp_year" maxlength="4">
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-12 col-md-8 col-lg-7">
              <div class="form-group">
                <label>카드비밀번호 앞 두자리</label>
                <input type="password" class="form-control" id="cardpwd" name="cardpwd" maxlength="2">
              </div>
            </div>
            <div class="col-12 col-md-4 col-lg-5">
                  <div class="form-group">
                    <label>Payment Type</label>
                    <select class="form-control" id="pur_type" name="pur_type">
                        <option value="" disabled selected></option>
                        <option value="nice">나이스페이먼츠</option>
                        <option value="inisis">이니시스</option>
                        <option value="payco">페이코</option>
                    </select>
                  </div>
            </div>
          </div>

          <div class="d-none d-md-block">
            <hr>
            <div class="d-flex mb-3">
              <button type="button" class="btn btn-outline-success" data-form-step="#personal">
                <i class="icon-arrow-left font-sm"></i>
                &nbsp; 배송지정보
              </button>
              <button type="button" id="confirm_btn" class="btn btn-success ml-auto" data-form-step="#confirmation">
                확인 &nbsp;
                <i class="icon-arrow-right font-sm"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div id="confirmation" class="tab-pane">
        <div class="mb-3">
          <a href="#confirmation-collapse" data-toggle="collapse">
            <span class="font-lg">4.</span> Confirm your details
            <small class="d-block text-secondary">
              Lorem ipsum dolor sit amet, venenatis adipiscing
            </small>
          </a>
        </div>
        <div id="confirmation-collapse" class="collapse" data-parent="#formOrder">
          <div class="text-secondary mb-3">
            <small>Step 4 of 4</small>
          </div>
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">닉네임</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_nickname" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">Email ID</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_email" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">받는 사람</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_name" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">폰번호</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_phone" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">우편번호</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_zipcode" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">도로명주소</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_addr1" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">상세주소</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_addr2" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">Card number</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_cardnum" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">카드 소지자</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_cardowner" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">생년월일 6자리</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_birthdate" class="mb-2"></div>
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-3 col-lg-2">
                  <label class="text-secondary">Card Expiry</label>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                  <div id="confirm_expiry" class="mb-2"></div>
                </div>
              </div>
            </div>
          </div>
          <hr>
          <div class="d-block d-md-flex">
            <button type="button" class="btn btn-outline-success d-none d-md-inline mb-3" data-form-step="#payment">
              <i class="icon-arrow-left font-sm"></i>
              &nbsp; 결제정보
            </button>
            <div class="d-block d-md-inline ml-auto mb-3">
              <button id="submit_btn" type="submit" class="btn btn-success btn-block">
                주문하기
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- 성공모달 -->
<div class="modal" tabindex="-1" id="reserve_modal" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">상품구매완료</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>상품 결제가 예약되었습니다 </p>
        <p>구매내역은 마이페이지에서 확인가능합니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="done" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- 실패모달 -->
<div class="modal" tabindex="-1" id="fail_modal" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">입력정보오류</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" >
        <p>결제예약 오류 : 재시도 해주세요.</p>
        <p id="contentBody"></p>
      </div>
      <div class="modal-footer">
        <button type="button" id="fail" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- @@close -->
<!-- Essential javascripts for application to work-->
    <script src="${pageContext.request.contextPath}/js/admin/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin/bootstrap.min.js"></script>
    <!-- Page specific javascripts-->
    <script src="${pageContext.request.contextPath}/js/payment/admin4b.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/payment/multi-step-form.js"></script>
    <script type="text/javascript" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>
    <script>
    $(":input").inputmask();

    function goPopup(){
         // 주소검색을 수행할 팝업 페이지를 호출합니다.
         // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
         var pop = window.open("../jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");

         // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
         //var pop = window.open("/payment/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
      }
      function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
       formOrder.zip_code.value = zipNo;//우편번호
       formOrder.addr1.value = roadAddrPart1;//도로명주소
       formOrder.addr2.value = addrDetail; //상세주소
      }
    </script>
  </body>
</html>
