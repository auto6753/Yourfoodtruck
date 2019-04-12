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
							<div class="eventBox"> <!-- 진행중인 이벤트 내용 -->
								<c:forEach var="i" begin="1" end="${onGoingEventNum}">
									<div class="col-md-6 max-width event"> <!-- 행당 2개 이벤트 배치 -->
										<div class="manageEvent">
											<div class="edit">
												<img src="${pageContext.request.contextPath}/resources/image/icon/edit-property-16.png"/>
											</div>
											<div class="delete">
												<img src="${pageContext.request.contextPath}/resources/image/icon/delete-16.png"/>
											</div>
										</div>
										
										<div class="eventItem">이벤트명</div>
										<div class="eventItemContent eventName">내용 ${i}</div>
										
										<div class="eventItem">기간</div>
										<div class="eventItemContent">내용 ${i}</div>
										
										<div class="eventItem">메뉴</div>
										<div class="eventItemContent">내용 ${i}</div>
										
										<div class="eventItem">할인가격</div>
										<div class="eventItemContent">내용 ${i}</div>
										
										<div class="eventItem">상세내용</div>
										<div class="eventItemContent">내용 ${i}</div>
									</div>
								</c:forEach>
							</div>

							<div class="eventBox"> <!-- 종료된 이벤트 내용 -->
								<c:forEach var="i" begin="1" end="${endEventNum}">
									<div class="col-md-6 max-width event"> <!-- 행당 2개 이벤트 배치 -->
										<div class="manageEvent">
											<div class="edit">
												<img class="endEventEdit" src="${pageContext.request.contextPath}/resources/image/icon/edit-property-16.png"/>
											</div>
											<div class="delete">
												<img src="${pageContext.request.contextPath}/resources/image/icon/delete-16.png"/>
											</div>
										</div>
										
										<div class="eventItem">이벤트명</div>
										<div class="eventItemContent eventName">내용 ${i}</div>
										
										<div class="eventItem">기간</div>
										<div class="eventItemContent">내용 ${i}</div>
										
										<div class="eventItem">메뉴명</div>
										<div class="eventItemContent">내용 ${i}</div>
										
										<div class="eventItem">할인가격</div>
										<div class="eventItemContent">내용 ${i}</div>
										
										<div class="eventItem">상세내용</div>
										<div class="eventItemContent">내용 ${i}</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>