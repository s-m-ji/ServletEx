package com.library.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.common.ConnectionUtil;
import com.library.common.DBConnectionPool;
import com.library.vo.Book;

public class BookDao {
	/**
	 * 도서목록 조회
	 * @return
	 */
	public List<Book> getList(){
		List<Book> list = new ArrayList<Book>();
		
		String sql = "select * from libboard";
		/* String sql = 
				"select no, title"
				+ "    , nvl((select 대여여부 "
				+ "			 from 대여 "
				+ "			where 도서번호 = no "
				+ "			  and 대여여부='Y'),'N') rentyn "
				+ "    , author "
				+ "from book "
				+ "order by no";
		*/
		
		try (Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String publisher = rs.getString("publisher");
				String rent_yn = rs.getString("rent_yn");
				
				Book book = new Book(idx, title, writer, publisher, rent_yn);
				list.add(book);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 도서상세 조회
	 * @return
	 */
	public Book getView() {
		Book book = new Book();
		String sql = "SELECT * FROM libBoard";
		try (Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			if(rs.next()) {
				book.setNo(rs.getInt("idx"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRentyn(rs.getString("rent_yn"));
				}
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
	
	
	/**
	 * 도서 등록
	 * @param book
	 * @return
	 */
	public int insert(Book book) {
		int res = 0;
		
		String sql = String.format
	("insert into book values (SEQ_BOOK_NO.NEXTVAL, '%s', '%s', '%s')"
				, book.getTitle(), book.getRentyn(), book.getAuthor());

		// 실행될 쿼리를 출력해봅니다
		//System.out.println(sql);
		
		try (Connection conn = ConnectionUtil.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 도서 삭제
	 * @return
	 */
	public int delete(int no) {
		int res = 0;
		
		String sql = String.format
						("delete from book where no = %d", no);
	
		// 실행될 쿼리를 출력해봅니다
		//System.out.println(sql);
		
		try (Connection conn = ConnectionUtil.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	/**
	 * 도서 업데이트
	 * @return
	 */
	public int update(int no, String rentYN) {
		int res = 0;
		
		String sql = String.format
		("update libBoard set rent_yn = '%s' where idx = %d", rentYN ,no);

		try (Connection conn = ConnectionUtil.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public String getRentYN(int bookNo) {
		String rentYN = "";
		String sql = 
				String.format(
					"SELECT rent_yn FROM libBoard WHERE idx = %s", bookNo);
		System.out.println("------------ getRentYN bookNo : " + bookNo);
		try (Connection conn = ConnectionUtil.getConnection();
				Statement stmt= conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);){
			if(rs.next()) {
				rentYN = rs.getString(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("------------ getRentYN rentYN : " + rentYN);
		return rentYN;
	}

}























