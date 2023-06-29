package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.common.FileUtil;
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
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		// ==================== 도서 목록 조회 ====================
		if(uri.indexOf("list")>0) {
			String sField = request.getParameter("searchField");
			String sWord = request.getParameter("searchWord");
			String pageNo = request.getParameter("pageNo");
			String sAmount = request.getParameter("searchAmount");
			
			Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
			request.setAttribute("map", bs.getList(cr));
			
			request.setAttribute("pageNo", cr.getPageNo());
			request.setAttribute("sAmount", cr.getAmount());
			
			System.out.println("pageNo : " + pageNo);
			System.out.println("sAmount : " + sAmount);
			
			request.getRequestDispatcher("./list.jsp").forward(request, response);
		} 
		
		
		// ==================== 마이페이지 조회 ====================
		else if(uri.indexOf("mypage")>0) {
			String sField = request.getParameter("searchField");
			String sWord = request.getParameter("searchWord");
			String pageNo = request.getParameter("pageNo");
			String sAmount = request.getParameter("searchAmount");
			
			Criteria cr = new Criteria(sField, sWord, pageNo, sAmount);
			request.setAttribute("map", bs.getListMyPage(cr, userId));
			request.setAttribute("pageNo", cr.getPageNo());
			request.setAttribute("sAmount", cr.getAmount());
			
			request.setAttribute("basket", bs.getBasketBook(cr, userId));
			
			
			System.out.println("----------- BookController 진입 / mypage");
			
			String delNo = request.getParameter("delNo");
			System.out.println("----------- BookController delNo : " + delNo);
			
			if(session.getAttribute("userId") == null) {
				JSPFunction.alertBack("로그인 후 이용 가능", response);
			}
			
			if(delNo != null && !"".equals(delNo)) {
				Book book = new Book();
				book.setId(userId);
							
				int res = bs.basketBook(book, delNo);
				if(res>0) {
					System.out.println(res+"건 책 바구니에 추가되었습니다.");
					
					JSPFunction.alertLocation("책 바구니에 추가 성공 ~ ", "./list.book", response);
					
				} else {
					System.err.println("책 바구니에 추가 중 오류가 발생 하였습니다.");
				}
			}
			
			request.getRequestDispatcher("./mypage.jsp").forward(request, response);
		} 
		
		// ==================== 도서 삭제 수행 ====================
		else if(uri.indexOf("delete")>0) {
			String delNo = request.getParameter("delNo");
			
			System.out.println("----------- BookController 진입 / delete");
			System.out.println("----------- BookController delNo : " + delNo);
			
			int res = bs.delete(delNo);
			if(res>0) {
				System.out.println(res+"건 삭제되었습니다.");
				request.setAttribute("message", "00건 삭제 성공 ! ");
				// TODO 메세지 처리 ! JSPFunction.alertLocation("", "", response);

			} else {
				System.err.println("삭제중 오류가 발생 하였습니다.");
				System.err.println("관리자에게 문의 해주세요");
				request.setAttribute("message", "오류눈 온젠나 ㅍ슬퍼 ! "); 
				// TODO 삭제 후 화면 새로고침할 때마다 나오니까 수정이 좀 필요..
			}
			
			request.getRequestDispatcher("./list.book").forward(request, response);
		}
		
		// ==================== 도서 대출 수행 ====================
		else if(uri.indexOf("rent")>0) {
			String delNo = request.getParameter("delNo");
			
			System.out.println("----------- BookController 진입 / rent");
			System.out.println("----------- BookController delNo : " + delNo);
			
			if(session.getAttribute("userId") == null) {
				JSPFunction.alertBack("로그인 후 이용 가능", response);
				// TODO 로그인 페이지로 이동할 수도 있음
			}
			
			Book book = new Book();
			book.setId(userId);
						
			int res = bs.rentBook(book, delNo);
			if(res>0) {
				System.out.println(res+"건 대출 되었습니다.");
				JSPFunction.alertLocation("여러건 대출 성공 ~ ", "./list.book", response);
				
			} else {
				System.err.println("대출 중 오류가 발생 하였습니다.");
				// TODO 삭제 후 화면 새로고침할 때마다 나오니까 수정이 좀 필요..
			}
		}
		
		// ==================== 도서 반납 수행 ====================
		else if(uri.indexOf("return")>0) {
			String delNo = request.getParameter("delNo");
			
			System.out.println("----------- BookController 진입 / return");
			System.out.println("----------- BookController delNo : " + delNo);
			
			if(userId == null) {
				JSPFunction.alertBack("로그인 후 이용 가능", response);
				// TODO 로그인 페이지로 이동할 수도 있음
			}
			
			Book book = new Book();
			book.setId(userId);
			
			int res = bs.returnBook(book, delNo);
			if(res>0) {
				System.out.println(res+"건 대출 되었습니다.");
				JSPFunction.alertLocation("여러건 반납 성공 ~ ", "./mypage.book", response);
				
			} else {
				System.err.println("반납 중 오류가 발생 하였습니다.");
			}
		}
		
		// ==================== 도서 상세 조회 ====================
		else if(uri.indexOf("view")>0) {
			System.out.println("----------- BookController 진입 / view");
			request.setAttribute("book", bs.getView(request.getParameter("idx")));
			request.getRequestDispatcher("./view.jsp").forward(request, response);
		
		} 
				
		// ==================== 도서 등록 페이지로 포워드 ====================
		else if(uri.indexOf("insert")>0) {
			System.out.println("----------- BookController 진입 / insert");
			request.getRequestDispatcher("./write.jsp").forward(request, response);
		}
		
		// ==================== 도서 수정 수행 ====================
		else if(uri.indexOf("edit")>0) {	
			System.out.println("----------- doGet BookController 진입 / edit");
			request.setAttribute("book", bs.getView(request.getParameter("idx")));
			request.getRequestDispatcher("./edit.jsp").forward(request, response);
		}
		
		else {
			JSPFunction.alertBack("url을 확인 부탁 ~", response);
		}
		
		System.out.println("----------- BookController 끝");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		System.out.println("***** doPost 요청 uri : " + uri);
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		// ==================== 도서 등록 수행 ====================
		// doGet(request, response); 
		// -> doPost에서 doGet을 실행시킬거면 post 방식으로 받아올것들을 get 메소드에서 작성해도 된다. 
		
		if(uri.indexOf("insert")>0) {			
		System.out.println("----------- BookController 진입 / insert");
		
		Book book = new Book();
		
		String saveDirectory = "C:/upload";
		saveDirectory = "C:\\Users\\user\\git\\ServletEx\\mimi_library\\src\\main\\webapp\\images\\bookimg";
		
		MultipartRequest mr = 
				FileUtil.uploadFile(request, saveDirectory, 1024 * 1000);
		String ofile = mr.getFilesystemName("book_img");
		
		if(ofile != null && !"".equals(ofile)) {
			
			String sfile = FileUtil.fileNameChange(saveDirectory, ofile);
			
			// TODO 아래 
			// 파일 업로드 실패
			// JSPFunction.alertBack("❌ 파일 업로드 실패 ❌", response);
			// return;
			
			book.setOfile(ofile);
			book.setSfile(sfile);
		
			String title = mr.getParameter("title"); 
			String author = mr.getParameter("author"); 
			String publisher = mr.getParameter("publisher");
			
			book.setTitle(title); 
			book.setAuthor(author); 
			book.setPublisher(publisher);
			
		  int res = bs.insert(book); 
		  if(res > 0) { 
			  System.out.println(res + "건 입력 되었습니다.");
			  JSPFunction.alertLocation("📘 도서 등록 완료 📘", "./list.book", response); 
			  } else { 
				  JSPFunction.alertBack("슬프게도 등록에 실패했어..", response);
				  System.err.println("입력중 오류가 발생 하였습니다.");
				  System.err.println("관리자에게 문의 해주세요"); 
			  	}
			} 
		
		}
		
		// ==================== 도서 수정 수행 ====================
		if(uri.indexOf("edit")>0) {			
			System.out.println("----------- doPost BookController 진입 / edit");
			
			Book book = new Book();
			
			String saveDirectory = "C:/upload";
			saveDirectory = "C:\\Users\\user\\git\\ServletEx\\mimi_library\\src\\main\\webapp\\images\\bookimg";
			
			MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, 1024 * 1000);
			String ofile = mr.getFilesystemName("book_img");
			
			if(ofile != null && !"".equals(ofile)) {
				
				String sfile = FileUtil.fileNameChange(saveDirectory, ofile);
				
				book.setOfile(ofile);
				book.setSfile(sfile);
			} 
			
			String idx = mr.getParameter("no");
			
			book.setTitle(mr.getParameter("title")); 
			book.setAuthor(mr.getParameter("author")); 
			book.setPublisher(mr.getParameter("publisher"));
			book.setNo(Integer.parseInt(idx));
			
			  int res = bs.updateBook(book); 
			  if(res > 0) { 
				  System.out.println(res + "건 입력 되었습니다.");
				  JSPFunction.alertLocation("📘 도서 수정 완료 📘", "./view.book?idx="+idx, response); 
			  } else { 
				  JSPFunction.alertBack("슬프게도 수정에 실패했어..", response);
				  System.err.println("수정중 오류가 발생 하였습니다.");
			  	}
			
			}
		
		// ==================== 도서 대출 수행 ====================
		else if(uri.indexOf("rent")>0) {
			System.out.println("----------- BookController 진입 / rent");
			
			if(session.getAttribute("userId") == null) {
				JSPFunction.alertBack("로그인 후 이용 가능", response);
				// TODO 로그인 페이지로 이동할 수도 있음
			}
			int no = Integer.parseInt(request.getParameter("no"));
			
			Book book = new Book();
			book.setNo(no);
			book.setId(userId);
			
			int rs = bs.rentBook(book, request.getParameter("no"));
			if(rs > 0) {
				JSPFunction.alertLocation("📘 도서 대출 완료 📘", "./view.book?idx="+book.getNo(), response); 
				System.err.println("대출 성공 !");
			} else {
				JSPFunction.alertBack("슬프게도 대출에 실패했어..", response);
				System.err.println("대출중 오류 발생 !");
			}
			
		} 
		// ==================== 도서 반납 수행 ====================
		else if(uri.indexOf("return")>0) {
			System.out.println("----------- BookController 진입 / return");
			
			if(session.getAttribute("userId") == null) {
				JSPFunction.alertBack("로그인 후 이용 가능", response);
				// TODO 로그인 페이지로 이동할 수도 있음
			}
			int no = Integer.parseInt(request.getParameter("no"));
			
			Book book = new Book();
			book.setNo(no);
			book.setId(userId);
			
			int rs = bs.returnBook(book, request.getParameter("no"));
			if(rs > 0) {
				JSPFunction.alertLocation("📘 도서 반납 완료 📘", "./view.book?idx="+book.getNo(), response); 
				System.err.println("반납 성공 !");
			} else {
				JSPFunction.alertBack("슬프게도 반납에 실패했어..", response);
				System.err.println("반납중 오류 발생 !");
			}
			
		}
		
		
		
	}

}
