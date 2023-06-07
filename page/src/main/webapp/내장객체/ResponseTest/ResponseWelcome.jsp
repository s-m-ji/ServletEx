<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseWelcome</title>
</head>
<body>
	<h3>ResponseWelcome</h3>	
	<!--  
	 <%= request.getParameter("id") %>님 오셨군여 ~ <br>	
	 -->
	 <% String id = (String) session.getAttribute("id"); %>
	 <%= id %>님 오셨군여 ~ <br><br>
	 <img alt="welcom" src="https://source.unsplash.com/random/300x300/?welcom">
</body>
</html>