<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/menu/menu.css"/>" />
<head>
<title>당신의 푸드트럭</title>
<script type="text/javascript"
	src="<c:url value="/resources/js/seller/menu/menu.js"/>"></script>
</head>
<body>
	<div class="container mw1650">
		<div class="row">
			<div class="col-md-2 mgt50">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div id="with" class="col">
					<h1 class="menuTitle">메뉴관리</h1>
					<br>
					<div class="album bg-light"
						style="height: 80%; overflow-y: auto;">
						<div class="container">
							
								<div id="menuBtns">
									<button id="addMenu" class="user-btn">등록</button>
									<button id="chkAllMenu" class="user-btn hideBtn">전체선택</button>
									<button id="unchkAllMenu" class="user-btn hideBtn">전체해제</button>
									<button id="delMenu" class="user-btn">삭제</button>
									<button id="delMenu2" class="user-btn hideBtn">삭제</button>
									<button id="goBack" class="user-btn hideBtn">취소</button>
								</div>
								
								<div class="row">
								<ul class="tab paddingZero" id="tab">
									<li>한식</li>
									<li>중식</li>
									<li>일식</li>
									<li>분식</li>
									<li>기타</li>
								</ul>
							</div>
							<div class="row">
							<div class="tab_con" id="tab_con">
								<div class="menuBox">
									<div class="container">
										<div class="row mbox">
											<c:forEach var="i" items="${menuNum}">
												<c:if test="${i.menu_category ==1}">
													<div class="col-md-2 menuf menuss">
														<div class="menut">
															<div class="imgBox">
																<img class="img editMenu changeToBlock"
																	src="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
															</div>
															<div class="changeToBlock">${i.menu_name }</div>
															<div class="changeToBlock">${i.unit_price }원</div>
															<input name="menu_code" type="hidden"
																value="${i.menu_code}" /> <input type="hidden"
																value="${i.menu_category}" /> <input type="hidden"
																value="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
														</div>
														<div class="delChk">
															<input type="checkbox" name="delChk"
																class="delChk${i.menu_category} delChk" value="" />
															<div class="status${i.menu_category} status"
																style="display: inline-block">선택해제됨</div>
															<input type="hidden" value="${i.menu_code}" />
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="menuBox">
									<div class="container">
										<div class="row mbox">
											<c:forEach var="i" items="${menuNum}">
												<c:if test="${i.menu_category ==2}">
													<div class="col-md-4 menuf menuss">
														<div class="menut">
															<div class="imgBox">
																<img class="img editMenu changeToBlock"
																	src="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
															</div>
															<div class="changeToBlock">${i.menu_name }</div>
															<div class="changeToBlock">${i.unit_price }원</div>
															<input name="menu_code" type="hidden"
																value="${i.menu_code}" /> <input type="hidden"
																value="${i.menu_category}" /> <input type="hidden"
																value="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
														</div>
														<div class="delChk">
															<input type="checkbox" name="delChk" id=""
																class="delChk${i.menu_category} delChk" value="" />
															<div class="status${i.menu_category} status"
																style="display: inline-block">선택해제됨</div>
															<input type="hidden" value="${i.menu_code}" />
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="menuBox">
									<div class="container">
										<div class="row mbox">
											<c:forEach var="i" items="${menuNum}">
												<c:if test="${i.menu_category ==3}">
													<div class="col-md-4 menuf menuss">
														<div class="menut">
															<div class="imgBox">
																<img class="img editMenu changeToBlock"
																	src="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
															</div>
															<div class="changeToBlock">${i.menu_name }</div>
															<div class="changeToBlock">${i.unit_price }원</div>
															<input name="menu_code" type="hidden"
																value="${i.menu_code}" /> <input type="hidden"
																value="${i.menu_category}" /> <input type="hidden"
																value="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
														</div>
														<div class="delChk">
															<input type="checkbox" name="delChk" id="${i}"
																class="delChk${i.menu_category} delChk" value="" />
															<div class="status${i.menu_category} status"
																style="display: inline-block">선택해제됨</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="menuBox">
									<div class="container">
										<div class="row mbox">
											<c:forEach var="i" items="${menuNum}">
												<c:if test="${i.menu_category ==4}">
													<div class="col-md-4 menuf menuss">
														<div class="menut">
															<div class="imgBox">
																<img class="img editMenu changeToBlock"
																	src="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
															</div>
															<div class="changeToBlock">${i.menu_name }</div>
															<div class="changeToBlock">${i.unit_price }원</div>
															<input name="menu_code" type="hidden"
																value="${i.menu_code}" /> <input type="hidden"
																value="${i.menu_category}" /> <input type="hidden"
																value="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
														</div>
														<div class="delChk">
															<input type="checkbox" name="delChk" id="${i}"
																class="delChk${i.menu_category} delChk" value="" />
															<div class="status${i.menu_category} status"
																style="display: inline-block">선택해제됨</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="menuBox">
									<div class="container">
										<div class="row mbox">
											<c:forEach var="i" items="${menuNum}">
												<c:if test="${i.menu_category ==5}">
													<div class="col-md-4 menuf menuss">
														<div class="menut">
															<div class="imgBox">
																<img class="img editMenu changeToBlock"
																	src="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
															</div>
															<div class="changeToBlock">${i.menu_name }</div>
															<div class="changeToBlock">${i.unit_price }원</div>
															<input name="menu_code" type="hidden"
																value="${i.menu_code}" /> <input type="hidden"
																value="${i.menu_category}" /> <input type="hidden"
																value="${pageContext.request.contextPath}/resources/image/upload/${i.menu_surl}" />
														</div>
														<div class="delChk">
															<input type="checkbox" name="delChk" id="${i}"
																class="delChk${i.menu_category} delChk" value="" />
															<div class="status${i.menu_category} status"
																style="display: inline-block">선택해제됨</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>