<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamMain.jsp</title>
</head>
<body>
	<h2>자바빈객체를 파라미터로 전달하기</h2>
	
	<jsp:useBean id="person" class="dto.Person" scope="request"/>
	<jsp:setProperty property="name" name="person" value="구구맨"/>
	<jsp:setProperty property="age" name="person" value="99"/>
	

	<!-- 
		jsp:include, jsp:forward 액션태그 이용 시 파라미터 전달 가능
	 -->
	 <%
	 	request.setCharacterEncoding("utf-8");
	 
	 	String pValue="StringValue";
	 %>
	 <jsp:forward page="ParamForward.jsp?param1=쿼리서터륑">
	 	<jsp:param value="param2" name="param2"/>
	 	<jsp:param value="<%= pValue %>" name="param3"/>
	 </jsp:forward>
</body>
</html>