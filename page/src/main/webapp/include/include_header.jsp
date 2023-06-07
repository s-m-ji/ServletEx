<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.LocalDate"%>

<%
	LocalDate today = LocalDate.now();  // 오늘 날짜
	LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);  // 내일 날짜
%>
오늘 : <%= today %><br>
내일 : <%= tomorrow %>

<p>헤더 header</p>
<header id='logo'>
    <div id='icon'><img src="images/logo.jpg" alt=""></div>
    <div id='title'><img src="images/mainlogo.jpg" alt=""></div>
    <nav>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Board</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
</header>