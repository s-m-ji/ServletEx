<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanMain.jsp</title>
</head>
<body>
	<%
	/* 
		자바빈이란?
			요청 발생 시 화면으로부터 입력받은 데이터를 하나의 객체에 담아 편리하게 사용 가능.
			JSP 페이지간의 데이터를 전달할 경우 자바빈을 이용.
			표준 액션 태그를 이용해서 자바빈을 활용하면 코드가 간결해짐.
			
		자바빈으로 생성될수 있는 객체(DTO/VO)
			- 자바빈은 기본(default)패키지 이외의 패키지에 속해 있어야 한다.
			- 기본 생성자가 존재해야 한다.
			- 멤버변수의 접근제어자는 private로 선언되어야 한다.
			- 멤버변수에 접근 가능한 getter 와 setter 메서드가 존재해야 한다.
			- getter 와 setter는 접근자가 public으로 선언되어야 한다.
		
		<jsp:useBean> 		: 자바빈을 생성합니다
		<jsp:setProperty> 	: 자바빈 속성을 저장 합니다
		<jsp:getProperty> 	: 자바빈 속성을 추출 합니다 
	*/
	%>
	<h2>useBean 액션태그</h2>
	<h3>자바빈스 생성하기</h3>
	<!-- 
		id: 	자바빈즈 이름
		class:  패키지명을 포함한 클래스 이름
		scope:  저장될 영역
	 -->
	 <!-- 
		dto 패키지의 Person 객체를 생성(기본생성자 이용) 후 request 영역에 저장함
		값을 세팅하기 위해서는 jsp:setProperty 태그를 이용
	  -->
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	
	<h3>setProperty 액션태그로 자바빈스 속성 지정하기</h3>
	<!-- 
		name: 		자바빈즈 이름
		property:   필드명
		value:  	필드값
	 -->
	<jsp:setProperty property="name" name="person" value="나상현씨"/>
	<jsp:setProperty property="age" name="person" value="30"/>
	
	<ol>
		<li>이름 : <jsp:getProperty property="name" name="person"/></li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
	</ol>
	
	<h3>request 객체를 이용해서 자바빈스 속성 읽기</h3>
	<%
		Person p = (Person)request.getAttribute("person");
	%>
	<ol>
		<li>이름 : <%= p.getName() %></li>
		<li>나이 : <%= p.getAge() %></li>
	</ol>
	
</body>
</html>


















