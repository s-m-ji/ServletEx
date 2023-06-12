<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForward.jsp</title>
</head>
<body>
	<h2>forward 페이지</h2>
	<h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
	<%
		Person p = (Person)request.getAttribute("request_person");
	%>
	
	<ul>
		attribute 정보 출력
		<li><%= p.getName() %>, <%= p.getAge() %></li>
		
		<%
			request.setCharacterEncoding("UTF-8");
		%>
		
		파라미터 정보 출력
		<li><%= request.getParameter("name") %>, <%= request.getParameter("age") %></li>
	</ul>
</body>
</html>