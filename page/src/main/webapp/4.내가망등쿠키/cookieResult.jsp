<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieResult.jsp</title>
</head>
<body>
	<h2>쿠키 값 확인하기</h2>
	<p>※ 처음 접속 시 저장된 쿠키가 없는 경우, 빈 페이지가 출력될 수 있음</p>
	<%
		Cookie[] cks = request.getCookies();
		if(cks != null) {
			for(Cookie c : cks){
				String cName = c.getName();
				String cValue = c.getValue();
				out.print("cName : " + cName + "<br>");
				out.print("cValue : " + cValue + "<br>");
				out.print("<br>");
			}
		}
	%>
</body>
</html>