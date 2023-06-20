<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int maxInactiveInterval = session.getMaxInactiveInterval();
    Date now = new Date();
    Date exTime = new Date(now.getTime() + (maxInactiveInterval * 1000));

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    String exTimeString = dateFormat.format(exTime);
    String nowTimeString = dateFormat.format(now.getTime());
%>
<script>
function displayExTime() {
    var exTime = '<%= exTimeString %>';
    var currentTime = new Date().getTime();
    var remainingTime = 
    	Math.max(0, Math.floor((Date.parse(exTime) - currentTime) / 1000)); 
    var minutes = Math.floor(remainingTime / 60);
    var seconds = remainingTime % 60;

    document.getElementById('timer').innerHTML = minutes + "분 " + seconds + "초 남음";
    setTimeout(displayExTime, 1000);
}
window.onload = displayExTime;
</script>
<table class="linkTable"> 
    <tr>
        <td align="center">
        ${ param.user_param2 }
        <c:if test="${ empty sessionScope.userId }" var="flag">
            <a href="${pageContext.request.contextPath}/6.세션/LoginForm.jsp">로그인</a>
        </c:if>
        <c:if test="${ not flag }">
        	<a href="${pageContext.request.contextPath}/6.세션/Logout.jsp">로그아웃</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="${pageContext.request.contextPath}/8게시판/List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="${pageContext.request.contextPath}">게시판(페이징O)</a><br><br>
            <span class="point" style="background: lavender;">ID: ${ userId } </span></span><span><b> 세션 만료까지 남은 시간 : </b></span><span id="timer"></span>
        </c:if>
        </td>
    </tr>
</table>
