/**
 * 
 */
$(document).ready(function(){
	$(document.body).on("click",".request_code",function(){
		var a = $(this);
		console.log(a.next().val());
		var code = a.next().val();
		var str = "/customer/poplist?request_code="+code;
		var win = window.open(str, "PopupWin", "width=400,height=500,location=no,resizable=no,toolbar=no");
	});
});