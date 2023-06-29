<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
<style>
	header {padding:10px;
			text-align:center;
			 background-color: #d8d8fd;}
</style>
<%
    // 세션 만료 시간 가져오기
    int maxInactiveInterval = session.getMaxInactiveInterval();
    Date now = new Date();
    Date exTime = new Date(now.getTime() + (maxInactiveInterval * 1000));

    // 포맷 설정
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    // 만료 시간을 문자열로 변환
    String exTimeString = dateFormat.format(exTime);
    String nowTimeString = dateFormat.format(now.getTime());

%>
<script>
// 만료 시간과 남은 시간을 표시하는 함수
function displayExTime() {
    var exTime = '<%= exTimeString %>';

    // 현재 시간과 만료 시간 사이의 차이 계산
    var currentTime = new Date().getTime();
    var remainingTime = 
    	Math.max(0, Math.floor((Date.parse(exTime) - currentTime) / 1000)); 
    // 남은 시간(초)

    // 분과 초 계산
    var minutes = Math.floor(remainingTime / 60);
    var seconds = remainingTime % 60;

    // 남은 시간을 HTML 요소에 업데이트
    document.getElementById('timer').innerHTML = minutes + "분 " + seconds + "초 남음";

    // 1초마다 업데이트 함수 호출
    setTimeout(displayExTime, 1000);
}
// 페이지 로드 시 만료 시간 표시 함수 호출
window.onload = displayExTime;
</script>
</head>
<body>
	<header>
	<table class="linkTable"> 
    <tr>
		<!-- 어드민 -->
		<!-- TODO 로그인 여부 > 관리자 여부 이렇게 로직 수정 -->
			<c:if test="${sessionScope.adminYn eq 'Y'}" var="res1">
				<td><h3>[Admin 페이지]</h3></td>
				<td>
					<span>🙋‍♀️ 어서와요 <b class="point">${sessionScope.userId}</b></span>
	     			<button onclick="location.href='../Login/logoutLibrary.jsp'">로그아웃</button>
					<button>사용자 등록</button>
					<button>사용자 삭제</button>
				</td>
			</c:if>
			<!-- 로그인 후 유저 -->
				<c:if test="${not res1 and not empty sessionScope.userId}">
					<td><h3>[Member 페이지]</h3></td>
					<td>
						<span>🙋‍♀️ 어서와요 <b class="point">${userId}</b></span>
		     			<button onclick="location.href='../Login/logoutLibrary.jsp'">로그아웃</button>
					    <button onclick="location.href='../book/mypage.book'">마이페이지</button>
				    </td>
				</c:if>
			<!-- 로그인 전 유저 -->
				<c:if test="${empty sessionScope.userId}" var="res2">
					<a href="../book/index.jsp">로그인</a>
				</c:if>	
	        <td><span><b> 세션 만료까지 남은 시간 : </b></span><span id="timer"></span></td>
	    </tr>
	</table>
	</header>
</body>
</html>