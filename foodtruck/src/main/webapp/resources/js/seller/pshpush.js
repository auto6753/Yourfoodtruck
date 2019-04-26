/**
 * 
 */

var config = {
	apiKey : "AIzaSyDgw_gFc9MB7Rc8Z7WjJUOqeWT6YQOqvxU",
	authDomain : "fir-test-f3fea.firebaseapp.com",
	databaseURL : "https://fir-test-f3fea.firebaseio.com",
	projectId : "fir-test-f3fea",
	storageBucket : "fir-test-f3fea.appspot.com",
	messagingSenderId : "960564228551"
};
firebase.initializeApp(config);
//파이어베이스 초기화

//메시징 객체 검색
const messaging=firebase.messaging();
//발급받은 키 등록
messaging.usePublicVapidKey
	("BGnZtMwCwypcubHTRV0hbuYboQe1afzxwdQ2PdbTrGu67_yXf6vmuIxZGZxCNPG9ApyS7g0XicBFjxeiyxQ4oXw");

//푸쉬 권한 요청
messaging.requestPermission().then(function() {
	console.log('Notification permission granted.');
}).catch(function(err) {
	console.log('Unable to get permission to notify,',err);
});

//권한요청에 대한 토큰 검색
messaging.getToken().then(function(currentToken) {
	if(currentToken) {
		sendTokenToServer(currentToken);
		updateUIForPushEnabled(currentToken);
	}else{
		console.log('No Instance ID token available. Request permission to generate one.');
	}
}).catch(function(err) {
	
});