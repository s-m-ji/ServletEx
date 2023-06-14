<%@page import="common.JSPFunction"%>
<%@page import="dto.Table"%>
<%@page import="dao.TableDao"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">		
<title>WriteProcess.jsp</title>
</head>
<body>
<%@ include file="IsLogin.jsp" %>
<!-- 1. 입력값을 받아서 dto 객체를 생성
	2. dao.insert 호출 : db에 게시글을 등록하고 결과를 숫자로 반환
	3. 등록 성공 : 리스트 페이지로 이동
			실패 : 메세지 처리 -->
	<%
		request.setCharacterEncoding("utf-8");
			
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		

		// 세션이 만료되면 가져올 id값이 없기 때문에 오류 발생 가능
		/* String id = session.getAttribute("userId").toString(); */
		String id = session.getAttribute("userId") == null ? "" : session.getAttribute("userId").toString();
		
		/* 
			id를 멤버 객체로부터 가져오는 방법
		Member member = new Member();
		member = (Member) session.getAttribute("user") == null ? member : (Member) session.getAttribute("user");
		String id = member.getId(); */

		TableDao dao = new TableDao();
	
		Table table = new Table();
		table.setTitle(title);
		table.setContent(content);
		table.setId(id);
		
		int res = dao.insert(table);
		
		if(res>0){
			JSPFunction.alertLocation("👌 게시글 등록 완료 👌", "TableList.jsp", out);
		%>  
		
		<!-- <script>
			alert("😉 게시글 등록 완료 😉");
			location.href="TableList.jsp";
		</script>  -->
		<%
		} else {
			JSPFunction.alertBack("⚠ 게시글 등록 중 오류 발생 ⚠", out);
		%>
		<!-- <script>
			alert("⚠ 게시글 등록 중 오류 발생 ⚠");
			history.go(-1);
		</script> -->
		<%
		}
		
	%>

</body>
</html>