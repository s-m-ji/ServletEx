<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fileupload.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>FileList.jsp</title>
<script>
function changePageSize(value) {
    var searchForm = document.forms.searchForm;
    searchForm.searchAmount.value = value;
    searchForm.submit();
}
</script>
</head>
<body>
<%	
	 String sField = request.getParameter("searchField");	
	 String sWord = request.getParameter("searchWord");	
	int pageNo = request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));
	int sAmount = request.getParameter("searchAmount") == null? 2 : Integer.parseInt(request.getParameter("searchAmount"));

	Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
	FileDao fDao = new FileDao();
	List<FileDto> list = fDao.getFileList(cr);	
	int total = fDao.getTotalCnt(cr);
	PageDto pDto = new PageDto(total, cr);
%>
	<h3>파일에 등록된 파일 목록 보기</h3>
	<a href="FileUpload.jsp" target="_blank">파일 등록하기</a><br><br>
	<c:set var="list" value="<%=list%>" />
	<c:set var="total" value="<%=total%>" />

	<%-- <c:set var="sField" value="${requestScope.sField}" />
	<c:set var="sWord" value="${requestScope.sWord}" />
	<c:set var="pageNo" value="${requestScope.pageNo}" />
	<c:set var="sAmount" value="${requestScope.sAmount}" />
	
	<c:set var="cr" value="${requestScope.cr}" />
	<c:set var="fDao" value="${requestScope.fDao}" />
	<c:set var="list" value="${requestScope.list}" />
	<c:set var="total" value="${requestScope.total}" />
	<c:set var="pDto" value="${requestScope.pDto}" /> --%>
	<!-- 검색폼 --> 
    <form name="searchForm">  
    <table border="1" width="90%">
    <tr>
    	<td><b>파일 총 ${total} 개</b></td>
<%--     	<td>파일 총 ${list.size()} 개</td> --%>
    	<td align="center">
            <select name="searchField"> 
                <option value="sfile" <%="sfile".equals(sField)? "selected" : "" %>>저장된 파일명</option>
                <option value="cate" <%="cate".equals(sField)? "selected" : "" %>>카테고리</option> 
                <option value="title" <%="title".equals(cr.getsField())? "selected" : "" %>>제목</option>
                <option value="name" <%="name".equals(cr.getsField())? "selected" : "" %>>작성자</option>
                <option value="postdate" <%="postdate".equals(cr.getsField())? "selected" : "" %>>작성일</option>
            </select>
            <input type="text" name="searchWord" value="<%= sWord == null? "" : sWord%>"/>
            <input type="hidden" name="pageNo" value="<%= cr.getPageNo()%>" >
            <input type="submit" value="검색하기" />
        <td align="center">
            <select name="searchAmount" onchange="changePageSize(this.value)">
            	<option value="1" <%= sAmount == 1 ? "selected" : "" %>>1개씩 보기</option>
            	<option value="5" <%= sAmount == 5 ? "selected" : "" %>>5개씩 보기</option>
            	<option value="10" <%= sAmount == 10 ? "selected" : "" %>>10개씩 보기</option>
            </select>
        </td>
    </tr>   
    </table>
    </form>
	<table border="1" width="90%" class="listTable">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>카테고리</th>
            <th>원본 파일명</th>
            <th>저장된 파일명</th>
            <th>작성일</th>
            <th>다운로드</th>
        </tr>
		<c:forEach items="${list}" var="fList">
        <tr>
            <td>${ fList.idx }</td>  
            <td>${ fList.name }</td>  
            <td>${ fList.title }</td>  
            <td>${ fList.cate }</td>  
            <td>${ fList.ofile }</td>  
            <td>${ fList.sfile }</td>  
            <td>${ fList.postdate }</td>  
            <td>
            	<a href="Download.jsp?oName=${fList.ofile}&sName=${fList.sfile}" download="${ fList.ofile }">
<%--             	<a href="${pageContext.request.contextPath}/upload/${ fList.sfile }" download="${ fList.sfile }"> --%>
                ${ fList.sfile }</a> 
            </td>
        </tr>
	</c:forEach>
	</table>
	<%@ include file="PageNavi_file.jsp" %>
</body>
</html>