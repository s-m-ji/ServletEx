package com.library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.service.BookService;

@WebServlet("*.book")
public class BookController extends HttpServlet {

	BookService bs = new BookService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("요청 uri : " + uri);
		if(uri.indexOf("list")>0) {
			request.setAttribute("list", bs.getList());
			// TODO total : 게시물 총 개수 session.setAttribute 필요
			request.getRequestDispatcher("../Book/list.jsp").forward(request, response);
			
		} else if(uri.indexOf("view")>0) {
			request.setAttribute("book", bs.getView());
			request.getRequestDispatcher("../Book/view.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
