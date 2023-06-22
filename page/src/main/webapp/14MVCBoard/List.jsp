<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>List.jsp</title>
<script>
function changePageSize(value) {
    var searchForm = document.forms.searchForm;
    searchForm.searchAmount.value = value;
    searchForm.submit();
}
</script>
</head>
<body>
	<h2>MVCBoardList - List.jsp</h2>
	<!-- 검색폼 --> 
    <form name="searchForm">  
	    <table border="1" width="90%">
		    <tr>
		    	<td><b>파일 총 ${total} 개</b></td>
		    	<td align="center">
		            <select name="searchField"> 
		                <option value="sfile" ${"sfile".equals(sField)? "selected" : "" }>저장된 파일명</option>
		                <option value="title" ${"title".equals(cr.getsField())? "selected" : "" }>제목</option>
		                <option value="name" ${"name".equals(cr.getsField())? "selected" : "" }>작성자</option>
		                <option value="postdate" ${"postdate".equals(cr.getsField())? "selected" : "" }>작성일</option>
		            </select>
		            <input type="text" name="searchWord" value="${sWord == null? "" : sWord}"/>
		            <input type="hidden" name="pageNo" value="${cr.getPageNo()}" >
		            <input type="submit" value="검색하기" />
		            <select name="searchAmount" onchange="changePageSize(this.value)">
		            	<option value="1" ${ sAmount == 1 ? "selected" : "" }>1개씩 보기</option>
		            	<option value="5" ${ sAmount == 5 ? "selected" : "" }>5개씩 보기</option>
		            	<option value="10" ${ sAmount == 10 ? "selected" : "" }>10개씩 보기</option>
		            </select>
		        </td>
		    </tr>   
	    </table>
    </form>
    <!-- 목록 조회 -->
	<table border="1" class="listTable">
		<tr>
			<th>번호</th>		
			<th>작성자 이름</th>		
			<th>제목</th>		
			<th>내용</th>		
			<th>작성일</th>		
			<th>원본 파일명</th>		
			<th>저장된 파일명</th>		
			<th>다운로드 횟수</th>		
			<!-- <th>비밀번호</th>		 -->
			<th>조회수</th>		
		</tr>
	<c:forEach items="${requestScope.list}" var="mList">
		<tr>
			<td>${mList.idx}</td>
			<td>${mList.name}</td>
			<td>${mList.title}</td>
			<td>${mList.content}</td>
			<td>${mList.postdate}</td>
			<td>${mList.ofile}</td>
			<td>${mList.sfile}</td>
			<td>${mList.downcount}</td>
			<%-- <td>${mList.pass}</td> --%>
			<td>${mList.visitcount}</td>
		</tr>
	</c:forEach>
	</table>
	<!-- 글쓰기 버튼 -->
	<table>
		<tr><td><a href="/mvcboard/write.do">글쓰기</a></td></tr>
	</table>
	<%@ include file="../12.파일업로드/PageNavi_file.jsp" %>
</body>
</html>