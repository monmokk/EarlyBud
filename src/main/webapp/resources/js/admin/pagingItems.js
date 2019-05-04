 $(document).ready(function() {
   $('table.sortable').each(function() {
     var $table = $(this);
     $('th', $table).each(function(column) {
       var $header = $(this);
       
	   var findSortKey;
       if ($header.is('.sort-basic')) {
         findSortKey = function($cell) {
           return $cell.text().toUpperCase();
         };
       }
       else if ($header.is('.sort-ranking')) {
         findSortKey = function($cell) {
           var key = $cell.text();
           key = parseFloat(key);
           return isNaN(key) ? 0 : key;
         };
       }     
           
       if (findSortKey) {
         $header.addClass('clickable').hover(function() {
           $header.addClass('hover');
         }, function() {
           $header.removeClass('hover');
         }).click(function() {
			 
			 var sortDirection = 1;
           if ($header.is('.sorted-asc')) {
             sortDirection = -1;
           }
			 
			 
           var rows = $table.find('tbody > tr').get();
           $.each(rows, function(index, row) {
             var $cell = $(row).children('td').eq(column);
             row.sortKey = findSortKey($cell);
           });
		   
           rows.sort(function(a, b) {
             if (a.sortKey < b.sortKey) return -sortDirection;
             if (a.sortKey > b.sortKey) return sortDirection;
             return 0;
           });
           $.each(rows, function(index, row) {
             $table.children('tbody').append(row);
             row.sortKey = null;
           });
		   
		   $table.find('th').removeClass('sorted-asc')
             .removeClass('sorted-desc');
           if (sortDirection == 1) {
             $header.addClass('sorted-asc');
           }
           else {
             $header.addClass('sorted-desc');
           }
           $table.alternateRowColors();
		   $table.trigger('repaginate');
		
         });
       }
     });
   });
 });


     $("#statu").on('change',function(){
         var category = $("#statu option:selected").val(); // 클릭된 대상의 값을 category 변수에 반환합니다.
         console.log("category value: "+category);
         $("#tbl tr").hide(); // 우선 row 들을 모두 숨깁
         if(category == "all"){
        	 console.log("category all");
        	 $("#tbl tr").show();
        	 }
         else{
        	 console.log("category change: "+ category);
        	 var selectC = $("#tbl button[class*="+category+"]").parent().parent();
        	 console.log(selectC);
        	 selectC.show();
        	 $table.trigger('repaginate');
        	 } // 분류에 해당하는 list를 나타냅 하단참조
     });


 $(document).ready(function() {
  $('table.paginated').each(function() {
    var currentPage = 0;
    var numPerPage = 10;
    var $table = $(this);
//
     $table.find('tbody tr').hide()
       .slice(currentPage * numPerPage,
         (currentPage + 1) * numPerPage)
       .show();

//   $table.bind('repaginate', function() {
 //     $table.find('tbody tr').hide()
 //       .slice(currentPage * numPerPage,
 //         (currentPage + 1) * numPerPage)
 //       .show();
//		
	$table.bind('repaginate', function() {
      $table.find('tbody tr').hide()
        .slice(currentPage * numPerPage,
          (currentPage + 1) * numPerPage)
        .show();
    });

	
    var numRows = $table.find('tbody tr').length;
    var numPages = Math.ceil(numRows / numPerPage);
    var numSections = Math.ceil(numPages/5);
    var nextSection;
    var curSection=0;
    var beforeSection;
    var endPage;
    var sectionNum=5;
    var $pager = $('<span class="pager"></span>');
    
    if((numSections-1) == curSection){
		endPage = numPages;
		console.log("endPage="+endPage);
		$('#next').attr('disabled', true);
		}else{
			endPage = sectionNum;
		}
    $('#previous').attr('disabled', true);
    
    for (var page = 0; page < endPage; page++) {
      $('<button class="page-number page-link"></button>').text(page + 1)
        .bind('click', {newPage: page}, function(event) {//클로저때문에 반복문에서 page 변수값을 못씀. newPage로
          currentPage = event.data['newPage'];
          $table.trigger('repaginate');
          console.log($(this));
          $(this).addClass('active')
            .siblings().removeClass('active');
          $('.mr-2').text("Showing "+ event.data['newPage'] +"1-"+ (event.data['newPage']+1) +"0 out of");
        }).appendTo($pager).addClass('clickable');
    }

    $pager.insertAfter('#previous')
      .find('button.page-number:first').addClass('active');
    
    $('#next').bind('click',function(event){
    	console.log("next click");
    	console.log("numSections="+numSections);
    	curSection += 1;
    	console.log("curSection="+curSection);
    	console.log("numPages="+numPages);
    	$('#previous').attr('disabled', false);
    	endPage = sectionNum*(curSection+1);
    	if((numSections-1) == curSection){
    		endPage = numPages;
    		console.log("endPage="+endPage);
    		$('#next').attr('disabled', true);
    		}
    	$('.page-number').remove();
    	for (var page =(curSection*sectionNum); page < endPage; page++) {
    	      $('<button class="page-number page-link"></button>').text(page + 1)
    	        .bind('click', {newPage: page}, function(event) {
    	          currentPage = event.data['newPage'];
    	          $table.trigger('repaginate');
    	          console.log($(this));
    	          $(this).addClass('active')
    	            .siblings().removeClass('active');
    	          $('.mr-2').text("Showing "+ event.data['newPage'] +"1-"+ (event.data['newPage']+1) +"0 out of");
    	        }).appendTo($pager).addClass('clickable');
    	    }
    	$pager.insertAfter('#previous')
        .find('button.page-number:first').addClass('active');
    	$(".page-number:first").trigger("click");
    });
    
    $('#previous').bind('click',function(event){
    	console.log("previous click");
    	console.log("numSections="+numSections);
    	curSection -= 1;
    	console.log("curSection="+curSection);
    	console.log("numPages="+numPages);
    	$('#next').attr('disabled',false);
    	endPage = sectionNum*(curSection+1);
    	if((numSections-1) == curSection){
    		endPage = numPages;
    		console.log("endPage="+endPage);
    		}
    	if(curSection == 0){
    		$('#previous').attr('disabled', true);
    		}
    	$('.page-number').remove();
    	for (var page =(curSection*sectionNum); page < endPage; page++) {
    	      $('<button class="page-number page-link"></button>').text(page + 1)
    	        .bind('click', {newPage: page}, function(event) {
    	          currentPage = event.data['newPage'];
    	          $table.trigger('repaginate');
    	          console.log($(this));
    	          $(this).addClass('active')
    	            .siblings().removeClass('active');
    	          $('.mr-2').text("Showing "+ event.data['newPage'] +"1-"+ (event.data['newPage']+1) +"0 out of");
    	        }).appendTo($pager).addClass('clickable');
    	    }
    	$pager.insertAfter('#previous')
        .find('button.page-number:first').addClass('active');
    	$(".page-number:first").trigger("click");
    });
    
  });
});

//만들어진 테이블에 페이지 처리
/*
function page(){ 
var reSortColors = function($table) {
  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
 };
 $('table.paginated').each(function() {
  var pagesu = 10;  //페이지 번호 갯수
  var currentPage = 0;
  var numPerPage = 10;  //목록의 수
  var $table = $(this);    
  
  //length로 원래 리스트의 전체길이구함
  var numRows = $table.find('tbody tr').length;
  //Math.ceil를 이용하여 반올림
  var numPages = Math.ceil(numRows / numPerPage);
  //리스트가 없으면 종료
  if (numPages==0) return;
  //pager라는 클래스의 div엘리먼트 작성
  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
  
  var nowp = currentPage;
  var endp = nowp+10;
  
  //페이지를 클릭하면 다시 셋팅
  $table.bind('repaginate', function() {
  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
  
   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
   $("#remo").html("");
   
   if (numPages > 1) {     // 한페이지 이상이면
    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
     nowp = 0;     // 1부터 
     endp = pagesu;    // 10까지
    }else{
     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
     endp = nowp+pagesu;   // 10까지
     pi = 1;
    }
    
    if (numPages < endp) {   // 10페이지가 안되면
     endp = numPages;   // 마지막페이지를 갯수 만큼
     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
    }
    if (nowp < 1) {     // 시작이 음수 or 0 이면
     nowp = 0;     // 1페이지부터 시작
    }
   }else{       // 한페이지 이하이면
    nowp = 0;      // 한번만 페이징 생성
    endp = numPages;
   }
   // [처음]
   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
          currentPage = 0;   
          $table.trigger('repaginate');  
          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
      }).appendTo($pager).addClass('clickable');
    // [이전]
      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
          if(currentPage == 0) return; 
          currentPage = currentPage-1;
    $table.trigger('repaginate'); 
    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
   }).appendTo($pager).addClass('clickable');
    // [1,2,3,4,5,6,7,8]
   for (var page = nowp ; page < endp; page++) {
    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
     currentPage = event.data['newPage'];
     $table.trigger('repaginate');
     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
     }).appendTo($pager).addClass('clickable');
   } 
    // [다음]
      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
    if(currentPage == numPages-1) return;
        currentPage = currentPage+1;
    $table.trigger('repaginate'); 
     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
   }).appendTo($pager).addClass('clickable');
    // [끝]
   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
           currentPage = numPages-1;
           $table.trigger('repaginate');
           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
   }).appendTo($pager).addClass('clickable');
     
     $($(".page-number")[2]).addClass('active');
reSortColors($table);
  });
   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
   $pager.appendTo($table);
   $table.trigger('repaginate');
 });
}
*/
 
 /*
 function loadData(code){
 	$.ajax({
 		url: "",
 		type: "GET",
 		cache: false,
 		hearders: {"cache-control": "no-cache"},
         contentType: "application/json",
         success: function(data){
         	var lists = data.result;
         	var temp = "<thead>" +
         			"<tr>" +
         			"<th></th>" +
         			"<th>받는사람</th>" +
         			"<th>내용</th>" +
         			"<th></th>" +
         			"<th>날짜</th>" +
         			"</tr>" +
         			"</thead>";
         	for(var i=0;i<lists.length;i++){
         		temp +=   '<tr>'+
         		'<td class="listtd">'+
         		  '<div class="animated-checkbox">'+
         			'<label>'+
         			  '<input class="msg_check" type="checkbox" name="chkbox" value="'+ lists[i].sender +'"><span class="label-text"> </span>'+
         			'</label>'+
         		  '</div>'+
         		'</td>'+
         		'<td class="user_email">'+ lists[i].sender +'</td>'+
         		'<td><a data-toggle="modal" data-backdrop="static" data-keyboard="false" href="#msg_modal" class="request"><b>'+ lists[i].content +'</b></a></td>'+
         		'<td>';
         	if(list[i].read_check == 0){
         	temp += '<i  class="fa fa-envelope-o"></i>';
         	}else{
         	temp += '<i class="fa fa-envelope-open-o"></i>';
         	}

         	temp += '<input type="hidden" name="msg_code" value="'+ list[i].message_code +'">'+
         		'</td>'+
         		'<td>'+ list[i].send_date +'</td>'+
         	  '</tr>';
         	}
         	$("#tbl").html(temp);
         	page();
         }
 	});
 }
*/