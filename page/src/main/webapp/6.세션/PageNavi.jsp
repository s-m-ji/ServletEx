<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageNavi.jsp</title>
</head>
<body>
<script>
	function go(page){
		/* location.href="TableList.jsp?pageNo="+page; */
		document.searchForm.pageNo.value=page;
		document.searchForm.submit();
	}

</script>
	<%
    out.print("<input type='button' value='시작' onclick='go(1);'>");
    if (pDto.isPrev()) {
        out.print("<input type='button' value='이전' onclick='go("+ (pDto.getStartNo()-1) +");'>");
    }
    
    for (int i = pDto.getStartNo(); i <= pDto.getEndNo(); i++) {
        String btnClass = (i == pageNo) ? "btnNavi on" : "btnNavi";
        out.print("<input type='button' class='" + btnClass + "' value='"+i+"' onclick='go("+ i +");'>");
    }
    
    if (pDto.isNext()) {
        out.print("<input type='button' value='다음' onclick='go("+ (pDto.getEndNo()+1) +");'>");
    }
    
    out.print("<input type='button' value='끝' onclick='go("+ (pDto.getRealEndNo()) +");'>");
%>


	
	
</body>
</html>