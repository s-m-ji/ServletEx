<%@page import="dao.TableDao"%>
<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
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
<%-- <%@ include file="../../6.세션/Link.jsp" %> --%>
<%@ include file="Link_jstl.jsp" %>
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
        <tr><td colspan ="6"><b>총 게시글 수 : <%= totalCnt%></b></td></tr>
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="15%">수정일</th>
        </tr>
        <!-- ES에서 사용하기위해 변수를 선언, page 영역에 저장 -->
        <c:set var="list" value="<%= list %>"/>
        <c:choose>
			<c:when test="${ empty list }">
				<tr>
					<td colspan="6">게시물이 없네요 ~</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="<%=list%>" var="bList">
			        <tr align="center">
			            <td>${ bList.num }</td>  
			            <td align="left">  
			            	<a href="${pageContext.request.contextPath}/8게시판/View.jsp?num=${ bList.num }&pageNo=<%=cr.getPageNo()%>">
			                ${ bList.title }</a> 
			            </td>
			            <td align="center">${ bList.id }</td>          
			            <td align="center">${ bList.count }</td>  	
			            <td align="center">${ bList.postdate }</td>    
			            <td align="center">${ bList.editdate }</td>   
			        </tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<!-- 저장 영역을 확실히 보여주고자 스코프 기입함 
		/ EL not empty로 쓰면 null, 빈 문자열 알아서 처리해줌 희희 -->
	<c:if test="${ not empty sessionScope.userId }">
	    <table border="1" width="90%" class="btnTable">
	        <tr align="right">
	            <td colspan="5"><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
	        </tr>
	    </table>
	</c:if>
    <!-- 페이지네이션 블록 -->
	<table class="pageNavi">
		<%-- <tr><td><%@ include file="../9.페이지/PageNavi.jsp" %></td></tr> --%>
		<tr><td><%@ include file="PageNavi_jstl.jsp" %></td></tr>
	</table>
<script>
const scrlTop = function () {
    const scrlBtn = document.createElement("button");
    scrlBtn.innerHTML = "<i class='fa-regular fa-circle-up'></i>";
    scrlBtn.setAttribute("id", "scroll-btn");
    document.body.appendChild(scrlBtn);

    const scrlBtnDp = function () {
      window.scrollY > window.innerHeight
        ? scrlBtn.classList.add("show")
        : scrlBtn.classList.remove("show");
    };
    
    window.addEventListener("scroll", scrlBtnDp);
    const scrlWindow = function () {
      if (window.scrollY != 0) {
        setTimeout(function () {
          window.scrollTo(0, window.scrollY - 200);
          scrlWindow();
        }, 10);
      }
    };
    scrlBtn.addEventListener("click", scrlWindow);
  };
scrlTop();
</script>	
</body>
</html>
