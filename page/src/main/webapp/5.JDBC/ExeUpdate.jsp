<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtill"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>ExeUpdate.jsp</title>
</head>
<body>
	<h2>회원 추가</h2>
	<%
	
	request.setCharacterEncoding("UTF-8");
	/* TODO 이 방법이 최선인지 ?  */
	
	String id = request.getParameter("userid");
	String pass = request.getParameter("password");
	String name = request.getParameter("username");
	
	Member member = new Member(id, pass, name, "");

	MemberDao dao = new MemberDao();
	int res = dao.insert(member);
	if(res > 0){
		out.print(res + "건 처리되었습니다. <br> 🙆‍♀️ 회원 등록 완료 🙆‍♀");
		%>
		<button type="button" onclick="location.href='ExeQuery.jsp' ">📝 목록 조회하기 📝</button>
		<%
		} else {
		out.print("🙅‍♀️ 회원 등록 중 오류가 발생했습니다. 🙅‍♀️");
	}
	
	
	%>

</body>
</html>