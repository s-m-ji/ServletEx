package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSPFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet{
	MVCBoardDao mDao = new MVCBoardDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDto mDto =  mDao.getBoardView(req.getParameter("idx"));
		req.setAttribute("mDto", mDto);
		req.setAttribute("mDtoCnt", mDto.getContent().replace("<br>", "\r\n"));
		req.getRequestDispatcher("../14MVCBoard/Edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String saveDirectory = "C:/upload";
		saveDirectory = "C:\\Users\\user\\git\\ServletEx\\page\\src\\main\\webapp\\upload";
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, 1024 * 1000);
		
		if(mr == null) {
			// 파일 업로드 실패
			JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", response);
			return;
		}
		
		String idx = mr.getParameter("idx");
		
		// 세션에 저장된 비밀번호가 없으면 수정 불가
		HttpSession session = request.getSession();
	    String pass = (String) session.getAttribute("pass");
	    request.setAttribute("pass", pass);
	    
		if(pass == null) {
			JSPFunction.alertLocation("❌ 수정 권한이 없음 ❌", "../mvcboard/view.do?idx="+idx, response);
			System.err.println("---------- 수정 권한이 없음 (pass == null)");
		}
		
		MVCBoardDto mDto = new MVCBoardDto();
		mDto.setName(mr.getParameter("name"));
		mDto.setTitle(mr.getParameter("title"));
		mDto.setContent(mr.getParameter("content"));
		mDto.setPass(mr.getParameter("pass"));

		
		String ofileName = mr.getFilesystemName("file");
		if(ofileName != null) {
			String fileName = ofileName.substring(0, ofileName.lastIndexOf("."));
			
			String exp = ofileName.substring(ofileName.lastIndexOf("."));
			
			String date = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			String nfileName = fileName +"_"+ date + exp;

			File oldFile = new File(saveDirectory + File.separator + ofileName);
			File newFile = new File(saveDirectory + File.separator + nfileName);
			oldFile.renameTo(newFile);
			
			mDto.setOfile(ofileName); // 원본 파일명
			mDto.setSfile(nfileName); // 저장된 파일명
			
		}
		System.out.println("---------- ofileName : " + ofileName);
		
		request.setAttribute("mDto", mDto);
		
		MVCBoardDao mDao = new MVCBoardDao();
		int res = mDao.insertPost(mDto);
		
		if(res>0){
			// 리스트 페이지로 이동
			JSPFunction.alertLocation("✏ 게시글 수정 완료 ✏", "../mvcboard/view.do?idx="+idx, response);
			System.out.println("---------- 게시글 수정 완료");
		} else {
			// 이전 페이지로 이동
			JSPFunction.alertBack("❌ 게시글 수정 실패 (res>0 false) ❌", response);
			System.err.println("---------- 게시글 수정 실패 (res>0 false)");

		}
	
	}
}
