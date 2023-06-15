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
<title>TableWrite.jsp</title>
</head>
<body>
<jsp:include page="Link.jsp" />
<%@ include file="../6.세션/IsLogin.jsp" %>
	<h2>글쓰기(Write)</h2>
	<form action="WriteProcess.jsp" method="POST">
	<table class="tableWrite">
		<tr>
			<td><label for="title">제목:</label></td>
			<td><input type="text" id="title" name="title" style="width:100%;" required/></td>
		</tr>
		<tr>
			<td><label for="content">내용:</label></td>
			<td><textarea id="content" name="content" rows="15" style="width:100%;" required></textarea></td>
		</tr>
		<tr>
  			<td colspan=2 align="center">
  			<input type="submit" value="작성 완료"> 
  			<input type="reset" value="다시 입력">
  			<input type="button" onclick="location.href='TableList.jsp'" value="목록 보기">
  			</td>
		</tr>
	</table>
</form>

</body>
</html>