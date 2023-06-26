<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logoutLibrary.jsp</title>
</head>
<body>
		<%
			session.invalidate();
			request.getSession(true);
			response.sendRedirect("../Book/index.jsp");
		%>
</body>
</html>