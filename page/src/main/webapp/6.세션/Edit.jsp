<%@page import="dto.Table"%>
<%@page import="java.util.List"%>
<%@page import="dao.TableDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Edit.jsp</title>
</head>
<body>

<jsp:include page="Link.jsp" />
<%
	TableDao tDao = new TableDao();	
	Table t = tDao.selectOne(request.getParameter("num"));
	
	%>
	<h2>수정하기(Edit)</h2>
	<form action="EditProcess.jsp?num=<%=t.getNum()%>" method="POST">
	<table class="tableWrite">
		<tr>
			<td><label for="title">제목:</label></td>
			<td><input type="text" id="title" name="title" style="width:100%;" value="<%=t.getTitle()%>" required/></td>
		</tr>
		<tr>
			<td><label for="content">내용:</label></td>
			<td><textarea id="content" name="content" rows="15" style="width:100%;" required></textarea></td>
		</tr>
		<tr>
  			<td colspan=2 align="center">
  			<input type="submit" value="수정 완료"> 
  			<input type="reset" value="다시 입력">
  			<input type="button" onclick="location.href='TableList.jsp'" value="목록 보기">
  			</td>
		</tr>
	</table>
</form>

</body>
</html>