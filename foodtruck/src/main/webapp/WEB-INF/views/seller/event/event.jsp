<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value="/resources/css/seller/event/event.css"/>" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
<head>
<script>
var projPath = "${pageContext.request.contextPath}";
</script>
<title>당신의 푸드트럭</title>
<script type="text/javascript">
	var projPath = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript"
	src="<c:url value="/resources/js/seller/event/event.js"/>"></script>
	
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

	<div class="container mw1650">
		<div class="row">
			<div class="col-md-2 mgt50">
				<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-10">
				<div id="with" class="col">
					<h1 class="menuTitle">이벤트등록</h1>
					<br>
					<div class="album py-5 bg-light"
						style="height: 80%; overflow-y: hidden;">
						<div class="container">
							<div class="row">
								<div class="col-md-12 eventBar paddingZero">
									<ul class="tab paddingZero" id="tab">
										<li>진행중인 이벤트</li>
										<li>종료된 이벤트</li>
									</ul>
									<button id="opener" class="user-btn btn-example">등록</button>
								</div>
								<div class="col-md-12 tab_con" id="tab_con">
									<div class="eventBox">
										<!-- 진행중인 이벤트 내용 -->
										<c:forEach var="event" items="${eventList}" varStatus="status">
											<c:if test="${curTime <= eventEndLong[status.index]}">
												<div class="col-md-6 max-width event">
													<!-- 행당 2개 이벤트 배치 -->
													<div class="manageEvent">
														<div>
															<button class=" opener2 btn-example2 edit" style="background: none; border: 0"> <img
																src="${pageContext.request.contextPath}/resources/image/icon/edit-property-16.png" />
															</button>
															<input id="eCode" class="eCode delEvent" type="hidden"
														value="${event.event_code}"/>
														</div>
														<div class="delete">
															<img
																src="${pageContext.request.contextPath}/resources/image/icon/delete-16.png" />
														</div>
													</div>
													
													<div class="eventItem">이벤트명</div>
													<div class="eventItemContent eventName">${event.event_name}</div>

													<div class="eventItem">기간</div>
													<div class="eventItemContent">
														<fmt:formatDate value="${event.event_start }"
															pattern="yyyy.MM.dd" />
														~
														<fmt:formatDate value="${event.event_end }"
															pattern="yyyy.MM.dd" />
													</div>

													<div class="eventItem">메뉴</div>
													<div class="eventItemContent">
														<c:set var="eventCode" value="${event.event_code}"></c:set>
														<c:forEach var="eventMenuList" items="${eventMenuList}"
															varStatus="status">
															<c:set var="eventCodes"
																value="${eventMenuList.event_code}"></c:set>
															<c:if test="${eventCodes == eventCode}">
																<c:out value="${eventMenuList.menu_name}"></c:out>
															</c:if>
														</c:forEach>
													</div>

													<div class="eventItem">할인가격</div>
													<div class="eventItemContent">
														<c:set var="eventCode" value="${event.event_code}"></c:set>
														<c:forEach var="eventMenuList" items="${eventMenuList}"
															varStatus="status">
															<c:set var="eventCodes"
																value="${eventMenuList.event_code}"></c:set>
															<c:if test="${eventCodes == eventCode}">
																<c:out value="${eventMenuList.discount}"></c:out>
															</c:if>
														</c:forEach>
													</div>

													<div class="eventItem">상세내용</div>
													<div class="eventItemContent">${event.event_content}</div>
												</div>
											</c:if>
										</c:forEach>
									</div>

									<div class="eventBox">
										<!-- 종료된 이벤트 내용 -->
										<c:forEach var="event" items="${eventList}" varStatus="status">
											<c:if test="${curTime > eventEndLong[status.index]}">
												<div class="col-md-6 max-width event">
													<!-- 행당 2개 이벤트 배치 -->
													<div class="manageEvent">
														<div class="edit">
															<img class="endEventEdit"
																src="${pageContext.request.contextPath}/resources/image/icon/edit-property-16.png" />
														</div>
														<div class="delete">
															<img
																src="${pageContext.request.contextPath}/resources/image/icon/delete-16.png" />
														</div>
													</div>
													<input class="delEvent" type="hidden"
														value="${event.event_code}" />
													<div class="eventItem">이벤트명</div>
													<div class="eventItemContent eventName">${event.event_name}</div>

													<div class="eventItem">기간</div>
													<div class="eventItemContent">
														<fmt:formatDate value="${event.event_start }"
															pattern="yyyy.MM.dd" />
														~
														<fmt:formatDate value="${event.event_end }"
															pattern="yyyy.MM.dd" />
													</div>

													<div class="eventItem">메뉴</div>
													<div class="eventItemContent">
														<c:set var="eventCode" value="${event.event_code}"></c:set>
														<c:forEach var="eventMenuList" items="${eventMenuList}"
															varStatus="status">
															<c:set var="eventCodes"
																value="${eventMenuList.event_code}"></c:set>
															<c:if test="${eventCodes == eventCode}">
																<c:out value="${eventMenuList.menu_name}"></c:out>
															</c:if>
														</c:forEach>
													</div>

													<div class="eventItem">할인가격</div>
													<div class="eventItemContent">
														<c:set var="eventCode" value="${event.event_code}"></c:set>
														<c:forEach var="eventMenuList" items="${eventMenuList}"
															varStatus="status">
															<c:set var="eventCodes"
																value="${eventMenuList.event_code}"></c:set>
															<c:if test="${eventCodes == eventCode}">
																<c:out value="${eventMenuList.discount}"></c:out>
															</c:if>
														</c:forEach>
													</div>

													<div class="eventItem">상세내용</div>
													<div class="eventItemContent">${event.event_content}</div>
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

	<!-- 이벤트 등록 딤처리 팝업 레이어(시작) -->
<div id="dialog" title="이벤트 등록">
						<form action="">
							<div id="upload">
								<div id="previewId">
									<div id="imgControlBox">
										<input type="file" id="uploadImg" name="uploadImg"
											onchange="previewImage(this,'previewId'); fileCheck(this);"
											accept=".jpg, .jpeg, .png, .gif, .bmp" /> <img
											class="imgUploadBtn"
											src="${pageContext.request.contextPath}/resources/image/icon/upload.png" />
										<img id="setDefaultBtn" class="setDefaultBtn"
											src="${pageContext.request.contextPath}/resources/image/icon/defaultimgbtn.png" />
										<img id="delUploadImg" class="delUploadImg"
											src="${pageContext.request.contextPath}/resources/image/icon/delete.png" />
									</div>
									<img id="noImage"
										src="${pageContext.request.contextPath}/resources/image/seller/event/noimage.png" />
									<img id="defaultImg"
										src="${pageContext.request.contextPath}/resources/image/seller/event/defaultimg.png" />
									
								</div>
							</div>
							<table id="table">
								<tr>
									<td class="titleStyle" valign="top"><label
										class="labelStyle" for="eventName">이벤트명</label></td>
									<td class="contentStyle" valign="top"><input type="text"
										id="eventName" name="eventName" maxlength="50"/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">기간</label></td>
									<td valign="top"><input type="datetime-local"
										id="beginDate" class="date" name="beginDate" style="width:40%"/> <span>~</span>
										<input type="datetime-local" id="endDate" class="date"
										name="endDate" style="width:40%"/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="target" >대상</label></td>
									<td valign="top"><input type="text" id="target"
										name="target"  maxlength="30"></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">메뉴</label></td>
									<td valign="top" class="menuWrapper">
										<div>
											<div class="categoryW menuCol">종류</div>
											<div class="menuWidth menuCol">이름</div>
											<div class="menuWidth2 menuCol">단가(원)</div>
											<div class="menuWidth2 menuCol">할인액(원)</div>
											<div class="menuWidth2 menuCol">할인가(원)</div>
										</div>
										
										
										
										<select id="allMenu" name="allMenu" style="display: none;">
											<option value="" selected>&nbsp;&nbsp;--메뉴--</option>
											<c:forEach var="i" items="${menuList}">
												<option value="${i.menu_code}">${i.menu_name}</option>
											</c:forEach>
										</select>

										<div id="pre_set" style="display: none; float: top;">
										<select class="categoryW selectCat" name="menu1">
													<option value="" selected>&nbsp;&nbsp;종류</option>
													<option value="1">한식</option>
													<option value="2">중식</option>
													<option value="3">일식</option>
													<option value="4">분식</option>
													<option value="5">기타</option>
										</select>
										
											<select class="menuWidth selectmenu" name="menu1" onchange="return changeAttr(this);" >
												<option value='' selected>&nbsp;&nbsp;--메뉴--</option>
											</select>
											
											<input type="text" class="menuWidth2" name="price"
													placeholder="단가" disabled /> <input type="text"
													class="menuWidth2 discount" name="discount" placeholder="할인액"
													onKeyUp="showDiscResult(this); removeChar(event);"
													onkeypress="return onlyNumber(event);" disabled />
											<input type="text" class="menuWidth2" name="dResult"
												placeholder="할인가"  disabled /> <a href="#"
												class="deleteMenuBtn" onclick="remove_item(this)"> <img
												class="deleteMenuBtnImg"
												src="${pageContext.request.contextPath}/resources/image/icon/deletemenu.svg" />
												<img class="deleteMenuBtnImg"
												src="${pageContext.request.contextPath}/resources/image/icon/deletemenu2.svg" />
											</a>
										</div>
										
										<div id="menuCats" style="display:none;">
											<input type="hidden" class="catVal" value="0"/>
											<c:forEach var="i" items="${menuList}">
												<input type="hidden" class="catVal" value="${i.menu_category}"/>
											</c:forEach>
										</div>
										
										<div id="field" style="overflow-y:scroll">
											<div id="default">
											<select class="categoryW selectCat" name="menu1">
													<option value="" selected>&nbsp;&nbsp;종류</option>
													<option value="1">한식</option>
													<option value="2">중식</option>
													<option value="3">일식</option>
													<option value="4">분식</option>
													<option value="5">기타</option>
										</select>
										
											<select class="menuWidth selectmenu" name="menu1" onchange="return changeAttr(this);" >
												<option value='' selected>&nbsp;&nbsp;--메뉴--</option>
											</select> <input type="text" class="menuWidth2" name="price"
													placeholder="단가" disabled /> <input type="text"
													class="menuWidth2 discount" name="discount" placeholder="할인액"
													onKeyUp="showDiscResult(this); removeChar(event);"
													onkeypress="return onlyNumber(event);" disabled />
												<input type="text" class="menuWidth2" name="dResult"
													placeholder="할인가"  disabled />
											</div>
										</div> <c:forEach var="i" items="${menuList}">
											<input id="${i.menu_code}" type="hidden"
												value="${i.unit_price}" />
										</c:forEach> <a href="#" class="addmenuBtn" onclick="add_item()"> <img
											class="addmenuBtnImg"
											src="${pageContext.request.contextPath}/resources/image/icon/addmenu.svg" />
											<!-- 기본 --> <img class="addmenuBtnImg"
											src="${pageContext.request.contextPath}/resources/image/icon/addmenu2.svg" />
											<!-- 마우스오버 -->
									</a> <br>

									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="details">상세내용</label></td>
									<td valign="top"><textarea id="details" name="details"
									onKeyUp="checkByte(this.form);" placeholder="내용을 입력해 주세요."></textarea>
										<div class="showByte">
											<input type="text" id="messagebyte" name="messagebyte" value="0" size="1"
												maxlength="2" readonly> <font color="#000000">/
												600 byte</font>
											<input id="checkDetails" type="hidden" value="0"/>
										</div></td>
										
										
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">결제수단</label></td>
									<td class="color666" valign="top">
										<div>
											<input type="checkbox" id="pCash" name="payment" value="cash" />
											현금
										</div>
										<div>
											<input type="checkbox" id="pCard" name="payment" value="card" />
											카드
										</div>
										<!-- <div>
											<input type="checkbox" id="pKakao" name="payment"
												value="kakaoPay" /> 카카오페이
										</div> -->
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">중복적용</label></td>
									<td class="color666" valign="top">
										<div>
											<input id="duplicate1" type="radio" name="duplicate" value="1" /> 가능
										</div>
										<div>
											<input id="duplicate0" type="radio" name="duplicate" value="0" /> 불가
										</div>
									</td>
								</tr>
							</table>
						
						<div class="btn-r">
							<button id="addEventBtn" class="btnCommonStyle">등록</button> 
							<input type="reset" id="resetBtn"  class="btnCommonStyle resetBtn" type="reset" value="리셋"/>
						</div>
						</form>
</div>

	<!-- 이벤트 등록 딤처리 팝업 레이어(끝) -->

	<!-- 이벤트 수정 딤처리 팝업 레이어(시작) -->
<div id="dialog2" title="이벤트 수정">
						<form action="">
							<div id="upload">
								<div id="previewId2">
									<div id="imgControlBox2">
										<input type="file" id="uploadImg2" name="uploadImg2"
											onchange="previewImage2(this,'previewId2'); fileCheck(this);"
											accept=".jpg, .jpeg, .png, .gif, .bmp" /> <img
											class="imgUploadBtn2"
											src="${pageContext.request.contextPath}/resources/image/icon/upload.png" />
										<img id="setDefaultBtn2" class="setDefaultBtn"
											src="${pageContext.request.contextPath}/resources/image/icon/defaultimgbtn.png" />
										<img id="delUploadImg2" class="delUploadImg"
											src="${pageContext.request.contextPath}/resources/image/icon/delete.png" />
									</div>
									<img id="noImage2"
										src="${pageContext.request.contextPath}/resources/image/seller/event/noimage.png" />
									<img id="defaultImg2"
										src="${pageContext.request.contextPath}/resources/image/seller/event/defaultimg.png" />
										<img id="uploadedImg" class="uploadedImg"/>
								</div>

							</div>
							<table id="table">

								<tr>
									<td class="titleStyle" valign="top"><label
										class="labelStyle" for="eventName">이벤트명</label></td>
									<td class="contentStyle" valign="top"><input type="text"
										id="eventName2" name="eventName" maxlength="50"/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">기간</label></td>
									<td valign="top"><input type="datetime-local"
										id="beginDate2" class="date" name="beginDate" style="width:40%"/> <span>~</span>
										<input type="datetime-local" id="endDate2" class="date"
										name="endDate" style="width:40%"/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="target" >대상</label></td>
									<td valign="top"><input type="text" id="target2"
										name="target"  maxlength="30"></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">메뉴</label></td>
									<td valign="top" class="menuWrapper">
										<div>
											<div class="categoryW menuCol">종류</div>
											<div class="menuWidth menuCol">이름</div>
											<div class="menuWidth2 menuCol">단가(원)</div>
											<div class="menuWidth2 menuCol">할인액(원)</div>
											<div class="menuWidth2 menuCol">할인가(원)</div>
										</div>
										
										
										
										<select id="allMenu2" name="allMenu" style="display: none;">
											<option value="" selected>&nbsp;&nbsp;--메뉴--</option>
											<c:forEach var="i" items="${menuList}">
												<option value="${i.menu_code}">${i.menu_name}</option>
											</c:forEach>
										</select>

										<div id="pre_set2" style="display: none; float: top;">
										<select class="categoryW selectCat" name="menu1">
													<option value="" selected>&nbsp;&nbsp;종류</option>
													<option value="1">한식</option>
													<option value="2">중식</option>
													<option value="3">일식</option>
													<option value="4">분식</option>
													<option value="5">기타</option>
										</select>
										
											<select class="menuWidth selectmenu2" name="menu1" onchange="return changeAttr2(this);" >
												<option value='' selected>&nbsp;&nbsp;--메뉴--</option>
											</select>
											
											<input type="text" class="menuWidth2" name="price"
													placeholder="단가" disabled /> <input type="text"
													class="menuWidth2 discount2" name="discount" placeholder="할인액"
													onKeyUp="showDiscResult(this); removeChar(event);"
													onkeypress="return onlyNumber(event);" disabled />
											<input type="text" class="menuWidth2" name="dResult"
												placeholder="할인가"  disabled /> <a href="#"
												class="deleteMenuBtn" onclick="remove_item2(this)"> <img
												class="deleteMenuBtnImg"
												src="${pageContext.request.contextPath}/resources/image/icon/deletemenu.svg" />
												<img class="deleteMenuBtnImg"
												src="${pageContext.request.contextPath}/resources/image/icon/deletemenu2.svg" />
											</a>
										</div>
										
										<div id="menuCats2" style="display:none;">
											<input type="hidden" class="catVal" value="0"/>
											<c:forEach var="i" items="${menuList}">
												<input type="hidden" class="catVal" value="${i.menu_category}"/>
											</c:forEach>
										</div>
										
										<div id="field2" style="overflow-y:scroll">
											<div id="default2">
											<select class="categoryW selectCat" name="menu1">
													<option value="" selected>&nbsp;&nbsp;종류</option>
													<option value="1">한식</option>
													<option value="2">중식</option>
													<option value="3">일식</option>
													<option value="4">분식</option>
													<option value="5">기타</option>
										</select>
										
											<select class="menuWidth selectmenu2" name="menu1" onchange="return changeAttr2(this);" >
												<option value='' selected>&nbsp;&nbsp;--메뉴--</option>
											</select> <input type="text" class="menuWidth2" name="price"
													placeholder="단가" disabled /> <input type="text"
													class="menuWidth2 discount2" name="discount" placeholder="할인액"
													onKeyUp="showDiscResult(this); removeChar(event);"
													onkeypress="return onlyNumber(event);" disabled />
												<input type="text" class="menuWidth2" name="dResult"
													placeholder="할인가"  disabled />
											</div>
										</div> <c:forEach var="i" items="${menuList}">
											<input id="${i.menu_code}" type="hidden"
												value="${i.unit_price}" />
										</c:forEach> <a href="#" class="addmenuBtn" onclick="add_item2()"> <img
											class="addmenuBtnImg"
											src="${pageContext.request.contextPath}/resources/image/icon/addmenu.svg" />
											<!-- 기본 --> <img class="addmenuBtnImg"
											src="${pageContext.request.contextPath}/resources/image/icon/addmenu2.svg" />
											<!-- 마우스오버 -->
									</a> <br>

									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="details">상세내용</label></td>
									<td valign="top"><textarea id="details2" name="details2"
									onKeyUp="checkByte2(this.form);" placeholder="내용을 입력해 주세요."></textarea>
										<div class="showByte">
											<input type="text" id="messagebyte2" name="messagebyte" value="0" size="1"
												maxlength="2" readonly> <font color="#000000">/
												600 byte</font>
											<input id="checkDetails2" type="hidden" value="0"/>
										</div></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">결제수단</label></td>
									<td class="color666" valign="top">
										<div>
											<input type="checkbox" id="pCash2" name="payment" value="cash" />
											현금
										</div>
										<div>
											<input type="checkbox" id="pCard2" name="payment" value="card" />
											카드
										</div>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">중복적용</label></td>
									<td class="color666" valign="top">
										<div>
											<input id="duplicate12" type="radio" name="duplicate" value="1" /> 가능
										</div>
										<div>
											<input id="duplicate02" type="radio" name="duplicate" value="0" /> 불가
										</div>
									</td>
								</tr>
							</table>
						
						<div class="btn-r">
							<button id="editEventBtn" class="btnCommonStyle">수정</button>
							<input type="reset" id="resetBtn2"  class="btnCommonStyle resetBtn" type="reset" value="리셋"/>
						</div>
						</form>
	</div>
						
	<!-- 이벤트 수정 딤처리 팝업 레이어(끝) -->
</body>
