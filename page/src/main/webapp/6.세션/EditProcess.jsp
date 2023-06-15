<%@page import="common.JSPFunction"%>
<%@page import="dto.Table"%>
<%@page import="dao.TableDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EditProcess.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Table t = new Table(num, title, content, "", "", "");
	
	TableDao tDao = new TableDao();	
	int res = tDao.update(t); 
	
	if(res>0){
		JSPFunction.alertLocation("👌 게시글 수정 완료 👌", "View.jsp?num="+t.getNum(), out);
	}
	%>
</body>
</html>