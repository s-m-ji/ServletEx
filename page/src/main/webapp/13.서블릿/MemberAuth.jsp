<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>MemberAuth.jsp</title>
</head>
<body>
	<h3>MVC 패턴으로 회원 인증하기</h3>
	<p>${authMessage}</p>
	<a href="./MemberAuth.mvc?userId=test&userPw=1234">test 로그인</a>       
</body>
</html>