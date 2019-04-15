<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header/header.jsp"></jsp:include>
<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.4/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase-database.js"></script>
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
	function toggleSignIn() {
		if(firebase.auth().currentUser) {
			firebase.auth().signOut();
		}else {
			var email=$('#email').val();
			var password=$('#password').val();
			if(email.length<4) {
				alert('이메일을 입력하세요');
				return;
			}
			if(password.length<4) {
				alert('비밀번호를 입력하세요');
				return;
			}
			
			firebase.auth().signInWithEmailAndPassword(email,password).catch(function(err) {
				var errorCode=err.code;
				var errorMessage=err.message;
				if(errorCode=='auth/weak-password') {
					alert('비밀번호 조건을 지켜주세요');
				}else {
					alert(errorMessage);
				}
				console.log(err);
				$('#sign-in').disabled=false;
			});
		}
		$('#sign-in').disabled=true;
	}
	function handleSignUp() {
		var email=$('#email').val();
		var password=$('#password').val();
		if(email.length<4) {
			alert('이메일을 입력하세요');
			return;
		}
		if(password.length<4) {
			alert('비밀번호를 입력하세요');
			return;
		}
		firebase.auth().createUserWithEmailAndPassword(email,password).catch(function(err) {
			var errorCode=err.code;
			var errorMessage=err.message;
			if(errorCode=='auth/weak-password') {
				alert('비밀번호 조건을 지켜주세요');
			}else {
				alert(errorMessage);
			}
			console.log(err);
		});
	}
	
	function initApp() {
		firebase.auth().onAuthStateChanged(function(user) {
			$('#verify-email').disabled=true;
			if(user) {
				var displayName=user.displayName;
				var email=user.email;
				var emailVerified=user.emailVerified;
				var photoURL=user.photoURL;
				var isAnonymous=user.isAnonymous;
				var uid=user.uid;
				var providerData=user.providerData;
				$('#sign-in-status').html('Signed in');
				$('#sign-in').html('Sign out');
				$('#account-details').text(JSON.stringify(user,null,' '));
				if(!emailVerified) {
					$('#verify-email').disabled=false;
				}
			}else {
				$('#sign-in-status').html('Signed out');
				$('#sign-in').html('Sign in');
				$('#account-details').html('null');
			}
			$('#sign-in').disabled=false;
		});
		
		$('#sign-in').click(function() {	toggleSignIn();	});
		$('#sign-up').click(function() {	handleSignUp();	});
	}
	
	$(function() {
		initApp();
	});
</script>
<input type="text" id="email"/><br/>
<input type="password" id="password"/><br/>
<button id="sign-in" name="signin">Sign In</button>
&nbsp;&nbsp;&nbsp;
<button id="sign-up" name="signup">Sign Up</button>
&nbsp;&nbsp;&nbsp;
<div>
	Firebase sign-in status: <span id="sign-in-status">Unknown</span>
	<div>Firebase auth <code>currentUser</code> object value:</div>
	<pre><code id="account-details">null</code></pre>
</div>