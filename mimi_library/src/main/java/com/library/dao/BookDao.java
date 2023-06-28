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
	 * 도서 목록 (마이페이지)
	 * @param cr
	 * @param userId
	 * @return
	 */
	public List<Book> getListMyPage(Criteria cr, String userId){
		List<Book> list = new ArrayList<Book>();
		
		String sql = "SELECT * FROM ("
				+ " SELECT ROWNUM rn, lib.* FROM ("
				+ " SELECT idx, title, writer, publisher, d.대여번호, d.대여여부,"
				+ " TO_DATE(to_char(반납가능일, 'yy/mm/dd'), 'YY/MM/DD') - TRUNC(SYSDATE) AS 잔여일,"
				+ " to_char(대여일, 'yy-mm-dd') 대여일, to_char(반납가능일, 'yy-mm-dd') 반납가능일, to_char(반납일, 'yy-mm-dd') 반납일"
				+ " FROM libboard b, 대여 d"
				+ " WHERE b.idx = d.도서번호";
		if(cr.getsWord() != null && !"".equals(cr.getsWord())){
			sql += " AND " + cr.getsField()	+ " LIKE '%" + cr.getsWord() + "%'";
		}
		if(userId != null && !"".equals(userId)) {
			sql += " AND '"+ userId +"' = d.아이디 ";
				// + " AND d.대여여부 = 'Y' ";
		}
			sql += " ORDER BY idx DESC ) lib ) WHERE rn BETWEEN "
					+ cr.getStartNo() + " AND " + cr.getEndNo();
	
		try (Connection conn = DBConnectionPool.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)){
			while(rs.next()) {
				Book book = new Book();
				book.setNo(rs.getInt("idx"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRent_yn(rs.getString("대여여부"));
				book.setRent_date(rs.getString("대여일"));
				book.setReturn_exp_date(rs.getString("반납가능일"));
				book.setReturn_date(rs.getString("반납일"));
				book.setRent_no(rs.getString("대여번호"));
				book.setRest_date(rs.getInt("잔여일"));
				
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
	public Book getView(String num) {
		Book book = new Book();
		String sql = "SELECT b.idx, b.title, d.대여여부, b.writer, d.아이디, b.publisher, "
				+ " to_char(대여일, 'yy/mm/dd') 대여일, to_char(반납가능일, 'yy/mm/dd') 반납가능일,"
				+ " 반납일, sfile, ofile, d.대여번호 FROM libBoard b, 대여 d"
				+ " WHERE b.rent_no = d.대여번호(+) and b.idx="+num;
		// 여기서 d.대여번호(+)라고 기입하는 이유는 상세보기 시에 대여 여부에 상관없이 libboard 테이블의 모든 책을 다 상세로 보고싶기때문임 ~
		try (Connection conn = DBConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				book.setNo(rs.getInt("idx"));
				book.setId(rs.getString("아이디"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRent_yn(rs.getString("대여여부"));
				book.setOfile(rs.getString("ofile"));
				book.setSfile(rs.getString("sfile"));
				book.setRent_no(rs.getString("대여번호"));
				book.setRent_date(rs.getString("대여일"));
				book.setReturn_exp_date(rs.getString("반납가능일"));
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
							("insert into libboard (idx, title, writer, publisher, ofile, sfile)"
									+ " values (SEQ_libboard_idx.NEXTVAL, '%s', '%s', '%s', '%s', '%s')"
										, book.getTitle(), book.getAuthor(), book.getPublisher(), book.getOfile(), book.getSfile());
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
	

	public String getRentYN(String delNoStr) {
		String rentYN = "";
		String sql = 
				String.format(
					"SELECT rent_yn FROM libBoard WHERE idx in (%s)", delNoStr);
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
	
	/**
	 * 게시글 총 개수 카운트 (마이페이지)
	 * @param cr
	 * @return
	 */
	public int getTotalCntMyPage(Criteria cr, String userId) {
		int res = 0;
		String sql = "SELECT COUNT(*) FROM ("
				+ " SELECT ROWNUM rn, lib.* FROM ("
				+ " SELECT idx, title, writer, publisher, rent_yn FROM libboard b, 대여 d"
				+ " WHERE b.idx = d.도서번호";
		if(cr.getsWord() != null && !"".equals(cr.getsWord())){
			sql += " AND " + cr.getsField()	+ " LIKE '%" + cr.getsWord() + "%'";
		}
		if(userId != null && !"".equals(userId)) {
			sql += " AND '"+ userId +"' = d.아이디 ";
				//+ " AND d.대여여부 = 'Y' ";
		}
			sql += " ORDER BY idx DESC ) lib ) WHERE rn BETWEEN "
					+ cr.getStartNo() + " AND " + cr.getEndNo();
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

	/**
	 * 도서 대출 
	 * @param book
	 * @return
	 */
	public int rentBook(Book book, String delNo) {
		int res = 0;
		
		// 1. rent 테이블에서 대여번호 셀렉트 (R00001)
		// 2. book 테이블에서 대여여부 업데이트 (rent_yn= Y, rent_no= 대여번호)
		// 		조건 : 도서번호, rent_no가 null또는 빈 문자열
		// 3. rent 테이블에 인서트 (모든 값 입력, *반납일은 null로 입력, 대여여부는 Y) 반납할 때 대여여부를 N으로 업데이트
		
		String[] numbers = delNo.split(",");
        
		
        // 배열의 값을 반복문으로 사용합니다.
        for (int i = 0; i < numbers.length; i++) {
        	int value = Integer.parseInt(numbers[i].trim());
        	
		String sql1 = "select 'R'||lpad(seq_대여.nextval,5,0) from dual";
		String sql2 = "update libboard set rent_no = ?, rent_yn = 'Y' "
				+ " where idx = ? and (rent_no is null or rent_no = '')";
		String sql3 = "insert into 대여 values"
				+ " ( ?, ?, ?, 'Y', sysdate, null, sysdate+14, null)";
		try (	Connection conn = DBConnectionPool.getConnection();
				) {
			conn.setAutoCommit(false); // 자동 커밋되지않도록 설정.
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			ResultSet rs = pstmt.executeQuery();
			if(!rs.next()) {
				return res; // rs가 없으면 여기서 작업 중단되도록.
			}
			
			String rent_no = rs.getString(1);
			System.out.println("------------ sql1 : " + sql1);
			System.out.println("------------ sql1 rent_no : " + rent_no);
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, rent_no);
			pstmt.setInt(2, value);
			// pstmt.setInt(2, book.getNo());
			res = pstmt.executeUpdate();
			System.out.println("------------ sql2 rent_no : " + rent_no);
			System.out.println("------------ sql2 res : " + res);
			
			if(res>0) {
				pstmt.close();
				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, rent_no);
				pstmt.setString(2, book.getId());
				pstmt.setInt(3, value);
				
				res = pstmt.executeUpdate();
				System.out.println("------------ sql3 rent_no : " + rent_no);
				System.out.println("------------ sql3 res : " + res);
				
				if(res > 0) {
					conn.commit();
				} else {
					conn.rollback();
				}
			} else {
				conn.rollback();
			}
		 
			
		} catch (SQLException e) {
			System.out.println("---------- 도서 대출 실패 ! BookDao rentBook 확인");
			e.printStackTrace();
		}
		
        }
        
		return res;
	}

	
	/**
	 * 도서 반납
	 * @param book
	 * @return
	 */
	public int returnBook(Book book, String delNo) {
		int res = 0;
		String[] numbers = delNo.split(",");
        for (int i = 0; i < numbers.length; i++) {
        	int value = Integer.parseInt(numbers[i].trim());
			String sql1 = "select d.대여번호 from libBoard b, 대여 d "
					+ "WHERE b.idx(+) = d.도서번호 and b.idx = "+value;
			String sql2 = "update libboard set rent_yn = 'N', rent_no = '' where rent_no = ? and rent_no is not null ";
			String sql3 = "update 대여 set 대여여부 = 'N', 반납일 = sysdate "
					+ "where 대여번호 = ?";
			try (	Connection conn = DBConnectionPool.getConnection();
					) {
				conn.setAutoCommit(false); // 자동 커밋되지않도록 설정.
				PreparedStatement pstmt = conn.prepareStatement(sql1);
				ResultSet rs = pstmt.executeQuery();
				if(!rs.next()) {
					return res; // rs가 없으면 여기서 작업 중단되도록.
				}
				
				String rent_no = rs.getString(1);
				System.out.println("------------ sql1 : " + sql1);
				pstmt.close();
				
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, rent_no);
				res = pstmt.executeUpdate();
				System.out.println("------------ sql2 : " + sql2);
				System.out.println("------------ sql2 res : " + res);
				
				if(res>0) {
					pstmt.close();
					pstmt = conn.prepareStatement(sql3);
					pstmt.setString(1, rent_no);
					
					res = pstmt.executeUpdate();
					System.out.println("------------ sql3 : " + sql3);
					System.out.println("------------ sql3 res : " + res);
					
					if(res > 0) {
						conn.commit();
					} else {
						conn.rollback();
					}
				} else {
					conn.rollback();
				}
				
			} catch (SQLException e) {
				System.out.println("---------- 도서 반납 실패 ! BookDao returnBook 확인");
				e.printStackTrace();
			}
        }
		return res;
	}

	public int updateBook(Book book) {
		int res = 0;
		System.out.println("------------ Dao update book : " + book);
		
		String sql = "update libboard set title = ?, writer = ?, publisher = ?, ofile = ?, sfile = ? where idx = ?";

		try (Connection conn = DBConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
			pstmt.setString(1, book.getTitle());
			pstmt.setString(2, book.getAuthor());
			pstmt.setString(3, book.getPublisher());
			pstmt.setString(4, book.getOfile());
			pstmt.setString(5, book.getSfile());
			pstmt.setInt(6, book.getNo());
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("------------ Dao update sql : " + sql);
		System.out.println("------------ Dao update book.getNo() : " + book.getNo());
		System.out.println("------------ Dao update res : " + res);
		return res;
	}

}























