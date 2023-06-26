<%@page import="com.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>PopupMain03.jsp</title>
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:turquoise;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
    .off {
    	display: none;
    }
</style>
<script type="text/javascript">
	window.onload=()=>{
		if(typeof closeBtn !== 'undefined'){
			closeBtn.onclick=()=>{
				popup.style.display = "none";
				
				let chkVal = document.querySelector('input[id=inactiveToday]:checked');
				
				if(chkVal !=null && chkVal.value == 1){
					console.log("쿠키 생성 요청");
					
					// javascript를 활용한 쿠키를 생성
					const date = new Date();
					// 유지시간 : 12시간 (*1000하는 이유는 getTime의 값이 milliseconds여서!)
					date.setTime(date.getTime() + 12 * 60 * 60 * 1000);
					document.cookie = "popupClose=off; expires="+date.toGMTString();
				}
			}
		}
	}
	
</script>
</head>
<body>
<h2>국희를 이용한 팝업창 제어 ver 3.0</h2>
	<%
		// 쿠키에 popupClose가 등록되어있으면 class 속성을 이용해 팝업창을 출력하지 않도록 처리
		String pClose = CookieManager.readCookie(request, "popupClose");
		String off = pClose.equals("off")? "off" : "";
		/* String off2 = pClose.equals("")? "" : "off"; */
	%>
	<div id="popup" class="<%= off%>">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        <form name="popFrm">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn"/> 
	        </form>
        </div>
    </div>

</body>
</html>