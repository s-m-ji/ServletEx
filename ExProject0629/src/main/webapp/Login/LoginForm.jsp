<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>Session</title>
</head>
<body>
    <h2>로그인 페이지</h2>
    <span style="color: purple; font-size: 1.2em;"> 
    <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>
    <%
    %>
    
    <!-- 1. 로그인 성공 시 로그인 폼을 화면에 출력x
    	2. ~님 환영합니다. 제목 태그로 출력
    	3. header 영역의 로그인 링크를 로그아웃으로 수정 -->
   	<%
   	String userId = (String)session.getAttribute("userId");
   	if(userId != null){
   	%>
   	<div style="text-align:center">
   		<h3>🙋‍♀️ 어서와요 <span class='point'><%= userId %> </span> 님 🙋</h3>
   		<button onclick="location=href='../Board/list.do'">목록 바로가기</button>
   	</div>
   	<%
   	} else {
   	%> 	
    <form action="LoginProcess.jsp" method="post" name="loginFrm"
        onsubmit="return validateForm(this);" id="loginFrm">
        <table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" required="required"/></td>
				<td rowspan="2"><input type="submit" value="로그인하기" /></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="user_pw" required="required"/></td>
				<td></td>
			</tr>
        </table>
    </form>
    <%
   	}
    %>
</body>
</html>