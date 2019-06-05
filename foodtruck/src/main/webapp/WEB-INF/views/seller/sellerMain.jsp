<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/sellerMain.css"/>">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/seller/sellerMain.js"/>"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-xs-12 col-md-9 content">
				<h1>매출관리</h1>
				<iframe src="/seller/mngSales" style="width: 100%; height: 50%; border: 1px lightgray solid;"></iframe>
				
				<h1>탑승자관리</h1>
				<div id="Line_Controls_Chart2">
					<!-- 라인 차트 생성할 영역 -->
					<div id="lineChartArea2" style="padding: 0px 20px 0px 0px;"></div>
					<!-- 컨트롤바를 생성할 영역 -->
					<div id="controlsArea2" style="padding: 0px 20px 0px 0px;"></div>
				</div>
			</div>
		</div>
	</div>
</body>