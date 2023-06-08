<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>내장 객체 - response</title></head>
<body>
    <h2>1. 로그인 폼</h2>
    
    <% 
    	if("1".equals(request.getParameter("loginErr"))){    
    		out.print("***** 👇 다시 입력해보세용! 👇 ***** <br><br>");
    		out.print("\r\n");
    %>
    <script>alert("🤔 로그인 정보가 틀렸나용? 🤔")</script>
    <%
    	}
    %>
   
    <form action="./ResponseLogin.jsp" method="post">
    
    	<!-- 유효성 검사(validation check) : 사용자의 입력이 유효한지 검사 -->
			<!-- 필수 입력 값을 required="required" 처리 -->
			
		<!-- forward 방식에서는 사용자로부터 전달 받은 request 객체가 공유되므로 
				value="<%= request.getParameter("냥냥")%>" 이 부분을 쓰는게 가능함 
					redirect 시 null 출력됨 -->
        
        아이디 : <input type="text" name="user_id" required="required" 
        				value="<%= request.getParameter("user_id")%>"/><br />
        패스워드 : <input type="text" name="user_pwd" required="required"/><br />
        <input type="submit" value="로그인" />
    </form>

    <h2>2. HTTP 응답 헤더 설정하기</h2>
    <form action="./ResponseHeader.jsp" method="get">
        날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00" /><br />  
        숫자 형식 : <input type="text" name="add_int" value="88" /><br />
        문자 형식 : <input type="text" name="add_str" value="나상현씨" /><br />
        <input type="submit" value="응답 헤더 설정 & 출력" />
    </form>
</body>
</html>