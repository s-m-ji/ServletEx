<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IsLogin.jsp</title>
</head>
<body>
	<%
		if(session.getAttribute("userId") == null){
	%>
		<script>
			alert('🍀 로그인 후 이용 가능 🍀');
			location.href="LoginForm.jsp";
		</script>
	<%
		}
	%>
	
</body>
</html>