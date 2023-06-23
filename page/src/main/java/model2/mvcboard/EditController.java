package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSPFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet{
	MVCBoardDao mDao = new MVCBoardDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MVCBoardDto mDto =  mDao.getBoardView(req.getParameter("idx"));
		req.setAttribute("mDto", mDto);
		req.getRequestDispatcher("../14MVCBoard/Edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// TODO 아래 name부터 전부 null이 찍힘.. 이유가 뭘까아
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String idx = req.getParameter("idx");
		
		MVCBoardDto mDto = new MVCBoardDto(idx, name, title, content, "", "", "", 0, "", 0);
									
		System.out.println("name : " + req.getParameter("name"));
		System.out.println("title : " + req.getParameter("title"));
		System.out.println("content : " + req.getParameter("content"));
		System.out.println("idx : " + req.getParameter("idx"));
		
		req.setAttribute("mDto", mDto);

		int res = mDao.updatePost(mDto);
		System.out.println("res : "+ res);
		
		if(res>0){
			// 리스트 페이지로 이동
			JSPFunction.alertLocation("📤 파일 업로드 완료 📤", "../mvcboard/write.do", resp);
			System.out.println("---------- 게시글 작성 완료");
		} else {
			// 이전 페이지로 이동
			JSPFunction.alertBack("❌ 게시글 수정 실패 ❌", resp);
			System.err.println("---------- 게시글 수정 실패");
		}
	}
}
