<%@page import="dao.TableDao"%>
<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script src="https://kit.fontawesome.com/bc0f5040fb.js" crossorigin="anonymous"></script>
<title>회원제 게시판</title>
<script>
function changePageSize(value) {
    var searchForm = document.forms.searchForm;
    searchForm.searchAmount.value = value;
    searchForm.submit();
}
</script>
</head>
<body>
<%@ include file="../6.세션/Link.jsp" %>
<%-- <%@ include file="../6.세션/IsLogin.jsp" %> --%>
<%
	/* if(userId == null){
		request.getRequestDispatcher(
				response.encodeRedirectURL("../6.세션/LoginForm.jsp")
			).forward(request, response);
	} */
	

	String sField = request.getParameter("searchField");	
	String sWord = request.getParameter("searchWord");	
	int pageNo = request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));	
	int sAmount = request.getParameter("searchAmount") == null? 10 : Integer.parseInt(request.getParameter("searchAmount"));	
	
	Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
	NewBoardDao bDao = new NewBoardDao();
	List<Board> list = bDao.getListPage(cr);
	int totalCnt = bDao.getTotalCnt(cr);
	PageDto pDto = new PageDto(totalCnt, cr);
%>
    <h2>New 목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form name="searchForm">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title" <%="title".equals(sField)? "selected" : "" %>>제목</option> 
                <option value="content" <%="content".equals(sField)? "selected" : "" %>>내용</option>
                <option value="id" <%="id".equals(cr.getsField())? "selected" : "" %>>작성자</option>
                <option value="postdate" <%="postdate".equals(cr.getsField())? "selected" : "" %>>작성일</option>
            </select>
            <input type="text" name="searchWord" value="<%= sWord == null? "" : sWord%>"/>
            <input type="hidden" name="pageNo" value="<%= cr.getPageNo()%>" >
            <input type="submit" value="검색하기" />
            <select name="searchAmount" onchange="changePageSize(this.value)">
            	<option value="10" <%= sAmount == 10 ? "selected" : "" %>>10개씩 보기</option>
            	<option value="50" <%= sAmount == 50 ? "selected" : "" %>>50개씩 보기</option>
            	<option value="100" <%= sAmount == 100 ? "selected" : "" %>>100개씩 보기</option>
            </select>
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%" class="listTable">
        <!-- 각 칼럼의 이름 --> 
        <tr><td colspan ="6"><b>총 게시글 수 : <%= totalCnt%></b></td></tr>
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="15%">수정일</th>
        </tr>
        <!-- 목록의 내용 --> 
		<%
		if(list.isEmpty()){
		%>
		<tr>
			<td colspan="6">게시물이 없네요 ~</td>
		</tr>
		<%	
		} else {
			for(Board b : list){
		%>
        <tr align="center">
            <td><%=b.getNum() %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
            	<a href="View.jsp?num=<%=b.getNum()%>&pageNo=<%=cr.getPageNo()%>">
                <%=b.getTitle() %></a> 
            </td>
            <td align="center"><%=b.getId() %></td>          <!--작성자 아이디-->
            <td align="center"><%=b.getCount() %></td>  <!--조회수-->
            <td align="center"><%=b.getPostdate() %></td>    <!--작성일-->
            <td align="center"><%=b.getEditdate() %></td>    <!--수정일-->
        </tr>
		<%
			}
		}
		%>

    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <%
    	if(session.getAttribute("userId") != null && !"".equals(session.getAttribute("userId"))){
    %>
    <table border="1" width="90%" class="btnTable">
        <tr align="right">
            <td colspan="5"><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
        </tr>
    </table>
    <%
    	};
    %>
    <!-- 페이지네이션 블록 -->
	<table class="pageNavi">
		<%-- <tr><td><%@ include file="../9.페이지/PageNavi.jsp" %></td></tr> --%>
		<tr><td><%@ include file="../6.세션/PageNavi.jsp" %></td></tr>
	</table>
	
<script>
const scrollTop = function () {
    const scrollBtn = document.createElement("button");
    scrollBtn.innerHTML = "<i class='fa-regular fa-circle-up'></i>";
    scrollBtn.setAttribute("id", "scroll-btn");
    document.body.appendChild(scrollBtn);

    const scrollBtnDisplay = function () {
      window.scrollY > window.innerHeight
        ? scrollBtn.classList.add("show")
        : scrollBtn.classList.remove("show");
    };
    
    window.addEventListener("scroll", scrollBtnDisplay);
    const scrollWindow = function () {
      if (window.scrollY != 0) {
        setTimeout(function () {
          window.scrollTo(0, window.scrollY - 100);
          scrollWindow();
        }, 10);
      }
    };
    scrollBtn.addEventListener("click", scrollWindow);
  };
scrollTop();

const urlParams = new URL(location.href).searchParams;
const pageNo = urlParams.get('pageNo');


</script>	
</body>
</html>
