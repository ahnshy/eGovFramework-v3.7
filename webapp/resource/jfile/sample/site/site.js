function updateTime() {		
	var remainTime = eval(--maxTime);
	$('#time').html( remainTime );
	if(remainTime > 0) {
		setTimeout("updateTime()", 1000);
	}
}

function cutdownSessionLimitTime(ctx) {
	jQuery.ajax({
		url : ctx+'/jfile/sample/site/cutdownSessionLimitTime.do',
		type: "GET",
		data : { },
		dataType : "json",
		success : function(result) {
			switch(result.JsonResultCode) {
			case "success":
				window.location.reload(true); 
				break;
			case "failure":
				break;
			default:
				break;
			}
		},
		error : function(xhr, ajaxSettings, thrownError){
			if (xhr.status == 901) {
				alert("세션이 종료 되었습니다.");
				self.location.href= ctx;
			}else{
				alert("xhr.status => "+ xhr.status);
				alert('프로세스 수행 중 장애가 발생 하였습니다. ');
			}
		}
	});
}
//