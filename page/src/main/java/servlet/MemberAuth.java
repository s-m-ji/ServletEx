package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class MemberAuth extends HttpServlet{

	MemberDao mDao;
	
	@Override
	public void init() throws ServletException {
		mDao = new MemberDao();
	}	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String admin_id = this.getInitParameter("admin_id");
		Member m = mDao.login(req.getParameter("userId"), req.getParameter("userPw"));
		
		  if(m != null) { 
			  req.setAttribute("authMessage", m.getName() +	 " 로그인 성공 했슈 !");
		  		System.out.println(m.getName() + " 로그인 성공 했슈 !"); 
		  			
	  		if(m.getId().equals(admin_id)) {
	  			// if(admin_id.equals(m.getId())) { 이렇게 하면 null 오류 발생...
	  			req.setAttribute("authMessage", "관리자 " + admin_id + " 등장 ~");
	  		}
		 } else {
			  req.setAttribute("authMessage", m.getName() + " 로그인 실패 했슈 !");
			  System.out.println(" 로그인 실패 했슈 !");
		  }
		
		req.getRequestDispatcher("/13.서블릿/MemberAuth.jsp").forward(req, resp);
		
		// resp.sendRedirect("/13.서블릿/MemberAuth.jsp"); -> 폴더명 : 한글 때문에 오류 발생..!
		
	}
	
	
	
	public MemberAuth() {
	}

}
