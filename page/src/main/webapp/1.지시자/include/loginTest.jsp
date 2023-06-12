<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginTest.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("u_id");
		String pw = request.getParameter("u_pw");
		
		if("mimi".equals(id) && "1234".equals(pw)){
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("index.jsp?login=N");
		}
	%>
</body>
</html>