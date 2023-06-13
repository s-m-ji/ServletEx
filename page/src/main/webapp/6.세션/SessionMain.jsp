<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionMain.jsp</title>
</head>
<body>
	<!-- Session 
	
		클라이언트의 상태 정보를 저장. 로그인 기능을 구현하는데 사용됨.
		
		http통신은 요청과 응답으로 구성되어있음.
		
		클라이언트에서 서버로 페이지를 요청하면 서버는 페이지를 응답해주고 통신은 종료.
		
		서버가 로그인 상태를 유지해주는 방법 ->
		클라이언트에서 웹브라우저로 서버에 최초로 접근 시
			- 웹서버는 웹브라우저에게 세션아이디를 발급
			- 세션아이디는 쿠키로 생성되어 응답객체의 쿠키에 담겨 클라이언트로 전송
			- 개발자도구의 쿠키를 확인해보면 JSESESSIONID라는 값이 입력되어있음.
			여기에 저장된 값이 바로 세션아이디 ! (웹브라우저를 새로 열어보면 세션아이디 값이 변경되는 것을 알 수 있음)
			
		세션의 유지시간
			유지시간을 설정하지 않으면 기본 30분(1800초)이며, 유지시간이 만료되기 전 새로운 요청이 들어오면 유지시간이 연장됨.
			클라이언트가 유지시간 내 요청이 없는 경우 해당 세션은 서버에서 제거됨.
			
		유지시간 설정방법
			web.xml : 유지시간을 분 단위로 설정 가능 (변경 후 웹브라우저를 닫았다가 다시 열어야 확인 가능!)
			session.setMaxInactiveInterval() : 유지시간을 초 단위로 설정 가능
	-->
	
	<%
		/* session.setMaxInactiveInterval(1); */ // 세션 유지시간 설정
	
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // 매개변수로 시:분:초 형식
		
		long creationTime = session.getCreationTime(); // 최초 요청(세션 생성) 시각
		String creationTimeStr = sdf.format(new Date(creationTime));
		
		long lastTime = session.getLastAccessedTime(); // 최종 요청		
		String lastTimeStr = sdf.format(new Date(lastTime));
		
		HttpSessionContext context = session.getSessionContext();
		// 위는 세션의 컨텍스트를 얻기 위함.
		
		Enumeration ids = context.getIds();
		// 위의 컨텍스트를 이용해서 아이디를 얻어옴.
		
		while(ids.hasMoreElements()){
			String id = (String)ids.nextElement();
			out.println("Checking "+ id + "...");
		}
		// 최신 상태가 아닌 세션을 검색하기 위해 세션 id를 살펴봄 -> 세션의 id를 구할 수 있음
	%>
	<h2>Session 설정 확인</h2>
	<ul>
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>최종 요청 시각 : <%= lastTimeStr %></li>
		<li>session Id : <%= session.getId() %></li>
		<li>session 유지시간(※ 경과 시 소멸) : <%= session.getMaxInactiveInterval() %>초</li>
	</ul>
</body>
</html>