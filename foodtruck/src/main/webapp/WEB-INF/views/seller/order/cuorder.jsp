<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>주문관리</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/news/news.css"/>" />

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.min.js"/>"></script>

</head>
<style>
#logo {
	text-align: center;
	font-weight: bold;
	font-size: 290%;
}

div a {
	color: rgb(255, 94, 24);
}

#box {
	border: 2px solid;
	color: rgb(255, 94, 24);
	width: 70%;
	margin: 0 auto;
	margin-top: 60px;
}

#click {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 49.9%;
	float: left;
}

#click2 {
	background-color: rgb(255, 94, 24);
	color: white;
	width: 49.9%;
	float: right;
}

#foodlist button {
	width: 35%;
	height: 0;
	padding-bottom: 10%;
	align: center;
}

#foodlist {
	margin-top: 50px;
	width: 100%;
}
</style>

<body>
	<div id="logo">
		<a href="/project/rehome">당신의 푸드트럭</a>
	</div>
	<div>
		<div id="box">
			<button id="click" class="btn">food</button>
			<button id="click2" class="btn">drink</button>

			<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
				<h4 id="fat">@fat</h4>
				<p>...</p>
				<h4 id="mdo">@mdo</h4>
				<p>...</p>
				<h4 id="one">one</h4>
				<p>...</p>
				<h4 id="two">two</h4>
				<p>...</p>
				<h4 id="three">three</h4>
				<p>...</p>
				<!-- <div id="foodlist">
				<button >음식1</button>
				<button>음식2</button> -->
			</div>

		</div>
	</div>



	</div>
</body>
</html>