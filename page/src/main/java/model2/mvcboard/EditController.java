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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory= "C:/upload";		
		int maxPostSize = 1024 * 1000;		
		String encoding = "utf-8";

		try { MultipartRequest mr = new MultipartRequest(
					req, saveDirectory, maxPostSize, encoding);
			
			// 폼 요소의 값을 저장
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");
			String idx = mr.getParameter("idx");

			HttpSession session = req.getSession();
		    String pass = (String) session.getAttribute("pass");
		    req.setAttribute("pass", pass);
		    
			if(pass == null) {
				JSPFunction.alertLocation("❌ 수정 권한이 없음 ❌", "../mvcboard/view.do?idx="+idx, resp);
				System.err.println("---------- 수정 권한이 없음 (pass == null)");
			}
			
			req.setAttribute("name", name);
			req.setAttribute("title", title);
			req.setAttribute("content", content);
			req.setAttribute("idx", idx);
		
			MVCBoardDto mDto = new MVCBoardDto();
			
			// 원래 첨부파일(이름+확장자)
			String ofileName = mr.getFilesystemName("file");
			
			if(ofileName != null) {
				// 첨부파일의 이름만
				String fileName = ofileName.substring(0, ofileName.lastIndexOf("."));
				
				// 첨부파일의 확장자
				String exp = ofileName.substring(ofileName.lastIndexOf("."));
				
				String date = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
				
				// 새로운 파일명
				String nfileName = fileName +"_"+ date + exp;
					
				mDto.setOfile(ofileName);
				mDto.setSfile(nfileName);
				// MVCBoardDto mDto = new MVCBoardDto(idx, name, title, content, "", ofileName, nfileName, 0, "", 0);
				System.out.println("*************************");
				System.out.println("ofileName : " + ofileName);
				System.out.println("nfileName : " + nfileName);
			}
			
			// MVCBoardDto mDto = new MVCBoardDto(idx, name, title, content, "", "", "", 0, "", 0);
			mDto.setName(name);
			mDto.setTitle(title);
			mDto.setContent(content);
			mDto.setIdx(idx);
			
			req.setAttribute("mDto", mDto);
			
			int res = mDao.updatePost(mDto);
			if(res>0){
				// 리스트 페이지로 이동
				JSPFunction.alertLocation("✏ 게시글 수정 완료 ✏", "../mvcboard/list.do", resp);
				System.out.println("---------- 게시글 수정 완료");
			} else {
				// 이전 페이지로 이동
				JSPFunction.alertBack("❌ 게시글 수정 실패 (res>0 false) ❌", resp);
				System.err.println("---------- 게시글 수정 실패 (res>0 false)");
			}
			
		} catch (IOException e) {
			JSPFunction.alertBack("❌ 게시글 수정 실패 (IOException) ❌", resp);
			System.err.println("---------- 게시글 수정 실패 (IOException)");
			e.printStackTrace();
		
		} catch (Exception e) {
			JSPFunction.alertBack("❌ 게시글 수정 실패 (Exception) ❌", resp);
			System.err.println("---------- 게시글 수정 실패 (Exception)");
			e.printStackTrace();
		}
		
	}
}
