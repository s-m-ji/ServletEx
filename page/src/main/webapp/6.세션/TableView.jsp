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
	
	TableDao tDao = new TableDao();
	List<Table> list = tDao.getList();
	%>
	<jsp:include page="Link.jsp" />
	<h2>상세 보기(View)</h2>
	<table border=1>

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
			<td><a href=" View.jsp?num= <%= t.getNum()%>"><%= t.getTitle()%></a></td>			
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
			<td class="content"  colspan="5" align="center"><%= t.getContent() %></td>
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
		<th><a href="Edit.jsp?">글 수정</a></th>
		<th ><a href="Delete.jsp?">글 삭제</a></th>
		<th ><a href="TableList.jsp">목록 조회</a></th>
		</tr>
		
	</table>
</body>
</html>