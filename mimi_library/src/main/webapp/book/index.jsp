<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/library.css">
<link rel="stylesheet" href="../css/style.css">
<title>index.jsp</title>
<style>
	.loginbox {margin: 0 auto;}
</style>
</head>
<body>
	<h2>📚 어서오세요 도서관에 📚</h2>
	<br>
	<aside id='rightside'>
        <div class='side1'>
            <div class='loginbox'>            
            <%           
            String uId = CookieManager.readCookie(request, "userId");
            
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
            	<form action="../login/LoginAction.do" method="post">
                <div id='login'>
                    <input type="text" name="userId" id=userId placeholder='ID를 입력해주세요.' required="required" value="<%= uId%>">
                    <input type="password" name="userPw" id="userPw" placeholder='PW를 입력해주세요.' required="required">
                </div>
                <div id='button'>
                <input type="submit" value="로그인">
                </div>
                <div id='info'>
	                <input type="checkbox" name="saveCheck" value="y" <%= !uId.equals("")? "checked" : "" %>> ID 저장하기 ~~~<br>
	                <a href="register.jsp">회원가입</a>
	                <a href="">ID찾기</a>
	                <a href="">PW찾기</a>
	            </div>
            	</form>
            <%
            }
            %>
            </div>
        </div>
    </aside>
</body>
</html>