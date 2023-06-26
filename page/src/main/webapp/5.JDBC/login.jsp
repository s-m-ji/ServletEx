<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/login.css">
<link rel="stylesheet" href="../css/style.css">
<title>login.jsp</title>
</head>
<body>
<h2>🙋‍♀️ 어서오세요 게시판에 🙋‍♀️</h2>
<br>
<aside id='rightside'>
        <div class='side1'>
            <div class='loginbox'>            
            <%           
            String uId = CookieManager.readCookie(request, "userId");
            
            String err = request.getParameter("err");
            if("y".equals(err)){
			%>
            	<h3>🤔 로그인 실패 (id/pw확인) 🤔</h3>
            <%
            } 
            %>
            	<form action="loginAction.jsp" method="post">
                <div id='login'>
                    <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' required="required" value="<%= uId%>">
                    <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required="required">
                </div>
                <div id='button'>
                <input type="submit" value="로그인">
                </div>
                <div id='info'>
	                <input type="checkbox" name="saveCheck" value="y" <%= !uId.equals("")? "checked" : "" %>> ID 저장하기 ~~~<br>
	                <a href="SignUp.jsp">회원가입</a>
	                <a href="Forgot.jsp?forgot=id">ID찾기</a>
	                <a href="Forgot.jsp?forgot=pw">PW찾기</a>
	            </div>
            	</form>
            </div>
        </div>
    </aside>
</body>
</html>