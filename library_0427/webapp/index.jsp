<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "com.library.Application"

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>Index</title>
</head>
<body>
	<h2>Wow....</h2>
	<aside id='rightside'>
        <div class='side1'>
            <div class='loginbox'>            
            <%           
            
            String error = request.getParameter("error");
            if("y".equalsIgnoreCase(error)){
			%>
            	<script>alert("🤔 로그인 실패 🤔");</script>
            <%
            } 
            
            String name = request.getParameter("name");         
            /* if("id".equalsIgnoreCase(name)){ */
            if(name != null && !name.equals("")) {
            	out.print("<script>alert('" + name + " 안녕?')</script>");
            	out.print(name + " 안녕~");
            } else {
            %>
            	<form action="loginAction.jsp" method="post">
                <div id='login'>
                    <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' required="required">
                    <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required="required">
                </div>
                <div id='button'>
                <input type="submit" value="로그인">
                </div>
            	</form>
            <%
            }
            %>
            </div>
            <div id='info'>
                <a href="register.jsp">회원가입</a>
                <a href="">ID찾기</a>
                <a href="">PW찾기</a>
            </div>
        </div>
    </aside>
</body>
</html>