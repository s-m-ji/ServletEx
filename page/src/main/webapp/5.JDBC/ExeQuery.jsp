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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.3/css/theme.default.min.css" integrity="sha512-wghhOJkjQX0Lh3NSWvNKeZ0ZpNn+SPVXX1Qyc9OCaogADktxrBiBdKGDoqVUOyhStvMBmJQ8ZdMHiR3wuEq8+w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/style.css">
<title>ExeQuery.jsp</title>
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
	<h2>회원 목록 조회</h2>
	<button type="button" onclick="location.href='SignUp.jsp' ">📝 회원 등록하기 📝</button>
	<table border=1; id="mbList">
	<thead>
	<tr>
	<th>ID</th>
	<th>NAME</th>
	<th>REGIDATE</th>
	</tr>
	</thead>
	<tbody>
	<%
		Connection con = ConnectionUtill.getConnection();
		String sql = "select id, name, regidate from member";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String id = rs.getString("id");
			String name = rs.getString("name");
			String regidate = rs.getString("regidate");
			
			out.print(String.format(
						"<tr><td>%s</td> <td>%s</td> <td>%s</td></tr>"
							, id, name, regidate));
		}
		rs.close();
		pstmt.close();
		con.close();
	%>
	</tbody>
	</table>
</body>
</html>