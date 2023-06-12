<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>ExeUpdate2.jsp</title>
</head>
<body>
	<h2>게시글 추가</h2>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	if(session.getAttribute("member") != null){
       	Member m = (Member)session.getAttribute("member");
	
	Board board = new Board(0, title, content, m.getId(), "", 0);	
	BoardDao dao = new BoardDao();
	
	int res = dao.insert(board);
	if(res > 0){
		out.print("🙆‍♀️ 게시글 등록 <span class='point'>" + res + "</span> 건 처리되었습니다. 🙆‍♀");
		%>
		<button type="button" onclick="location.href='BoradList.jsp' ">📝 목록 조회하기 📝</button>
		<%
		} else {
		out.print("🙅‍♀️ 게시글 등록 중 오류가 발생했습니다. 🙅‍♀️");
		}
       } 
     %>
</body>
</html>