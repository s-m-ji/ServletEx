<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
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
<%@ include file="../6.세션/IsLogin.jsp" %>
<%
	/* if(userId == null){
		request.getRequestDispatcher(
				response.encodeRedirectURL("../6.세션/LoginForm.jsp")
			).forward(request, response);
	} */
	

	String sField = request.getParameter("searchField");	
	String sWord = request.getParameter("searchWord");	
	int pageNo = request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));	
	
	Criteria cr = new Criteria(sField, sWord, pageNo);

	NewBoardDao bDao = new NewBoardDao();
	/* List<Board> list = bDao.getList(cr); */
	List<Board> list = bDao.getListPage(cr);
%>
    <h2>New 목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title" <%="title".equals(sField)? "selected" : "" %>>제목</option> 
                <option value="content" <%="content".equals(sField)? "selected" : "" %>>내용</option>
                <option value="id" <%="id".equals(sField)? "selected" : "" %>>작성자</option>
                <option value="postdate" <%="postdate".equals(sField)? "selected" : "" %>>작성일</option>
            </select>
            <input type="text" name="searchWord" value="<%= sWord == null? "" : sWord%>"/>
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%" class="listTable">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="15%">수정일</th>
        </tr>
        <!-- 목록의 내용 --> 
		<%
		if(list.isEmpty()){
		%>
		<tr>
			<td colspan="5">게시물이 없네요 ~</td>
		</tr>
		<%	
		} else {
			for(Board b : list){
		%>
        <tr align="center">
            <td><%=b.getNum() %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
            	<a href="View.jsp?num=<%=b.getNum() %>">
                <%=b.getTitle() %></a> 
            </td>
            <td align="center"><%=b.getId() %></td>          <!--작성자 아이디-->
            <td align="center"><%=b.getCount() %></td>  <!--조회수-->
            <td align="center"><%=b.getPostdate() %></td>    <!--작성일-->
            <td align="center"><%=b.getEditdate() %></td>    <!--수정일-->
        </tr>
		<%
			}
		}
		%>

    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <%
    	if(session.getAttribute("userId") != null && !"".equals(session.getAttribute("userId"))){
    %>
    <table border="1" width="90%" class="btnTable">
        <tr align="right">
            <td colspan="5"><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
        </tr>
    </table>
    <%
    	};
    %>
</body>
</html>
