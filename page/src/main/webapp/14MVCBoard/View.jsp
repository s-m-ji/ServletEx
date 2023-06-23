<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>View.jsp</title>
<!-- <script>
	function deletePost(){
		var check = prompt("진짜 정말 리얼리 삭제를 원한다면 비밀번호를 입력해줭");
		if("1234" == check){
			location.href="../mvcboard/pass.do?idx=${mDto.idx}";
		}
	}
</script> -->
</head>
<body>
	<h2>MVCBoardList - View.jsp</h2>
	<!-- 상세 조회 -->
	<table border="1" class="listTable">
		<tr>
			<th>번호</th>	
			<td>${mDto.idx}</td>
			<th>작성자 이름</th>		
			<td>${mDto.name}</td>
		</tr>
		<tr>
			<th>작성일</th>		
			<td>${mDto.postdate}</td>
			<th>조회수</th>	
			<td>${mDto.visitcount}</td>
		<tr>
			<th>제목</th>		
			<td colspan="3" >${mDto.title}</td>
		</tr>	
		<tr>
			<th>내용</th>		
			<td colspan="3">${mDto.content}</td>
		</tr>
		<tr>	
			<th>첨부파일</th>		
			<td>
            <c:if test="${ not empty mDto.ofile }">
            ${ mDto.ofile }
            <a href="../mvcboard/download.do?ofile=${ mDto.ofile }&sfile=${ mDto.sfile }&idx=${ mDto.idx }">
                [다운로드]
            </a>
            </c:if>
        </td>
			<th>다운로드 횟수</th>		
			<td>${mDto.downcount}</td>
		</tr>
	</table>
	<!-- 수정, 삭제, 목록 버튼 -->
	<table border="1">
		<tr>
			<td colspan="4">
				<button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${ param.idx }';">수정하기</button>
		        <button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${ param.idx }';">삭제하기</button> 
		        <button type="button" onclick="location.href='../mvcboard/list.do';">목록 보기</button>
			</td>
		</tr>
	</table>
</body>
</html>