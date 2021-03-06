<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/customercss/cusInfo.css"/>" />
</head>
<body>
	<div class="container" style="max-width: 1650px;">
		<div class="row">
			<div class="col-md-2" style="margin-top: 50px;">
				<jsp:include page="sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div id="with" class="col">
					<h1 style="text-align: center; padding-top: 20px;">회원정보</h1>


					<div class="div2">
						<br> 아이디:${cusinfo.email} <br>비밀번호
						<button href="#layer1" class="btn-example">변경</button>

						<div class="pop-layer" id="layer1">
							<div class="pop-container">
								<div class="pop-conts">
									아이디:${cusinfo.email}<br> <input id="nowpasswd"
										type="password" placeholder="현재 비밀번호"> <input
										id="newpasswd" type="password" placeholder="새 비밀번호">
									<p>8~64자 영문, 숫자, 특수문자를 조합해주세요.</p>
									<input id="newpassword" type="password" placeholder="비밀번호 확인">
									<br> <br>
									<div class="btn-r">
										<a type="button" class="btn-layerClose" id="ck">변경</a> <a
											type="button" class="btn-layerClose" id="ch">취소</a>
									</div>
								</div>
							</div>
						</div>
						<br> 닉네임: ${cusinfo.nickname}
						<button href="#layer2" class="btn-example">변경</button><br/>
						<div class="dim-layer">
							<div class="dimBg"></div>
							<div id="layer2" class="pop-layer">
								<div class="pop-container">
									<div class="pop-conts">
										닉네임:${cusinfo.nickname}<br> <input placeholder="변경닉네임"
											id="nickname"> <br>
										<p>사용할 닉네임을 입력해주세요.</p>
										<br> <br>
										<div class="btn-r">
											<a type="button" class="btn-layerClose" id="button1">변경</a> <a
												type="button" class="btn-layerClose" id="button2">취소</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						휴대전화:${cusinfo.telephone}

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document)
			.ready(
					function() {
						$('.btn-example').click(function() {
							var $href = $(this).attr('href');
							layer_popup($href);
						});
						function layer_popup(el) {
							var $el = $(el); //레이어의 id를 $el 변수에 저장
							var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

							isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

							var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el
									.outerHeight()), docWidth = $(document)
									.width(), docHeight = $(document).height();

							// 화면의 중앙에 레이어를 띄운다.
							if ($elHeight < docHeight || $elWidth < docWidth) {
								$el.css({
									marginTop : -$elHeight / 2,
									marginLeft : -$elWidth / 2
								})
							} else {
								$el.css({
									top : 0,
									left : 0
								});
							}

							$el.find('a.btn-layerClose').click(
									function() {
										isDim ? $('.dim-layer').fadeOut() : $el
												.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
										return false;
									});
							$('.layer .dimBg').click(function() {
								$('.dim-layer').fadeOut();
								return false;
							});
						}
						$('#pop_bt').click(function() {
							$('#pop').show();
						});
						$('#close').click(function() {
							$('#pop').hide();
						});
						$('#close1').click(function() {
							$('#pop').hide();
						});
						$("#ck")
								.click(
										function() {
											var nowpasswd = $("#nowpasswd")
													.val();
											var newpassword1 = $("#newpasswd")
													.val();
											var newpassword2 = $("#newpassword")
													.val();
											var dbpasswd = "${sessionScope.sessionid.password}";
											//alert(dbpasswd);
											if (dbpasswd != nowpasswd) {
												alert("현재 비밀번호가 일치하지 않습니다.");
												$("#nowpasswd").val("");
												$("#newpasswd").val("");
												$("#newpassword").val("");
											} else if (newpassword1 != newpassword2) {
												alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
												$("#nowpasswd").val("");
												$("#newpasswd").val("");
												$("#newpassword").val("");
											} else {
												$
														.ajax({
															type : "post",
															url : "/customer/cusInfo",
															data : {
																"password" : newpassword2
															},
															success : function(
																	data) {
																alert("비밀번호가 변경되었습니다.");
																location
																		.reload();
															},
															error : function(
																	err) {
																alert("오류발생");
															}
														});
											}
										});
						$("#ch").click(function() {
							$("#lay1").hide();
							$("#nowpasswd").val("");
							$("#newpasswd").val("");
							$("#newpassword").val("");
						});
						$("#button1").click(function() {
							var nickname = $("#nickname").val();

							console.log(nickname);
							$.ajax({
								type : "post",
								url : "/customer/nicknameck",
								data : {
									"nickname" : nickname
								},
								success : function(data) {
									if (data == "success") {
										alert("닉네임이 변경되었습니다");
										location.reload();
									} else {
										alert("중복된 닉네임입니다.");
										$("#nickname").val("");
									}
								},
								error : function(err) {
									alert("알수없는 오류발생");
								}
							});

						});
					});
</script>
</html>