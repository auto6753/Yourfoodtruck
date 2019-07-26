<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<title>당신의 푸드트럭</title>
</head>

<jsp:include page="../../header/header.jsp"></jsp:include>
<style>
@font-face {
	font-family: 'BMHANNAPro';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#cuorder, #seorder {
	display: inline-block;
	width: 50%;
}

.mw1650 {
	max-width: 1650px !important;
}

.mgt50 {
	margin-top: 50px;
}

#with {
	margin-top: 50px;
	height: 600px;
	font-family: 'yg-jalnan';
	border-radius: 10px;
	background-color: lightgray;
}

.menuTitle {
	text-align: center;
	padding-top: 20px;
}

.width50 {
	width: 50%;
	text-align: center;
}

.button {
	text-align: center;
}

.fs {
	font-size: 2.5em;
    margin-top: 3%;
}
</style>
<div class="container mw1650">
	<div class="row">
		<div class="col-md-2 mgt50">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-10">
			<div id="with" class="col">
				<h1 class="menuTitle">주문관리</h1>
				<br>
				<div class="album py-5 bg-light"
					style="height: 80%; overflow-y: auto;">
					<div class="container">
						<div class="row">
							<div class="button width50 col-md-6">
								<a href="cuorder?truck_code=${sessionScope.seller.truck_code}">
									<img src="/resources/image/현장고객용.png" id="cuorder" class="btn" />
								</a>
								<div class="fs">현장고객용</div>
							</div>
							<div class="button width50 col-md-6">
								<a href="seorder">
									<img src="/resources/image/현장상인용.png" id="seorder" class="btn" />
								</a>
								<div class="fs">현장상인용</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>