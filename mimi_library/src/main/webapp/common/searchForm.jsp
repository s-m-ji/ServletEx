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
 		            <input type="text" name="pageNo" value="1" >
		            
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