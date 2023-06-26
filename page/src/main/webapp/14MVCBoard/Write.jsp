<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Write.jsp</title>
<script>
	function validateForm(form){
		if(form.name.value == ''){
			alert("⚠ 작성자를 입력해줭 ⚠"); 
			form.name.focus();
			return false;
		} 
		if(form.title.value == ''){
			alert("⚠ 제목을 입력해줭 ⚠"); 
			form.title.focus();
			return false;
		} 
		if (form.content.value == "") {
            alert("⚠ 내용을 입력해줭 ⚠");
            form.content.focus();
            return false;
        }
		if (form.pass.value == "") {
            alert("⚠ 비밀번호를 입력해줭 ⚠");
            form.pass.focus();
            return false;
        }
	}
</script>
</head>
<body>
	<h2>MVCBoardList - Write.jsp</h2>
	<form action="../mvcboard/write.do" method="post" 
		enctype="multipart/form-data" onsubmit="return validateForm(this);">
		<table border="1" class="listTable writeTable">
			<tr>
				<th>작성자 이름</th><td><input type="text" name="name" size="20"></td>
			</tr>
			<tr>
				<th>제목</th>	<td><input type="text" name="title" size="100"></td>
			</tr>	
			<tr>
				<th>내용</th>	<td><textarea name="content" cols="100" rows="10" style="resize: none;" ></textarea></td>
			</tr>	
			<tr>
				<th>첨부 파일</th>	<td><input type="file" name="file" multiple="multiple"></td>
			</tr>	
			<tr>
				<th>비밀번호</th><td><input type="text" name="pass" size="10"></td>
			</tr>
			<tr>
			<td colspan="2">
				<input type="submit" value="작성 완료">
				<input type="reset" value="RESET">
				<input type="button" value="목록 바로가기" onclick="location.href='../mvcboard/list.do'">
			</td></tr>	
		</table>
	</form>
</body>
</html>