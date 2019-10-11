/**
 * 
 */
$(document).ready(function(){
	$(".review").click(function() {
		location.href = "/customer/review";
	});
	$(".callList").click(function() {
		location.href = "/customer/callList";
	});
	$(".goodbyeForm").click(function() {
		location.href = "/customer/goodbyeForm";
	});
	$(".onboard").click(function() {
		location.href = "/customer/onboard";
	});
	$(".mozip").click(function() {
		// 모집공고 페이지
		location.href ="/customer/joinlist";
	});
	$(".cusInfo").click(function() {
		location.href = "/customer/cusInfo";
	});
	$(".myQuestion").click(function() {
		location.href = "/help/myQuestion";
	});
	
	$(".onboard").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/탑승트럭b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/탑승트럭g.png");
	});
	$(".mozip").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/모집공고b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/모집공고g.png");
	});
	$(".review").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/리뷰관리b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/리뷰관리g.png");
	});
	$(".callList").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/호출내역b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/호출내역g.png");
	});
	$(".cusInfo").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/회원정보관리b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/회원정보관리g.png");
	});
	$(".myQuestion").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/문의내역b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/문의내역g.png");
	});
	$(".goodbyeForm").mouseover(function(){
		$(this).attr("src", "/resources/image/mypage/회원탈퇴b.png");
	}).mouseout(function(){
		$(this).attr("src", "/resources/image/mypage/회원탈퇴g.png");
	});
});
