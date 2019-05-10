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
							<a href="#layer1" id="addEvent" class="user-btn btn-example">등록</a>
						</div>
						<div class="col-md-12 tab_con" id="tab_con">
							<div class="eventBox"> <!-- 진행중인 이벤트 내용 -->
								<c:forEach var="event" items="${eventList}">
									<div class="col-md-6 max-width event"> <!-- 행당 2개 이벤트 배치 -->
										<div class="manageEvent">
											<div>
												<a href="#layer2" class="btn-example2">
													<img src="${pageContext.request.contextPath}/resources/image/icon/edit-property-16.png"/>
												</a>
											</div>
											<div class="delete">
												<img src="${pageContext.request.contextPath}/resources/image/icon/delete-16.png"/>
											</div>
										</div>
										
										<div class="eventItem">이벤트명</div>
										<div class="eventItemContent eventName">${event.event_name}</div>
										
										<div class="eventItem">기간</div>
										<div class="eventItemContent">${event.event_start} ${event.event_end}</div>
										
										<div class="eventItem">메뉴</div>
										<div class="eventItemContent">내용</div>
										
										<div class="eventItem">할인가격</div>
										<div class="eventItemContent">내용</div>
										
										<div class="eventItem">상세내용</div>
										<div class="eventItemContent">${event.event_content}</div>
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
										
										<div class="eventItem">메뉴</div>
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
	
	<!-- 이벤트 등록 딤처리 팝업 레이어(시작) -->
	<div class="dim-layer">
		<div class="dimBg"></div>
		<div id="layer1" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<div class="ctxt mb20">
						<div class="addEventTitle">이벤트 등록</div>
							<form action="">
							<div id="upload">
								<div id="previewId">
									<div id="imgControlBox">
										<input type="file" id="uploadImg" name="uploadImg" onchange="previewImage(this,'previewId'); fileCheck(this);" accept=".jpg, .jpeg, .png, .gif, .bmp"/>
										<img class="imgUploadBtn" src="${pageContext.request.contextPath}/resources/image/icon/upload.png"/>
										<img id="setDefaultBtn" class="setDefaultBtn" src="${pageContext.request.contextPath}/resources/image/icon/defaultimgbtn.png"/>
										<img id="delUploadImg" class="delUploadImg" src="${pageContext.request.contextPath}/resources/image/icon/delete.png"/>
									</div>
									<img id="noImage" src="${pageContext.request.contextPath}/resources/image/seller/event/noimage.png"/>
									<img id="defaultImg" src="${pageContext.request.contextPath}/resources/image/seller/event/defaultimg.png"/>
								</div>
							</div>
							<table id="table">
								<tr>
									<td class="titleStyle" valign="top"><label class="labelStyle" for="eventName">이벤트명</label></td>
									<td class="contentStyle" valign="top"><input type="text" id="eventName" name="eventName" required/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">기간</label></td>
									<td valign="top">
										<input type="datetime-local" id="beginDate" class="date" name="beginDate"/>
										<span>~</span>
										<input type="datetime-local" id="endDate" class="date" name="endDate" required/>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="target">대상</label></td>
									<td valign="top"><input type="text" id="target" name="target" required/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">메뉴</label></td>
									<td valign="top" class="menuWrapper">
										<div>
											<div class="menuWidth menuCol">이름</div>
											<div class="menuWidth2 menuCol">단가(원)</div>
											<div class="menuWidth2 menuCol">할인액(원)</div>
											<div class="menuWidth2 menuCol">할인가(원)</div>
										</div>
										<div id="pre_set" style="display: none; float:top;">
											<select class="menuWidth" name="menu1" onchange="changeAttr(this);" required>
												<option value="" selected>&nbsp;&nbsp;------- 메뉴 -------</option>
												<c:forEach var="i" items="${menuList}">
													<option value="${i.menu_code}">${i.menu_name}</option>
												</c:forEach>
											</select>
											<input type="text" class="menuWidth2" name="price" placeholder="단가" disabled/>
											<input type="number" class="menuWidth2" name="discount" placeholder="할인액" onKeyUp="showDiscResult(this);" onkeypress="return digit_check(event);" required disabled/>
											<input type="text" class="menuWidth2" name="dResult" placeholder="할인가" required disabled/>
											<a href="#" class="deleteMenuBtn" onclick="remove_item(this)">
												<img class="deleteMenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/deletemenu.svg"/>
												<img class="deleteMenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/deletemenu2.svg"/>
											</a>
										</div>

										<div id="field">
											<div id="default">
												<select class="menuWidth" name="menu1" onchange="changeAttr(this);" required>
													<option value="" selected>&nbsp;&nbsp;------- 메뉴 -------</option>
													<c:forEach var="i" items="${menuList}">
														<option value="${i.menu_code}">${i.menu_name}</option>
														
													</c:forEach>
												</select>
												<input type="text" class="menuWidth2" name="price" placeholder="단가" disabled/>
												<input type="number" class="menuWidth2" name="discount" placeholder="할인액" onKeyUp="showDiscResult(this.value);" onkeypress="return digit_check(event);" required disabled/>
												<input type="text" class="menuWidth2" name="dResult" placeholder="할인가" required disabled/>
											</div>
										</div>
										<c:forEach var="i" items="${menuList}">
											<input id="${i.menu_code}" type="hidden" value="${i.unit_price}"/>
										</c:forEach>
										<a href="#" class="addmenuBtn" onclick="add_item()">
											<img class="addmenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/addmenu.svg"/> <!-- 기본 -->
											<img class="addmenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/addmenu2.svg"/> <!-- 마우스오버 -->
										</a>
										<br>
										
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="details">상세내용</label></td>
									<td valign="top">
										<textarea id="details" name="details" required onFocus="clearMessage(this.form);" onKeyUp="checkByte(this.form);">내용을 입력해 주세요.
										</textarea>
										<div class="showByte">
											<input type="text" name="messagebyte" value="0" size="1" maxlength="2" readonly>
											<font color="#000000">/ 1000 byte</font>
										</div>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">결제수단</label></td>
									<td class="color666" valign="top">
										<div><input type="checkbox" id="pCash" name="payment" value="cash"/> 현금</div>
										<div><input type="checkbox" id="pCard" name="payment" value="card"/> 카드</div>
										<div><input type="checkbox" id="pKakao" name="payment" value="kakaoPay"/> 카카오페이</div>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">중복적용</label></td>
									<td class="color666" valign="top">
										<div><input type="radio" name="duplicate" value="1"/> 가능</div>
										<div><input type="radio" name="duplicate" value="0"/> 불가</div>
									</td>
								</tr>
							</table>
						</form>
						<div class="btn-r fixedStyle">
							<button id="addEventBtn" class="btnCommonStyle">등록</button>
							<button class="btnCommonStyle resetBtn">리셋</button>
							<button id="cancelAdd" class="btnCommonStyle btn-layerClose">취소</button>
						</div>
					</div>
					<div class="blankBox"></div>
					<!--// content-->
				</div>
			</div>
		</div>
	</div>
	<!-- 이벤트 등록 딤처리 팝업 레이어(끝) -->
	
	<!-- 이벤트 수정 딤처리 팝업 레이어(시작) -->
	<div class="dim-layer2">
		<div class="dimBg2"></div>
		<div id="layer2" class="pop-layer2">
			<div class="pop-container2">
				<div class="pop-conts2">
					<!--content //-->
					<div class="ctxt2 mb202">
						<div class="editEventTitle">이벤트 수정</div>
						<div class="deleteEventDiv">
							<img id="deleteEvent" src="${pageContext.request.contextPath}/resources/image/icon/deleteevent.svg"/>
						</div>
						<form action="">
							<div id="upload">
								<div id="previewId2">
									<div id="imgControlBox2">
										<input type="file" id="uploadImg2" name="uploadImg2" onchange="previewImage2(this,'previewId2'); fileCheck(this);" accept=".jpg, .jpeg, .png, .gif, .bmp"/>
										<img class="imgUploadBtn2" src="${pageContext.request.contextPath}/resources/image/icon/upload.png"/>
										<img id="setDefaultBtn2" class="setDefaultBtn" src="${pageContext.request.contextPath}/resources/image/icon/defaultimgbtn.png"/>
										<img id="delUploadImg2" class="delUploadImg" src="${pageContext.request.contextPath}/resources/image/icon/delete.png"/>
									</div>
									<img id="noImage2" src="${pageContext.request.contextPath}/resources/image/seller/event/noimage.png"/>
									<img id="defaultImg2" src="${pageContext.request.contextPath}/resources/image/seller/event/defaultimg.png"/>
								</div>

							</div>
							<table id="table">
									
								<tr>
									<td class="titleStyle" valign="top"><label class="labelStyle" for="eventName">이벤트명</label></td>
									<td class="contentStyle" valign="top"><input type="text" id="eventName" name="eventName" required/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">기간</label></td>
									<td valign="top">
										<input type="datetime-local" id="beginDate" class="date" name="beginDate"/>
										<span>~</span>
										<input type="datetime-local" id="endDate" class="date" name="endDate" required/>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="target">대상</label></td>
									<td valign="top"><input type="text" id="target" name="target" required/></td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">메뉴</label></td>
									<td valign="top">
										<div id="pre_set2" style="display: none; float:top;">
											<select class="menuWidth" name="menu1" onchange="changeAttr(this);" required>
												<option value="" selected>메뉴</option>
												<option value="menu1">메뉴1</option>
												<option value="menu2">메뉴2</option>
												<option value="menu3">메뉴3</option>
											</select>
											<input type="text" class="menuWidth" name="price" placeholder="단가" disabled/>
											<input type="text" class="menuWidth" name="discount" placeholder="할인액" required disabled/>
											<a href="#" class="deleteMenuBtn" onclick="remove_item2(this)">
												<img class="deleteMenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/deletemenu.svg"/>
												<img class="deleteMenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/deletemenu2.svg"/>
											</a>
										</div>

										<div id="field2">
											<div>
												<select class="menuWidth" name="menu1" onchange="changeAttr(this);" required>
													<option value="" selected>메뉴</option>
													<option value="menu1">메뉴1</option>
													<option value="menu2">메뉴2</option>
													<option value="menu3">메뉴3</option>
												</select>
												<input type="text" class="menuWidth" name="price" placeholder="단가" disabled/>
												<input type="text" class="menuWidth" name="discount" placeholder="할인액" required disabled/>
											</div>
										</div>
										<a href="#" class="addmenuBtn" onclick="add_item2()">
											<img class="addmenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/addmenu.svg"/> <!-- 기본 -->
											<img class="addmenuBtnImg" src="${pageContext.request.contextPath}/resources/image/icon/addmenu2.svg"/> <!-- 마우스오버 -->
										</a>
										<br>
										
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle" for="details">상세내용</label></td>
									<td valign="top">
										<textarea id="details" name="details" required onFocus="clearMessage(this.form);" onKeyUp="checkByte(this.form);">내용을 입력해 주세요.
										</textarea>
										<div class="showByte">
											<input type="text" name="messagebyte" value="0" size="1" maxlength="2" readonly>
											<font color="#000000">/ 1000 byte</font>
										</div>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">결제수단</label></td>
									<td class="color666" valign="top">
										<div><input type="checkbox" name="payment" value="cash"/> 현금</div>
										<div><input type="checkbox" name="payment" value="card"/> 카드</div>
										<div><input type="checkbox" name="payment" value="kakaoPay"/> 카카오페이</div>
									</td>
								</tr>
								<tr>
									<td valign="top"><label class="labelStyle">중복적용</label></td>
									<td class="color666" valign="top">
										<div><input type="radio" name="duplicate" value="yes"/> 가능</div>
										<div><input type="radio" name="duplicate" value="no"/> 불가</div>
									</td>
								</tr>
							</table>
						</form>
						<div class="btn-r fixedStyle">
							<button id="editEventBtn" class="btnCommonStyle" onclick="editEventBtn();">수정</button>
							<button class="btnCommonStyle resetBtn">리셋</button>
							<button id="cancelEdit" class="btnCommonStyle btn-layerClose">취소</button>
						</div>
					</div>
					<div class="blankBox"></div>
					<!--// content-->
				</div>
			</div>
		</div>
	</div>
	<!-- 이벤트 수정 딤처리 팝업 레이어(끝) -->
</body>
