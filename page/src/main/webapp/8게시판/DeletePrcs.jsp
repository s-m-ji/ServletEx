<%@page import="common.JSPFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeletePrcs.jsp</title>
</head>
<body>
	<%
		NewBoardDao dao = new NewBoardDao();
		String num = request.getParameter("num");
		int res = dao.delete(num);
		if(res>0){
			JSPFunction.alertLocation("게시물 삭제 성공 🙆", "List.jsp", out);
		}
	%>
</body>
</html>