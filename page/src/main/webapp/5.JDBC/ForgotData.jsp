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
<title>ForgotData.jsp</title>
</head>
<body>
	<h2>ID/PW 조회 결과</h2>
	<%
	String userId = request.getParameter("userid");
	String userName = request.getParameter("username");
	
	String data = "";
	String tit = "";
	
		Connection con = ConnectionUtill.getConnection();
		String sql = "select id, pass, name from member";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			String id = rs.getString("id");
			String pass = rs.getString("pass");
			String name = rs.getString("name");
			
			if(userId != null && userId.equals(id)){
				tit = "PW : ";
				data = pass;
			} else if (userName != null && userName.equals(name)){
				tit = "ID : ";
				data = id;
			} else {
				out.print("기입한 정보를 다시 확인해줘잉 <br>");
			} 
			
		} 		
		
		rs.close();
		pstmt.close();
		con.close();
	%>
	<%= tit%> <input type="text" value="<%= data%>">
	<button type="button" onclick="location.href='login.jsp' ">📝 로그인으로 이동 📝</button>
</body>
</html>