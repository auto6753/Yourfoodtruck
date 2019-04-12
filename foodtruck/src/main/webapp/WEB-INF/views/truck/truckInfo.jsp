<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/truck/truckinfo.css"/>" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#call").click(function() {
			location.href = "/project/truck/callForm";
		});
		$("#btn1").click(function() {
			$("#menu").show();
			$("#review, #truckinfo, #location, #event").hide();

		});
		$("#btn2").click(function() {
			$("#review").show();
			$("#menu, #truckinfo, #location, #event").hide();

		});
		$("#btn3").click(function() {
			$("#truckinfo").show();
			$("#review, #menu, #location, #event").hide();

		});
		$("#btn4").click(function() {
			$("#location").show();
			$("#review, #truckinfo, #menu, #event").hide();

		});
		$("#btn5").click(function() {
			$("#event").show();
			$("#review, #truckinfo, #location, #menu").hide();

		});
		$("#ride").click(function() {
			var check;

			if ($(this).text() == '탑승하기') {
				$(this).text('탑승중');
			} else {
				var truckname = $("#truckname").text();
				check = confirm(truckname + "을 하차하시겠습니까?");
				if (check == true) {
					$(this).text('탑승하기');
				}
			}
		});
		$(".star_rating a").click(function() {
			$(this).parent().children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			return false;
		});

	});
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
					<h1 id="truckname">맛짱트럭</h1>
					<br>
					<button id="ride">탑승하기</button>
					<button id="call">호출하기</button>
				</div>
			</div>
			<div id="btngroup"
				style="margin: 0 auto; margin-top: 200px; text-align: center;">
				<button id="btn1">메뉴</button>
				<button id="btn2">리뷰 및 평점</button>
				<button id="btn3">트럭 정보</button>
				<button id="btn4">실시간 위치</button>
				<button id="btn5">이벤트</button>
			</div>
			<div id="menu" class="container">
				<div class="row">
					<div  class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food1.png'>
						<br> 핫도그 <br> 3000원
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/don.jpg'>
						<br> 돈까스 <br> 5000원
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food2.jpg'>
						<br> 핫도그 <br> 3000원
					</div>
					<div  class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food2.jpg'>
						<br> 핫도그 <br> 3000원
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food3.jpg'>
						<br> 핫도그 <br> 3000원
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food1.png'>
						<br> 핫도그 <br> 3000원
					</div>
					
				</div>

			</div>


			<div id="review" style="display: none;">
				review
				<p class="star_rating">
					<a href="#">★</a> <a href="#">★</a> <a href="#"">★</a> <a
						href="#">★</a> <a href="#">★</a>
				</p>



			</div>

			<div id="truckinfo" style="display: none;">
				truckinfo
				<div>1</div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
			</div>
			<div id="location" style="display: none;">
				location
				<div>1</div>
				<div>2</div>
				<div>3</div>

			</div>
			<div id="event" style="display: none;">
				event
				<div>1</div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
			</div>
		</div>
	</div>
</body>
</html>