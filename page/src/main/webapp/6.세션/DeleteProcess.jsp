<%@page import="common.JSPFunction"%>
<%@page import="dto.Table"%>
<%@page import="dao.TableDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteProcess.jsp</title>
</head>
<body>
	<%
	TableDao tDao = new TableDao();	
	Table table = new Table();
	int res = tDao.delete(request.getParameter("num"));
	if(res>0){
		JSPFunction.alertLocation("👌 게시글 삭제 완료 👌", "TableList.jsp", out);
	}
	%>
</body>
</html>