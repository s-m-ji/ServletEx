<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>FileUpload.jsp</title>
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
		if(form.attachedFile.value == ''){
			alert("⚠ 파일 첨부는 필수유 ⚠"); 
			return false;
		} 
		
		var ck = document.querySelectorAll("[name=cate]:checked").length;
		if(ck == 0){
			alert("⚠ 카테고리를 체크해줭 ⚠"); 
			return false;
		}
	}
</script>
</head>
<body>
<!-- 파일 업로드
	- 라이브러리(cos.jar) 추가
	- form 속성 설정
		method : post
		enctype : multipart/form-data
		
		form 값을 서버로 전송할 때의 인코딩 방식을 지정
		- application/x-www-form-urlencoded(기본값)
			모든 문자를 서버로 전송하기 전에 인코딩함
		- multipart/form-data
			form태그를 통해 파일을 서버로 전송할 때 사용함
			모든 문자를 인코딩하지 않음.
	-->
	<h3>파일 업로드</h3>
			<!-- 사용자 입력 체크 로직을 추가 : 유효성 검사 validation -->
	<%
		String errMsg = (String)request.getAttribute("errMsg");
	%>
	<p>${errMsg}</p>
	<form action="UploadProcess.jsp" method="post" 
			enctype="multipart/form-data" 
			onsubmit="return validateForm(this);">
		<fieldset>
		<legend>파일 업로드</legend>
		작성자 : <input type="text" name="name" value="작성자"><br>
		제목 : <input type="text" name="title" value="제목"><br>
		카테고리 : <input type="checkbox" name="cate" value="사진" checked="checked"> 사진
				<input type="checkbox" name="cate" value="과제"> 과제
				<input type="checkbox" name="cate" value="워드"> 워드
				<input type="checkbox" name="cate" value="음원"> 음원<br>
		첨부파일 : <input type="file" name="attachedFile"><br>
		<!-- 첨부파일 여러개 : <input type="file" name="attachedFile" multiple="multiple"><br> -->
		<input type="submit" value="전송하기">
		</fieldset>
	</form>
	<hr>
	<h3>파일 다운로드</h3>
	<%
	/* String ofileName = mr.getFilesystemName("attachedFile"); */
	%>
	<a href="${pageContext.request.contextPath}/upload/kerokero.png" download="파일명">kerokero.png 다운로드</a>
	<hr>
</body>
</html>










