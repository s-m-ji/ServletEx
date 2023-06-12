<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.Arrays"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestParameter</title>
</head>
<body>
<pre>
	<%
		// 한글 깨짐 처리
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id"); 
		String gender = request.getParameter("sex"); 
		String intro = request.getParameter("intro");
		
		String[] favo = request.getParameterValues("favo");
		String favoStr = "";
		for(int i=0; i<favo.length; i++){			
			out.print("favo["+i+"].toString() : " + favo[i].toString() + "\r\n");
		}
		for(String Str : favo){			
			out.print("Str.toString() : " + Str.toString() + "<br>");
		}
		out.print("Arrays.toString(favo) : " + Arrays.toString(favo));
		
		favoStr = Arrays.toString(favo);
	%>
</pre>
	<ul>
		<li>이름 : <%= id %></li>
		<li>성별 : <%= gender %></li>
		<li>관심사항 : <%= Arrays.toString(favo) %></li>
			<!-- 개행처리 -->
		<li>관심사항 : <%= favoStr.toString().replace(",", "<br>") %></li>
		<li>자기소개 : <%= intro.replace("\r\n", "<br>") %></li>
	</ul>
</body>
</html>