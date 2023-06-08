<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="dto.Person"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageInclude.jsp</title>
</head>
<body>	
	<ul>
		<li>string : <%= pageContext.getAttribute("page").toString() %></li>
		<li>_int : <%= pageContext.getAttribute("page_int") %></li>
		<li>Person : <%= pageContext.getAttribute("pagePerson") %></li>
	</ul>
</body>
</html>