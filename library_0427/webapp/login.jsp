<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>
	<form action="loginTest.jsp" method="post">
       <div id='login'>
           <input type="text" name="u_id" id="userid" placeholder='ID를 입력해주세요.' required="required">
           <input type="password" name="u_pw" id="userpw" placeholder='PW를 입력해주세요.' required="required">
       </div>
       <div id='button'>
       <input type="submit" value="로그인">
       </div>
   	</form>
   	<div id='info'>
       <a href="register.jsp">회원가입</a>
       <a href="">ID찾기</a>
       <a href="">PW찾기</a>
    </div>
</body>
</html>