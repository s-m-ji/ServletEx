<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>searchForm.jsp</title>
<script>
function changePageSize(value) {
    var searchForm = document.forms.searchForm;
    searchForm.searchAmount.value = value;
    searchForm.submit();
}
</script>
</head>
<body>
<!-- 폼 액션이 없으면 자기자신의 페이지를 가져옴 ! -->
<!-- 그래서 action을 지정해주거나  -->
    <form name="searchForm" method="get">  
	    <table border="1">
		    <tr>
		    	<td><b>게시글 총 ${map.totalCnt} 개</b></td>
		    	<td><b>현재 화면에서 ${map.list.size()} 개</b></td>
		    	<td align="center">
		            <select name="searchField"> 
		                <option value="title" ${ param.searchField eq "title" ? "selected" : "" }>도서명</option>
		                <option value="writer" ${ param.searchField eq "writer" ? "selected" : "" }>작가명</option>
		                <option value="publisher" ${ sField eq "publisher"? "selected" : "" }>출판사명</option>
		            </select>
		            
		            <input type="text" name="searchWord" value="${param.searchWord }"/>
		            <input type="submit" value="검색하기" />
		            
		            <!-- 페이지 번호, 삭제할 글 번호 -->
 		            <input type="hidden" name="pageNo" value="1" >
 		            <input type="text" name="delNo" >
		            
		            <select name="searchAmount" onchange="changePageSize(this.value)">
		            	<option value="5" ${ sAmount eq 5 ? "selected" : "" }>5개씩 보기</option>
		            	<option value="10" ${ sAmount eq 10 ? "selected" : "" }>10개씩 보기</option>
		            	<option value="50" ${ sAmount eq 50 ? "selected" : "" }>50개씩 보기</option>
		            </select>
		        </td>
		    </tr>   
	    </table>
    </form>
</body>
</html>