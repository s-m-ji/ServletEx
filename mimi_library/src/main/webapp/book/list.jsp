<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet" href="../css/style.css">
<script src='../js/custom.js'></script>
<title>list.jsp</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../common/header.jsp" %>
	<h2>도서 목록(List.jsp)</h2>	
	<!-- 검색폼 --> 
	<table>
		<tr><%@ include file="../common/searchForm.jsp" %></tr>
	</table>
	<!-- 게시글 목록 -->
	<table border="1" class="listTable">
		<tr>
			<td colspan="6">
			<c:if test="${sessionScope.adminYn eq 'Y'}" var="res1">
				<!-- 어드민 계정인 경우 등록 / 삭제 버튼 출력 -->
				<input type="button" name="insert" value="도서 등록" onclick="location.href='./insert.book'">
				<input type="button" name="delete" value="도서 삭제" onclick="deleteBook();">
			</c:if>
			<c:if test="${ not res1 }">
				<input type="button" name="rent" value="바로 대출" onclick="rentBook();">
				<input type="button" name="cart" value="책 바구니" onclick="basketBook();">
			</c:if>
			</td>
		</tr>
		<tr>
			<th>선택</th>		
			<th>번호</th>		
			<th width="35%">제목</th>		
			<th>작가</th>		
			<th>출판사</th>		
			<th>대출여부</th>		
		</tr>
		<c:choose>
			<c:when test="${empty map.list}">
				<tr><td colspan="6">🤷‍♀ 등록된 게시글이 없는걸 🤷‍♀️</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${map.list}" var="book">
					<tr>
						<!-- 삭제용 체크박스 -->
						<td><input type="checkbox" name="delNo" value="${book.no}"></td>
						<td>${book.no}</td>
						<td><a href="../book/view.book?idx=${book.no}">${book.title}</a></td>
						<td>${book.author}</td>
						<td>${book.publisher}</td>
						<td>${book.rent_yn}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
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