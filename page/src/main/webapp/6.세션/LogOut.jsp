<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut.jsp</title>
</head>
<body>
	<%
		// 방법1. 회원인증정보 속성 삭제
		session.removeAttribute("userId");
		/* session.removeAttribute("member"); member에서 name을 얻어왔다면*/	
		
		// 방법2. 세션 무효화
		session.invalidate();
		
		// 방법1,2 실행 후 페이지 이동 
		response.sendRedirect("LoginForm.jsp");
	%>
</body>
</html>