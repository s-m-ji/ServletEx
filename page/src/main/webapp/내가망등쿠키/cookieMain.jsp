<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookieMain.jsp</title>
</head>
<body>
	<!-- 
		cookie
		클라이언트의 상태 정보를  클라이언트 pc에 저장
		로그인 아이디, 팝업창 제어 등등
		
		- 3000개까지 생성 가능
		- 하나의 호스트(웹서버) 또는 도메인 당 50개까지 생성 가능
		- 쿠키 하나당 최대 크기는 4096byte
		
		속성
			도메인 : 쿠키를 적용할 도메인
			경로 : 쿠키를 적용할 경로
			유지기간 : 쿠키를 유지할 기간
	
	 -->
	 <h2>1. 쿠키 설정</h2>
	 <%
	 	/* 국희 생성
	 		new Cookie(이름, 값);
	 			이름: 국희를 구별하는 이름
	 			값: 국희에 저장할 실제 데이터
	 	*/
	 	Cookie ck = new Cookie("toughCookie", "청바지");
	 			
	 	// 국희가 적용될 경로를 지정(하위경로까지 사용가능)
	 	// request.getContextPath() : request 객체로부터 Context 루트 조회
	 	// 루트 경로로 지정하게 되면 웹애플리케이션 전체에서 국희를 사용하겠다는 의미
	 	ck.setPath(request.getContextPath());
	 	
	 	// 국희가 유지될 기간을 초단위로 설정 3600초 : 1시간
	 	ck.setMaxAge(3600);
	 	
	 	// 생성한 국희를 응답 객체에 추가
	 	response.addCookie(ck);
	 %>
</body>
</html>


















