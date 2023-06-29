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
<%@ include file="../Login/Link.jsp" %>
	<h2>ExProject0629 - List.jsp</h2>
	<!-- 검색폼 --> 
    <form name="searchForm">  
	    <table border="1">
		    <tr>
		    	<td><b>게시글 총 ${total} 개</b></td>
		    	<td><b>현재 화면에서 ${list.size()} 개</b></td>
		    	<td align="center">
		            <select name="searchField"> 
		                <option value="title" ${ param.searchField eq "title" ? "selected" : "" }>제목</option>
		                <option value="name" ${ param.searchField eq "name" ? "selected" : "" }>작성자</option>
		                <option value="postdate" ${ sField eq "postdate"? "selected" : "" }>작성일</option>
		            </select>
		            <input type="text" name="searchWord" value="${param.searchWord }"/>
		            <input type="submit" value="검색하기" />
 		            <input type="hidden" name="pageNo" value="1" >

		            <select name="searchAmount" onchange="changePageSize(this.value)">
		            	<option value="5" ${ sAmount eq 5 ? "selected" : "" }>5개씩 보기</option>
		            	<option value="10" ${ sAmount eq 10 ? "selected" : "" }>10개씩 보기</option>
		            	<option value="50" ${ sAmount eq 50 ? "selected" : "" }>50개씩 보기</option>
		            </select>
		        </td>
		    </tr>   
	    </table>
    </form>
    <!-- 게시글 목록 -->
	<table border="1" class="listTable">
		<tr>
			<th>선택</th>	
			<th>번호</th>		
			<th width="40%">제목</th>		
			<th>작성자</th>		
			<th>작성일</th>		
			<th>조회수</th>		
			<th>첨부파일</th>		
		</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="6">🤷‍♀ 등록된 게시글이 없는걸 🤷‍♀️</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${requestScope.list}" var="mList">
				<tr>
					<!-- 삭제용 체크박스 -->
					<td><input type="checkbox" name="delNo" value="${mList.idx}"></td>
					<td>${mList.idx}</td>
					<td><a href="../mvcboard/view.do?idx=${mList.idx}">${mList.title}</a></td>
					<td>${mList.name}</td>
					<td>${mList.postdate}</td>
					<td>${mList.visitcount}</td>
					<td>
						<c:if test="${not empty mList.ofile}" var="fileDwld">
							<a href="../mvcboard/download.do?ofile=${mList.ofile}&sfile=${mList.sfile}" download="${mList.ofile}">있음 📥</a>
						</c:if>
						<c:if test="${ not fileDwld }">
							<font color="#666">없음</font>
						</c:if>
					</td> 
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	<!-- 글쓰기 버튼 -->
	<table>
		<tr><td>
		<button onclick="location=href='../Board/write.do'">글쓰기</button>
		<button onclick="location=href='../Board/delete.do'">글삭제</button>
		<button onclick="location=href='../Board/list.do'">전체 목록 조회</button>
		</td></tr>
	</table>
	<!-- 페이지네이션 블록 -->
	<table>
		<tr><td><%@ include file="PageNavi_file.jsp" %></td></tr>
	</table>
</body>
</html>