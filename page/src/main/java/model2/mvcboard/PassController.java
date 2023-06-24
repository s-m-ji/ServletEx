package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import common.JSPFunction;

@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("../14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String mode = req.getParameter("mode");
		String idx = req.getParameter("idx");
		String pass = req.getParameter("pass");
		//req.setAttribute("idx", idx);
		//req.setAttribute("pass", pass);
		
		MVCBoardDao mDao = new MVCBoardDao();
		boolean confirmed = mDao.confirmPassword(pass, idx);
		if(confirmed) {
			System.out.println("비밀번호 검증 성공 ~ ");
			if("edit".equals(mode)) {
				 // req.getRequestDispatcher("../mvcboard/edit.do").forward(req, resp);
				HttpSession session = req.getSession();
			    session.setAttribute("pass", pass);
				resp.sendRedirect("../mvcboard/edit.do?idx="+idx); // 파라미터 값이 idx만 필요해서 간단히 리다이렉트함
			} else if("delete".equals(mode)) {
				int res = mDao.deletePost(idx);
				if(res>0) {
					JSPFunction.alertLocation("🗑 게시글 삭제 완료 🗑 ", "../mvcboard/list.do", resp);
				} else {
					JSPFunction.alertBack("❌ 게시글 삭제 실패 ❌ (관리자 문의 요망) ", resp);
				}
			}
		} else {
			JSPFunction.alertBack("🙅‍♀️ 비밀번호 검증 실패 🙅‍♀️", resp);
		}
		
	}

}
