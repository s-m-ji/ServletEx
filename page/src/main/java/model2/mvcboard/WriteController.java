package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSPFunction;

public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("../14MVCBoard/Write.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드
		// 업로드 경로, 최대 사이즈
		String saveDirectory = "C:/upload";
		saveDirectory = "C:\\Users\\user\\git\\ServletEx\\page\\src\\main\\webapp\\upload";
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, 1024 * 1000);
		if(mr == null) {
			// 파일 업로드 실패
			JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", response);
			return;
		}
		
		// 파일 업로드 외 form 값을 dto에 저장
		MVCBoardDto mDto = new MVCBoardDto();
		mDto.setName(mr.getParameter("name"));
		mDto.setTitle(mr.getParameter("title"));
		mDto.setContent(mr.getParameter("content"));
		mDto.setPass(mr.getParameter("pass"));
		
		// 원래 첨부파일(이름+확장자)
		String ofileName = mr.getFilesystemName("file");
		if(ofileName != null) {
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
			
			mDto.setOfile(ofileName); // 원본 파일명
			mDto.setSfile(nfileName); // 저장된 파일명
		}
		
		System.out.println("ofileName : " + ofileName);
		
		MVCBoardDao mDao = new MVCBoardDao();
		int res = mDao.insertPost(mDto);
		if(res>0) {
			System.out.println("---------- 게시글 작성 완료");
			JSPFunction.alertLocation("📝 게시글 작성 완료 📝", "../mvcboard/list.do", response);
		} else {
			JSPFunction.alertBack("❌ 게시글 작성 실패 (res>0 false)", response);
			System.err.println("---------- 게시글 작성 실패 (res>0 false)");
		}
	
	}

}



























