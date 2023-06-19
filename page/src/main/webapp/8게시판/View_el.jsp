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
	}
	// 영역에 저장
	request.setAttribute("board", b);	
%>
<h2>회원제 게시판 - 상세 보기(View)</h2>

    <table border="1" width="90%" class="">
        <tr>
            <th>번호</th>
            <td>${ board.num }</td>
            <th>작성자</th>
            <td>${ board.id }</td>
            <th>조회수</th>
            <td>${ board.count }</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td colspan="2">${ board.postdate }</td>
            <th>수정일</th>
            <td colspan="2">${ board.editdate }</td>            
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5">${ board.title }</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5" height="100">${ board.content }</td> 
        </tr>
        <tr>
            <td colspan="6" align="center">
            	<%
            		if(userId != null && b.getId().equals(userId)){
            	%>
                <button type="button" onclick="location.href='Edit.jsp?num=<%= b.getNum()%>&pageNo=<%=pageNo%>'">수정하기</button>
                <button type="button" onclick='delete();'>삭제하기</button> 
                <% } %>
                <button type="button" onclick="location.href='List.jsp?pageNo=<%=pageNo%>'">목록 보기</button>
            </td>
        </tr>
    </table>

</body>
</html>
