<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
</head>
<body>

<form action="loginAction.jsp" method="post">
    <% 
    	// 쿠키에 저장된 아이디가 있다면 id필드의 value 속성에 저장된 아이디 값을 넣어줌
    	String userId = CookieManager.readCookie(request, "userId");	
    
    	/* returnCValue() 메소드로 아래 작업을 대체
    	
    	String userId = ""; 
		Cookie[] cks = request.getCookies();
    	if(cks != null){ // 쿠키가 없어도 null 예외 발생하지않음
	    	for(Cookie c : cks){
	    		if("userId".equals(c.getName())){
	    			userId = c.getValue();
	    			break;
	    		}
	    	}
    	}
    	*/	
    	
    	String name = request.getParameter("name");
    	if(name != null && !name.equals("")){
    		out.print("<h1>" + name + "님 환영 합니다.</h1>");
    	} else {
    		
    %>
    <div class='loginbox'>
        <div id='login'>
            <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' value="<%= userId%>" required="required"><br>
            <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'><br>
            <input type="checkbox" name="save_check" value="y"> id 저장 <br>
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div>
    
    <%
    } 
    %>
</form>
                
</body>
</html>