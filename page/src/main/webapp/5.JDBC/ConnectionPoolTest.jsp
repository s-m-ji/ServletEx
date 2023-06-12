<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnectionPool"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionPoolTest.jsp</title>
</head>
<body>
	<!-- 
		커넥션 풀 (Connection Pool)
	
	 -->
	 
	 <%
	 	Connection con = DBConnectionPool.getConnection();
	 	PreparedStatement pstmt = con.prepareStatement("select sysdate from dual");
	 	ResultSet rs = pstmt.executeQuery();

	 	if(rs.next()){
	 		out.print(rs.getString(1));	
	 	}
	 	rs.close();
	 	pstmt.close();
	 	con.close();
	 	
	 	
	 	
	 %>
</body>
</html>