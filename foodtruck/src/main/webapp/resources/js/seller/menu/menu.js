/**
 * 
 */

$(document).ready(function(){
	$("#addMenu").click(function(){
		var popupX = (window.screen.width / 2) - (430 / 2);
		var popupY = (window.screen.height / 2) - (600 / 2);
		
		window.open("addMenu", "addMenu", "width=430, height=460, left=" + popupX + "," + "top=" + popupY + "resizalbe=no");
	});
	
	$("#delMenu").click(function(){
		$("#delMenu").toggle(); // 삭제 show
		
		$(".delChk").toggle(); // 체크박스 show
		$("#chkAllMenu").toggle(); // 전체선택 show
		$("#unchkAllMenu").toggle(); // 전체해제 show
		$("#goBack").toggle(); // 취소 show
		$("#delMenu2").toggle(); // 삭제2 show
		
		$("#addMenu").toggle(); // 메뉴등록  hide

		// show/hide 시, inline-block으로 변경된 display 속성을 block으로 변경
		var display1 = $("#chkAllMenu").css("display");
		var display2 = $("#unchkAllMenu").css("display");
		var display3 = $("#goBack").css("display");
		var display4 = $("#delMenu2").css("display");
		
		if (display1 == "inline-block" && display2 == "inline-block") {
			$("#chkAllMenu").css("padding", "6px 9px");
			$("#unchkAllMenu").css("padding", "6px 9px");
			$("#goBack").css("padding", "6px 9px");
			$("#delMenu2").css("padding", "6px 9px");
			
			$("#chkAllMenu").css("display", "block");
			$("#unchkAllMenu").css("display", "block");
			$("#goBack").css("display", "block");
			$("#delMenu2").css("display", "block");
		}
	});
	
	$("#delMenu2").click(function(){
		var checked = $('input:checkbox[name=delChk]:checked').length;
		
		if(checked == 0) {
			alert("선택된 메뉴가 없습니다.\n삭제할 메뉴를 선택해 주세요!");
		}
	});

	$("#chkAllMenu").click(function(){
		$(".delChk").prop("checked", true);
		$(".status").addClass("selected");
		$(".status").text("선택됨");
	});

	$("#unchkAllMenu").click(function unchkAllMenu(){
		$(".delChk").prop("checked", false);
		$(".status").removeClass("selected");
		$(".status").text("선택해제됨");
	});
	
	$("#goBack").click(function(){
		$(".delChk").prop("checked", false);
		$(".status").removeClass("selected");
		$(".status").text("선택해제됨");
		
		$("#delMenu").toggle(); // 삭제 show
		
		$(".delChk").toggle(); // 체크박스 hide
		$("#chkAllMenu").toggle(); // 전체선택 hide
		$("#unchkAllMenu").toggle(); // 전체해제 hide
		$("#goBack").toggle(); // 취소 hide
		$("#delMenu2").toggle(); // 삭제2 hide
		
		$("#addMenu").toggle(); // 메뉴등록 show
	});
	
	$("input:checkbox").on('click', function(){
		if($(this).prop('checked')) {
			$(this).siblings().addClass("selected");
			$(this).siblings().text("선택됨");
		} else {
			$(this).siblings().removeClass("selected");
			$(this).siblings().text("선택해제됨");
		}
	});
	
	$(".imgBox").click(function(){
		var popupX = (window.screen.width / 2) - (430 / 2);
		var popupY = (window.screen.height / 2) - (600 / 2);
		
		window.open("editMenu", "editMenu", "width=430, height=460, left=" + popupX + "," + "top=" + popupY);
	});
});