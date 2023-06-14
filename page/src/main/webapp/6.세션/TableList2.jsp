<%@page import="java.util.List"%>
<%@page import="dao.TableDao2"%>
<%@page import="dto.Table"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>TableList2.jsp</title>
</head>
<body>
	<%
	// 해당 페이지를 url로 들어가면 로그인하라고 나오도록 처리 ! 
	String userId = (String)session.getAttribute("userId");
	if(userId == null){
		response.sendRedirect("LoginForm.jsp");
		return;
	}

	String sField = request.getParameter("searchField");
	String sWord = request.getParameter("searchWord");
	sWord = sWord == null ? "" : sWord;
	
	TableDao2 tDao = new TableDao2();
	List<Table> list = tDao.getList(sField, sWord);
	int totalCnt = tDao.getTotalCnt(sField, sWord);
	/* tDao.getListPage(sField, sWord, 1, 3); */
	
	
	// 검색어가 null이 아니면 검색 기능을 추가......
	/* if(sWord != null){
		out.print("분류 : " + sField + "<br>");
		out.print("검색어 : " + sWord);
	} */
	%>
	<jsp:include page="Link.jsp" />
	<h2>목록 보기(List)</h2>
	<!-- 검색폼 테이블 : 현재 페이지에서 검색할 용도-->
	<form action="">
	<table>
		<tr>
			<td align="center">
			<select name="searchField">
				<option value="title" <%= "title".equals(sField) ? "selected" : "" %>>제목</option>
				<option value="content" <%= "content".equals(sField) ? "selected" : "" %>>내용</option>
				<option value="id" <%= "id".equals(sField) ? "selected" : "" %>>작성자</option>
				<option value="postdate" <%= "postdate".equals(sField) ? "selected" : "" %>>작성일</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="<%= sWord%>">
			<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	<!-- 게시글 목록 테이블 -->
	<table class="listTable" border=1>
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
</body>
</html>