<!--
	jsp : 동적인 페이지를 작성하기 위해 JAVA언어를 사용
	
	지시어(Directive)
	jsp페이지를 servlet 코드로 변환하는데 필요한 정보
	
	지시어의 종류
		page : JSP 페이지에 대한 정보를 설정
		include : 외부 파일을 현재 JSP 페이지에 포함시킴
		taglib : 표현 언어에서 사용할 자바 클래스나 JSTL을 선언
		
	작성 방법
	< %@ 지시어종류 속성1="값1",...(속성 나열)% >
	
	jsp 파일 생성 시 기본 인코딩을 변경하는 방법
		window > preference > JSP Files 선택 > Encodindg을 UTF-8로 선택
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<img alt="무지개" src="https://source.unsplash.com/random/500x500/?rainbow">
</body>
</html>