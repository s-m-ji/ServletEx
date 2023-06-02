<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	try{
		
	// 사용자의 요청을 담고 있는 객체
	int age = Integer.parseInt(request.getParameter("age"));
	out.print("나이는" + age + "이네용");
	// 파라미터가 들어가지 않은 상태이면 null을 숫자로 변환할 수 없기 때문에 오류 발생
	// http://localhost:8081/page/error_trycatch.jsp?age=20 이렇게해야함
	} catch(Exception e){
		out.print("예외발생~~~" + e.getMessage());
%>

<h3>오류가 발생했군요?</h3>	
<%= e.getMessage() %>

<%
	}
%>
</body>
</html>