package com.library.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.common.JSPFunction;
import com.library.service.BookService;

@WebServlet("/rentBook")
public class RentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("------------ idx : " + request.getParameter("idx"));
		BookService bs = new BookService();	
		// bs.rentBook(Integer.parseInt(request.getParameter("idx")));
		JSPFunction.alertLocation("오예 대출 성공쓰 ~ ", "../book/list.book", response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
