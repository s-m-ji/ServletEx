<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>Pass.jsp</title>
<script type="text/javascript">
    function validateForm(form) {
        if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        }
    }
</script>
</head>
<body>
	<h2>MVCBoardList - Pass.jsp</h2>
	<form name="writeFrm" method="post" action="../mvcboard/pass.do" 
		onsubmit="return validateForm(this);">
		<input type="text" name="idx" value="${ param.idx }" />
		<input type="text" name="mode" value="${ param.mode }" /> 
		<!-- req 영역에 저장해두었기때문에 그냥 변수명만 적어도 된다 ! 하지만 컨트롤러에서 별도 저장 안 하면 param 붙이기-->
	<table border="1" width="90%">
	    <tr>
	        <td>비밀번호</td>
	        <td><input type="password" name="pass" style="width:100px;" /></td>
	    </tr>
	    <tr>
	        <td colspan="2" align="center">
	            <button type="submit">검증하기</button>
	            <button type="reset">RESET</button>
	            <button type="button" onclick="location.href='../mvcboard/list.do';">
	                목록 바로가기
	            </button>
	        </td>
	    </tr>
	</table>    
</form>
</body>
</html>