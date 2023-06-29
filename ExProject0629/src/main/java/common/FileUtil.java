package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	
	/**
	 * 파일 업로드 
	 * @param request
	 * @param response
	 * @param saveDirectory
	 */
	public static void downloadFile(
			HttpServletRequest request, HttpServletResponse response,
			String saveDirectory, String originalFileName, String saveFileName) {
		
		// 업로드 파일이 저장된 경로
				// 원본 파일 이름
				// String originalFileName = request.getParameter("oName"); -> "ofile"로 수정해야되지만 대신 매개변수로 name을 받아오기로함
				// 저장된 파일 이름
				// String saveFileName = request.getParameter("sName");
				
				System.out.print("originalFileName : " + originalFileName + "<br>");
				System.out.print("saveFileName : " + saveFileName + "<br>");
				
			try {
				File file = new File(saveDirectory, saveFileName);
				System.out.print("file : " + file);
				
				// 파일 입력 스트림 생성
				InputStream inStream = new FileInputStream(file);
				
				// 한글 파일명 깨짐 방지
				String str = request.getHeader("User-Agent"); 
				// ie(익스 브라우저) 체크
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
				// out.clear(); // --> jsp에서와 달리 여기서는 out을 바로 사용 못하여 주석처리
				
				/* 파일 다운로드는 되지만 콘솔에 "getOutputStream()이 이미 호출되었습니다." 계속 출력되기에
				 기존 out 객체를 비우고 새로 쓸 준비를 하기 위해 아래 코드 추가 */
				// out = pageContext.pushBody(); // --> jsp에서와 달리 여기서는 out을 바로 사용 못하여 주석처리
				
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
				JSPFunction.alertBack("❗ 파일을 찾을 수 없슈 ❗", response);
				
			} catch(Exception e){
				JSPFunction.alertBack("❗ 파일 다운로드 중 오류 발생 ❗", response);
			}
	}
	
	
	/**
	 * 파일 업로드
	 * @param request
	 * @param saveDirectory
	 * @param maxPostSize
	 * @return
	 */
	public static MultipartRequest uploadFile(
			HttpServletRequest request, String saveDirectory, int maxPostSize) {
		
		try {
			return new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
		} catch (IOException e) {
			System.out.println("---------- 파일 업로드 실패 (IOException)");
			e.printStackTrace();
			return null;
		}
	}
	
	

	/**
	 * 파일 삭제
	 * 불필요한 더미데이터가 누적되는 것을 방지 
	 * @param directory
	 * @param fileName
	 */
	public static void deleteFile(String directory, String fileName) {
			
		File file = new File(directory + File.separator + fileName);
	
		// 파일이 존재하면 제거
		if(file.exists()) {
			file.delete();
		}
	}
	
	/**
	 * 파일 업로드 시 원본 파일명을 수정된 파일명으로 저장
	 * @param saveDirectory
	 * @param ofileName
	 * @return
	 */
	public static String fileNameChange(String saveDirectory, String ofileName) {
		
		// if(ofileName != null) { -> TODO 파일을 업로드하지 않아도 도서 등록이 가능하도록 처리 필요.
		
		// 첨부파일의 이름만
		  String fileName = ofileName.substring(0, ofileName.lastIndexOf("."));
					
		
		// 첨부파일의 확장자
			String exp = ofileName.substring(ofileName.lastIndexOf("."));
			
			// H: 0~23시, S: millisecond초
			String date = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			// 수정된 파일
			String nfileName = fileName +"_"+ date + exp;

			/* 파일명 변경 */
			File oldFile = new File(saveDirectory + File.separator + ofileName);
			File newFile = new File(saveDirectory + File.separator + nfileName);
			oldFile.renameTo(newFile);
			
			return nfileName;
		// }
	}
	
	
	
	
	
	
	
	
	
	
	
}































