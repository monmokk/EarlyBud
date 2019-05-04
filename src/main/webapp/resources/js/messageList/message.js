console.log("message module...");
var replyService = (function(){
	
	function add(message, callback, error){
		console.log("add message.......");
		
		$.ajax({
			type : 'post',
			url : '/messages/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(reusult, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	return {add:add};
})();
