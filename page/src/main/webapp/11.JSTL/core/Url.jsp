<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>Url.jsp</title>
</head>
<body>
	<h3>url 태그를 이용해서 링크 걸기</h3>
	<!-- c:url
		지정한 경로와 매개변수를 이용해서 컨텍스트 루트를 포함한 url을 생성
		a태그의 href 속성이나 form태그의 action 속성에 이용 가능
		value : 경로
		var : 변수명 -->
	<a href="../inc/OtherPage.jsp">페이지 바로가기</a>
	<br>
	<c:url value="../inc/OtherPage.jsp" var="urlV"></c:url>
	<a href="${urlV}">url 태그를 이용해서 바로가기</a>
	<!-- 이렇게 보내면 context root를 같이 보내준다 !
		나는 지금 프로젝트를 루트 경로로 지정해놔서 바로 확인이 어렵지만... -->
	<form action="${urlV}?user_param1=바밍&user_param2=타이거" method="post">
		<button>전송</button>
	</form>
	<hr>
	<h3>예외처리</h3>
	<!-- c:catch 태그 
		예외가 발생하면 지정한 변수에 에러메세지가 저장되어 전달
	-->
	<% int num1 = 100; %>
	<c:catch var="eMessage">
	<% int res = num1/0; %>
	</c:catch>
	예외 내용: ${eMessage}
	
	<h3>EL 예외처리</h3>
	<c:set var="num2" value="200"/>
	<c:catch var="eMessage2"> ${"바밍타이거"+num2} </c:catch>
	EL 예외 내용: ${eMessage2}
	<br><br><br><br><br>
</body>
</html>


































