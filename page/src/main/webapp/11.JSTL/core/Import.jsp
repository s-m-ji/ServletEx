<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>Import.jsp</title>
</head>
<body>
	<!-- import : 외부 파일을 현재 위치에 삽입
		url : 외부 파일 경로
		scope : 영역
		var : 변수명
		변수명을 사용하려면 선언과 삽입을 분리할 수 있음
		
		외부파일에 매개변수 넣기
		- url의 쿼리스트링으로 전달
		- c:param 태그 이용
	 -->
	 <h3>다른 문서 삽입하기</h3>
	 <c:import url="Link_jstl.jsp" var="link">
	 	<c:param name="user_param2" value="헤더영역"></c:param>
	 </c:import>
	 <!-- 변수명으로 호출하지않으면 import된 페이지를 바로 확인할 수 없음 -->
	 ${ link }
	
	<h3>iframe을 이용한 외부 자원 삽입하기</h3>
	<iframe src="../inc/GoldPage.jsp" style="width:100%; height:300px" ></iframe>
	<c:set var="iTag">i 태그는 <i>기울임</i>을 표현합니당</c:set>
	
	<h3>out 태그 기본 사용</h3>
	<c:out value="${ iTag }"></c:out>
	
	<h3>EL로 출력</h3>
	${ iTag }
	
	<h3>escapeXML 속성</h3>
	<!-- HTML 태그를 해석하여 마크업이 적용된 상태로 출력 -->
	<c:out value="${iTag}" escapeXml="false"/>
	
	<h3>default 속성</h3>
	<c:out value="${param.name}" default="이름 없ㅇ..."/>
	<!-- "" 빈 문자열도 값으로 인식하므로 디폴트가 출력되지않음 -->
	<c:out value="" default="빈 문자열도 값인걸요?"/>

	<h3>redirect</h3>
	<c:set var="requestVar" value="requestVar" scope="request"/>
	<%-- <c:redirect url="../inc/OtherPage.jsp">
		<c:param name="user_param1">user_param1</c:param>
		<c:param name="user_param2">user_param2</c:param>
	</c:redirect> --%>
	
	
</body>
</html>

















