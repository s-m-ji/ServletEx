package model2.mvcboard;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FileUtil;

@WebServlet("/mvcboard/download.do")
public class DownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---------- ofile : " + request.getParameter("ofile"));
		System.out.println("---------- sfile : " + request.getParameter("sfile"));
		String ofile = request.getParameter("ofile");
		String sfile = request.getParameter("sfile");
		FileUtil.downloadFile(request, response, "C:\\Users\\user\\git\\ServletEx\\page\\src\\main\\webapp\\upload", ofile, sfile);
		/*
		 * FileUtil.downloadFile(request, response, "C:/upload", ofile, sfile);
		 */	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
