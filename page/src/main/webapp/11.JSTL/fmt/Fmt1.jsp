<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../css/style.css">
<title>Fmt1.jsp</title>
</head>
<body>
	<!-- formatNumber
		var : 변수명 (변수명을 지정하지 않으면 바로 출력)
		value : 출력할 숫자
		pattern : 숫자 패턴
		scope : 영역
		type : 출력 양식을 설정
			- percent (퍼센트)
			- currency (통화)
			- number (기본값, 일반숫자)
		groupingUesd : 구분기호 사용여부
	 -->
	 
	<h3>숫자 포맷 설정</h3>
	 <c:set var="num" value="12345"/>
	콤마(,)출력 O : <fmt:formatNumber value="${num}"/><br>
	콤마(,)출력 X : <fmt:formatNumber value="${num}" groupingUsed="false"/><br>
	
	변수에 저장 <fmt:formatNumber value="${num}" var="saveVar" type="currency" /><br>
<%-- 	변수에 저장 <fmt:formatNumber value="${num}" var="saveVar" type="currency" currencySymbol="₩"/><br> --%>
	변수에 저장된 값 출력 ${saveVar}<br> 
	
	퍼센트 : <fmt:formatNumber value="0.03" type="percent"/>
	
	<h3>패턴을 지정하여 숫자를 활용</h3>
	<c:set var="num2" value="123456.0789"/>
	0, # : 자릿수를 의미함<br>
	0 표현 : 자리에 숫자가 없으면 0으로 표시 : 자릿수를 맞춰서 출력하고싶을 때<br>
	# 표현 : 자리에 숫자가 없으면 공란으로 표시<br>
	
	<fmt:formatNumber value="${num2}"/><br>
	"0,00.0" <fmt:formatNumber value="${num2}" pattern="0,00.0"/><br>
	"0,000,00.0" <fmt:formatNumber value="${num2}" pattern="0,000,00.0"/><br>
	"#,###.##" <fmt:formatNumber value="${num2}" pattern="#,###.##"/><br>
	"###,###.0000000" <fmt:formatNumber value="${num2}" pattern="###,###.0000000"/><br>
	
	<fmt:parseNumber value="${num2}" integerOnly="true" var="saveVar2" />
	정부 부분만 : ${saveVar2}
<hr>
	<h3>날짜 포맷 설정</h3>
	<c:set var="today" value="<%= new java.util.Date() %>"/>
	오늘은 : ${today}<br><br>
	
	<fmt:formatDate value="${today}" type="date"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="medium"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${today}" type="date" dateStyle="full"/><br><br>
	
	<fmt:formatDate value="${today}" type="time"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="short"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="medium"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="long"/><br>
	<fmt:formatDate value="${today}" type="time" timeStyle="full"/><br>
	
	<h3>날짜/시간 표시</h3>
	<fmt:formatDate value="${today}" type="both" dateStyle="default" timeStyle="default"/><br>
	<fmt:formatDate value="${today}" type="both" dateStyle="short" timeStyle="short"/><br>
	<fmt:formatDate value="${today}" type="both" dateStyle="medium" timeStyle="medium"/><br>
	<fmt:formatDate value="${today}" type="both" dateStyle="long" timeStyle="long"/><br>
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<h3>패턴 지정 후 표시</h3>
	<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd- hh:mm:ss"/><br>
	
	<h3>타임존 설정</h3>
	<fmt:timeZone value="GMT">
	<!-- GMT: 세계협정시, 대한민국보다 9시간 빠름 -->
		GMT: <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone><br>
	<fmt:timeZone value="America/Chicago">
		America/Chicago : <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone><br>
	<fmt:timeZone value="Canada/Central">
		Canada/Central : <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	<fmt:timeZone value="Asia/Shanghai">
		Asia/Shanghai : <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone><br>
	
	<h3>로케일 설정</h3>
	한글로 설정 : <fmt:setLocale value="ko_kr"/><br>
	<fmt:formatNumber value="10000" type="currency" />
	<fmt:formatDate value="${today}" type="date"/><br>
	
	일어로 설정 : <fmt:setLocale value="ja_JP"/><br>
	<fmt:formatNumber value="10000" type="currency" />
	<fmt:formatDate value="${today}" type="date"/><br>
	
	영어로 설정 : <fmt:setLocale value="en_US"/><br>
	<fmt:formatNumber value="10000" type="currency" />
	<fmt:formatDate value="${today}" type="date"/><br>
	<br><br><br><br><br>
</body>
</html>




















