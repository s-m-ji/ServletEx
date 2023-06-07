<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseLogin.jsp</title>
</head>
<body>
	<p>ResponseLogin.jsp</p>
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pwd");
		
		/* if(id != null && id.equals("qwerty") ... 이렇게 null 체크를 한 번 더 해줘야함..){ */
		if("qwerty".equals(id) && "12345".equals(pw)){
			out.print("로그인 성공 ~~~");
			response.sendRedirect("ResponseWelcom.jsp");
		} else {
			id = "???";
			pw = "???";
			out.print("로그인 실패 ~~~ \n");
			response.sendRedirect("ResponseMain.jsp?loginErr=1");
		}
		
		/* out.printf("id : %s, pw : %s", id, pw); */
		/* JSP에서 out객체는 print(), println()를 통해 출력 가능 */
		out.print("id : "+ id + ", pw : "+ pw);
	%>
</body>
</html>