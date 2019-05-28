<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/truck/truckinfo.css"/>" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9df56b013af05d5db1fb3350de0a4265"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var email = "${sessionScope.sessionid.email}";
				var truck_code = "${tlist.truck_code}";
				//alert(email);
				$.ajax({
					type : "post",
					url : "/customer/ridech",
					data : {
						"truck_code" : truck_code,
						"email" : email
					},
					success : function(data) {
						var json = JSON.parse(data);
						console.log(json);
						if (json.onboardstate != 1) {
							alert(json.onboard_state);
							$('#ride').text('탑승하기');
						} else {
							$('#ride').text('하차하기');
						}
					},
					error : function(err) {
						console.log(err);
						console.log(err.statusText);
					}
				});
				$("#ride").click(function() {
					var email = "${sessionScope.sessionid.email}";
					if (email == "") {
						alert("로그인이후 이용가능합니다.");
					} else {
						$("#ride").click(function() {
							var email = "${sessionScope.sessionid.email}";
							var truck_code = "${tlist.truck_code}";
							var date = new Date();
							var year = date.getFullYear();
							var month = date.getMonth() + 1; //months from 1-12
							var day = date.getDate();

							if ((day + "").length < 2) {
								day = "0" + day;
							} else if ((month + "").length < 2) {
								month = "0" + month;
							}
							var today = year + "-" + month + "-" + day;
							alert(today);

							if ($("#ride").text() == '탑승하기') {
								$.ajax({
									url : "/customer/insertOnboard",
									type : "post",
									data : {
										"truck_code" : truck_code,
										"onboard_date" : today
									},
									success : function(data) {
										$('#ride').text('하차하기');
									},
									error : function(err) {
										console.log(err);
										console.log(err.statusText);
										alert("안넘어감");
									}
								});

							} else {
								var truckname = $("#truckname").text();
								check = confirm(truckname + "을 하차하시겠습니까?");
								var truck_code = "${tlist.truck_code}";
								var date = new Date();
								var year = date.getFullYear();
								var month = date.getMonth() + 1; //months from 1-12
								var day = date.getDate();

								if ((day + "").length < 2) {
									day = "0" + day;
								} else if ((month + "").length < 2) {
									month = "0" + month;
								}
								var today = year + "-" + month + "-" + day;
								alert(today);

								$.ajax({
									url : "/customer/Deleteride",
									type : "post",
									data : {
										"truck_code" : truck_code,
										"email" : email,
										"out_date" : today
									},
									success : function(data) {
										$('#ride').text('탑승하기');
									}
								});
							}
						});
					}
				});

				var score = "${sumscore}";
				if (score > 0 && score < 2) {
					$('.sumscore').append('<p>★☆☆☆☆</p>');
				} else if (score > 2 && score < 3) {
					$('.sumscore').append('<p>★★☆☆☆</p>');
				} else if (score > 3 && score < 4) {
					$('.sumscore').append('<p>★★★☆☆</p>');
				} else if (score > 4 && score < 5) {
					$('.sumscore').append('<p>★★★★☆</p>');
				} else if (score == 5) {
					$('.sumscore').append('<p>★★★★★</p>');
				}
				$("#call").click(
						function() {
							var truck_code = "${tlist.truck_code}";
							location.href = "/truck/callForm/?truck_code="
									+ truck_code;
						});
				$("#btn1").click(
						function() {
							$("#menu").css("visibility", "visible");
							$("#review, #truckinfo, #location, #event").css(
									"visibility", "hidden");
						});
				$("#btn2").click(
						function() {
							$("#review").css("visibility", "visible");
							$("#menu, #truckinfo, #location, #event").css(
									"visibility", "hidden");
						});
				$("#btn3").click(
						function() {
							$("#truckinfo").css("visibility", "visible");
							$("#review, #menu, #location, #event").css(
									"visibility", "hidden");
						});
				$("#btn4").click(
						function() {
							$("#location").css("visibility", "visible");
							$("#review, #truckinfo, #menu, #event").css(
									"visibility", "hidden");
							/* $("#location").show();
							$("#review, #truckinfo, #menu, #event").hide(); */
						});
				$("#btn5").click(
						function() {
							$("#event").css("visibility", "visible");
							$("#review, #truckinfo, #location, #menu").css(
									"visibility", "hidden");
						});
				$(".star_rating a").click(function() {
					$(this).parent().children("a").removeClass("on");
					$(this).addClass("on").prevAll("a").addClass("on");
					return false;
				});
				$("#creatbtn").click(function() {
					$("#reviewwhole").show();
					$("#creatbtncancle").show();
					$("#creatbtn").hide();
				});
				$("#creatbtncancle").click(function() {
					$("#reviewwhole").hide();
					$("#reviewwhole2").hide();
					$("#creatbtncancle").hide();
					$("#creatbtn").show();
				});
				$(".modify").click(function() {
					var a = $(this);
					var b = a.next().val();
					a.closest("div").next().css("display", "block");
					a.closest("div").css("display", "none");

				});
				$("#imageplus").click(function() {
					$("#reviewwhole").hide();
					$("#reviewwhole2").show();

				});

				$("#credit").click(
						function() {
							var reviewcontent = $("#reviewcontent").val();
							var truckcode = "${tlist.truck_code}";

							var reviewscore = $(
									"input:radio[name='star']:checked").val();
							var query = {
								truck_code : truckcode,
								review_content : reviewcontent,
								review_score : reviewscore
							}
							$.ajax({
								url : "/truck/reviewwrite",
								data : query,
								type : "post",
								success : function(data) {
									location.reload();
								}
							});
						});
				$(".delete").click(function() {
					var a = $(this);
					var b = a.next().val();
					console.log(b);
					var truckcodes = "${tlist.truck_code}";
					alert(truckcodes);
					var reviewcode = b;
					var query = {
						truck_code : truckcodes,
						review_code : reviewcode
					}
					$.ajax({
						url : "/truck/reviewdelete",
						type : "post",
						data : query,
						success : function(data) {
							location.reload();
						}
					});
				});

				$(".modifysuccess").click(function() {
					var a = $(this);
					var b = a.next().val();
					var content = a.prev().val();

					var query = {

						review_code : b,
						review_content : content

					}

					$.ajax({
						url : "/truck/reviewmodify",
						type : "post",
						data : query,
						success : function(data) {
							location.reload();

						}

					});

				});

				var a = "${test}";
				if (a == null) {

				} else if (a == 1) {
					$('#btn2').trigger('click');
					var a = "${test2}";
					var offset = $("#" + a).offset();
					console.log(offset);
					//alert(offset);
					$('html, #review').animate({
						scrollTop : offset.top - 575
					}, 400);
				}
			});

	/* $("#btn2").bind("click", function () { 
	   alert("버튼이 클릭됨");
	   
	}); */
	//$("#btn2").trigger("click");
	//버튼 클릭이 아니라 코드에 의해서 click이벤트를 실행하고 싶다면?
</script>
</head>
<body>
	<div id="with" class="col">
		<div id="height" class="col">
			<div style="float: left;" class="col">
				<img
					src='${pageContext.request.contextPath}/resources/image/food1.png'>
				<div id="cross">
					<br>
					<h1 id="truckname">${tlist.brandname}</h1>
					<br>
					<button id="ride">탑승하기</button>
					<button id="call">호출하기</button>
				</div>
			</div>
			<div id="btngroup"
				style="margin: 0 auto; margin-top: 200px; text-align: center;"
				class="col">
				<button id="btn1" class="col-md-2">메뉴</button>
				<button id="btn2" class="col-md-2">리뷰 및 평점</button>
				<button id="btn3" class="col-md-2">트럭 정보</button>
				<button id="btn4" class="col-md-2">실시간 위치</button>
				<button id="btn5" class="col-md-2">이벤트</button>
			</div>
			<div id="menu" class="container">

				<div class="row">
					<c:forEach var="i" items="${menu }">
						<div class="col-md-3">

							<img class="img"
								src="${pageContext.request.contextPath}/resources/image/upload/${i.menu_url }">
							<div class="menuname">
								<br>${i.menu_name }<br> ${i.unit_price }
							</div>
						</div>
					</c:forEach>


				</div>

			</div>


			<div id="review" style="visibility: hidden;">

				<div class="col-md-12">

					<div id="creatbtngroup">
						<c:if test="${not empty sessionScope.sessionid }">
							<button id="creatbtn">리뷰작성하기</button>

							<button id="creatbtncancle" style="display: none;">리뷰작성취소</button>
						</c:if>
					</div>

					<div>


						<p class="sumscore" style="color: #ff6622;">${sumscore}</p>

					</div>
				</div>
				<div id="reviewwhole" class="col-md-12" style="display: none;">
					<div id="star" class="col">
						<div id="starcontent">
							<h6>평점을 매겨주세요.</h6>
							<!-- <p class="star_rating">
                        <a href="#">★</a> <a href="#">★</a> <a href="#">★</a> <a
                           href="#">★</a> <a href="#">★</a>
                     </p> -->
							<div class="stars">

								<form action="">

									<input value="5" class="star star-5" id="star-5" type="radio"
										name="star" /> <label class="star star-5" for="star-5"></label>
									<input value="4" class="star star-4" id="star-4" type="radio"
										name="star" /> <label class="star star-4" for="star-4"></label>
									<input value="3" class="star star-3" id="star-3" type="radio"
										name="star" /> <label class="star star-3" for="star-3"></label>
									<input value="2" class="star star-2" id="star-2" type="radio"
										name="star" /> <label class="star star-2" for="star-2"></label>
									<input value="1" class="star star-1" id="star-1" type="radio"
										name="star" /> <label class="star star-1" for="star-1"></label>

								</form>

							</div>

						</div>
					</div>
					<input id="reviewcontent" placeholder="리뷰를 작성해주세요."></input>
					<div id="reviewbtn">
						<button id="credit">작성</button>
					</div>

				</div>



				<c:forEach var="i" items="${reviewList}">
					<div class="col-md-12">
						<div class="reviewbar">
							<p style="line-height: 10px;">[${i.nickname}] &nbsp;&nbsp;
								${i.review_regdate}</p>
						</div>
						<div class="reviewbar2">
							<c:if test="${i.review_score==1}">
								<a class="on">평점: ★</a>
							</c:if>
							<c:if test="${i.review_score==2}">
								<a class="on">평점: ★★</a>
							</c:if>
							<c:if test="${i.review_score==3}">
								<a class="on">평점: ★★★</a>
							</c:if>
							<c:if test="${i.review_score==4}">
								<a class="on">평점: ★★★★</a>
							</c:if>
							<c:if test="${i.review_score==5}">
								<a class="on">평점: ★★★★★</a>
							</c:if>


						</div>
						<div class="content" id="content">

							<p id="${i.review_code}">${i.review_content}</p>
							<c:if test="${sessionScope.sessionid.email == i.email}">

								<input class="delete" type="button" value="삭제">
								<input type="hidden" value="${i.review_code}">
								<input class="modify" type="button" value="수정">
								<input type="hidden" value="${i.review_code}">

							</c:if>

						</div>

						<div class="contentmodify" style="display: none">

							<c:if test="${sessionScope.sessionid.email == i.email}">

								<textarea class="textareaa" name="review_content" rows="2"
									value="${i.review_content }">${i.review_content }</textarea>


								<input class="modifysuccess" type="submit" value="수정완료">
								<input type="hidden" name="review_code" value="${i.review_code}">




							</c:if>

						</div>


					</div>
				</c:forEach>
			</div>





			<div id="truckinfo" style="visibility: hidden;">
				<div id="truckinfohead">
					<div id="truckruntime">
						<h3>트럭정보</h3>
					</div>
					<div id="cacheinfo">
						<h3>결제정보</h3>
					</div>
					<div id="managerinfo">
						<h3>사업자정보</h3>
					</div>
				</div>
				<div id="truckinfobody">
					<div id="truckruntime1">

						<h3>${tlist.truck_desc}</h3>
					</div>
					<div id="cacheinfo1">
						<c:if test="${tlist.paytype == 1 }">
							<h3>결제수단: 카카오페이</h3>
						</c:if>
						<c:if test="${tlist.paytype == 3 }">
							<h3>결제수단: 카드</h3>
						</c:if>
						<c:if test="${tlist.paytype == 5 }">
							<h3>결제수단: 현금</h3>
						</c:if>
						<c:if test="${tlist.paytype == 4 }">
							<h3>결제수단: 카드 카카오페이</h3>
						</c:if>
						<c:if test="${tlist.paytype == 6 }">
							<h3>결제수단: 현금 카카오페이</h3>
						</c:if>
						<c:if test="${tlist.paytype == 8 }">
							<h3>결제수단: 현금 카드</h3>
						</c:if>
						<c:if test="${tlist.paytype == 9 }">
							<h3>결제수단: 현금 카드 카카오페이</h3>
						</c:if>
					</div>
					<div id="managerinfo1">
						<h3>
							상호명:&nbsp;${tlist.brandname} <br>사업자등록번호:&nbsp;${tlist.account}

						</h3>
					</div>
				</div>
			</div>
			<div id="location" style="visibility: hidden;">
				<div id="map">
					<%-- <jsp:include page="location.jsp"></jsp:include> --%>
				</div>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 마커가 표시될 위치입니다 
					var markerPosition = new daum.maps.LatLng(33.450701,
							126.570667);

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position : markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);

					// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
					// marker.setMap(null);
				</script>
				<div id="locationdetail" style="text-align: left;">
					지하철<br> -1호선을 타고 월평역에서 하차하여 약 20분정도 걸어오셔야 합니다. <br> <br>


					버스<br> -유성구청 정류장(도보1분거리) : 간선104, 지석121, <br> -마을5한빛아파트
					정류장(도보5분거리) : 간선105, 115, 지선117, 급행1002,<br> -마을1유림공원
					정류장(도보10분거리) : 간선102, 106, 108, 113, 706




				</div>
			</div>
			<div id="event" style="visibility: hidden;">

				<div id="eventborder">
					<c:forEach var="i" items="${event }">
						<div id="eventbody">

							<img id="eventimage"
								src='${pageContext.request.contextPath}/resources/image/food10.PNG'>
						</div>
						<div id="eventcontent">
							<br>
							<h2>
								<span style="color: #C90000;">${i.event_name }</span>
							</h2>
							<br>
							<h5>
								<span style="color: #FF0000;">${i.event_content }</span>
							</h5>
							<br>
							<h6>
								<span style="color: #FF0000;"><fmt:formatDate
										value="${i.event_start }" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate
										value="${i.event_end }" pattern="yyyy.MM.dd" /></span>
							</h6>
							<br>
						</div>
					</c:forEach>
				</div>


			</div>
		</div>
	</div>
	<script>
		var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);

		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
			position : markerPosition
		};

		var staticMapContainer = document.getElementById('map'), // 이미지 지도를 표시할 div  
		staticMapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
			level : 3, // 이미지 지도의 확대 레벨
			marker : marker
		// 이미지 지도에 표시할 마커 
		};

		// 이미지 지도를 생성합니다
		var map = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>

</body>
</html>