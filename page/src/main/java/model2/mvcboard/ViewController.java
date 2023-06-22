package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {

	public ViewController() {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = (String)req.getAttribute("idx");
		
		MVCBoardDao mDao = new MVCBoardDao();
		MVCBoardDto mDto = mDao.getBoardView(idx);
		
		req.setAttribute("mDto", mDto);
		
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
	}
}
