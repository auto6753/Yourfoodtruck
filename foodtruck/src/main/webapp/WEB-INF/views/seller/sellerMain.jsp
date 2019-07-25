<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head><title>당신의 푸드트럭</title></head>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/sellerMain.css"/>">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<body>
	<div class="container mw1650">
		<div class="row">
			<div class="col-md-2 mgt50">
				<jsp:include page="sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div id="with" class="col">
					<h1 class="menuTitle">매출관리</h1>
					<br>
					<div class="album py-5 bg-light" style="height: 80%; overflow-y: auto;">
						<div class="container">
							<div class="row">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	 <div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<div class="col-md-12 paddingZero">
					<div class="menuTitle">매출관리</div>
					</div>
					</div>
			<div class="col-xs-12 col-md-9 content" id="main1">
				<iframe src="/seller/salesToday" style="width: 100%; height: 550px; overflow-y:auto; position: relative; bottom: 100px;border: 2px lightgray solid;"></iframe>
			</div>
		</div>
	</div> 
</body>