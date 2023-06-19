<%@page import="common.JSPFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>회원제 게시판</title>
<%@ include file="../6.세션/Link.jsp" %>
<%@ include file="../6.세션/IsLogin.jsp" %>
<%
	NewBoardDao dao = new NewBoardDao();
	Board b = dao.getPostOne(request.getParameter("num"));
	if(b == null){
		JSPFunction.alertBack("존재하지 않는 게시글 🤷", out);
		return;
	}
	int pageNo = request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));
%>
</head>
<body>
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form action="EditPrcs.jsp?num=<%=b.getNum()%>&pageNo=<%=pageNo%>" method="POST">
    <table border="1" width="90%" >
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" value="<%=b.getTitle()%>"/> 
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"
                ><%=b.getContent()%></textarea>
                <input type="hidden" value="<%=b.getNum()%>" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp?pageNo=<%=pageNo%>'">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>