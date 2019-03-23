# 19.03.23 주요 사항
## 링크 설정시 절대 경로로 해야 여러번 왔다갔다 하지않음
예) <a href="rehome"></a>  =>  <a href="/project/rehome">
  이미지 태그는 이렇게 해아 제대로 로딩 됨(resources/image 폴더 밑에 있다는 가정하에)
  => <img src='${pageContext.request.contextPath}/resources/image/question.png' />
  
## bootstrap.css와 jQuery는 헤더에 있으니 헤더가 포함된 파일일 경우 <jsp:include>태그 밑에서 바로 사용 하면 됨
## 헤더가 없어서 복붙해야 할 경우 헤더 맨 위에 있는 부트스트랩 link태그, 맨밑의 script태그 복사해서 쓰면 됨
