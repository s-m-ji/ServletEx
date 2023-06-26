<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>popupCookie.jsp</title>
</head>
<body>
	<h2>쿠키를 활용한 팝업창 제어</h2>
	<%
		// 하루동안 팝업창이 열리지 않도록 쿠키를 생성
		CookieManager.makeCookie(response, "popupClose", "y", 60*60*24);
		
		// main02에서 fetch 방식으로 쿠키를 생성하면 아래처럼 리다이렉트 안 해도 된다. 
		// response.sendRedirect("PopupMain01.jsp");
	%>
</body>
</html>