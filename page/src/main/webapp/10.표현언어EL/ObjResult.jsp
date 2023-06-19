<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>ObjResult.jsp</title>
</head>
<body>
	<h3>영역을 통해 전달된 객체 읽기</h3>
	<!-- EL을 사용하면 형변환 필요없이 파라미터 읽기 가능
		별도의 null처리 안 해도 ok: 현재 페이지 리로드해도 오류발생x 
		객체를 사용하기 위해 import만 하면 된다 
		
		영역을 별도 지정하지 않아도 속성명만 불러오면 값을 쓸 수 있다.
		page에 없으면 request에서 (순서대로)찾아오기때문에
		-->
	<ul>
		<li>personObj -> 
			ID: ${ personObj.id }, NAME: ${ personObj.name }
		</li>
		<li>stringObj -> ${ stringObj }</li>
		<li>integerObj -> ${ integerObj }</li>
	</ul>
	<hr>
	<h3>매개변수로 전달된 값 읽기</h3>
	<ul>
		<li>firstNum -> ${ param.firstNum }</li>
		<li>secondNum -> ${ param.secondNum }</li>
		<li>firstNum -> ${ param['firstNum'] }</li>
		<li>secondNum -> ${ param["secondNum"] }</li>
		<li>sum -> ${ param.firstNum + param.secondNum }</li>
		<%-- 연산 : 이렇게는 안된당
			<li>sum -> ${ param.firstNum } + ${ param.secondNum }</li> 
		--%>
	</ul>
</body>
</html>