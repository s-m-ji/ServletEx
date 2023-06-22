<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp</title>
</head>
<body>
	<h2>MVCBoardList - View.jsp</h2>
	<!-- 상세 조회 -->
	<table border="1" class="listTable">
		<tr>
			<th>번호</th>	
			<td>${mDto.idx}</td>
			<th>작성자 이름</th>		
			<td>${mList.name}</td>
		</tr>
			<th>작성일</th>		
			<td>${mList.postdate}</td>
			<th>조회수</th>	
			<td>${mList.visitcount}</td>
		<tr>
			<th>제목</th>		
			<td>${mList.title}</td>
		</tr>	
		<tr>
			<th>내용</th>		
			<td>${mList.content}</td>
		</tr>
		<tr>	
			<th>첨부파일</th>		
			<td>${mList.sfile}</td>
			<th>다운로드 횟수</th>		
			<td>${mList.downcount}</td>
		</tr>
	</table>
	<!-- 수정, 삭제, 목록 버튼 -->
	<table>
		<tr>
			<td>
				<button type="button" onclick="location.href='/mvcboard/list.do'">수정하기</button>
		        <button type="button" onclick='delete();'>삭제하기</button> 
		        <button type="button" onclick="location.href='/mvcboard/list.do'">목록 보기</button>
			</td>
		</tr>
	</table>
</body>
</html>