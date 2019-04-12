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
		$("#creatbtn").click(function(){
			
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
					<h1 id="truckname">닭치고 닭꼬치</h1>
					<br>
					<button id="ride">탑승하기</button>
					<button id="call">호출하기</button>
				</div>
			</div>
			<div id="btngroup"
				style="margin: 0 auto; margin-top: 200px; text-align: center;" class="col">
				<button id="btn1" class="col-md-2">메뉴</button>
				<button id="btn2" class="col-md-2">리뷰 및 평점</button>
				<button id="btn3" class="col-md-2">트럭 정보</button>
				<button id="btn4" class="col-md-2">실시간 위치</button>
				<button id="btn5" class="col-md-2">이벤트</button>
			</div>
			<div id="menu" class="container">
				<div class="row">
					<div  class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food1.png'>
						<div class="menuname"><br> 핫도그 <br> 3000원</div>
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/don.jpg'>
						<div class="menuname"><br> 돈까스 <br> 5000원</div>
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food2.jpg'>
						<div class="menuname"><br> 핫도그 <br> 3000원</div>
					</div>
					<div  class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food2.jpg'>
						<div class="menuname"><br> 핫도그 <br> 3000원</div>
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food3.jpg'>
						<div class="menuname"><br> 핫도그 <br> 3000원</div>
					</div>
					<div class="col-md-3">
						<img class="img"
							src='${pageContext.request.contextPath}/resources/image/food1.png'>
						<div class="menuname"><br> 핫도그 <br> 3000원</div>
					</div>
					
				</div>

			</div>


			<div id="review" style="display: none;">
				<div class="col-md-12">
					<div id="creatbtngroup">
						<button id="creatbtn">리뷰작성하기</button>
					</div>
					<div>
						<h4>이거슨 닭인가!! 치킨인가!!<span style="color: red;">닭치고닭꼬치</span></h4>
						<h5 style="color: blue;">4</h5>
						<p class="star_rating">
							<a href="#" class="on">★</a>
							<a href="#" class="on">★</a> 
							<a href="#" class="on">★</a>
							<a href="#" class="on">★</a>
							<a href="#">★</a>
						</p>
					</div>
				</div>
				<div class="col-md-12">
				
				<div class="reviewbar">
				<p style="line-height: 10px;">tmst7****님 &nbsp;&nbsp;  1hour ago</p>
				</div>
				<div class="reviewbar2">
				<p>평점
							<a class="on">★</a>
							<a class="on">★</a> 
							<a class="on">★</a>
							<a class="on">★</a>
							<a>★</a>
						</p>
							</div>
							<div id="content">
							<p>너무 맛있어요!!! JMT!!!!! 다시 사먹을만한 맛!!! 추천해영~~!!!</p>
							</div>	
							
						
				</div>
				<div class="col-md-12">
				
				<div class="reviewbar">
				<p style="line-height: 10px;">788oyuu****님 &nbsp;&nbsp;  7days ago</p>
				</div>
				<div class="reviewbar2">
				<p>평점
							<a class="on">★</a>
							<a class="on">★</a> 
							<a class="on">★</a>
							<a class="on">★</a>
							<a>★</a>
						</p>
							</div>
							<div id="content">
							<p>줄서서 먹을만한 집은 아닌듯..</p>
							</div>	
							
						
				</div>
				<div class="col-md-12">
				
				<div class="reviewbar">
				<p style="line-height: 10px;">BSEg****님 &nbsp;&nbsp;  1month ago</p>
				</div>
				<div class="reviewbar2">
				<p>평점
							<a class="on">★</a>
							<a class="on">★</a> 
							<a class="on">★</a>
							<a>★</a>
							<a>★</a>
						</p>
							</div>
							<div id="content">
							<p>그닥 맛있진 않네요. 그냥저냥 먹을만 해요....</p>
							</div>	
							
						
				</div>
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