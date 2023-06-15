<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="common.JSPFunction"%>
<%@page import="dto.Table"%>
<%@page import="dao.TableDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IsLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Edit.jsp</title>
<jsp:include page="IsLogin.jsp" />
	<%
		TableDao dao = new TableDao();
		Table t = dao.selectOne(request.getParameter("num"));
	    
		if(t != null){
	%>
</head>
<body>
<jsp:include page="Link.jsp" />
	<h2>수정하기(Edit)</h2>
	<form action="EditProcess.jsp?num=<%=t.getNum()%>" method="POST">
	<table border=1 class="viewTable">
		<tr>
			<th>글번호</th>
			<td><%= t.getNum()%></td>
			<th>작성자</th>
			<td><%= t.getId()%></td>
		</tr>
		<tr>
		<th>작성일</th>
		<td><%= t.getPostdate()%></td>
		<th>조회수 test</th>
		<td><%= t.getVisitcount()%></td>
		</tr>
		<tr>
			<th><label for="title">제목:</label></th>		
			<td colspan="3">
			<input type="text" id="title" name="title" style="width:100%;" value="<%=t.getTitle()%>" required/>
			</td>			
		</tr>
		<tr>
			<th><label for="content">내용:</label></th>
			<td class="content"  colspan="3">
			<textarea id="content" name="content" rows="15" style="width:100%; resize: none;" required
			><%=t.getContent()%></textarea>
			<input type="hidden" value="<%=t.getNum()%>" />
			</td>
		</tr>
		<tr>
  			<td colspan=4 align="center">
  			<input type="submit" value="수정 완료"> 
  			<input type="reset" value="다시 입력">
  			<input type="button" onclick="location.href='TableList.jsp'" value="목록 보기">
  			</td>
		</tr>
	</table>
</form>		
<%
	}
%>
</body>
</html>