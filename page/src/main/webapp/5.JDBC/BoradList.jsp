<%@page import="dto.Member"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtill"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/css/theme.default.min.css" 
integrity="sha512-wghhOJkjQX0Lh3NSWvNKeZ0ZpNn+SPVXX1Qyc9OCaogADktxrBiBdKGDoqVUOyhStvMBmJQ8ZdMHiR3wuEq8+w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/style.css">
<title>BoradList.jsp</title>
  <script
      src="https://code.jquery.com/jquery-3.7.0.min.js"
    ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/js/jquery.tablesorter.min.js"></script>
  <script>
$(document).ready(function(){ 
    $("#mbList").tablesorter();
 });
</script>
</head>
<body>
	<%
       if(session.getAttribute("member") != null){
       	Member m = (Member)session.getAttribute("member");
     %>
	<h2>게시글 목록 조회</h2>
	<h3>안녕하세요 <span class="point"><%= m.getId()%></span> 님 !</h3>
	<button onclick="location.href='login.jsp'">로그아웃</button>
	<button onclick="location.href='ExeQuery.jsp' ">👤 회원목록 조회하기 👤</button>
	<button onclick="location.href='BoradWrite.jsp' ">📝 게시글 등록하기 📝</button>
	<table border=1; id="mbList">
	<thead>
	<tr>
	<th>NUM</th>
	<th>TITLE</th>
	<th>CONTENT</th>
	<th>ID</th>
	<th>POSTDATE</th>
	<th>VISITCOUNT</th>
	</tr>
	</thead>
	<tbody>
	<%
		Connection con = ConnectionUtill.getConnection();
		String sql = "select * from board";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			int num = rs.getInt("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			String postdate = rs.getString("postdate");
			int count = rs.getInt("visitcount");
			
			out.print(String.format(
						"<tr>" +
						"<td>%d</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%s</td> <td>%d</td>" +
						"</tr>"
							, num, title, content, id, postdate, count));
		}
		rs.close();
		pstmt.close();
		con.close();
	%>
	</tbody>
	</table>
	 <%
       } 
     %>
</body>
</html>