package com.library.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.common.JSPFunction;
import com.library.service.BookService;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("*.book")
public class BookController extends HttpServlet {

	BookService bs = new BookService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		System.out.println("***** doGet 요청 uri : " + uri);
		
		// ========== 도서 목록 조회 ==========
		// ========== 도서 목록 조회 ==========
		if(uri.indexOf("list")>0) {
			String sField = request.getParameter("searchField");
			String sWord = request.getParameter("searchWord");
			String pageNo = request.getParameter("pageNo");
			String sAmount = request.getParameter("searchAmount");
			
			Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
			request.setAttribute("map", bs.getList(cr));
			
			//ipageNo == null? pageNo = 1 : Integer.parseInt(pageNo)); TODO 널일 경우 처리를 여기서 다시 해보기
			request.setAttribute("pageNo", cr.getEndNo());
			request.setAttribute("sAmount", cr.getAmount());
			
			System.out.println("pageNo : " + pageNo);
			System.out.println("sAmount : " + sAmount);
			
			request.getRequestDispatcher("./list.jsp").forward(request, response);
		} 
		
		// ========== 도서 삭제 수행 ==========
		else if(uri.indexOf("delete")>0) {
			String delNo = request.getParameter("delNo");
			
			System.out.println("----------- BookController 진입 / delete");
			System.out.println("----------- BookController delNo : " + delNo);
			
			int res = bs.delete(delNo);
			if(res>0) {
				System.out.println(res+"건 삭제되었습니다.");
				request.setAttribute("message", "00건 삭제 성공 ! ");

			} else {
				System.err.println("삭제중 오류가 발생 하였습니다.");
				System.err.println("관리자에게 문의 해주세요");
				request.setAttribute("message", "오류눈 온젠나 ㅍ슬퍼 ! "); 
				// TODO 삭제 후 화면 새로고침할 때마다 나오니까 수정이 좀 필요..
			}
			
			request.getRequestDispatcher("./list.book").forward(request, response);
		}
		
		// ========== 도서 상세 조회 ==========
		else if(uri.indexOf("view")>0) {
			System.out.println("----------- BookController 진입 / view");
			request.setAttribute("book", bs.getView());
			request.getRequestDispatcher("./view.jsp").forward(request, response);
		
		} 
		
		// ========== 도서 대출 수행 ==========
		else if(uri.indexOf("rent")>0) {
			System.out.println("----------- BookController 진입 / rent");
			String delNo = request.getParameter("delNo");
			request.setAttribute("book", bs.rentBook(delNo));
			request.getRequestDispatcher("./list.book").forward(request, response);
			
		} 
		
		// ========== 도서 등록 수행 ==========
		else if(uri.indexOf("insert")>0) {
			System.out.println("----------- BookController 진입 / insert");
			request.getRequestDispatcher("./write.jsp").forward(request, response);
		}
		
		System.out.println("----------- BookController 끝");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		String uri = request.getRequestURI();
		
		System.out.println("***** doPost 요청 uri : " + uri);
		if(uri.indexOf("insert")>0) {			
		System.out.println("----------- BookController 진입 / insert");
		
		String saveDirectory = "C:/upload";
		saveDirectory = "C:\\Users\\user\\git\\ServletEx\\page\\src\\main\\webapp\\upload";
		MultipartRequest mr = com.library.common.FileUtil.uploadFile(request, saveDirectory, 1024 * 1000);
		if(mr == null) {
			// 파일 업로드 실패
			JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", response);
			return;
		}
		
		// 파일 업로드 외 form 값을 dto에 저장
		Book book = new Book();
		
		String title = mr.getParameter("title");
		String author = mr.getParameter("author");
		String publisher = mr.getParameter("publisher");
		
		System.out.println("----------- BookController title : " + title);
		System.out.println("----------- BookController author : " + author);
		System.out.println("----------- BookController publisher : " + publisher);
		
		book.setTitle(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		
		// 원래 첨부파일(이름+확장자)
		String ofileName = mr.getFilesystemName("file");
		if(ofileName != null) {
			// 첨부파일의 이름만
			String fileName = ofileName.substring(0, ofileName.lastIndexOf("."));
			
			// 첨부파일의 확장자
			String exp = ofileName.substring(ofileName.lastIndexOf("."));
			
			// H: 0~23시, S: millisecond초
			String date = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			// 수정된 파일
			String nfileName = fileName +"_"+ date + exp;

			/* 파일명 변경 */
			File oldFile = new File(saveDirectory + File.separator + ofileName);
			File newFile = new File(saveDirectory + File.separator + nfileName);
			oldFile.renameTo(newFile);
			
			//book.setOfile(ofileName); // 원본 파일명
			//book.setSfile(nfileName); // 저장된 파일명
		}
		
		
		int res = bs.insert(title, author, publisher);
		// request.setAttribute("book", bs.insert(title, author, publisher));
		if(res > 0) {
			System.out.println(res + "건 입력 되었습니다.");
			JSPFunction.alertLocation("📘 도서 등록 완료 📘", "./list.book", response);
		} else {
			System.err.println("입력중 오류가 발생 하였습니다.");
			System.err.println("관리자에게 문의 해주세요");
		}
		
		}
	}

}
