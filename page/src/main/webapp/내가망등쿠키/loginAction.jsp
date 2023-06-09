<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction.jsp</title>
</head>
<body>

	<%
		// name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환 합니다.
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		// id 저장 체크박스
		String saveYN = request.getParameter("save_check");
		out.print("saveYN : " + saveYN + "<br>");
		
		// id 저장 체크가 되어있다면 쿠키에 아이디를 저장
		if("y".equalsIgnoreCase(saveYN)){
			
			CookieManager.makeCookie(response, "userId", id, 3600);
			
			/* makeCookie() 메소드로 아래 작업을 대체
			
			// 1) 쿠키 생성 (userId, 사용자아이디)
			Cookie ck = new Cookie("userId", id);
			// 2) 유지시간 1h
			ck.setMaxAge(3600);
			// 3) 응답객체에 쿠키 담기
			response.addCookie(ck);
			*/
			
		}
		
		if("abc".equals(id)
				&& "123".equals(pw)){
			
			out.print("로그인 성공");
			response.sendRedirect("login.jsp?name="+id);
	%>
			// html을 출력
			<h1>로그인 성공</h1>
	<%
		} else {
			out.print("로그인 실패");
		}
	%>
	
</body>
</html>



















