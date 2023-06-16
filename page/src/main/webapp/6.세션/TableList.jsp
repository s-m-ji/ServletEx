<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="dao.TableDao"%>
<%@page import="dto.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>TableList.jsp</title>

</head>
<body>
	<%
	String userId = (String)session.getAttribute("userId");
	// 해당 페이지를 url로 들어가면 로그인하라고 나오도록 처리 ! 
	/* 
	if(userId == null){
		response.sendRedirect("LoginForm.jsp");
		return;
	} */

	// 게시판 DB 작업 - DAO 생성
	TableDao tDao = new TableDao();
		
	// 검색 조건
	String sField = request.getParameter("searchField");
	String sWord = request.getParameter("searchWord");
	String pageNo = request.getParameter("pageNo");
	
	// 검색 조건을 객체로 생성
	Criteria cr = new Criteria(sField, sWord, pageNo);
	
	// 리스트 조회 
	/* List<Table> list = tDao.getList(cr.getsField(), cr.getsWord()); */
	List<Table> list = tDao.getListPage(cr);

	// 총 게시글 수 산정
	int totalCnt = tDao.getTotalCnt(cr);
	
	%>
	<jsp:include page="Link.jsp" />
	<h2>목록 보기(List)</h2>
	<!-- 검색폼 테이블 : 현재 페이지에서 검색할 용도-->
	<form name="searchForm">
<%-- 	<form action="PageNavi.jsp?pageNo=<%= cr.getPageNo()%>" name="searchForm"> --%>
	<table>
		<tr>
			<td align="center">
			<select name="searchField">
				<option value="title" <%= "title".equals(sField) ? "selected" : "" %>>제목</option>
				<option value="content" <%= "content".equals(sField) ? "selected" : "" %>>내용</option>
				<option value="id" <%= "id".equals(sField) ? "selected" : "" %>>작성자</option>
				<option value="postdate" <%= "postdate".equals(sField) ? "selected" : "" %>>작성일</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="<%= cr.getsWord()%>">
			<input type="text" value="<%= cr.getPageNo()%>" name="pageNo">
			<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	<!-- 게시글 목록 테이블 -->
	<table class="listTable" border=1>
	<colgroup>
    	<col width="50px" />
  	</colgroup>
	<%
	if(list.isEmpty()){
	%>
	<tr><td colspan="6" align="center">등록된 게시물이 없는걸 ~ </td></tr>
	<%	
	} else {
	%>
	<tr><td colspan="6" align="right"><b>총 게시글 : <%= totalCnt%> </b></td></tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	<tbody>
	<%
		for(Table t : list){
			
		/* out.print(String.format(
				"<tr>" +
				"<td>%s</td> <td><a href='View.jsp?num=%s'>%s</a></td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td>" +
				"</tr>"
					, t.getNum(), t.getNum(), t.getTitle(), t.getContent(), t.getId(), t.getPostdate(), t.getVisitcount())); */
	
			
		%>
		<tr>
			<td><%= t.getNum() %></td>
			<td><a href="View.jsp?num=<%=t.getNum()%>"><%=t.getTitle()%></a></td>
			<td><%= t.getContent() %></td>
			<td><%= t.getId() %></td>
			<td><%= t.getPostdate() %></td>
			<td><%= t.getVisitcount() %></td>
		</tr>
		<%
		}
	}
	
    if(userId != null){
	%>
	</tbody>
	</table>
	<!-- 글쓰기 버튼 테이블 -->
	<table>
		<tr><th align="right"><a href="TableWrite.jsp?">글쓰기</a></th></tr>
	</table>
	<%
	}
	%>
	<!-- 페이지네이션 블록 -->
	<%
		PageDto pDto = new PageDto(totalCnt, cr);
	%>
	<table>
		<tr><td><%@ include file="PageNavi.jsp" %></td></tr>
	</table>
</body>
</html>