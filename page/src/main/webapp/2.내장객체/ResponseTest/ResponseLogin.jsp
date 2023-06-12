<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseLogin</title>
</head>
<body>
	<h3>ResponseLogin</h3>
	<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
		if(id.equals("qwerty") && pw.equals("1234")){
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			response.sendRedirect("ResponseWelcome.jsp"); 
		} else {
			// response.sendRedirect("ResponseMain.jsp");
			// response.getWriter().print("<script>alert('Id 또는 Pw가 틀렸슴둥~'); location.href='ResponseMain.jsp';</script>");
	%>
			<script>alert('Id 또는 Pw가 틀렸슴둥~'); location.href='ResponseMain.jsp';</script>
	<%
		}
	%>
	아이디 : <%= id %>
	패스워드 : <%= pw %>
</body>
</html>