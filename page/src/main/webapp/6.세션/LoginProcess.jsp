<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		
<title>LoginProcess.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
	
		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pw);
		
		if(member != null){
			// 로그인 성공 : 세션에 member 객체를 저장
			session.setAttribute("userId", member.getId());
			session.setAttribute("user", member);
			
			response.sendRedirect("LoginForm.jsp"); 
			
		} else {
			// 로그인 실패 : LoginForm 페이지로 이동 후 오류 메세지 출력
			// request 영역을 공유하기위해 forward 사용
			request.setAttribute("LoginErrMsg", "🙅‍♀️ ID/PW 불일치 🙅‍♀️");
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
		}
		
		
	%>

</body>
</html>