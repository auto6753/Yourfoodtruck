<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.carousel-item {
	height: 65vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

#top-right {
	text-align: right;
}

#top-right {
	margin-top: 50px;
	margin-left: 26%;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">당신의 푸드트럭!</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item active"><a class="nav-link" href="#">트럭소개
							<span class="sr-only">(current)</span>
					</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">트럭검색</a></li>
					<li class="nav-item"><a class="nav-link" href="#">모집공고</a></li>
					<li class="nav-item"><a class="nav-link" href="#">앱 다운로드</a></li>
					<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
				</ul>
				<div id="top-right">
					<span id="login" class="badge badge-light"><a href="login">로그인</a></span>
					<span class="badge badge-light"><a href="#">회원가입</a></span>
				</div>
			</div>

		</div>
	</nav>
</body>
</html>