<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
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
		
		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pw);
		
		String saveYN = request.getParameter("saveCheck");
		
		if("y".equals(saveYN)){
			CookieManager.makeCookie(response, "userId", id, 3600);
		}
				
		if(member != null && !"".equals(member.getId())){			
			session.setAttribute("member", member);
			response.sendRedirect("BoradList.jsp"); 
		} else {
			response.sendRedirect("login.jsp?err=y");
		}
	%>
	
</body>
</html>



















