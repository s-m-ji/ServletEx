<%@page import="dto.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp</title>
</head>
<body>
	<!-- 
	application 영역
		웹서버 실행 시 생성되는 영역
		클라이언트가 요청하는 모든 페이지가 application 영역을 공유
		웹서버 종료 시 소멸
	 -->
	 <h2>application</h2>
	 <%
	 	Map<String, Person> maps = new HashMap<>();
	 	
	 	maps.put("actor1", new Person("가상현씨밴드", 21));
	 	maps.put("actor2", new Person("나상현씨밴드", 22));
	 	maps.put("actor3", new Person("다상현씨밴드", 23));
	 	maps.put("actor2", new Person("라상현씨밴드", 24));
	 	
	 	application.setAttribute("maps", maps);
	 %>
	 application 영역에 저장되었습니다.
	 <a href="ApplicationResult.jsp">ApplicationResult 확인하기</a>
</body>
</html>