<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>outMain.jsp</title>
</head>
<body>
	<!-- 
		out 객체
		웹 브라우저에 변수 등의 값을 출력할 때 사용
		스크립틀릿 (< % 자바코드 % >) 내부에서 변수 등을 출력하기 위해 사용 
	 -->
	 
	 <%
	 	// 버퍼 내용 삭제하기
	 	out.print("<h3>out 내장 객체</h3>");
		out.clearBuffer(); 			// 버퍼를 비움
		out.print("평범한 목요일밤 ~ "); // 버퍼에 저장
		
		// 기본 크기 8kb(1kb= 1024byte)
		out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
		out.print("남은 버퍼의 크기 1 : " + out.getRemaining() + "<br>");
		
		out.flush(); // 버퍼의 내용을 출력
		out.print("남은 버퍼의 크기 2 : " + out.getRemaining() + "<br>");
		
		out.println(123);
		out.println(false);
	 %>
</body>
</html>