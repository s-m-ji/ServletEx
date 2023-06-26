<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>PopupMain01.jsp</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script type="text/javascript">
	window.onload = function (){
		if(typeof closeBtn !== 'undefined'){		
			closeBtn.onclick = function () {
			/* function cBtn(){
				let popup = document.getElementById('popup'); */
			   
			   // 체크박스가 체크되었으면 popFrm 폼을 서브밋 처리 
			   // -> popupCookie.jsp를 요청
			   // 쿠키를 생성 후 main01.jsp를 리다이렉트
			   
			   /*let cBox = document.querySelector('#inactiveToday').checked
			   if(cBox){ */
				 if(document.querySelector('#inactiveToday').checked){
				   popFrm.submit();
			   } else { popup.style.display = "none";}
		   }
		}
	}
    </script>
</head>
<body>
	<h2>국희를 이용한 팝업창 제어 ver 1.0</h2>
	
	<%
		// 쿠키에 popupClose값이 등록되어있지 않으면 팝업창을 보여줌
		String cValue = CookieManager.readCookie(request, "popupClose");
		if(!cValue.equalsIgnoreCase("y")){
	%>
			
	<div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        <form name="popFrm" action="popupCookie.jsp">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" onclick="cBtn();"/> 
	        </form>
        </div>
    </div>
    
	<%   
   }
	%>

</body>
</html>