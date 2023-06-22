package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.one")
public class FrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		// 요청 경로
		String commandStr = uri.substring(uri.lastIndexOf("/"));

		switch (commandStr) {
			case "/regist.one": {
				registFunc(req);
				break;
			}
			case "/login.one": {
				loginFunc(req);
				break;
			}
			case "/freeboard.one": {
				freeboardFunc(req);
				break;
			}
		}
		
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		
		req.getRequestDispatcher("/13.서블릿/FrontController.jsp").forward(req, resp);
		
		/*
		 * resp.getWriter().print(uri + "\n"); resp.getWriter().print(commandStr);
		 */
	}
	

	// 요청별 처리 메소드
	private void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<b>회원가입</b>");
	}
	
	private void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<b>로그인</b>");
		
	}

	private void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<b>자유게시판</b>");
		
	}
	
	
	public FrontController() {
		// TODO Auto-generated constructor stub
	}

}
