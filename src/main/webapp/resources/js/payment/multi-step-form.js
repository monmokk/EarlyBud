$("#pwd").click(function(){
$("#pwd").blur(function(){
    var str = formOrder.pwd.value;
    var nick = formOrder.nickname.value;
    console.log(str);
    var request = $.ajax({
        url:"/earlybud/payment/pwdCheck",
        method:"post",
        data:{pwd:str, nickname:nick},
        dataType:"html"});
       request.done(function(data){
          console.log("data: "+data);
          console.log("typeof data: "+ typeof(data));
          if(data){
               $('#pwd_ok').css('color','blue');
               $("#pwd_ok").html("비밀번호 확인");
              $('button').removeClass("disabled");
              $('button').addClass("btn-success");

          }else{
             $('#pwd_ok').css('color','red');
               $("#pwd_ok").html("잘못된 비밀번호");
              $('button').removeClass("btn-success");
              $('button').addClass("disabled");

          }
      });
});
});

$('[data-form-step]').on('click', function () {
  var tabId = $(this).attr('data-form-step');
  $('[href="' + tabId + '"]').tab('show');
});

$('#submit_btn').on('click', function(e) {
   //console.log( $('#formOrder').serializeArray());
   var info = $('.callout-info').text();
    var serializeArray = $('#formOrder').serializeArray();
    $('.nav-tabs-progress').find('.nav-item').last().addClass('complete');
    console.log("before ajax");
    $.ajax({
        method: 'post',
        url: '/earlybud/payment/reserve_payment',
        data: serializeArray,
        success: function(data){
            console.log(data);
            if(data){
               //alert(data);
               $("#contentBody").html(data);
               $('#fail_modal').modal({backdrop: 'static', keyboard: false});
            }else{
               console.log("결제예약완료");
               console.log("mailto: "+formOrder.email.value);
               console.log("nickname:"+formOrder.nickname.value);
               console.log("info: "+info);
               $.ajax({
                  type:'post',
                    url: '/earlybud/send_mail',
                    dataType: "json",
                    contentType: "application/json",
                    data: JSON.stringify({
                       "mailto": formOrder.email.value,
                       "mailsubject": "얼리버드 상품 결제예약이 완료되었습니다.",
                       "mailcontent": "주문하신 상품 "+ info +" 자정에 예약결제됩니다. 예약 내역은 마이페이지에서 확인가능합니다."
                       }),
                    success: function(){
                        console.log("확인 메일&메세지 보냄");
                        //$('#reserve_modal').modal({backdrop: 'static', keyboard: false});

                    }
                });
               $('#reserve_modal').modal({backdrop: 'static', keyboard: false});
            }
        }
    });
  e.preventDefault();//기본이벤트 제거
});
$('#fail').on('click',function(){
   location.href="../input/"+formOrder.type_code.value;
});
$('#done').on('click',function(){
   location.href="/earlybud/reward?item_code="+formOrder.item_code.value;
});
var payment = {}
$(document).ready(function(){
    $('#confirm_btn').click(function(){
        payment.nickname = formOrder.nickname.value;
        payment.email = formOrder.email.value;
        payment.pwd = formOrder.pwd.value;
        payment.del_name = formOrder.del_name.value;
        payment.del_phone = formOrder.del_phone.value;
        payment.zip_code = formOrder.zip_code.value;
        payment.addr1 = formOrder.addr1.value;
        payment.addr2 = formOrder.addr2.value;
        payment.cardnum = formOrder.cardnum.value;
        payment.card_owner = formOrder.card_owner.value;
        payment.birthdate = formOrder.birthdate.value;
        payment.pur_type= formOrder.pur_type.value;
        payment.exp_month = formOrder.exp_month.value;
        payment.exp_year = formOrder.exp_year.value;
        payment.cardpwd = formOrder.cardpwd.value;

        $('#confirm_nickname').html(payment.nickname);
        $('#confirm_email').html(payment.email);
        $('#confirm_name').html(payment.del_name);
        $('#confirm_phone').html(payment.del_phone);
        $('#confirm_zipcode').html(payment.zip_code);
        $('#confirm_addr1').html(payment.addr1);
        $('#confirm_addr2').html(payment.addr2);
        $('#confirm_cardowner').html(payment.card_owner);
        $('#confirm_cardnum').html(payment.cardnum);
        $('#confirm_birthdate').html(payment.birthdate);
        $('#confirm_expiry').html(payment.exp_year+"-"+payment.exp_month);
    });
});