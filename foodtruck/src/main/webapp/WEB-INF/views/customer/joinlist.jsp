<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<link rel="stylesheet"
	href="<c:url value ="/resources/css/customercss/callList.css"/>" />
<style>
</style>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/customer/join.js"></script>
<script type="text/javascript"
	src="/resources/js/seller/jquery.ajax-cross-origin.min.js"></script>
<script>
	$(document).ready(function() {
				var a = ${list};
				console.log(a);
				a = JSON.parse(a);
				for (var i = 0; i < a.length; i++) {
					var day = a[i].request_regdate.date;
					var month = a[i].request_regdate.month + 1;

					var year = "" + a[i].request_regdate.year;
					year = year.substr(1);

					/* var smonth = a[i].request_start.month + 1;
					var emonth = a[i].request_end.month + 1;
					var sday = a[i].request_start.date;
					var eday = a[i].request_end.date;
					
					var start = smonth + "/" + sday;
					var end = emonth + "/" + eday;
					
					var startend = start + "~"+end; */
					//str.substr( 3 )
					//console.log(year);
					var start = a[i].request_start;
					var end = a[i].request_end;
					start = start.substr(2, 8); //날짜 서브스트링
					start = start.replace(/\-/g, "/");
					console.log(start.replace(/\-/g, ""));

					end = end.substr(2, 8); //날짜 서브스트링
					end = end.replace(/\-/g, "/");
					console.log(end);
					var status;

					var startend = start + "~" + end;
					var date = year + "/" + month + "/" + day;

					var tr = $("<tr></tr>");

					$("<td></td>").text(date).appendTo(tr);
					//$("<input />").text(a[i].request_data_code).addClass('truck_code').appendTo(tr);
					$("<td></td>").text(a[i].request_title).appendTo(tr);
					$("<td></td>").text(startend).appendTo(tr);
					$("<td></td>").text(a[i].request_truck_count + "명")
							.appendTo(tr);
					if (a[i].request_status == 0) {
						//status = "모집중";
						var c = $("<td></td>").text("모집중").appendTo(tr);
						$("<button></button>").text("목록").addClass(
								"request_code").appendTo(c);
						$("<input />").attr({
							value : a[i].request_code,
							type : 'hidden'
						}).appendTo(c);
					} else {
						var c = $("<td></td>").text("마감").appendTo(tr);
						$("<input />").attr({
							value : a[i].request_code,
							type : 'hidden'
						}).appendTo(c);
					}
					//var c = $("<td></td>").text(status).appendTo(tr);
					//$("<button></button>").text("신청중").appendTo(c);
					$("<td></td>").text()

					$("#tbody").append(tr);
				}
			});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<jsp:include page="sideMenuBar.jsp"></jsp:include>
			</div>
			<div class="col-md-9">
				<div id="with" class="col">
					<h1 id="bb" style="text-align: center; padding-top: 20px;">모집공고
						작성 내역</h1>
					<br>
					<table class="table table-hover" class="col">
						<tr>
							<th>날짜</th>
							<th>제목</th>
							<th>모집기간</th>
							<th>신청현황</th>
							<th>모집상태</th>
							<th>D-day</th>
						</tr>
						<tbody id="tbody">
							<!-- <tr>
					<td>19/7/15</td>
					<td>OO 행사 푸드트럭 모집</td>
					<td>1/15~1/16</td>
					<td>3명</td>
					<td>진행중
						<button class="list">신청 목록</button> <input type="hidden" value="19071900018">
					</td>
					<td>3 일후에 종료됩니다.</td>
				</tr> -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>