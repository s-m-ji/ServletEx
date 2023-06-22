package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "서블릿 호출 ~");
		
		// getWrier()로  해당 페이지 내용을 바로 보여주려면 포워드, 리다이렉트(x)
		
		/*
		 * PrintWriter out = resp.getWriter(); out.print("서블릿 호출 ~~~");
		 */
		
		/* resp.sendRedirect("HelloServlet.jsp"); */

		// setAttribute 메세지 가져가려고 포워드함
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
		
	}

	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
