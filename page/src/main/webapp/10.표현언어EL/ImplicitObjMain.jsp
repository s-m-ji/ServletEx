<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>ImplicitObjMain.jsp</title>
</head>
<body>
	<%
		/* 표현언어 EL (Expression Language)
		변수의 값을 출력할 때 사용하는 스크립트 언어
		
		4가지 영역에 저장된 값을 출력, 사용법이 간결하고 예외와 형변환에 관대.
	
		서블릿에서 처리된 결과는 영역을 통해 전달되고 표현언어로 접근하여 쉽게 출력 가능.
		
		- JSP 내장 객체의 영역에 담긴 속성을 사용.
		- 산술, 논리, 비교 연산이 가능함.
		- 자바 클래스에 정의된 메소드를 호출할 수 있음.
		
		기본사용법
		${ 영역.속성 }
		변수에 접근하기 위해서는 영역을 지정해줘야함
		* 영역을 별도로 지정하지 않으면 기본적으로 page 영역에서 값을 찾게 됨당 
		
		- 페이지영역		:pageScope
		- 영역			:pageScope
		- 영역			:pageScope
		- 어플리케이션영역	:pageScope
		
		ex)  ${requestScope.saveVar}
		
		요청 파라미터
		request.getParameter("매개변수명")
		${ param.매개변수명 }
		${ param["매개변수명"] }
		${ param['매개변수명'] }
			
		한글, 특수문자가 입력된 경우 대괄호([])를 이용해야 오류가 발생하지 않음
		ex) ${param["user-agent"]}
			${param["한글"]}
		*/
	%>
	
	<%
		pageContext.setAttribute("scopeValue", "페이지 영역");
		request.setAttribute("scopeValue", "리퀘스트 영역");
		session.setAttribute("scopeValue", "세션 영역");
		application.setAttribute("scopeValue", "어플리케이션 영역");
	%>
	
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>페이지 영역 : ${ pageScope.scopeValue }</li>
		<li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
		<li>세션 영역 : ${ sessionScope.scopeValue }</li>
		<li>어플리케이션 영역 : ${ applicationScope.scopeValue }</li>
	</ul>
	<br><br>	<hr>	<br><br>
	<h3>영역 지정 없이 속성 읽기</h3>
	<ul>
		<li>${ scopeValue }</li>
	</ul>
	
	<!-- forward 시 기존 내용은(~main.jsp) 출력되지 않음 ! : result 페이지 내용만 나옴 -->
	<jsp:forward page="ImplicitForwardResult.jsp"></jsp:forward>
	
</body>
</html>

















