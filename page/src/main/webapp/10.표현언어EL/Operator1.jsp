<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Operator1.jsp</title>
</head>
<body>

	<%
		int a = 3;
		pageContext.setAttribute("b", 4);
		pageContext.setAttribute("c", "5");
		pageContext.setAttribute("d", "8");
	%>
	<h3>변수 선언 및 할당</h3>
	<!-- a은 영역에 저장되지 않아서 출력 x -->
	<p>스크립틀릿에서 선언한 변수 : ${ a }</p>
	<p>페이지 영역에 저장된 변수 : ${ b }</p>
	
	<!-- 3.0버전부터 대입연산자(=) 이용하여 값 대입 가능 -->
	<!-- 값을 대입 후 바로 출력 -->
	<p>변수 할당 및 즉시 출력 : ${a = 7}</p>
	
	<!-- 값을 대입하고 바로 출력하지 않음 ; '' -->
	<p>변수 할당 및 별도 출력 : ${ b = 8; '' } => ${ b }</p>
	
	<pre>
	a = ${a}
	b = ${b}
	c = ${c}
	d = ${d}
	</pre>
	
	<h3>산술 연산자</h3>
	<!-- EL(표현언어)를 사용하면 산술 연산 시 문자는 자동으로 숫자 변환 -->
	<pre>
	c + d = ${c + d};
	c - d = ${c - d};
	c * d = ${c * d};
	c / d = ${c / d};
	c % d = ${c % d};
	</pre>
	<!-- div : 나누기 (문자 형태의 연산자) -->
	<pre>	c <b>div</b> d = ${c div d};</pre>
	<!-- mod : 나머지 (문자 형태의 연산자) -->
	<pre>	c <b>mod</b> d = ${c mod d};</pre>
	
 	<h3>+ 연산자는 덧셈만 가능 (숫자 연산 o, 문자 연결 x)</h3>
 	<pre>
 	a = ${a}
 	a + "34" : ${a + "34"};
 	<%-- a + "삼십사" : ${a + "삼십사"}; --%>
 	</pre>
 	<hr>
 	<h3>비교 연산자</h3>
	<pre>
	<!-- 문자 형태의 연산자 : 코드를 좀 더 직관적으로 작성 가능 -->
	c = ${c}, d = ${d}
	
	c > d = ${c gt d};
	c < d = ${c lt d};
	c >= d = ${c ge d};
	c == d = ${c eq d};
	</pre>
 	<hr>
 	<h3>논리 연산자</h3>
 	<pre>
	c = ${c}, d = ${d}
	
	c <= d && c == d :  ${c le d and c eq d};
	c >= d || c != d :  ${c ge d or c ne d};
	</pre>
</body>
</html>

























