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

import common.JSPFunction;
import fileupload.FileDao;
import fileupload.FileDto;

public class WriteController extends HttpServlet{

	public WriteController() {
	}
	
	MVCBoardDao mDao;
	
	@Override
	public void init() throws ServletException {
		mDao = new MVCBoardDao();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory= "C:/upload";
		
		int maxPostSize = 1024 * 1000;
		
		// 인코딩 방식
		String encoding = "utf-8";

		try { MultipartRequest mr = new MultipartRequest(
					req, saveDirectory, maxPostSize, encoding);
			
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
			String content = mr.getParameter("content");
			String pass = mr.getParameter("pass");
			
			req.setAttribute("name", name);
			req.setAttribute("title", title);
			req.setAttribute("content", content);
			req.setAttribute("pass", pass);
			
			File oldFile = new File(saveDirectory + File.separator + ofileName);
			File newFile = new File(saveDirectory + File.separator + nfileName);
			oldFile.renameTo(newFile);
			
			MVCBoardDto mDto = new MVCBoardDto();
			mDto.setName(name);
			mDto.setTitle(title);
			mDto.setContent(content);
			mDto.setPass(pass);
			mDto.setOfile(ofileName);
			mDto.setSfile(nfileName);
			
			int res = mDao.insert(mDto);
			if(res>0){
				// 리스트 페이지로 이동
				// JSPFunction.alertLocation("📤 파일 업로드 완료 📤", "FileList.jsp", out);
				System.out.println("---------- 게시글 작성 완료");
			} else {
				// 이전 페이지로 이동
				// JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", out);
				System.err.println("---------- 게시글 작성 실패1");
				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("---------- 게시글 작성 실패2");
		
		} catch (Exception e) {
			e.printStackTrace();
			// JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", out);
			System.err.println("---------- 게시글 작성 실패3");
		}
		
		// 글쓰기 화면으로 포워드
		req.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(req, resp);
		
		
	}
}
