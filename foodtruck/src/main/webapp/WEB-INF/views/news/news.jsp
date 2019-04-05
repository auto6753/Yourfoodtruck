<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
뉴스
${postList}
<button id="test">테스트</button>
<script>
	$(function() {
		$('#test').click(function() {
			location.href="/project/news/specific";
		});
	});
</script>