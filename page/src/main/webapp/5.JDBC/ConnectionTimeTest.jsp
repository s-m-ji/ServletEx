<%@page import="common.DBConnectionPool"%>
<%@page import="common.ConnectionUtill"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ConnectionTimeTest.jsp</title>
</head>
<body>
	<h2>ConnectionUtill을 이용한 커넥션 생성</h2>
	<%
		long sTime, eTime;
		sTime = System.currentTimeMillis();
		for(int i=0; i<100; i++){
			Connection con1 = ConnectionUtill.getConnection(application);
			System.out.println("con1 : " + con1);
			con1.close();
		}
		eTime = System.currentTimeMillis();
		out.print("100개 생성 시 걸리는 시간 (con1) : " + (eTime - sTime) + "ms");
	%>
	
	<h2>ConnectionPool을 이용한 커넥션 생성</h2>
	<%
		sTime = System.currentTimeMillis();
		for(int i=0; i<100; i++){
			Connection con2 = DBConnectionPool.getConnection();
			System.out.println("con2 : " + con2);
			con2.close();
		}
		eTime = System.currentTimeMillis();
		out.print("100개 생성 시 걸리는 시간 (con2) : " + (eTime - sTime) + "ms");
	%>
	
</body>
</html>