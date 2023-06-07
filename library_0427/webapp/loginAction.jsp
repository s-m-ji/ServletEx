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
<title>loginTest</title>
</head>
<body>
	<%
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		MemberService mbService = new MemberService();
        
        Member member = mbService.login(id, pw);
        
        if(member != null && !member.getId().equals("")){
        	System.out.print("=== syso1 === \n");
        	out.print("=== out1 === \n");
        	
        	System.out.print("member : " + member + "\n");
        	out.print(member.getId() + " 안녕 ~\n");
        	
        	if("ADMIN".equals(member.getId())){
        		response.sendRedirect("loginAdmin.jsp");
        	} else {
        		response.sendRedirect("loginMember.jsp");
        	}
        } else {
        	response.sendRedirect("index.jsp?error=Y");
        }

        System.out.print("=== syso2 === \n");
        out.print("=== out2 === \n");
        
       /* LibraryController libCont = new LibraryController();
        libCont.library();  */
        
        System.out.print("=== syso3 === \n");
        out.print("=== out3 === \n");
        
	%>
</body>
</html>