<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.library.service.MemberService"
    import = "com.library.vo.Member"
    import = "com.library.controller.LibraryController"
    %>
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
		
		String sCheck = request.getParameter("saveCheck");
		
		if("y".equals(sCheck)){
			CookieManager.makeCookie(response, "userId", id, 3600);
		}
		
		MemberService mbService = new MemberService();
        
        Member member = mbService.login(id, pw);
        
        if(member != null && !member.getId().equals("")){
        	// TODO 대소문자를 구분없이 써도 알아서 멤버 목록에 맞게 로그인해주는 기능을 달아본다면 ?
        
        	if (id.equals(id.toLowerCase())) {
		        id = id.toUpperCase();
		    } else if (id.equals(id.toUpperCase())) {
		        id = id.toLowerCase();
		    }
        	
        	
        	session.setAttribute("member", member);
        	
        	System.out.print("member : " + member + "\n");
        	out.print(member.getId() + " 안녕 ~\n");
        	
        	if("ADMIN".equals(member.getId())){
				/* session.setAttribute("loginId", id); */
        		response.sendRedirect("loginAdmin.jsp");
        	} else {
        		/* session.setAttribute("loginId", id); */
        		response.sendRedirect("loginMember.jsp");
        	}
        } else {
        	response.sendRedirect("index.jsp?error=Y");
        }
        
	%>
</body>
</html>