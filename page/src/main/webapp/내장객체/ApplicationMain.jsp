<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp</title>
</head>
<body>
	<!-- 
		application 내장 객체
			웹 애플리케이션 당 하나만 생성되며 모든 JSP페이지에서 접근할 수 있는 객체
			ServeletContext 타입으로 웹 애플리케이션 전반에 이용하는 정보를 저장하거나(web.xml)
			서버의 정보, 물리적 경로 등을 얻어오는데 사용함
	
		web.xml (배포 서술자)
			웹 어플리케이션에 대한 여러가지 설정을 저장하는 파일
			
		서버의 물리적 경로 : 이클립스에서 지정한 임의의 경로가 출력
	 -->
	 
	 <h2>application</h2>
	 <%
	 	// xml에 설정한 파라미터 읽어오기
	 	String init = application.getInitParameter("INIT_PARAM");
	 	out.print("초기화 매개변수 : " + init + "<br>");
	 	
	 	// 서버의 물리적 경로 읽어오기
	 	String path = application.getRealPath("/내장객체");
	 %>
	 	내장객체의 물리적 주소 : <%=path %>
	 
	 <h3>선언부에서 application 내장객체 사용하기</h3>
	 <%!
	 	/* 메소드, 필드 선언 */
	 	public String useImplicitObject(){ 
		 return this.getServletContext().getRealPath("/내장객체");
	 }
	 
	 public String useImplicitObject(ServletContext app){
		 return app.getRealPath("/내장객체");
	 }
	 
	 %>
	 
	 <ul>
	 	<li>this 사용 : <br> <%= useImplicitObject() %></li>
	 	<li>내장객체를 인수로 전달 : <br><%= useImplicitObject(application) %></li>
	 </ul>
</body>
</html>
















