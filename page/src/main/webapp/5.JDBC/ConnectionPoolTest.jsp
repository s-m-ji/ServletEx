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
		Connection 객체를 생성하는 것은 네트워크 통신과 사용자 인증 등 시간이 많이 소요되는 작업임.
		빈번한 연결과 해제는 시스템 성능을 떨어뜨릴 수 있음.
		
		이를 해결하기 위해 커넥션풀이라는 공간에 커넥션 객체를 미리 생성해두고
		필요할 때마다 요청하여 가저다 사용하는 방법임.
		
		사용이 완료된 객체를 연결을 해제하지 않고 커넥션 풀에 반납하여 재사용 할 수 있도록 함
	 
	 	JNDI
	 	자바 프로그램에서 객체나 데이터의 전체 경로를 몰라도 '이름'으로 찾아 쓸 수 있는 디렉토리 서비스.
	 	이름과 실제 객체와의 연결은 외부 설정파일에서 관리함.
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