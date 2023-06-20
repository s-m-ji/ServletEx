<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>ForEach.jsp</title>
</head>
<body>
	<h3>일반 for문 형태의 forEach</h3>
	<!-- 
		forEach 태그를 활용한 반복문
			begin : 시작값
			end : 종료값
			step : 증가값
			var : 변수
	 -->
	 <%-- 이것과 동일 <%	for(int i=0; i<=10; i++){} %> --%>
	 <c:forEach begin="0" end="9" step="1" var="i">
	 	<span>제주 청귤 아이스티 <b>${ i }개 </b></span>
	 		<br>
	 		<c:if test="${ not empty i }">
			 	<c:forEach begin="0" end="${ i }" step="1">
			 		<span>🍊</span>
			 	</c:forEach>
	 		</c:if>
	 		<br>
	 </c:forEach>
	 <hr>
	<h3>varStatus 속성 살펴보기</h3>
	<!-- 일반 for문
		루프의 현재 상태를 알려주는 변수명
			current : var에 지정한 현재 루프의 변수값
			index : var에 지정한 현재 루프의 변수값
			count : 실제 반복 횟수(1부터 시작)
			first : 루프의 처음일 때 true
			last : 루프의 마지막일 때 true
	 -->
	 <table border='1'>
	  <c:forEach begin="3" end="5" var="i" varStatus="loop">
	 	<tr>
	 		<td>i : ${ i }</td>
	 		<td>current : ${loop.current}</td>
	 		<td>index : ${loop.index}</td>
	 		<td>count : ${loop.count}</td>
	 		<td>first : ${loop.first}</td>
	 		<td>last : ${loop.last}</td>
	 	</tr>
	 </c:forEach>
	 </table>
	<hr>
	<h3>1~100까지의 정수 중 홀수의 합</h3>
	<c:forEach begin="1" end="100" var="i">
		<%-- <c:if test="${ i mod 2 eq 1 }"> --%>
		<%-- <c:if test="${ not (i mod 2 eq 0) }"> --%>
		<c:if test="${ i mod 2 ne 0 }">
			<c:set var="sum" value="${ sum + i }"/>
			${ sum }
		</c:if>
	</c:forEach>
	<br><b>결과는 =>	${ sum }</b> 
	<h3>1~100까지의 정수 중 짝수의 합</h3>
	<c:forEach begin="1" end="100" var="i">
		<c:if test="${ i mod 2 eq 0 }">
			<c:set var="sum2" value="${ sum2 + i }"/>
			${ sum2 }
		</c:if>
	</c:forEach>
	<br><b>결과는 =>	${ sum2 } </b>
	<hr>
	<h3>향상된 for문 형태의 forEach태그</h3>
	<!-- 향상된 for문
			current : 현재 루프의 실제 요소를 반환
			index : 현재 루프의 인덱스를 표시(0부터 시작)
			count : 일반 for문과 동일 
			first : 일반 for문과 동일 
			last : 일반 for문과 동일 
	 -->
	<%
		String[] rgba = {"Red","Green","Blue","Purple"};
	%>
	<!-- item 속성에 배열을 지정하고 변수 이름은 "c"로 입력 -->
	<table border='1'>
	<c:forEach items="<%=rgba%>" var="c" varStatus="loop">
		<tr>
		<td><b style="color:${c}">${c}</b></td>
		<td>current : ${loop.current}</td>
 		<td>index : ${loop.index}</td>
 		<td>count : ${loop.count}</td>
 		<td>first : ${loop.first}</td>
 		<td>last : ${loop.last}</td>
		</tr>
	</c:forEach>
	</table>
	<hr>
	<h3>List 컬렉션 사용하기</h3>
	<%
		List<Member> list = new ArrayList<Member>();
		list.add(new Member("iceT1","","아이스티1",""));
		list.add(new Member("iceT2","","아이스티2",""));
		list.add(new Member("iceT3","","아이스티3",""));
		list.add(new Member("iceT4","","아이스티4",""));
	%>
	<%-- 이렇게 쓰면 값을 담아둘 수 없음 <c:set var="list" value="${ list }" /> --%>
	<c:set var="list" value="<%= list %>" />
	<!-- items : 반복을 위한 객체를 지정
		var : 변수명 -->
	<ul>
	<c:forEach items="${ list }" var="member">
		<li>ID: ${ member.id }, NAME: ${ member.name }</li>
	</c:forEach>
	</ul>
	<hr>
	<h3>Map 컬렉션 사용하기</h3>
	<%
		Map<String, Member> map = new HashMap<String, Member>();
/* 		Map<String, Member> map = new LinkedHashMap<String, Member>(); LinkedHashMap로 쓰면 put 순서대로 값을 가져올 수 있음*/
		map.put("bt1", new Member("balm1","","바밍타이거1",""));
		map.put("bt2", new Member("balm2","","바밍타이거2",""));
		map.put("bt3", new Member("balm3","","바밍타이거3",""));
	%>
	<ul>
	<c:set var="map" value="<%= map %>"></c:set>
	<c:forEach items="${ map }" var="mapV" >
		<li>KEY: ${ mapV.key }, VALUE: ${ mapV.value }</li>
		<li>ID: ${ mapV.value.id }, NAME: ${ mapV.value.name }</li>
	</c:forEach>
	</ul>
	<hr>
	<h3>forTokens 태그 사용</h3>
	<!-- Token : 문법적으로 의미 있는 최소 단위
				구분자를 기준으로 문자열을 나눠 토큰의 갯수만큼 반복
				
		items : 문자열(*문자열만 사용 가능)
		delims : 구분자
		var : 변수명
	 -->
	<%
		String rgba2 = "Red,Green,Blue,Purple";
	%>
	<c:forTokens items="<%= rgba2 %>" delims="," var="color">
		<b style="color:${color}">${color}</b>
	</c:forTokens>
	
	<br><br><br><br><br>
</body>
</html>




























