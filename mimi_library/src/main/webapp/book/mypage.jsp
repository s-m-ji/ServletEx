<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<script src='../js/custom.js'></script>
<title>mypage.jsp</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../common/header.jsp" %>
	<h2>마이페이지(mypage.jsp)</h2>	
	<!-- 검색폼 --> 
	<table>
		<tr><%@ include file="../common/searchForm.jsp" %></tr>
	</table>
	<!-- 게시글 목록 -->
	<table border="1" class="listTable">
		<tr>
			<td colspan="10">
				<input type="button" name="returnBook" value="선택 도서 반납하기" onclick="returnBook();">
			</td>
		</tr>
		<tr>
			<th>선택</th>		
			<th>대출번호</th>		
			<th width="35%">제목</th>		
			<th>작가</th>		
			<th>출판사</th>		
			<th>대출여부</th>		
			<th>대출일</th>		
			<th>반납기한</th>		
			<th>반납일</th>		
		</tr>
		<c:choose>
			<c:when test="${empty map.list}">
				<tr><td colspan="10">🤷‍♀ 대출한 책이 없는걸 🤷‍♀️</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${map.list}" var="book">
					<tr>
						<!-- 반납용 체크박스 -->
						<td><input type="checkbox" name="delNo" value="${book.no}"></td>
						<td>${book.rent_no}</td>
						<td><a href="../book/view.book?idx=${book.no}">${book.title}</a></td>
						<td>${book.author}</td>
						<td>${book.publisher}</td>
						<td>${book.rent_yn}</td>
						<td>${book.rent_date}</td>
						<td>${book.return_exp_date}</td>
						<c:set value="${book.rest_date < 0 or book.rent_yn eq 'N' ? '-' : book.rest_date}" var="rest_date"/>
						<td>
						    <c:if test="${book.return_date == null}" var="res">
						        <c:choose>
						            <c:when test="${book.rest_date <= 3}">
						                <span class="point rest red"><font color="red">${rest_date}</font> 일 남음</span>
						            </c:when>
						            <c:otherwise>
						                <span class="point rest">${rest_date} 일 남음</span>
						            </c:otherwise>
						        </c:choose>
						    </c:if>
						    <c:if test="${not res}">
						        ${book.return_date}
						    </c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr><td colspan="10"><button type="button" onclick="location.href='./list.book';">전체 도서 목록 바로가기</button></td></tr>
	</table>
	<!-- 페이지네이션 블록 -->
	<table>
		<tr><td><%@ include file="../common/pageNavi.jsp" %></td></tr>
	</table>
</body>
</html>