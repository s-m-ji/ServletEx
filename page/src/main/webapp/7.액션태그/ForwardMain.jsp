<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForwardMain.jsp</title>
</head>
<body>
	<h2>액션태그를 이용한 포워딩</h2>
	<!-- 새로운 페이지로 forward
		공유되는 범위 : page(x), request(o) -->
		<%
			request.setCharacterEncoding("utf-8");
		
			pageContext.setAttribute("pAttr", "페이지");
			request.setAttribute("rAttr", "요청");
		%>
	<%-- <jsp:forward page="inc/ParamInclude.jsp"></jsp:forward> --%>
	<jsp:forward page="ForwardSub.jsp">
		<jsp:param name="pAttr" value="페이지"/>
	</jsp:forward>
</body>
</html>