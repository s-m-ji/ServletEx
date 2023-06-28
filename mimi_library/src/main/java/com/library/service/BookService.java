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
	
	public Map<String, Object> getListMyPage(Criteria cr, String userId){
		Map<String, Object> map = new HashMap<>();
		
		// 리스트 조회
		List<Book> list = dao.getListMyPage(cr, userId);
		
		// 총 갯수 조회
		int totalCnt = dao.getTotalCntMyPage(cr, userId);
		System.out.println(" ---------- totalCnt : " + totalCnt);
		
		// 페이지 객체 (pageDto)
		PageDto pDto = new PageDto(totalCnt, cr);
		
		map.put("list", list);
		map.put("totalCnt", totalCnt);
		map.put("pDto", pDto);
		
		return map;
	}
	
	/**
	 * 도서 상세 조회
	 * @param num
	 * @return
	 */
	public Book getView(String num) {
		Book book = dao.getView(num);
		return book;
	}

	/**
	 * 도서 등록
	 */
	public int insert(Book book) {
		int res = dao.insert(book);
		
		System.out.println("------------ Service res : " + res);
		return res;
	}

	/**
	 * 도서 삭제
	 * @param noStr
	 * @return
	 */
	public int delete(String noStr) { 
		System.out.println("------------ Service noStr : " + noStr);
		int res = dao.delete(noStr);
		return res;
	}

	/**
	 * 도서 대출
	 * @param book
	 * @param delNo
	 * @return
	 */
	public int rentBook(Book book, String delNo) {
		int res = dao.rentBook(book, delNo);
		
		if(res>0) {
			System.out.println(book.getNo() + " 번 도서 대여 완료 (" + res + "건 처리)");
		} else {
			System.err.println("대여중 오류가 발생 하였습니다.");
		}
		return res;
	}


	/**
	 * 도서 반납
	 * @param book
	 * @param delNo
	 * @return
	 */
	public int returnBook(Book book, String delNo) {
		int res = dao.returnBook(book, delNo);
		
		if(res>0) {
			System.out.println(book.getNo() + " 번 도서 반납 완료 (" + res + "건 처리)");
		} else {
			System.err.println("반납중 오류가 발생 하였습니다.");
		}
		return res;
	}

	/**
	 * 도서 수정
	 * @param book
	 * @return
	 */
	public int updateBook(Book book) {
		int res = dao.updateBook(book);
		System.out.println("------------ Service res : " + res);
		return res;
	}
	
}













