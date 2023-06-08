<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Collection" 
    import="java.text.SimpleDateFormat"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseHeader.jsp</title>
</head>
<body>
	<p>ResponseHeader.jsp</p>
	<!-- 
	response 객체는 응답 헤더에 정보를 추가하는 기능을 제공
		add...() : 응답 헤더 추가
		set...() : 응답 헤더 수정
	 -->
	<ul>
	<%
		/* getParameter는 String을 반환함 */	
		String a_date = request.getParameter("add_date");
		String a_int = request.getParameter("add_int");
		String a_str = request.getParameter("add_str");
		
		/* 문자열을 날짜 형식으로 변환 */
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		response.addDateHeader("date", s.parse(a_date).getTime());
		response.addIntHeader("int", Integer.parseInt(a_int));
		response.addHeader("str", a_str);
		
		Collection<String> headerNames = response.getHeaderNames();
		for(String hName : headerNames){
			String hValue = response.getHeader(hName);
	%>
		<li><%=hName %> : <%=hValue %></li>	
	<%
		}
	%>
	</ul>
	
</body>
</html>