package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.service.MemberService;
import com.library.vo.Member;

@WebServlet("/login/LoginAction.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		
		MemberService ms = new MemberService();
        
        Member member = ms.login(id, pw);
        
        if(member != null && !member.getId().equals("")){
        	
        	HttpSession session = request.getSession();
        	
        	session.setAttribute("member", member);
        	session.setAttribute("userId", member.getId());
        	
        	if("Y".equals(member.getAdminyn())){
        		session.setAttribute("adminYn", "Y");
        	} 
        	
			//request.getRequestDispatcher("../book/list.book").forward(request, response);
        	// doPost에서 충돌이 나는 것 같다고하셔서 sendRedirect로 바꿨으나 오류가 생기지 않는 듯 함..?
        	 response.sendRedirect("../book/list.book");
        	
        } else {
        	response.sendRedirect("../Book/index.jsp?error=Y");
        }
	}

}
