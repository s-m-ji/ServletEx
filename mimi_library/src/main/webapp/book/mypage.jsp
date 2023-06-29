<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/style.css">
<script src='../js/custom.js'></script>
<title>mypage.jsp</title>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../common/header.jsp" %>
	<h2>마이페이지(mypage.jsp)</h2>	
<ul class="nav nav-pills nav-justified">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" aria-current="page" href="#qwe">도서 대출 이력</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#asd">책 바구니</a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane fade show active" id="qwe">
	<!-- 검색폼 --> 
	<table>
		<tr><%@ include file="../common/searchForm.jsp" %></tr>
	</table>
	<!-- 게시글 목록 -->
	<table border="1" class="listTable">
		<tr>
			<td colspan="10">
				<input type="button" name="returnBook" value="선택 도서 반납하기" onclick="returnBook();">
				<button type="button" onclick="location.href='./list.book';">전체 도서 목록 바로가기</button>
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
						        <span class="point return">${book.return_date}</span>
						    </c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 페이지네이션 블록 -->
	<table>
		<tr><td><%@ include file="../common/pageNavi.jsp" %></td></tr>
	</table>
	</div>
  <div class="tab-pane fade" id="asd">
    <!-- 검색폼 --> 
	<table>
		<tr><%@ include file="../common/searchForm.jsp" %></tr>
	</table>
	<!-- 게시글 목록 -->
	<table border="1" class="listTable">
		<tr>
			<td colspan="10">
				<input type="button" name="rentBook" value="선택 도서 대출하기" onclick="rentBook();">
				<button type="button" onclick="location.href='./list.book';">전체 도서 목록 바로가기</button>
			</td>
		</tr>
		<tr>
			<th>선택</th>		
			<th>책 번호</th>		
			<th width="35%">제목</th>		
			<th>작가</th>		
			<th>출판사</th>		
			<th>책 바구니 여부</th>		
		</tr>
		<c:choose>
			<c:when test="${empty basket.list}">
				<tr><td colspan="10">🤷‍♀ 예약한 책이 없는걸 🤷‍♀️</tr>        
			</c:when>
			<c:otherwise>
				<c:forEach items="${basket.list}" var="bskt">
					<tr>
						<!-- 대출용 체크박스 -->
						<td><input type="checkbox" name="delNo" value="${bskt.no}"></td>
						<td>${bskt.no}</td>
						<td><a href="../book/view.book?idx=${bskt.no}">${bskt.title}</a></td>
						<td>${bskt.author}</td>
						<td>${bskt.publisher}</td>
						<td>${bskt.basket}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 페이지네이션 블록 -->
	<table>
		<tr><td><%@ include file="../common/pageNavi.jsp" %></td></tr>
	</table>
  </div>
</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>