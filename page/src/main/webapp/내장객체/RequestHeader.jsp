<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Enumeration"
    import="java.util.Iterator"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestHeader.jsp</title>
</head>
<body>
	<p>RequestHeader.jsp</p>
	<h2>3. HTTP 요청 헤더 정보 출력하기</h2>
	<%
		// Enumeration : 객체들을 집합체 형태로 관리하게 해주는 인터페이스
		// 요즘엔 Iterator를 더 많이 사용한다고용
		// 컬렉션에서 사용됨 (list, set, map)
		
		Enumeration headers = request.getHeaderNames();
	
		// .Next()와 비슷한 역할 : 요소가 있으면 가지고 오고 아니면 x.
		while(headers.hasMoreElements()){
			String headerName = (String)headers.nextElement();
			String headerValue = request.getHeader(headerName);
			
			out.print("headerName : " + headerName + " headerValue : " + headerValue + "<br>");
		}
	%>
	<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않는다. (다른 파일을 통해 경유하여 들어오면 생김)</p>
</body>
</html>