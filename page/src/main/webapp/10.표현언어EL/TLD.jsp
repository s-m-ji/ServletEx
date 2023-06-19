<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>TLD.jsp</title>
</head>
<body>
	<!-- TLD(Tag Library Descriptor) 
		JSP에서 사용되는 커스텀태그나 JSTL의 태그들에 대한 설정 파일
		WEB-INF 하위에 위치해야 인식 가능함 ! 
		prefix : EL에서 사용할 접두어
		uri : tld 파일의 경로
	-->
	<%@ taglib prefix="myTag" uri="/WEB-INF/MyTagLib.tld" %>
	<%
	pageContext.setAttribute("response", response);
	%>
	<h3>TLD 파일에 등록 후 정적 메소드 호출하기</h3>
	<ul>
		<li>"100" : ${ myTag:isNumber("100")}</li>
		<li>"abc" : ${ myTag:isNumber("abc")}</li>
	</ul>
	<ul>
		<li>${ myTag:makeCookie(response, "ELCookie", "식사는없습니다", 10) }</li>
		<li>ELCookie : ${ cookie.ELCookie.value }</li>
	</ul>
</body>
</html>