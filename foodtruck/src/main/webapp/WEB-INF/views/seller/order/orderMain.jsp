<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head><title>당신의 푸드트럭</title></head>

<jsp:include page="../../header/header.jsp"></jsp:include>
<style>
@font-face { font-family: 'BMHANNAPro'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff'); font-weight: normal; font-style: normal; } 
#cuorder, #seorder{

    display: inline-block;
    width: 15em;
    height: 19em;
    font-size: 130%;
    position: relative;
    bottom: 24px;
    background-color: mediumspringgreen;
    font-family: 'BMHANNAPro';
}
#button{

margin :0 auto;
width:100%;
text-align: center;
margin-top: 100px;


}

.mw1650 {
	max-width: 1650px !important;
}

.mgt50 {
	margin-top: 50px;
}

#with {
	margin-top: 50px;
	height: 600px;
	font-family: 'yg-jalnan';
	border-radius: 10px;
	background-color: lightgray;
}
</style>
<div class="container mw1650">
	<div class="row">
		<div class="col-md-2 mgt50">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-10">
			<div id="with" class="col"></div>
		</div>
	</div>
</div>

<%-- <div class="container">
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="../sideMenuBar/sideMenuBar.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div id="button">
				<a href="cuorder?truck_code=${sessionScope.seller.truck_code}"><button id="cuorder" class="btn">현장 고객용</button></a>
				
				<a href="seorder"><button id="seorder"  class="btn">현장 상인용</button></a>
			</div>
		</div>
	</div>
</div> --%>