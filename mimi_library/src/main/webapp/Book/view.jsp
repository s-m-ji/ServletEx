<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>view.jsp</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../common/header.jsp" %>
	<h2>도서 상세(view.jsp)</h2>	
	<!-- 게시글 목록 -->
	<table border="1" class="listTable">
		<tr>
			<th>번호</th>		
			<th width="35%">제목</th>		
			<th>작가</th>		
			<th>출판사</th>		
			<th>대출여부</th>		
		</tr>
		<tr>
			<td>${book.no}</td>
			<td>${book.title}</td>
			<td>${book.author}</td>
			<td>${book.publisher}</td>
			<td>${book.rentyn}</td>
		</tr>
	</table>
	<!-- 글쓰기 버튼 -->
	<table>
		<tr><td><button onclick="location=href='../mvcboard/write.do'">글쓰기</button></td></tr>
	</table>
	<!-- 페이지네이션 블록 -->
	<table>
		<tr><td><%@ include file="../common/pageNavi.jsp" %></td></tr>
	</table>
</body>
</html>