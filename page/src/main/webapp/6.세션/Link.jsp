<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // 세션 만료 시간 가져오기
    int maxInactiveInterval = session.getMaxInactiveInterval();
    Date now = new Date();
    Date exTime = new Date(now.getTime() + (maxInactiveInterval * 1000));

    // 포맷 설정
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    // 만료 시간을 문자열로 변환
    String exTimeString = dateFormat.format(exTime);
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

<table class="linkTable"> 
    <tr>
        <td align="center">
       <%
		    String userId = (String)session.getAttribute("userId");
		    String linkText = (userId != null) ? "로그아웃" : "로그인";
		    String linkUrl = ("로그아웃".equals(linkText)) ? "/6.세션/LogOut.jsp" : "/6.세션/LoginForm.jsp";
		%>
		<a href="<%=linkUrl%>"><%=linkText%></a>

            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->
            &nbsp;&nbsp;&nbsp; 
            <a href="../08Board/List.jsp">게시판(페이징X)</a>
            &nbsp;&nbsp;&nbsp; 
            <a href="../09PagingBoard/List.jsp">게시판(페이징O)</a>
        </td>
        
        <%
       		 if(userId != null){
        %>
        <td>
            <span class="point" style="background: lavender;">ID: <%= userId %> </span></span><span><b> 세션 만료까지 남은 시간 : </b></span><span id="timer"></span>
        </td>
        <% } %>
    </tr>
</table>
