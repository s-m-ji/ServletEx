<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "errorPage.jsp" %>
    <!-- 오류 발생 시 화면에 출력할 페이지를 지정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 사용자의 요청을 담고 있는 객체
	int age = Integer.parseInt(request.getParameter("age"));

	// 화면에 출력
	out.print("나이는" + age + "이네용");
%>

</body>
</html>