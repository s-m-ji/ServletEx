<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fileupload.FileDao"%>
<%@page import="fileupload.FileDto"%>
<%@page import="common.JSPFunction"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<title>UploadProcess.jsp</title>
</head>
<body>
<%
	// 저장할 디렉토리의 실제 경로
	// 로컬 C드라이브에 'upload'라는 폴더를 하나 생성해주었음
	String saveDirectory= "C:/upload";
	
	/* webapp 폴더 하위에 'upload' 디렉토리를 하나 생성해주었음 
	역슬래시 오류는 두개씩 써주면 됩니다옹 */
	saveDirectory = "C:\\Users\\user\\git\\ServletEx\\page\\src\\main\\webapp\\upload";
	
	// 파일의 최대 크기(1MB)
	int maxPostSize = 1024 * 1000;
	
	// 인코딩 방식
	String encoding = "utf-8";

	/* MultipartRequest 객체 생성
		생성자의 매개변수로 지정 (request, 저장 경로, 파일의 최대 크기, 인코딩 방식)
		객체가 정상적으로 생성되면 파일은 업로드 됩니다
	*/
	try {
		MultipartRequest mr = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding);
		/* JSPFunction.alertLocation("👌 파일 업로드 완료 👌", "file:///upload/", out); 
			=> 브라우저에서 로컬 폴더를 바로 열 수 없기 때문에 이건 불가 ! */
		
		
		/* 새로운 파일명 생성
			동일한 파일명이 업로드 되는 경우 기존 파일이 소실될 위험이 있으므로 파일명을 변경하여 저장 */		
			
		// 원래 첨부파일(이름+확장자)
		String ofileName = mr.getFilesystemName("attachedFile");
		
		// 첨부파일의 이름만
		String fileName = ofileName.substring(0, ofileName.lastIndexOf("."));
		
		// 첨부파일의 확장자
		String exp = ofileName.substring(ofileName.lastIndexOf("."));
		
		// H: 0~23시, S: millisecond초
		String date = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		
		// 수정된 파일
		String nfileName = fileName +"_"+ date + exp;
		
		// 폼 요소의 값을 저장
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		
		// 체크 박스는 값을 배열로 받아서 문자열로 연결하여 저장
		String[] cateArry = mr.getParameterValues("cate");
		StringBuffer sb = new StringBuffer();
		if(sb == null){
			sb.append("선택 없음");
		} else {
			int i=0;
			for(String s : cateArry){
				sb.append(s);
				if(i < cateArry.length-1){
					sb.append(", ");
				}	i++;
			}
		}
		
		System.out.println("-------------------------");
		System.out.println("name : " + name);
		System.out.println("title : " + title);
		System.out.println("cate : " + sb.toString());
		System.out.println("ofileName : " + ofileName);
		System.out.println("nfileName : " + nfileName);
		System.out.println("-------------------------");
		
		/* 파일명 변경 */
		File oldFile = new File(saveDirectory + File.separator + ofileName);
		File newFile = new File(saveDirectory + File.separator + nfileName);
		oldFile.renameTo(newFile);
		
		// FileDto 생성
		FileDto file = new FileDto("", name, title, sb.toString(), ofileName, nfileName, "");
		
		// FileDao 호출
		FileDao fDao = new FileDao();
		int res = fDao.insetFile(file);
		if(res>0){
			// 리스트 페이지로 이동
			JSPFunction.alertLocation("📤 파일 업로드 완료 📤", "FileList.jsp", out);
		} else {
			// 이전 페이지로 이동
			JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", out);
			
		}
		
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("errMsg", "파일 업로드 오류");
		JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", out);
	}
%>
</body>

</html>



















