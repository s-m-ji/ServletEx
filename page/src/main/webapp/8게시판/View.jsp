<%@page import="dto.Criteria"%>
<%@page import="common.JSPFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script src="https://kit.fontawesome.com/bc0f5040fb.js" crossorigin="anonymous"></script>
<title>회원제 게시판</title>
</head>
<body>
<%@ include file="../6.세션/Link.jsp" %>
<%
	String num = request.getParameter("num");
	String pageNo ="1";
	if(request.getParameter("pageNo") != null){
		pageNo = request.getParameter("pageNo");
	}
	NewBoardDao dao = new NewBoardDao();
	dao.updateVsCnt(num);
	Board b = dao.getPostOne(num);
	if(num == null){
		JSPFunction.alertBack("존재하지 않는 게시글 🤷", out);
		return; 
		// 여기서 return을 하지 않으면 아래 코드가 전부 실행되면서 오류/예외를 발생시킴.
		// 그걸 방지하고자 알림창 띄우고 스탑하는 것.
	}
%>
<script>
	function deletePost(){
		var check = confirm("정말 수정하실거 ???");
		if(check){
			location.href="DeletePrcs.jsp?num=<%=b.getNum()%>";
		}
		
	}
	
</script>
<h2>회원제 게시판 - 상세 보기(View)</h2>

    <table border="1" width="90%" class="">
        <tr>
            <th>번호</th>
            <td><%= b.getNum()%></td>
            <th>작성자</th>
            <td><%= b.getId()%></td>
            <th>조회수</th>
            <td><%= b.getCount()%></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td colspan="2"><%= b.getPostdate()%></td>
            <th>수정일</th>
            <td colspan="2"><%= b.getEditdate()%></td>            
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5"><%= b.getTitle()%></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5" height="100"><%= b.getContent().replace("\r\n", "<br>")%></td> 
        </tr>
       	<%
       		if(userId != null && b.getId().equals(userId)){
       	%>
        <tr>
            <td colspan="6" align="center">
                <button type="button" onclick="location.href='Edit.jsp?num=<%= b.getNum()%>&pageNo=<%=pageNo%>'">수정하기</button>
                <button type="button" onclick='deletePost();'>삭제하기</button> 
            </td>
         </tr>
         <% } %>
             <tr>
        <td colspan="6" class="userAdd">
        	<br>
            <textarea name="comment" id="comment" rows="5" cols="100">댓글 달기</textarea>
            <button type="button" onclick="addFile('<%= b.getNum()%>')"><i class="fa-solid fa-plus"></i></button>
            <button type="button" onclick="addComment('<%= b.getNum()%>')"><i class="fa-regular fa-paper-plane"></i></button>
            <button type="button" onclick="addLike('<%= b.getNum()%>')"><i class="fa-regular fa-thumbs-up"></i></button>
        </td>
    </tr>
         
         <tr>
         	<td colspan="6" align="center">
            	<button type="button" onclick="location.href='View.jsp?num=<%= b.getNum() -1 %>'">이전 글</button>
                <button type="button" onclick="location.href='List.jsp?pageNo=<%=pageNo%>'">목록 보기</button>
	            <button type="button" onclick="location.href='View.jsp?num=<%= b.getNum() +1 %>'">다음 글</button>
            </td>
        </tr>
    </table>

</body>
</html>
