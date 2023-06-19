<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/style.css">
<meta charset="UTF-8">
<title>Collection.jsp</title>
</head>
<body>
	<%
		// 리스크 생성 (object로 지정 : 모든 타입 저장 가능)
		List<Object> oList = new ArrayList<Object>();
		oList.add("바밍타이거");
		oList.add(new Member("salt", "1234", "소금", "2023-06-19"));

		// 페이지 영역에 리스트 객체 저장
		pageContext.setAttribute("oList", oList);
	%>
	
	<h3>List 컬렉션</h3>     	
	<ul>
		<!-- 영역을 지정하지 않았지만 페이지 영역에 저장된 oList 값 출력 -->
		<li>0번째 요소 : ${ oList[0] }</li>
		<!-- 객체의 주소값이 출력됨 -->
		<li>1번째 요소 : ${ oList[1] }</li>
		<li>1번째 요소의 ID : ${ oList[1].id }</li>
		<li>1번째 요소의 NAME : ${ oList[1].name }</li>
		<!-- 사실 2번째 요소는 없음 ! : 그래도 오류 발생하지 않고 빈 값으로 출력됨 -->
		<li>2번째 요소 : ${ oList[2] }</li>
	</ul>
	<hr>
	<h3>Map 컬렉션</h3>
	<%
		Map<String, String> map = new HashMap<String, String>();
		
		// key, value 셋팅 ! 
		map.put("바밍타이거1", "소금");
		map.put("바밍타이거2", "오메가");
		
		// 페이지 영역에 저장해야 출력 가능 ! 
		pageContext.setAttribute("map", map);
	%>
	<ul>
		<!-- 한글은 . 으로 접근 x (500 에러 발생)-->
		<li>바밍타이거 : ${map}</li>
		<li>바밍타이거1 : ${ map['바밍타이거1'] }</li>
		<li>바밍타이거2 \${map} : ${ map["바밍타이거2"] }</li>
		<li>바밍타이거2 map.get : <%= map.get("바밍타이거2") %></li>		
		<!-- EL 주석 처리 \ (그대로 출력됨) -->
		<li>주석 처리 : \${ map['바밍타이거3'] }</li>
	</ul>

</body>
</html>





