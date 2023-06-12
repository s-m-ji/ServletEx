<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>SignUp.jsp</title>
</head>
<body>
	<h2>회원가입</h2>
  <form action="ExeUpdate.jsp" method="POST">
    <label for="userid">ID:</label>
    <input type="text" id="userid" name="userid" required ><br><br>
    
    <label for="password">PW:</label>
    <input type="password" id="password" name="password" required ><br><br>

    <label for="username">NAME:</label>
    <input type="text" id="username" name="username" required ><br><br>

    <input type="submit" value="가입하기">
    <input type="reset" value="다시쓰기">
  </form>
</body>
</html>