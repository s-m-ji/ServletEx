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
<title>TableView.jsp</title>
</head>
<body>
	<%
	String num = request.getParameter("num");
	String sField = request.getParameter("searchField");
	String sWord = request.getParameter("searchWord");
	
	TableDao tDao = new TableDao();
	List<Table> list = tDao.getList(sField, sWord);
	%>
	<jsp:include page="Link.jsp" />
	<h2>상세 보기(View)</h2>
	<table border=1 class="viewTable">
		<tr>
			<th>번호</th>
			<th>제목</th>			
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	<tbody>
	<%
		for(Table t : list){	
			if(num.equals(t.getNum())){
	%>
		<tr>
			<td><%= t.getNum() %></td>
			<td><%= t.getTitle()%></td>			
			<td><%= t.getId() %></td>
			<td><%= t.getPostdate() %></td>
			<td><%= t.getVisitcount() %></td>
		</tr>
	<%
		}
	}
	%>
		<tr>
			<th>내용</th>
	<%
		for(Table t : list){	
			if(num.equals(t.getNum())){
	%>
			<td class="content"  colspan="5"><%= t.getContent() %></td>
	<%
		}
	}
	%>
		</tr>
	</tbody>
	</table>
	<!-- 목록 조회 버튼 테이블 -->
	<table class="btnTable">
		<tr>
		<td><button type="button" onclick="location.href='Delete.jsp?">글 삭제</button></td>
		<td><button type="button" onclick="location.href='Edit.jsp?">글 수정</button></td>
		<td><button type="button" onclick="location.href='TableList.jsp">목록 조회</button></td>
		</tr>
	</table>
</body>
</html>