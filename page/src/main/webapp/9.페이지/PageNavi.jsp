<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PageNavi.jsp</title>
<script src="https://kit.fontawesome.com/bc0f5040fb.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- PageDto 객체를 가지고 페이지 블럭을 생성 
		- 페이징 블록의 시작번호
		- 페이징 블록의 끝번호
		- 게시물의 끝번호
		- 이전/다음 버튼 출력 여부
		- 맨 처음/끝 버튼 출력 여부	
	-->
	
	<%
		/* int total = 300;
		int pageNo = request.getParameter("pageNo") == null? 1 : Integer.parseInt(request.getParameter("pageNo"));
 		Criteria cr = new Criteria(pageNo);
		PageDto pDto = new PageDto(total, cr); */
		
		if(pDto.isPrev()){
			out.print("<a href='List.jsp?pageNo="+(pDto.getStartNo()-1)+"'>");
			out.print(" <i class='fa-solid fa-left'></i> <");
			out.print("</a>");
		}
		for(int i = pDto.getStartNo(); i<= pDto.getEndNo(); i++){
			out.print("<a href='List.jsp?pageNo="+i+"'> ");
			out.print(i);
			out.print(" </a>");
		}
		if(pDto.isNext()){
			out.print("<a href='List.jsp?pageNo="+(pDto.getEndNo()+1)+"'>");
			out.print(" <i class='fa-solid fa-right'></i> >");
			out.print("</a>");
		}
		
	%>
	
</body>
</html>