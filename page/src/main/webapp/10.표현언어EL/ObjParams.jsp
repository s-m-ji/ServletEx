<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjParams.jsp</title>
</head>
<body>
	<%
		// request 영역에 객체를 생성 후 forward 된 페이지에서 출력하기 ~
		request.setAttribute("personObj",
				new Member("salt", "1234", "소금", "2023-06-19"));
		request.setAttribute("stringObj", "문자열");
		request.setAttribute("integerObj", new Integer(99));
	%>
	<h3>객체 매개변수</h3>
	<jsp:forward page="ObjResult.jsp">
		<jsp:param value="10" name="firstNum"/>
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>
</body>
</html>