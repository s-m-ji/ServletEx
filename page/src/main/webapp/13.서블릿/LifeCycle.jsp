<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>LifeCycle.jsp</title>
<script>
	function requestAction(form, type){
		if(type == 1){
			form.method = "get";
		} else {
/* 		} else if(type == 2) { */
			form.method = "post";
		}
	form.submit();		
	}
	
</script>
</head>
<body>
	<h3>서블릿 수명 주기 메소드</h3>
	<form action="./LifeCycle.do">
		<input type="button" value="Get방식 요청" onclick="requestAction(this.form, 1)">
		<input type="button" value="Post방식 요청" onclick="requestAction(this.form, 2)">
	</form>
</body>
</html>