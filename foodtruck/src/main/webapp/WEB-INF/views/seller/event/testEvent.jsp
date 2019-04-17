<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
						<form>
							<table id="table">
								<tr>
									<td class="titleWidth80" valign="top"><label for="eventName">이벤트명</label></td>
									<td class="contentWidth" valign="top"><input type="text" id="eventName" name="eventName" required/></td>
									<td class="titleWidth130 rightItem" rowspan="4" valign="top"><label for="details">상세내용</label></td>
									<td class="contentWidth" rowspan="4" valign="top">
										<textarea id="details" name="details" required onFocus="clearMessage(this.form);" onKeyUp="checkByte(this.form);">내용을 입력해 주세요.
										</textarea>
										<div class="showByte">
											<input type="text" name="messagebyte" value="0" size="1" maxlength="2" readonly>
											<font color="#000000">/ 1000 byte</font>
										</div>
									<td class="hiddenCol"></td>
								</tr>
								<tr>
									<td class="titleWidth80" valign="top"><label>기간</label></td>
									<td class="contentWidth" valign="top">
										<input type="datetime-local" name="date"/><input type="datetime-local" name="date" required/>
									</td>
									<td class="hiddenCol"></td>
								</tr>
								<tr>
									<td class="titleWidth80" valign="top"><label for="target">대상</label></td>
									<td class="contentWidth" valign="top">
										<input type="text" id="target" name="target" required/>
									</td>
									<td class="hiddenCol"></td>
								</tr>
								<tr>
									<td class="titleWidth80" rowspan="3" valign="top"><label>메뉴</label></td>
									<td class="contentWidth" rowspan="3" valign="top">
										<div>
											<select class="menuWidth" name="menu1" required>
												<option value="" selected>-- 메뉴 --</option>
												<option value="menu1">메뉴1</option>
												<option value="menu2">메뉴2</option>
												<option value="menu3">메뉴3</option>
											</select>
											<input type="text" class="menuWidth" name="price" placeholder="판매가" disabled/>
											<input type="text" class="menuWidth" name="discount" placeholder="할인액" required disabled/>
										</div>
										<div>
											
										</div>


										<div id="pre_set" style="display: none; float:top;">
											<select class="menuWidth" name="menu1" required>
												<option value="" selected>-- 메뉴 --</option>
												<option value="menu1">메뉴1</option>
												<option value="menu2">메뉴2</option>
												<option value="menu3">메뉴3</option>
											</select>
											<input type="text" class="menuWidth" name="price" placeholder="판매가" disabled/>
											<input type="text" class="menuWidth" name="discount" placeholder="할인액" required disabled/>
											<input type="button" value="삭제" onclick="remove_item(this)">
										</div>

										<div id="field"></div> <input type="button" value="추가" onclick="add_item()"><br>
										
										
									</td>
									<td class="hiddenCol"></td>
								</tr>
								<tr>
									<td class="titleWidth130 rightItem" valign="top"><label>결제수단</label></td>
									<td class="contentWidth" valign="top">
										<div><input type="checkbox" name="payment" value="cash"/>현금</div>
										<div><input type="checkbox" name="payment" value="card"/>카드</div>
										<div><input type="checkbox" name="payment" value="kakaoPay"/>카카오페이</div>
									</td>
									<td class="hiddenCol"></td>
								</tr>
								<tr>
									<td class="titleWidth130 rightItem" valign="top"><label>중복적용</label></td>
									<td class="contentWidth" valign="top">
										<div><input type="radio" name="duplicate" value="yes"/>가능</div>
										<div><input type="radio" name="duplicate" value="no"/>불가</div>
									</td>
									<td class="hiddenCol"></td>
								</tr>
							</table>
						</form>
</body>
</html>