function ck() {
	var isTrue = false;
	if (fr.m_name.value == "") {
		alert("이름 입력");
		isTrue = false;
		return false;
	} else if (fr.m_mail.value == "") {
		alert("이메일을 입력해주세요");
		isTrue = false;
		return false;
	} else if (fr.m_passwd.value == "") {
		alert("비밀번호를 입력하세요");
		isTrue = false;
		return false;
	} else if (fr.repasswd.value == "") {
		alert("비밀번호 확인을 입력하세요");
		isTrue = false;
		return false;
	} else if (fr.repasswd.value != fr.m_passwd.value) {
		alert("입력하신 비밀번호가 달라요");
		isTrue = false;
		return false;
	} else if (fr.m_nicname.value == "") {
		alert("닉네임을 입력해주세요");
		isTrue = false;
		return false;
	} else if (fr.hp.value == "") {
		alert("전화번호를 입력해주세요");
		isTrue = false;
		return false;
	}
	if (!isTrue) {
		var query = {
			m_mail : fr.m_mail.value,
			m_nicname : fr.m_nicname.value
		}
		$.ajax({
			url : "/project/login/idck",
			type : "get",
			data : query,
			success : function(data) {
				if ("success" == data) {
					$("#target").attr('onsubmit', 'true');
					$('#target').submit();
				} else if ("nicname" == data) {
					alert("사용중인 닉네임입니다");
				} else {
					alert("사용중인 이메일 입니다");
				}

			}
		});

	}
	return false;
}