<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ParamForward.jsp</title>
</head>
<body>	
	<h3>forward 페이지에서 매개변수 확인 ~ </h3>
	param1 : <%= request.getParameter("param1") %><br>
	param2 : <%= request.getParameter("param2") %><br>
	param3 : <%= request.getParameter("param3") %><br>
	<hr>
	
	<!-- 액션태그는 태그의 형태를 지니고 있어 소스의 이질감이 줄어들고
		jsp 코드보다 훨씬 짧은 코드로 동일한 기능을 구현할 수 있다. -->
	<h3>자바빈을 활용한 매개변수 전달 ~ </h3>
	<jsp:useBean id="person" class="dto.Person" scope="request"/>
	이름 : <jsp:getProperty property="name" name="person"/> 🕊🕊
	나이 : <jsp:getProperty property="age" name="person"/>
	<hr>
	
	<!-- jsp:include 액션태그를 이용해 다른페이지를 불러올때 
   	jsp:param 액션태그를 이용시 파라메터를 전달 할 수 있습니다-->
   	<h3>jsp:include페이지에 파라메터 넘기기 ~ </h3>
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="🥜피스타치오월드🥜" name="loc1"/>
		<jsp:param value="🥑아보카도월드🥑" name="loc2"/>
	</jsp:include>
</body>
</html>