<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/event/event.css"/>" />
<head>
<title>이벤트관리</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/seller/event/event.js"/>"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-xs-12 col-md-9 content">
				<div class="container">
					<div class="row">
						<div class="col-md-12 eventBar paddingZero">
							<ul class="tab paddingZero" id="tab">
								<li>진행중인 이벤트</li>
								<li>종료된 이벤트</li>
							</ul>
							<button id="addEvent" class="user-btn">등록</button>
						</div>
						<div class="col-md-12 tab_con" id="tab_con">
							<div class="eventBox">1st Contents</div>
							<div class="eventBox">2nd Contents</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>