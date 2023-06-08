<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionInvalidate.jsp</title>
</head>
<body>
	<%
		// 세션의 기본 유효 시간은 30분
		// 시간 수정 희망 시 web.xml에서 설정 가능
		
		// 세션 무효화
		session.invalidate();
	%>
	세션이 무효화되었읍니다...
	<a href= "SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
</body>
</html>