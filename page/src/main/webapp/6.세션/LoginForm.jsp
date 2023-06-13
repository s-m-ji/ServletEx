<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Session</title>
</head>
<body>
	<jsp:include page="Link.jsp" />
    <h2>로그인 페이지</h2>
    <span style="color: purple; font-size: 1.2em;"> 
    <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    	/* String errMsg = (String)request.getAttribute("LoginErrMsg");
   		if(errMsg != null){
	    	out.print("<p class='errMsg'>" + errMsg + "</p>");
   		} */
    %>
    
    <!-- 1. 로그인 성공 시 로그인 폼을 화면에 출력x
    	2. ~님 환영합니다. 제목 태그로 출력
    	3. header 영역의 로그인 링크를 로그아웃으로 수정 -->
   	<%
   	String userId = (String)session.getAttribute("userId");
   	if(userId != null){
   	%>
   	<h3>🙋‍♀️ 어서와요 <span class='point'><%= userId %> </span> 님 🙋</h3>
   	<%
   	} else {
   	%> 	
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);">
        아이디 : <input type="text" name="user_id" required="required"/><br />
        패스워드 : <input type="password" name="user_pw" required="required"/><br />
        <input type="submit" value="로그인하기" />
    </form>
    <%
   	}
    %>
</body>
</html>