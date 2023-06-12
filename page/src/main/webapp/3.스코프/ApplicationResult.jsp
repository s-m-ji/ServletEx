<%@page import="java.util.Set"%>
<%@page import="dto.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationResult.jsp</title>
</head>
<body>
	<%
		// 브라우저를 닫았다가 다시 열어도 값이 유지됨.
		// 서버를 종료 후 다시 실행 시 제거되는 것을 확인할 수 있음.
		Map<String, Person> ms = (Map<String, Person>)application.getAttribute("maps");
	
		// 맵에 담겨진 데이터 키값을 조회함.
		// keySet() : key의 집합을 Set 타입으로 반환함.
		Set<String> keys = ms.keySet();
		
		// map은 key, value가 쌍으로 저장되는 컬렉션 타입임
		// get(key) : 키 값을 이용하여 value 값을 반환 받음
		for(String key : keys){
			Person p = ms.get(key);
			out.print(p.getName() + ", " + p.getAge() + "<br>");
		}
	%>
</body>
</html>