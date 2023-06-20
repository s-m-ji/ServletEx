<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>Choose.jsp</title>
</head>
<body>
	<h3>Choose 다중 조건문</h3>
	<h4>홀/짝 판단하기 ~</h4>
	<!-- 변수 선언 -->
	<c:set var="num" value="101" />
	<!-- 다중 조건문 사용 -->
	<c:choose>
		<c:when test="${ num mod 2 eq 0 }">
			${ num }은(는) 짝수입니다옹
		</c:when>
		<c:otherwise>
			${ num }은(는) 홀수입니다옹
		</c:otherwise>
	</c:choose>
	<hr>
	<h4>학점 출력하기 ~</h4>
	<!-- 국/영/수 점수를 입력하면 평균을 내어 학점 출력 -->
	<p>>=90 : A, >=80 : B, >=70 : C, >=60 : D</p>
	<form action="">
		국어: <input type="text" name="ko"><br>
		영어: <input type="text" name="en"><br>
		수학: <input type="text" name="mt"><br>
		<input type="submit" value="학점 출력">
	</form>
	<!-- 모든 과목의 점수가 입력되었는지 확인 -->
	<c:if test="${ not (empty param.ko or empty param.en or empty param.mt) }" var="flag">
		국어 점수 : ${ param.ko }<br>
		영어 점수 : ${ param.en }<br>
		수학 점수 : ${ param.mt }<br>
		<c:set var="avg" value="${Math.round((param.ko + param.en + param.mt) div 3 *10)/10.0}"/>
		*평균 점수 : ${ avg }<br>
		<c:choose>
			<c:when test="${ avg gt 90 }">A학점</c:when>
			<c:when test="${ avg gt 80 }">B학점</c:when>
			<c:when test="${ avg gt 70 }">C학점</c:when>
			<c:when test="${ avg gt 60 }">D학점</c:when>
			<c:otherwise>에푸 ^_^ 홧팅	</c:otherwise>
		</c:choose>
	입니다옹
	</c:if>
	<c:if test="${not flag}">점수를 입력해줘잉</c:if>
</body>
</html>