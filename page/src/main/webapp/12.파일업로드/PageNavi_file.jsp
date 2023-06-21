<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageNavi.jsp</title>
</head>
<body>
<script>
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.submit();
	}
</script>

<c:set var="pDto" value="<%=pDto%>"/>
<c:set var="pageNo" value="<%=pageNo%>"/>
<c:if test="${pDto.prev}">
    <input type='button' value='시작' onclick='go(1);'>
    <input type='button' value='이전' onclick='go(${pDto.startNo}-1);'>
</c:if>
<c:forEach begin="${pDto.startNo}" end="${pDto.endNo}" step="1" var="i">
       <input type='button' class="btnNavi ${i eq pageNo ? 'on' : ''}" value='${i}' onclick='go(${i});'>
</c:forEach>
<c:if test="${pDto.next}">
   	<input type='button' value='다음' onclick='go(${pDto.endNo}+1);'>
  	<input type='button' value='끝' onclick='go(${pDto.realEndNo});'>
</c:if>    
</body>
</html>