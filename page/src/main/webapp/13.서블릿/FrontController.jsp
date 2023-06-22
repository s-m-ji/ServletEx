<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>FrontController.jsp</title>
<style type="text/css">
	ul {margin-bottom:20px;}
	li {margin-bottom:10px;}
</style>
</head>
<body>
	<h3>하나의 매핑으로 여러가지 요청 처리</h3>
	
	resultValue : ${resultValue}<br><br>
	<ul>
		<li>URI : ${uri}</li>
		<li>요청명 : ${commandStr}</li>
	</ul>
	<ul>
		<li><a href="../13.서블릿/regist.one">회원가입</a></li>
		<li><a href="../13.서블릿/login.one">로그인</a></li>
		<li><a href="../13.서블릿/freeboard.one">자유게시판</a></li>
	</ul>
	
</body>
</html>