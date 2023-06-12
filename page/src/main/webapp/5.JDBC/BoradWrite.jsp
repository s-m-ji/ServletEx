<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>BoradWrite.jsp</title>
</head>
<body>
	<h2>글쓰기</h2>
  <form action="ExeUpdate2.jsp" method="POST">
    <label for="title">TITLE:</label><br>
    <textarea id="title" name="title" cols="100" rows="1"></textarea><br><br>
    
    <label for="content">CONTENT:</label><br>
    <textarea id="content" name="content" cols="100" rows="10"></textarea><br><br>

    <input type="submit" value="글쓰기">
    <input type="reset" value="취소">
  </form>
</body>
</html>