<%@page import="dto.Board"%>
<%@page import="common.JSPFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditPrcs.jsp</title>
</head>
<body>
<%@ include file="../6.세션/Link.jsp" %>
<%@ include file="../6.세션/IsLogin.jsp" %>
<%

	int num = Integer.parseInt(request.getParameter("num"));
	int pageNo = request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String editdate = request.getParameter("nowTime");
	
	Board b = new Board(num, title, content, "", "", editdate, 0); 
	NewBoardDao dao = new NewBoardDao();
	int res = dao.update(b);
	if(res>0){
		JSPFunction.alertLocation("게시물 수정 성공 🙆", "View.jsp?num="+b.getNum()+"&pageNo="+pageNo, out);
	} else {
		JSPFunction.alertBack("게시물 수정 실패 🙅‍♀", out);
	}
%>
</body>
</html>