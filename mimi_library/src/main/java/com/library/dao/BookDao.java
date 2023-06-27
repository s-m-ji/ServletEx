package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.library.common.DBConnectionPool;
import com.library.vo.Book;
import com.library.vo.Criteria;

public class BookDao {
	/**
	 * 도서목록 조회
	 * @return
	 */
	public List<Book> getList(Criteria cr){
		List<Book> list = new ArrayList<Book>();
		
		String sql = "SELECT * FROM ("
				+ " SELECT ROWNUM rn, lib.* FROM ("
				+ " SELECT idx, title, writer, publisher, rent_yn FROM libboard";
		if(cr.getsWord() != null && !"".equals(cr.getsWord())){
			sql += " WHERE " + cr.getsField()
					+ " LIKE '%" + cr.getsWord() + "%'";
		}
			sql += " ORDER BY idx DESC ) lib ) WHERE rn BETWEEN "
					+ cr.getStartNo() + " AND " + cr.getEndNo();

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
		System.out.println("------------ Dao insert book : " + book);
		
		String sql = String.format
							("insert into libboard (idx, title, writer, publisher)"
									+ " values (SEQ_libboard_idx.NEXTVAL, '%s', '%s', '%s')"
										, book.getTitle(), book.getAuthor(), book.getPublisher());
	/*
	 * ("insert into libboard (idx, title, rent_yn, writer) values (SEQ_libboard_idx.NEXTVAL, '%s', '%s', '%s')"
	 * , book.getTitle(), book.getRentyn(), book.getAuthor());
	 */	
		try (Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("------------ Dao insert sql : " + sql);
		System.out.println("------------ Dao insert res : " + res);
		return res;
	}
	
	/**
	 * 도서 삭제
	 * @return
	 */
	public int delete(String noStr) {
		int res = 0;
		System.out.println("------------Dao delete noStr : " + noStr);
		String sql = String.format
						("delete from libboard where idx in (%s)", noStr);
		
		System.out.println("------------Dao delete sql : " + sql);
		try (Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("------------Dao delete res : " + res);
		return res;
	}
	
	/**
	 * 도서 업데이트
	 * @return
	 */
	public int update(String delNoStr, String rentYN) {
		int res = 0;
		
		String sql = String.format
		("update libBoard set rent_yn = '%s' where idx = %s", rentYN ,delNoStr);

		try (Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();	){
			res = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

	public String getRentYN(String delNoStr) {
		String rentYN = "";
		String sql = 
				String.format(
					"SELECT rent_yn FROM libBoard WHERE idx = %s", delNoStr);
		System.out.println("------------ getRentYN bookNo : " + delNoStr);
		try (Connection conn = DBConnectionPool.getConnection();
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

	/**
	 * 게시글 총 개수 카운트
	 * @param cr
	 * @return
	 */
	public int getTotalCnt(Criteria cr) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM libboard";
		if(cr.getsWord() != null && !"".equals(cr.getsWord())) {
			sql += " WHERE "	+ cr.getsField()
					+ " LIKE '%" + cr.getsWord() + "%'";
		}
		try (	Connection conn = DBConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				) {
			if(rs.next()) {
				res = rs.getInt(1); 
			}
			System.out.println(" ---------- res : " + res);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}

}























