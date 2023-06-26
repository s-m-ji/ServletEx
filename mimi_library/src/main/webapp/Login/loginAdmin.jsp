<%@page import="com.library.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/library.css">
<link rel="stylesheet" href="../css/style.css">
<title>loginAdmin.jsp</title>
</head>
<body>
	<h3>[loginAdmin 페이지]</h3>
	<%@ include file="../common/header.jsp" %>
	<%
       if(session.getAttribute("member") != null){
       	Member m = (Member)session.getAttribute("member");
     %>
     <span><b><%= m.getId()%></b> 왔슈? </span>
     <button onclick="location.href='../Login/logoutLibrary.jsp'">로그아웃</button>

	<ul>
		<li><button>도서 등록</button></li>
		<li><button>도서 삭제</button></li>
		<!-- * 도서 삭제는 추후 도서 상세보기 화면으로 이동 예정 -->
		<li><button>관리자 등록</button></li>
		<li><button>관리자 삭제</button></li>        
     </ul>
     <%
       } 
     %>
</body>
</html>