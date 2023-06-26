package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		MVCBoardDao mDao = new MVCBoardDao();
		mDao.updateVisitCnt(idx);
		MVCBoardDto mDto = mDao.getBoardView(idx);
		
		if(idx == null) {
			System.err.println("---------- 존재하지 않는 게시글 🤷");
			return; 
		}
		
		req.setAttribute("mDto", mDto);
		
		req.getRequestDispatcher("../14MVCBoard/View.jsp").forward(req, resp);
	}
}
