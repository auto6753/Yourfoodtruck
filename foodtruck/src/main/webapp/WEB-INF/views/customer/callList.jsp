<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당신의 푸드트럭</title>
<jsp:include page="../header/header.jsp"></jsp:include>
<style>

#with {
	margin: 0 auto;
	margin-top: 150px;
	width: 1200px;
	height: 600px;
	border: 1px solid darkgray;
}
	
.sunjae{
	width:200px;
	margin: 0 auto;
	text-align: center;
}
.sg {
    transform: translate(8%,15%);
}
</style>
</head>
<body>
	<div id="with" class="col">
		<h1 style="text-align:center; margin-top:10px;">호출내역</h1><br>
		<table class="table table-hover" class="col">
			<thead>
				<th>푸드트럭명</th>
				<th>위치</th>
				<th>행사명</th>
				<th>행사일정</th>
				<th>시간</th>
				<th>신청일</th>
				<th>입금현황</th>
				<th>승인상태</th>
				<th>거래상태</th>
			</thead>
			<tbody>
				<tr>
					<td>마카롱</td>
					<td>대구 달성공원</td>
					<td>달성공원축제</td>
					<td>2019-02-22~02-22</td>
					<td>10:00~18:00</td>
					<td>2019-02-18</td>
					<td>완료</td>
					<td>완료</td>
					<td>거래중</td>
				</tr>

				<tr>
					<td>스위트와플</td>
					<td>영진전문대학</td>
					<td>영진전문대학축제</td>
					<td>2019-02-25~02-25</td>
					<td>10:00~15:00</td>
					<td>2019-02-19</td>
					<td>취소</td>
					<td>취소</td>
					<td>취소</td>
				</tr>
				
				<tr>
					<td>복현동떡볶이</td>
					<td>동성로</td>
					<td>동성로축제</td>
					<td>2019-02-28~02-28</td>
					<td>10:00~15:00</td>
					<td>2019-02-19</td>
					<td>대기</td>
					<td>대기</td>
					<td>취소</td>
				</tr>
				
			</tbody>
				
		</table>
	</div>
<div class="sunjae">
	<nav aria-label="Page navigation example" id="nav" class="sg" >
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only"></span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only"></span>
      </a>
    </li>
  </ul>
</nav>
</div>
</body>
</html>