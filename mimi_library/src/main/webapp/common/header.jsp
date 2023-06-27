<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
</head>
<body>
	<header>
		<!-- 어드민 -->
		<!-- TODO 로그인 여부 > 관리자 여부 이렇게 로직 수정 -->
			<c:if test="${sessionScope.adminYn eq 'Y'}" var="res1">
				<h3>[Admin 페이지]</h3>
				<span><b class="point">${userId}</b> 왔슈?</span>
     			<button onclick="location.href='../Login/logoutLibrary.jsp'">로그아웃</button>
				<button>사용자 등록</button>
				<button>사용자 삭제</button>
			</c:if>
		<!-- 로그인 후 유저 -->
			<c:if test="${not res1 and not empty sessionScope.userId}">
				<h3>[Member 페이지]</h3>
				<span><b class="point">${userId}</b> 왔슈?</span>
     			<button onclick="location.href='../Login/logoutLibrary.jsp'">로그아웃</button>
			    <button>도서 반납</button>
			</c:if>
		<!-- 로그인 전 유저 -->
			<c:if test="${empty sessionScope.userId}" var="res2">
				<a href="../book/index.jsp">로그인</a>
			</c:if>	
	</header>
</body>
</html>