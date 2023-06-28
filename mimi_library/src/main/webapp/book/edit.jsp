<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>edit.jsp</title>
<script>
	form.title.focus();
	
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
<!-- 헤더 -->
<%@ include file="../common/header.jsp" %>
	<h2>도서 수정</h2>
	<form action="../book/edit.book" method="post" 
		enctype="multipart/form-data" onsubmit="return validateForm(this);">
		도서번호 : <input type="text" name="no" value="${book.no }">
		<table border="1" class="listTable writeTable">
			<tr>
				<th>ID</th><td><input type="text" name="id" size="50" value="${sessionScope.userId}" readonly="readonly"></td>
			</tr>
			<tr>
				<th>도서명</th><td><input type="text" name="title" size="50" autofocus="autofocus" value="${book.title}"></td>
			</tr>
			<tr>
				<th>작가명</th>	<td><input type="text" name="author" size="50" value="${book.author}"></td>
			</tr>	
			<tr>
				<th>출판사명</th>	<td><input type="text" name="publisher" size="50" value="${book.publisher}"></td>
			</tr>	
			<tr>
				<th>첨부 파일(책 이미지)</th>	<td><input type="file" name="book_img" multiple="multiple"></td>
			</tr>	
			<tr>
			<td colspan="2">
				<input type="submit" value="작성 완료">
				<input type="reset" value="RESET">
				<input type="button" value="목록 바로가기" onclick="location.href='../book/list.book'">
			</td></tr>	
		</table>
	</form>
</body>
</html>