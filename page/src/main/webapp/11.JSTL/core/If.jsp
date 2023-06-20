<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>If.jsp</title>
</head>
<body>
	<h3>JSTL의 if 태그로 짝/홀수 판단하기</h3>
	<c:set var="num" value="101"/>
	<!-- 
		test : if문에서 사용할 조건을 지정(EL 사용 가능)
		var : 조건의 결과를 저장할 변수명
		scope : 변수가 저장될 영역 
	 -->
	 <c:if test="${ num mod 2 eq 0 }" var="result">
	 	<!-- 조건이 참인 경우 실행 ※ else 문은 없음. -->
		${ num }은(는) 짝수입니다옹
	 </c:if>
	 <br>
	 result : ${ result }
	<h3>문자열 비교와 else 구문 흉내내기</h3>
	<c:if test="${ not result }" var="result2">
		${ num }은(는) 홀수입니다옹
	</c:if>
	 <br>
	result2 : ${ result2 }
	<br>
	 <br>
	<!-- 문자열 변수 선언 -->
	<c:set var="str" value="JSP"/>
	<c:if test="${ str eq 'Java' }" var="result3">
		문자열은 Java입니다옹
	</c:if>
	<c:if test="${ not result3 }">
		문자열은 Java가 아닙니다옹
	</c:if>
	<h3>조건식 주의사항</h3>
	<!-- EL을 쓰지않는 경우 -->
	<c:if test="100" var="result4">
		EL을 쓰지않는 경우 (일반값을 입력) false
	</c:if>
	<br>
	EL을 쓰지않는 경우 (일반값을 입력) : false
	<br>
	result4 : ${ result4 }
	<!--   -->
	<br>
	<c:if test="tRuE" var="result5">
		대/소문자 구분없이 "tRuE" 경우 : true
	</c:if>
	<br>
	result5 : ${ result5 }
	<c:if test="  ${result5}  " var="result6">
		조건, EL에 공백이 삽입된 경우 false
	</c:if>
	<br>
	조건, EL에 공백이 삽입된 경우 : false
	<br>
	result6 : ${ result6 }
</body>
</html>


















