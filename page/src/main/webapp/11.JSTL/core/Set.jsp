<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>Set.jsp</title>
</head>
<body>
	<!-- JSTL(JSP Standard Tag Library)
		JSP 표준 태그 라이브러리를 이용하면 스크립틀릿을 사용하지 않고 
		태그를 사용하여 제어문, 반복문 등을 사용 가능.
		
		기본 태그가 아닌 확장 태그이므로 사용하기 위해서는 별도의 라이브러리가 필요함.
		메이븐 리파지토리로 접근하여 jstl-1.2.jar파일 다운로드 받고 lib 폴더에 추가. 
	 
	 	JSTL 종류
	 		Core 태그: 변수 선언, 조건/반복문, URL 처리
	 		접두어: c
	 		
	 		Formatting 태그: 숫자, 날짜, 시간 포맷 지정
	 		접두어: fmt
	 
	 	JSTL을 사용하려면 ?
	 	1. 라이브러리 추가
	 	2. taglib 지시어 추가
	 -->
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	 
	 <!-- Core 태그 
	 	변수 선언, 조건문, 반복문 등을 대체 하는 태그를 제공
	 	
	 	set : 변수 선언 (setAttribute())
	 	remove : 변수 제거 (removeAttribute())
	 	if : 단일 조건문 처리 (else문 없음)
	 	choose : 다중 조건문 (when ~ otherwise 태그 이용)
	 	forEach : 반복문 처리
	 	forTokens : 구분자로 분리된 토큰을 처리
	 	import : 외부 파일 삽입
	 	redirect : 지정한 경로로 이동(sendRedirect())
	 	url : 경로를 설정
	 	out : 내용을 출력
	 	catch : 예외 처리
	 -->
	
	 <!-- 1. 변수 선언
			var: 변수명
			value: 값
			scope: 저장영역 (지정하지않으면 가장 가까운 영역에 저장됨)
	  --> 
	  
	 <c:set var="directVar" value="100"/> 
	 <c:set var="elVar" value="${ directVar mod 5 }"/> 
	 <c:set var="expVar" value="<%= new Date() %>"/> 
	 <c:set var="betweenVar">변수 값</c:set> 
	 
	 <h3>EL을 이용해 변수 출력</h3>
	<ul>
		<li>directVar : ${pageScope.directVar}</li>
		<li>elVar : ${elVar}</li>
		<li>expVar : ${expVar}</li>
		<li>betweenVar : ${betweenVar}</li>
	</ul>
	<hr>
	 <h3>자바빈즈 생성1 - 생성자 사용</h3>
	 <c:set var="personVal1" 
	 	value='<%= new Member("coda", "", "코다라인", "2023-06-20") %>'
	 	scope="request"/>
	 <ul>
	 	<li>ID : ${personVal1.id}</li>
	 	<li>NAME : ${personVal1.name}</li>
	 	<li>REGIDATE : ${requestScope.personVal1.regidate}</li>
	 </ul>
	<hr>
	 <h3>자바빈즈 생성2 - target, property 사용</h3>
	 <!-- target : 자바빈즈 속성명 -> 표현식(< % =변수%>)이나 EL 변수(${varName})로 써야함
	 		property : 자바빈즈 속성명(멤버변수명)
	 		value: 값 지정
	 -->
	 <c:set var="personVal2" 
	 	value='<%= new Member("jami", "", "자미로콰이", "") %>'
	 	scope="request"/>
	 <ul>
	 	<li>변경 전 ID : ${personVal2.id}</li>
	 	<li>변경 전 NAME : ${requestScope.personVal2.name}</li>
	 </ul>

	 <c:set target="${personVal2}" property="id" value="jjjaaammmiii"/>
	 <c:set target="${personVal2}" property="name" value="자미로로로로로콰이"/>
	 <ul>
	 	<li>변경 후 ID : ${personVal2.id}</li>
	 	<li>변경 후 NAME : ${requestScope.personVal2.name}</li>
	 </ul>
	<hr>
	 <h3>List 컬렉션 이용하기</h3>
	 <%
	 	ArrayList<Member> list = new ArrayList<Member>();
	 	list.add(new Member("Gel","","실리카겔",""));
	 	list.add(new Member("Nah","","나씨밴",""));
	 %>
	<c:set var="pList" value="<%= list %>" scope="request"/>
	 <ul>
	 	<li>ID : ${pList[0].id}</li>
	 	<li>NAME : ${requestScope.pList[0].name}</li>
	 	<li>ID : ${pList[1].id}</li>
	 	<li>NAME : ${requestScope.pList[1].name}</li>
	 </ul>
	<hr>
	 <h3>Map 컬렉션 이용하기</h3>
	 <%
	 	Map<String, Member> map = new HashMap<String, Member>();
	 	map.put("pArgs1", new Member("Balm","","바밍타이거",""));
	 	map.put("pArgs2", new Member("Salt","","소금",""));
	 %>
	 <c:set var="map" value="<%= map %>" scope="request"/>
	 <ul>
	 	<li>ID : ${map.pArgs1.id}</li>
	 	<li>NAME : ${requestScope.map.pArgs1.name}</li>
	 	<li>ID : ${map.pArgs2.id}</li>
	 	<li>NAME : ${requestScope.map.pArgs2.name}</li>
	 </ul>
</body>
</html>






















