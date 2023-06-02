<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage = "true" 
    trimDirectiveWhitespaces = "true"
%>
	<!-- 위의 isErrorPage = "true" 지정
 		오류 페이지로 인식하여 예외 처리를 가져올 수 있다. -->
 		
 	<!-- trimDirectiveWhitespaces = "true" 지정
 		해당 페이지에 빈 여백을 안 보이게할 수 있다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>서비스 중 일시적인 오류가 발생했네용</h3>
	<h4>관리자님 ☎🙋‍♀️☎🙋‍♀️</h4>
	<pre>
		오류 코드 : 
		오류 이름 : <%= exception.getClass().getName()%> 
		오류 메세지 : <%= exception.getMessage()%> 
	</pre>
</body>
</html>