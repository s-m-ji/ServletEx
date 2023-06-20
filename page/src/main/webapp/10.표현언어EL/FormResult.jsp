<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormResult.jsp</title>
</head>
<body>
	<h3>EL 폼 값 받기</h3>
	<%
	/*
	요청 시 받아온 파라미터를 출력
	
		request.getParameter("속성명")
		${param.속성명}
		
		request.getParameterValues("속성명")
		${ paramValues.속성명[배열번호] }
		
		체크박스는 선택된 내용만 넘어옴, EL은 null 오류 처리 없이 바로 사용 가능
	*/
	%>
	<ul>
		<li>이름 : ${ param.name }</li>
		<li>성별 : ${ param.gender }</li>
		<li>학력 : ${ param.grade }</li>
		<li>관심사항1 : 
				${ paramValues.inter[0] },
				${ paramValues.inter[1] },
				${ paramValues.inter[2] },
				${ paramValues.inter[3] }
		</li>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<li>관심사항2 :
        <c:forEach var="index" begin="0" end="3" step="1">
            ${paramValues.inter[index]}
        </c:forEach>
    	</li>
    	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<li>관심사항3 :
		<c:set var="length" value="${fn:length(paramValues.inter)}" />
		<c:forEach var="index" begin="0" end="${length - 1}" step="1">
		  ${paramValues.inter[index]}
		</c:forEach>
    	</li>
	</ul>
</body>
</html>