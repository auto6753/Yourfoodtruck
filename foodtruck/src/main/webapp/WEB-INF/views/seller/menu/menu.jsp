<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../../header/header.jsp"></jsp:include>
<link rel="stylesheet" href="<c:url value="/resources/css/seller/menu.css"/>"/>
<head>
	
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12"></div>
        <nav class="col-xs-3">
        	<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
        </nav>
        <section class="col-xs-9">
			<c:forEach var="item" items="${menuList}">
				<div class="menuList">
					<img class="imgSize" src="${pageContext.request.contextPath}/resources/image/food1.png"/>
					${item}
				 </div>
			</c:forEach>
		</section>
    </div>
</div>
		

</body>