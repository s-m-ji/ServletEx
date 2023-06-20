<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>Remove.jsp</title>
</head>
<body>
	<c:set var="scopeVar" value="Page Value"/>
	<c:set var="scopeVar" value="Request Value" scope="request"/>
	<c:set var="scopeVar" value="Session Value" scope="session"/>
	<c:set var="scopeVar" value="Applicaiton Value" scope="application"/>
	<h3>출력하기</h3>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	<hr>
	<%-- <% 이거랑 같은 기능임 !
		session.getAttribute(name);
		session.removeAttribute(name);
	%> --%>
	<h3>session 영역에서 삭제하기</h3>
	<c:remove var="scopeVar" scope="session"/>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
	<!-- 모든 영역의 변수가 삭제됨 ! -->
	<h3>영역을 지정하지 않고 삭제하기</h3>
	<c:remove var="scopeVar"/>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>
</body>
</html>