<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("userid"); 
		String pw = request.getParameter("userpw");
		
			String sCheck = request.getParameter("save_check");
		
		if("y".equals(sCheck)){
			CookieManager.makeCookie(response, "userId", id, 3600);
		}
		
		if("id".equalsIgnoreCase(id) && "pw".equalsIgnoreCase(pw)){
			// 로그인 성공하면 id를 세션에 저장
			session.setAttribute("id", id);
			
			
			/* response.sendRedirect("gogreen.jsp?name="+id); */
			response.sendRedirect("gogreen.jsp");
		} else {
			/* response.sendRedirect("gogreen.jsp?login=N"); */
			
	%>	
	<jsp:forward page="gogreen.jsp?login=N"></jsp:forward>
	<!-- forward 형식이니까 url은 변경되지 않지만 해당 페이지를 보여주는 것은 맞음 ! -->
		<%
		}
		%>
</body>
</html>