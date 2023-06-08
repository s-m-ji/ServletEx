<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception.jsp</title>
</head>
<body>
	<h4>아이쿠?</h4>
	<%
		// response 내장 객체로부터 에러 코드를 확인
		int status = response.getStatus();
	
		// 에러 코드에 맞게 적절한 메세지를 출력
		if(status == 404){
			out.print("아이쿠? ERROR CODE : 404");
			out.print("<br>파일 경로를 확인해줘잉");
		} else if(status == 405) {
			out.print("아이쿠? ERROR CODE : 405");
			out.print("<br>요청방식(method)을 확인해줘잉");
		} else if(status == 500){
			out.print("아이쿠? ERROR CODE : 500");
			out.print("<br>관리자한테 문의해줘잉");
		}
	%>
</body>
</html>