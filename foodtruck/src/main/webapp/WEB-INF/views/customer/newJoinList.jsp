<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/customer/newjoin.js"></script>
<script>
	$(document).ready(
			function() {
				var a = '${list}';
				a = JSON.parse(a);
				console.log(a);
				console.log(a.length);
			

				//console.log(JSON.parse(a));
				//var c = JSON.parse(a);
				
				//console.log(a.length);
				//var b = JSON.parse(JSON.stringify(a));
				//console.log(b);
				//console.log(b.length);
				//console.log(JSON.parse(b));
				//console.log(a);
				if (a != "") {
					for (var i = 0; i < a.length; i++) {
	
						var day = a[i].request_data_regdate.date;
						var month = a[i].request_data_regdate.month+1;
						var year =""+a[i].request_data_regdate.year;
						year=year.substr(1);
						//str.substr( 3 )
						//console.log(year);
						
						var date = year+"."+month+"."+day;
						
						var tr = $("<tr></tr>");
						$("<td></td>").text(date).appendTo(tr);
						//$("<input />").text(a[i].request_data_code).addClass('truck_code').appendTo(tr);
						$("<td></td>").text(a[i].brandname).appendTo(tr);
						$("<td></td>").text(a[i].telephone).appendTo(tr);
						$("<input />").attr({value : "'"+a[i].request_truck_code+"'", type : 'hidden'}).addClass('truck_code').appendTo(tr);
						$("<input />").attr('type', 'radio').addClass('radio').appendTo(tr);
						$("#tbody").append(tr);

						//console.log(tr);

						//var request_data_code = $(a[i].request_data_code).appendTo("<td class='truck_code'></td>");
						//var brandname = $(a[i].brand_name).appendTo("<td></td>");
						//var telephone = $(a[i].telephone).appendTo("<td></td>");
						//var truck_code = $("<input type='hidden' value='"+a[i].truck_code+"'/>").appendTo("<td></td>");
						//var radio = $("<input class='radio' type='radio'>").appendTo("<td></td>");

						//var content = request_data_code + brandname + telephone + truck_code+radio;
						//console.log("d");
						//console.log(content);
						//alert(content);
						//$(content).appendTo("<tr></tr>");
						//$("#tbody").append(content);
					}
				} else {
					//	$.ajax({
					//		
					//	});
					alert("값없음");
				}
			});
</script>
<title>당신의 푸드트럭</title>
</head>
<body>
	<div>
		<table>
			<thead>
				<tr>
					<th>신청일</th>
					<th>푸드트럭</th>
					<th>전화번호</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody id="tbody">
<!-- 				<tr>
					<td>19.07.16</td>
					<td>씨푸드</td>
					<td>01044445555</td>
					<td><input type="radio" class="radio"></td>
				</tr>
				<tr>
					<td>19.07.16</td>
					<td>씨푸드</td>
					<td>01044445555</td>
					<td><input type="radio" class="radio"></td>
					
				</tr> -->
			</tbody>
		</table>
	</div>
	<div>
		<div style="float: right">
			<button id="choice">결정</button>
		</div>
	</div>
</body>
</html>