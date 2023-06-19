<%@page import="el.MyELClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Operator2.jsp</title>
</head>
<body>
	<%
		pageContext.setAttribute("a", 9);
		pageContext.setAttribute("b", "10");

		// empty 연산자
		// null, 빈 문자열, 길이 0인 배열, 사이즈 0인 컬렉션인 경우 true를 반환
		pageContext.setAttribute("nullStr", null);
		pageContext.setAttribute("emptyStr", "");
		pageContext.setAttribute("lengthZero", new Integer[0]);
		pageContext.setAttribute("sizeZero", new ArrayList());
		
	%>
	
	<h3>empty 연산자</h3>
	<!-- 주로 출력 시 리스트가 비었는지 확인하는 용도로 사용 -->
	<pre>
	empty nullStr : ${ empty nullStr }
	empty emptyStr : ${ empty emptyStr }
	empty lengthZero : ${ empty lengthZero }
	empty sizeZero : ${ empty sizeZero }
	empty num1 : ${ empty num1 }
	</pre>
	<hr>
	<h3>삼항 연산자</h3>
	<!-- 조건? "true" : "false" -->
	a gt b : ${ a gt b ? "a이 크다" : "b가 크다" }
	<hr>
	<h3>null 연산</h3>
	<pre>
	<!-- null이 연산에 사용될 경우 0으로 인식 -->
	null + 10 = ${ null + 10 }
	nullStr + 10 = ${ nullStr + 10 }
	param.noVar > 10 = ${ param.noVar > 10 }
	<!-- 정의되지 않은 변수 : 0으로 인식되기 때문에 오류 발생 x -->
	</pre>
	
</body>
</html>























