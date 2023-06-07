<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<title>RequestMain</title>
</head>
<body>
	<h2>1. 클라이언트와 서버의 환경정보 읽기</h2>
	<!-- method를 지정하지않은 경우는 모두 get방식(기본)으로 호출된다 *url 호출 : 무조건 GET방식 -->
	<a href="RequestWebInfo.jsp?eng=hi&kor=앙뇽">Get 방식으로 요청</a>
	<!-- 404 : 페이지를 찾을 수 없음
				서버에 파일이 없는 경우, 또는 경로가 일치하지 않는 경우 
				URL 경로를 확인해봐야함 -->
	<form action="RequestWebInfo.jsp" method="post">
		영어 : <input type="text" name="eng" value="bye"><br>
		한글 : <input type="text" name="kor" value="안뇬"><br>
		<input type="submit" value="Post 전송">	
	</form>
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form method="post" action="RequestParameter.jsp">
		<!-- 다양한 input 태그를 사용하여 서버에 값을 전달해봅시당 -->
		아이디 : <input type="text" name="id" value="a" /><br />
		<!-- 아이디 : <input type="text" name="id" value="b" /><br /> 
			* name이 여러개면 첫번째 요소가 전송이 된다 -->
        성별 :
        <input type="radio" name="sex" value="man" />남자
        <input type="radio" name="sex" value="woman" checked="checked" />여자
        <br />
        관심사항 :
        <input type="checkbox" name="favo" value="eco" />경제
        <input type="checkbox" name="favo" value="pol" checked="checked" />정치
        <input type="checkbox" name="favo" value="ent" />연예<br />
        자기소개:
        <textarea name="intro" cols="30" rows="4">안뇽하세용?</textarea>
        <br />
        <input type="submit" value="전송하기" />	
	</form>
	
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
		<a href= "RequestHeader.jsp">요청 헤더 정보 읽기</a>
</body>
</html>



















