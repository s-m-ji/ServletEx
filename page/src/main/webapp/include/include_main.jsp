<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<p>메인 main</p>     
<main>
    <aside id='leftside'>

    </aside>
    <div id='maincontent'>
        <ul>
            <li><img src="images/main_img1.jpg" alt="">나무를 심는 사람들</li>
            <li><img src="images/main_img2.jpg" alt="">아이들에게 녹색 미래를..</li>
            <li><img src="images/main_img3.jpg" alt="">설악산을 사리는 길</li>
            <li><img src="images/main_img4.jpg" alt="">사라지는 북극곰들</li>
        </ul>
    </div>

    <aside id='rightside'>
        <div class='side1'>
            <div class='loginbox'>
            <!-- 로그인 실패 : 메세지 처리 (alert) -->
            <!-- 로그인 성공 : form 숨김처리 + "id 안녕~" 출력 -->
            
            <%
            String login = request.getParameter("login");
            if("N".equalsIgnoreCase(login)){
			%>
            	<script>alert("🤔 로그인 실패 🤔");</script>
            <%
            } 
            
            String name = request.getParameter("name");         
            /* if("id".equalsIgnoreCase(name)){ */
            if(name != null && !name.equals("")) {
            	out.print("<script>alert('" + name + " 안녕?')</script>");
            	out.print(name + " 안녕~");
            } else {
            %>
            	<form action="loginAction.jsp" method="post">
                <div id='login'>
                    <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' required="required">
                    <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required="required">
                </div>
                <div id='button'>
                <input type="submit" value="로그인">
                </div>
            	</form>
            <%
            }
            %>
            </div>
            <div id='info'>
                <a href="register.jsp">회원가입</a>
                <a href="">ID찾기</a>
                <a href="">PW찾기</a>
            </div>
        </div>

        <div class='side2'>
            <img src="images/right_img.jpg" alt="">
        </div>

        <div class='side3'>
            <img src="images/me_chat.jpg" alt="">
        </div>
    </aside>
</main>        