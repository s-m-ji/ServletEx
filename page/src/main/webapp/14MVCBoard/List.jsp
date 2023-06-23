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
	    <table border="1">
		    <tr>
		    	<td><b>게시글 총 ${total} 개</b></td>
		    	<td><b>현재 화면에서 ${list.size()} 개</b></td>
		    	<td align="center">
		            <select name="searchField"> 
		                <option value="title" ${sField eq "title"? "selected" : "" }>제목</option>
		                <option value="content" ${sWord eq "content"? "selected" : "" }>내용</option>
		                <option value="sfile" ${"sfile".equals("")? "selected" : "" }>첨부파일명</option>
		            </select>
		            <input type="text" name="searchWord" value="${sWord == null? '' : sWord}"/>
		            <input type="submit" value="검색하기" />
		            <!--<input type="text" name="pageNo">-->
 		            <input type="text" name="pageNo" value="1" >
<%-- 		            <input type="hidden" name="pageNo" value="${pageNo}" > --%>
		            
		            <select name="searchAmount" onchange="changePageSize(this.value)">
		            	<option value="1" ${ sAmount eq 1 ? "selected" : "" }>1개씩 보기</option>
		            	<option value="5" ${ sAmount eq 5 ? "selected" : "" }>5개씩 보기</option>
		            	<option value="10" ${ sAmount eq 10 ? "selected" : "" }>10개씩 보기</option>
		            </select>
		        </td>
		    </tr>   
	    </table>
    </form>
    <!-- 목록 조회 -->
	<table border="1" class="listTable">
		<tr>
			<th>번호</th>		
			<th>제목</th>		
			<th>내용</th>		
			<th>작성일</th>		
			<th>조회수</th>		
			<th>첨부</th>		
		</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="6">🤷‍♀ 등록된 게시글이 없는걸 🤷‍♀️</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${requestScope.list}" var="mList">
				<tr>
					<td>${mList.idx}</td>
					<td><a href="../mvcboard/view.do?idx=${mList.idx}">${mList.title}</a></td>
					<td>${mList.content}</td>
					<td>${mList.postdate}</td>
					<td>${mList.visitcount}</td>
					<td>${mList.sfile}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
	<!-- 글쓰기 버튼 -->
	<table>
		<tr><td><button onclick="location=href='../mvcboard/write.do'">글쓰기</button></td></tr>
	</table>
	<%@ include file="../12.파일업로드/PageNavi_file.jsp" %>
	<%--
		include 태그로 모듈을 가져오게되면 저장된 Dto 값을 가져올 수 없기에
	 <jsp:include page="../12.파일업로드/PageNavi_file.jsp">
		-> 여기에 파라미터를 따로 넘겨줘야함 !
	</jsp:include> --%>
</body>
</html>