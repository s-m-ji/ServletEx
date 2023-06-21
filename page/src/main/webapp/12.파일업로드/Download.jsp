<%@page import="java.io.FileNotFoundException"%>
<%@page import="common.JSPFunction"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download.jsp</title>
</head>
<body>
	<%
		// 업로드 파일이 저장된 경로
		String saveDirectory = "C:/upload";
		// 원본 파일 이름
		String originalFileName = request.getParameter("oName");
		// 저장된 파일 이름
		String saveFileName = request.getParameter("sName");
		
		out.print("originalFileName : " + originalFileName + "<br>");
		out.print("saveFileName : " + saveFileName + "<br>");
		
	try {
		File file = new File(saveDirectory, saveFileName);
		out.print("file : " + file);
		
		// 파일 입력 스트림 생성
		InputStream inStream = new FileInputStream(file);
		
		// 한글 파일명 깨짐 방지
		String str = request.getHeader("User-Agent"); 
		// ie 체크
		if(str.indexOf("WOW64") == -1){
			originalFileName = 
					new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1");
		} else {
			originalFileName = 
					new String(originalFileName.getBytes("KSC5601"), "ISO-8859-1");
		}
		
		// 파일 다운로드용 응답 헤더 설정
		response.reset();
		
		// 파일 다운로드 창을 띄우기 위한 콘텐츠 타입을 지정
		// octet-stream은 8비트 단위의 바이너리 데이터를 의미
		response.setContentType("application/octet-stream");
		
		// 원본파일명으로 다운로드 받을 수 있게 설정
		response.setHeader("Content-Disposition",
							"attachment; filename=\"" + originalFileName + "\"");
		response.setHeader("Content-Length", "" + file.length() );
		
		
		// 충돌을 방지하고자 출력하기 전 출력 스트림 초기화
		out.clear();
		
		/* 파일 다운로드는 되지만 콘솔에 "getOutputStream()이 이미 호출되었습니다." 계속 출력되기에
		 기존 out 객체를 비우고 새로 쓸 준비를 하기 위해 아래 코드 추가 */
		out = pageContext.pushBody();
		
		// response 내장 객체로부터 새로운 출력 스트림을 생성
		OutputStream outStream = response.getOutputStream();
		
		// 출력 스트림에 파일 내용 출력
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer = inStream.read(b)) > 0){
			outStream.write(b, 0, readBuffer);
		}
		
		// 입/출력스트림 닫기
		inStream.close();
		outStream.close();
		
	} catch(FileNotFoundException e){
		JSPFunction.alertBack("❗ 파일을 찾을 수 없슈 ❗", out);
		
	} catch(Exception e){
		JSPFunction.alertBack("❗ 파일 다운로드 중 오류 발생 ❗", out);
	}
	%>
</body>
</html>













