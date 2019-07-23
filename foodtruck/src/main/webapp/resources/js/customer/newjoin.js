$(document).ready(function() {
	function getQuerystring(paramName) { //html 파라미터 넘어오는거 값 받을수있음
		var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제 
		var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기 
		for (var i = 0; _tempArray.length; i++) {
			var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기 
			if (_keyValuePair[0] == paramName) { // _keyValuePair[0] : 파라미터 명 // _keyValuePair[1] : 파라미터 값
				return _keyValuePair[1];
			}
		}
	}
	var request_code = getQuerystring("request_code");
	
	//alert(truck_code);
	$("#choice").click(function() {
		var ck = [];
		ck = $("input[class='radio']:checked").each(function() {
			ck.push($(this).val());
		});
		var list = [];
		console.log(ck);
		console.log(ck.length);
		if (ck.length == "") {
			alert("선택된게 없습니다. 선택해주세여");
		} else {
			list.push(request_code);
			for (var i = 0; i < ck.length; i++) {
				var truck_code = $(ck[i]).closest('input').val();

				console.log(truck_code);
				list.push(truck_code);
			}
			var jobj = new Object();

			jobj.truck_code = list;
			console.log(jobj);
			//console.log(JSON.parse(jobj));
			console.log(list);
			var query = {
				truck_code : jobj
			}
			console.log(query);
			if (confirm("선택하면 모집이 마감되며 해당 푸드트럭에게 알림이 가게됩니다.")) {
				$.ajax({
					type : "post",
					url : "/customer/selectlist",
					async : false,
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify(list),
					success : function(data) {
						opener.location.reload();		
						window.close();
						
					}
				});
			}
		}
	});
	$(document.body).on("click", ".radio", function() {

		if ($(this).attr("title") == '') {
			//console.log("on");
			$(this).attr("title", "on");
		} else {
			$(this).prop("checked", false);
			$(this).attr("title", "");
			//console.log("off");
		}
	});

});