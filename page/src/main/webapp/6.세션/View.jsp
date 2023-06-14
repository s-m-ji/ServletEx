<%@page import="common.JSPFunction"%>
<%@page import="dto.Table"%>
<%@page import="dao.TableDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>View.jsp</title>
	<%
		TableDao dao = new TableDao();
		Table t = dao.selectOne(request.getParameter("num"));
		dao.updateVstCnt(request.getParameter("num"));
		if(t != null){
	%>
<script>
	function deletePost(){
		var res = confirm('정말진짜리얼 삭제한다고욧?');
		if(res){
			location.href='DeleteProcess.jsp?num=<%=t.getNum()%>'
		}
	}
</script>
</head>
<body>
<jsp:include page="Link.jsp" />
	<h2>상세 보기(View)</h2>
	
	<table border=1 class="viewTable">
		<tr>
			<th>글번호</th>
			<td><%= t.getNum() %></td>
			<th>작성자</th>
			<td><%= t.getId() %></td>
		</tr>
		<tr>
		<th>작성일</th>
		<td><%= t.getPostdate() %></td>
		<th>조회수</th>
		<td><%= t.getVisitcount() %></td>
		</tr>
		<tr>
			<th>제목</th>		
			<td colspan="3"><%= t.getTitle()%></td>			
		</tr>
		<tr>
			<th>내용</th>
			<td class="content"  colspan="3"><%= t.getContent() %></td>
		</tr>
	</table>
			<!-- 목록 조회 버튼 테이블 -->
			<table class="btnTable">
				<tr>
				<td>
	<%
			String userId = (String) session.getAttribute("userId");
			if(userId != null){
				if(t.getId().equals(userId)){
	%>
				<button type="button" onclick="location.href='Edit.jsp?num=<%=t.getNum()%>'">글 수정</button>
<%-- 				<button type="button" onclick="location.href='EditProcess.jsp?num=<%=t.getNum()%>'">글 수정</button> --%>
				<button type="button" onclick="deletePost();">글 삭제</button>
				
	<% 			
				} else {
				%>			
				<button type="button" onclick="location.href='TableWrite.jsp'">글 작성</button>
				<%
				}
			}
			%>
			<button type="button" onclick="location.href='TableList.jsp'">목록 조회</button>
			</td>
			</tr>
			</table>
			<%
		} 
		else {
	%>
	<!-- <h3>🤷‍♀️ 게시글이 없음둥 🤷‍♀️</h3>
	<img alt="" src="../img/not_exist.jpg" style="height:400px;"> -->
	<%
	/* JSPFunction.alertBack("🤷‍♀️ 게시글이 없음둥 🤷‍♀️", out); */
	JSPFunction.alertLocation("🤷‍♀️ 게시글 없음! 목록으로 이동 🤷‍♀️", "TableList.jsp", out);
		}
	%>
</body>
</html>