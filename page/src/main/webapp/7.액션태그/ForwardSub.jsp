<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardSub.jsp</title>
</head>
<body>
	<h2>😉 포워드 결과 확인 😉</h2>
	<ol>
		
		<li>page 영역 : <%=pageContext.getAttribute("pAttr") %></li>
		<li>* : <%=request.getParameter("pAttr") %></li>
		<li>request 영역 : <%=request.getAttribute("rAttr") %></li>
	</ol>
</body>
</html>