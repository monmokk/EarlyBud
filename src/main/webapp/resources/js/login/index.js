$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  var $this = $(this),
      label = $this.prev('label');
	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight');
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }
});

var pick = document.getElementById('forgot');
var mymodal = document.getElementById('myModal');
pick.onclick = function(){
	  mymodal.style.display = "block";
}
window.onclick = function(event) {
    if (event.target == mymodal) {
  	  myproject.option_type.value = "가격: "+ type_code.value + " 옵션이름: " + type_name.value + " 옵션설명: " + info.value; 
        mymodal.style.display = "none";
    }
}

$('.tab a').on('click', function (e) {
  e.preventDefault();
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  target = $(this).attr('href');
  $('.tab-content > div').not(target).hide();
  $(target).fadeIn(600);
});

$(document).ready(function(){
	$(".joinNick").blur(function(){
		var inputed=$('.joinNick').val();
		$.ajax({
			url : "login_check",
			dataType: 'json',
			data:{
			nickname : inputed
		},
		success:function(data){
			console.log(data);
			if(data == 0){
				$('.denied').css('display', 'none');
				}
			else
				$('.denied').css('display', 'block');
			}
		});
	});
	$(".joinEmail").click(function(){
	$(".joinEmail").blur(function(){
		var inputed=$('.joinEmail').val();
		$.ajax({
			url : "login_check",
			dataType: 'json',
			data:{
			email : inputed
		},
		success:function(data){
			console.log(data);
			if(data == 0){
				$('.deniedE').css('display', 'none');
				}
			else
				$('.deniedE').css('display', 'block');
			}
		  });
	  });
	});
});