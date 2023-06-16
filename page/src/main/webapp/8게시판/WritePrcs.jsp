<%@page import="common.JSPFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WritePrcs.jsp</title>
</head>
<body>
<%@ include file="../6.세션/Link.jsp" %>
<%@ include file="../6.세션/IsLogin.jsp" %>
	<%  
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = session.getAttribute("userId").toString();
		
		Board b = new Board();
		b.setTitle(title);
		b.setContent(content);
		b.setId(id);
		
		NewBoardDao dao = new NewBoardDao();
		int res = dao.insert(b);
		
		/* b = dao.getPostOne(String.valueOf(b.getNum())); */
		
		if(res>0){
			JSPFunction.alertLocation("게시물 등록 성공 🙆‍♀️", "View.jsp?num="+dao.latest(), out);
/* 			JSPFunction.alertLocation("게시물 등록 성공 🙆‍♀️", "List.jsp", out); */
		} else {
			JSPFunction.alertBack("게시물 등록 실패 🙅‍♀️", out);
		}

	%>
</body>
</html>