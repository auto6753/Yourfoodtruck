<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
<button id="toOne">첫번째</button>
<button id="toTwo">두번째</button>
<div id="one">one영역</div>
<div id="two">two영역</div>
<div id="inserTest">인서트 테스트</div>
<input id="socketTest" type="button" value="json보내보기" />
<button id="firebaseTest">파이어베이스</button>
<button id="anonymousLogin">익명로그인 및 db정보 가져오기</button>
<hr/>
<input type="text" value="test" id="email">
<input type="text" value="20" id="age">
<button id="get">정보 가져오기</button>
<div id="data"></div>
<div id="forTest"></div>
<script>
var value;
	var uid;
 // Initialize Firebase
	var config = {
		apiKey : "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
		authDomain : "fir-test-f3fea.firebaseapp.com",
		databaseURL : "https://fir-test-f3fea.firebaseio.com",
		projectId : "fir-test-f3fea",
		storageBucket : "fir-test-f3fea.appspot.com",
		messagingSenderId : "960564228551"
	};
	firebase.initializeApp(config);
	$('#firebaseTest').click(function() {
		console.log(firebase.app().name);
		console.log(firebase.auth().uid);
	//	var database=firebase.database();
	});
	$('#anonymousLogin').click(function() {
		firebase.auth().signInAnonymously().catch(function(error) {
			var errorCode=error.code;
			var errorMessage=error.message;
		});
		firebase.auth().onAuthStateChanged(function(user) {
			if(user) {
				var isAnonymous=user.isAnonymous;
				uid=user.uid;
				console.log(uid);
			}else {
				console.log('user is signed out');
			}
		});
		var userId=firebase.auth().currentUser.uid;
		console.log(userId);
/* 		var dbRef=firebase.database().ref(userId).set({
			username: 'test',
			email: 'aaa@naver.com'	
		},function(error) {
			if(error) {
				console.log('error');
			}else {
				console.log('success');
			}
		}); */
		var ref = firebase.database().ref(userId);
		ref.once('value').then(function(snapshot) {
			value = snapshot.val();
			console.log(value);
		});
//		dbRef.on('value',function(snapshot) {
//			console.log(snapshot);
//		});
	});
	$('#get').click(function() {
		var uid = firebase.auth().currentUser.uid;
		var ref2 = firebase.database().ref('PaymentTest/songtak456_naver_com');
		ref2.once('value').then(function(snapshot){
			value=snapshot.val();
			console.log(value);
			
		});
		$('#forTest').html(JSON.stringify(value));
	});
</script>
