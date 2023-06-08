<%@page import="com.library.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/library.css">
<title>loginMember.jsp</title>
</head>
<body>
	<h3>[loginMember 페이지]</h3>	
	<%
      if(session.getAttribute("member") != null){
     	Member m = (Member)session.getAttribute("member");
     %>
     	<span><b><%= m.getId() %></b> 왔슈?</span>
     	<button onclick="location.href='logoutLibrary.jsp'">로그아웃</button>
     <%
     }
     %>
    	
   	<ul>
		<li><button>도서 대출</button></li>
		<li><button>도서 반납</button></li>
	</ul>
</body>
</html>