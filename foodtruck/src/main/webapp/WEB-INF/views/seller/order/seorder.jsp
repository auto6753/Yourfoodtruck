<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Product list for Ecommerce Website</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
<style type="text/css">
body {
	font-family: "Open Sans", sans-serif;
}
.wrap {
	width: 1000px;
	height: 300px;
	overflow-x: scroll;
	white-space: nowrap
}

.wrap div {
	width: 300px;
	height: 100%;
	display: inline-block;
}

wrap {
	white-space: nowrap;
}


</style>
</head>
<body>
	<div class="wrap">
		<div id="forReceive"></div>
	</div>
	<button id="test">테스트</button>
</body>
<script>
var config = {
		apiKey : "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
		authDomain : "fir-test-f3fea.firebaseapp.com",
		databaseURL : "https://fir-test-f3fea.firebaseio.com",
		projectId : "fir-test-f3fea",
		storageBucket : "fir-test-f3fea.appspot.com",
		messagingSenderId : "960564228551"
};
firebase.initializeApp(config);
console.log('${sessionScope.sessionid.password}');
var email='${sessionScope.sessionid.email}';
var password='${sessionScope.sessionid.password}';
 firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
// Handle Errors here.
	var errorCode = error.code;
	var errorMessage = error.message;
	alert(errorMessage);
	// ...
});
var uid;
firebase.auth().onAuthStateChanged(function(user) {
	  if (user) {
	    console.log(user);
	    console.log(firebase.auth());
	    uid=firebase.auth().currentUser.uid;
	    console.log(uid);
	  } else {
	    console.log('error');
	  }
});
var test44;
var receiveRef=firebase.database().ref('/PaymentTest2/qJK5GuH9U2RO00RaXIvXbxj1HMg2/010-1111-4875');
$(function() {
	receiveRef.once('value').then(function(snapshot) {
		snapshot.once('value').then(function(child) {
			child
		});
		console.log(snapshot.val());
		test44=snapshot.val();
		console.log();
		var bb=JSON.stringify(snapshot.val());
		console.log(bb);
	});
});

$('#test').click(function() {
	/* var a=$('#forReceive').children(1);
	console.log(a.html());
	var test=JSON.parse(a.html());
	console.log(test);
	 $.ajax({
		type:"POST",
		url:"/project/pay/insertPayment",
		data:JSON.stringify(test),
		contentType:"application/json;charset=UTF-8",
		traditional:true,
		success:function(data) {
			console.log('success');
		},error:function(err) {
			console.log(err);
		}
	});  */
});
</script>
</html>
