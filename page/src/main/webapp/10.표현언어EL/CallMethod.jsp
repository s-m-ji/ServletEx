<%@page import="el.MyELClass"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>CallMethod.jsp</title>
</head>
<body>
<h3>영역에 저장 후 메소드 호출</h3>
	<%
		MyELClass el = new MyELClass();
		pageContext.setAttribute("el", el);
		pageContext.setAttribute("response", response);
	%>
	990909-2345678 : ${ el.getGender("990909-2345678") } <br>
	990909-1234567 : ${ el.getGender("990909-1345678") } <br>
	990909-5678912 : ${ el.getGender("990909-5345678") } <br>
	"123a"는 숫자인가요? : ${ el.isNumber("123a") } <br>
	<p>5단까지 출력</p>
	${ el.showGugu(5) }
	${ CookieManager.makeCookie(response, "ELCookie", "식사는없습니다", 10) }<br>
	ELCookie : ${ cookie.ELCookie.value }
	<hr>
	<h3>메소드 호출하기</h3>
	123-456 => ${ "123-456".replace("-", " 그리고 ") }
	<br><br><br><br><br>
</body>
</html>