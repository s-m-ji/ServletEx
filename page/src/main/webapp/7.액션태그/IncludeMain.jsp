<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>
</head>
<body>
	<%
	/* 
	액션 태그
		JSP에서 사용하는 표준 태그로 페이지 사이에서 이동을 제어하거나
		자바객체(자바빈)를 생성할 때 주로 사용됨.
		- XML 문법을 따르며 반드시 종료태그를 작성해야함
		- 액션 태그 사이에 주석을 사용할 수 없음.
		- 표현식을 사용할 수 없음.
		
		액션태그의 종류
		<jsp:include> 		: 외부파일을 현재 파일에 포함시킵니다
		<jsp:forward> 		: 다른 페이지로 요청을 넘깁니다
		<jsp:param> 		: 다른 페이지로 매개변수를 전달 합니다.
							  jsp:include, jsp:forward 태그와 함께 사용 합니다.
							  
		<jsp:useBean>		: 자바빈을 생성합니다
	*/
	
		pageContext.setAttribute("pAttr", "동명왕");
		request.setAttribute("rAttr", "온조왕");
	%>
	<h2>지시어와 액션태그 동작 방식 비교</h2>
	<hr>
	<h3>지시어 방식</h3>
	<!-- 지시어 방식 -->
	<%@ include file="inc/OuterPage1.jsp" %>
	<p>외부 파일에 선언한 변수 : <%= newVar1 %></p>

	<hr>
	<!-- 액션태그 방식 -->
	<h3>액션태그 방식</h3>
	<jsp:include page="inc/OuterPage2.jsp"/>
	<p>외부 파일에 선언한 변수 : </p><%-- <%= newVar2 %> 
	액션 태그로 받아오면 컴파일 되어 넘어오기 때문에 newVar2를 가져올 수 없어서 오류남 --%>
</body>
</html>