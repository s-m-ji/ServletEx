package mimi.libBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtill;
import dto.Criteria;

public class BookDao {

	// 게시글 목록 조회 - 페이징 처리 (o)
		public List<BookDto> getBoardList(Criteria cr){
			List<BookDto> list = new ArrayList<BookDto>();
			
			String qry = "SELECT * FROM (" 
					+ " SELECT ROWNUM rn, t.* FROM (" 
					+ " SELECT idx, title, writer, publisher, rent_yn, rent_date, return_date, return_exp_date, rent_count "
					+ " FROM libBoard";
				if (cr.getsWord() != null && !"".equals(cr.getsWord())) {
					qry += " WHERE " + cr.getsField() + " LIKE '%" + cr.getsWord() + "%'";
				}
				qry += " ORDER BY idx DESC )"
					+ " t )"
					+ " WHERE rn BETWEEN " 
					+ cr.getStartNo() + " AND " + cr.getEndNo();
				
				System.out.println("----------- qry : " + qry);
				
			try (	Connection con = ConnectionUtill.getConnection();
					PreparedStatement pstmt = con.prepareStatement(qry);
					ResultSet rs = pstmt.executeQuery();
					) {
				while(rs.next()) {
					// BookDto dto = new BookDto(idx, title, writer, publisher, rent_yn, rent_date, returb_date, return_exp_date, 0);
					BookDto dto = new BookDto( rs.getString("idx"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
							rs.getString("rent_yn"), rs.getString("rent_date"), rs.getString("returb_date"), rs.getString("returb_date"),
							rs.getInt("rent_count"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				System.err.println("========== libBoard 목록 조회하던 중 예외 발생 🤦‍♀️");
				e.printStackTrace();
			}
			
			return list;
		}
		
		
		// 게시글 상세 조회
		public BookDto getBoardView(String idx){
			BookDto dto = null;
			if(idx == null || "".equals(idx)) {
				return null;
			}
			
			String qry = "SELECT * FROM libBoard WHERE idx = ? ";
			
			try (	Connection con = ConnectionUtill.getConnection();
					PreparedStatement pstmt = con.prepareStatement(qry);
					) {
				pstmt.setString(1, idx);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new BookDto( rs.getString("idx"), rs.getString("title"), rs.getString("writer"), rs.getString("publisher"),
							rs.getString("rent_yn"), rs.getString("rent_date"), rs.getString("returb_date"), rs.getString("returb_date"),
							rs.getInt("rent_count"));
				}
				
			} catch (SQLException e) {
				System.err.println("========== libBoard 상세 조회하던 중 예외 발생 🤦‍♀️");
				e.printStackTrace();
			}
			
			return dto;
		}

}
