<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP에서 JAVA 코드를 작성하는 방법</h2>
	<p>JSP Scripting Element</p>
	<ul>
		<li>선언문 : 변수, 메소드를 선언 (전역변수, 메소드)</li>
		<li>스크립틀릿 : 자바 코드를 작성(지역변수)</li>
		<li>표현식 : 값을 출력</li>
	</ul>
	<!-- 선언부 -->
	<p>JSP 파일이 서블릿 파일로 변환 시 _jspServide()메소드 외부에 작성되어 전역변수, 메소드를 생성함</p>
	<%!
		// 전역변수를 선언
			String str = "Java Server Page";		
		// 메소드를 선언
			public int add(int num1, int num2){
				return num1 + num2;
			}
	%>
	<!-- 스크립틀릿 -->
	<p>Java 코드를 작성하는 영역 </p>
	<p>JSP 파일이 서블릿 파일로 변환 시 _jspServide()메소드 내부에 작성되어 지역변수 생성함 (메소드 생성 불가!)</p>
	<%
		// 지역변수 
		int res = add(10,20);
	
	%>
	<!-- 표현식 -->
	<p>변수, 상수, 수식 등을 출력</p>
	<p>실행 결과 하나의 값이 남는 문장을 화면에 출력</p>
	<h2><%= str%></h2>
	<h2><%= res%></h2>
	<h2><%= add(10,20)%></h2>
	
	<h4>서블릿으로 변환된 JSP파일의 위치</h4>
	<p>워크스페이스\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp</p>
	
</body>
</html>