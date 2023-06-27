package com.library.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.library.dao.BookDao;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.library.vo.PageDto;

public class BookService {
	BookDao dao = new BookDao();
	
	/**
	 * 책 리스트를 조회 합니다.
	 * @return
	 */
	public Map<String, Object> getList(Criteria cr){
		Map<String, Object> map = new HashMap<>();
		
		// 리스트 조회
		List<Book> list = dao.getList(cr);
		
		// 총 갯수 조회
		int totalCnt = dao.getTotalCnt(cr);
		System.out.println(" ---------- totalCnt : " + totalCnt);

		// 페이지 객체 (pageDto)
		PageDto pDto = new PageDto(totalCnt, cr);
		
		map.put("list", list);
		map.put("totalCnt", totalCnt);
		map.put("pDto", pDto);
		
		return map;
	}
	
	public Book getView() {
		Book book = dao.getView();
		return book;
	}

	/**
	 * 도서 정보 입력
	 */
	public int insert(String title, String author, String publisher) {
		Book book = new Book();
		book.setTitle(title);
		book.setAuthor(author);
		book.setPublisher(publisher);
		
		System.out.println("------------ Service title : " + title);
		System.out.println("------------ Service author : " + author);
		
		int res = dao.insert(book);
		
		System.out.println("------------ Service res : " + res);
		return res;
	}

	public int delete(String noStr) { 
		System.out.println("------------ Service noStr : " + noStr);
		int res = dao.delete(noStr);
		return res;
	}

	public String rentBook(String delNoStr) {
		// 대여가능한 도서인지 확인
		String rentYN = dao.getRentYN(delNoStr);
		if("Y".equals(rentYN)) {
			System.err.println("이미 대여중인 도서 입니다.");
		} else if ("".equals(rentYN)) {
			System.err.println("없는 도서 번호 입니다.");
		}
		System.out.println("------------ rentBook bookNo : " + delNoStr);
		System.out.println("------------ rentBook rentYN : " + rentYN);
		
		// 대여처리
		int res = dao.update(delNoStr, "Y");
		
		if(res>0) {
			System.out.println(delNoStr + " 번 도서 대여 완료 (" + res + "건 처리)");
		} else {
			System.out.println("대여중 오류가 발생 하였습니다.");
			System.out.println("관리자에게 문의 해주세요");
		}
		return rentYN;
	}
/*
	public void returnBook(int bookNo) {
		// 반납가능한 도서인지 확인
		String rentYN = dao.getRentYN(bookNo);
		if("N".equals(rentYN)) {
			System.err.println("반납 가능한 상태가 아닙니다.");
		} else if ("".equals(rentYN)) {
			System.out.println("없는 도서 번호 입니다.");
		}
		
		// 반납처리
		int res = dao.update(bookNo, "N");
		
		if(res>0) {
			System.out.println(res + "건 반납 되었습니다.");
		}else {
			System.out.println("반납 처리 중 오류가 발생 하였습니다.");
			System.out.println("관리자에게 문의 해주세요");
		}
	}
*/
	
}













