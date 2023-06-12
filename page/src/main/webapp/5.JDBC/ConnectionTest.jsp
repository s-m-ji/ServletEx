<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtill"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionTest.jsp</title>
</head>
<body>
	<!-- 외부 설정 파일로부터 DB 접속 정보를 읽어오기 -->
	<%
	Connection con = ConnectionUtill.getConnection(application);
		/* 여기서 쓰인 application는 내장객체! */

	PreparedStatement pstmt = con.prepareStatement("select sysdate from dual");
	
	ResultSet rs = pstmt.executeQuery();

	rs.next();
	out.print("Today : " + rs.getString(1));
	%>
</body>
</html>