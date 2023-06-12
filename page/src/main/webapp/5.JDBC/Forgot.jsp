<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Forgot.jsp</title>
</head>
<body>
	<h2>ID/PW 찾기</h2>
  <form action="ForgotData.jsp" method="POST">
  <%
  	String forgot = request.getParameter("forgot");
	if("id".equals(forgot)){
	%>
	<h4>👇 ID를 찾으시려면 가입한 NAME을 입력하세욧</h4>
	 <label for="username">NAME:</label>
    <input type="text" id="username" name="username" required >
	<%	
	} else if("pw".equals(forgot)){
	%>
		<h4>👇 PW를 찾으시려면 가입한 ID을 입력하세욧</h4>
		 <label for="userid">ID:</label>
	    <input type="text" id="userid" name="userid" required >
	<%
	}  
  %>
    <input type="submit" value="찾기">
  </form>
</body>
</html>