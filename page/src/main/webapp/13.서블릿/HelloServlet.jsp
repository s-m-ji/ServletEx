<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>HelloServlet.jsp</title>
</head>
<body>
	<h3>와우</h3>
	request.getAttribute("message") 
			: <%= request.getAttribute("message") %> !<br>
	requestScope.message : ${ requestScope.message } !<br><br>
	
	<!-- 아래의 url로 접근하면 HelloServlet이 실행되도록 설정해둠 -->
	<!-- ./ 현재경로 -->
	<a href="./HelloServlet.do">바로가기</a><br><br>
	<!-- 루트 경로 -->
	<a href="${pageContext.request.contextPath}
			/13.서블릿/AnnotationMapping.do">바로가기</a><br><br>
</body>
</html>