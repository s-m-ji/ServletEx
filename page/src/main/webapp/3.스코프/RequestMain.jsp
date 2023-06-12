<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp</title>
</head>
<body>
	<%
		request.setAttribute("request_str", "request 영역에 문자열을 저장");
		request.setAttribute("request_person", new Person("김춘추", 25));
	%>
	
	<h2>request 영역의 속성값 읽어오기</h2>
	
	<%
		String str = (String)request.getAttribute("request_str");
		Person ps = (Person)request.getAttribute("request_person");
		String rq_int = (String)request.getAttribute("request_int");
	%>
	
	<ul>
		<li>str : <%= str %></li>
		<li>person : <%= ps.getName() %>, <%= ps.getAge() %></li>
		<li>rq_int : <%= rq_int %></li>
	</ul>
	
	<h2>request 영역의 속성값 삭제하기</h2>
	<%
		request.removeAttribute("request_str");
		request.removeAttribute("rq_int");
	%>
	
	request_str 삭제 : <%= request.getAttribute("request_str") %>
	
	<h2>forward 된 페이지에서 request 영역 속성 값 읽기</h2>
	
	<%
		request.getRequestDispatcher("RequestForward.jsp?name=나상현씨&age=30").forward(request, response);
	%>
</body>
</html>








