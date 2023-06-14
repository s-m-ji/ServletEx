package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.ConnectionUtill;
import common.DBConnectionPool;
import dto.Table;

/**
 * 
 * @author sm-ji
 *
 */
public class TableDao2 {		

	public TableDao2() {
	}
	
	/**
	 * 게시글 목록 조회
	 * @param sField 제목 조건
	 * @param sWord 내용 조건
	 * @return List<Table>
	 */
	public List<Table> getList(String sField, String sWord) {
		List<Table> list = new ArrayList<Table>();
		
		String sql = "select * from board ";
			if(sWord != null && !"".equals(sWord)) {
				sql += "where "	+ sField + " like '%" + sWord + "%' ";
			}
				sql += "order by num desc";
		
		try (	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
			) {
			while(rs.next()) {
				
				Table table = new Table();
				
				table.setNum(rs.getString("num"));
				table.setTitle(rs.getString("title"));
				table.setContent(rs.getString("content"));
				table.setId(rs.getString("id"));
				table.setPostdate(rs.getString("postdate"));
				table.setVisitcount(rs.getString("visitcount"));
				
				list.add(table);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 
	 * @param sField
	 * @param sWord
	 * @return int 게시글 총 수 
	 */
	public int getTotalCnt(String sField, String sWord) {
		int totalCnt = 0;
		String sql = "select count(*) from board ";
			if(sWord != null && !"".equals(sWord)) {
				sql += "where "	+ sField + " like '%" + sWord + "%' ";
			}
				sql += "order by num desc";
		
		try (	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
			) {
			while(rs.next()) {
				totalCnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("⚠총 게시물의 수를 조회하던 중 예외 발생⚠");
			e.printStackTrace();
		}
		
		return totalCnt;
	}
	
	/**
	 * 게시글 등록
	 * @param table
	 * @return int 등록처리된 건 수
	 */
	public int insert(Table table) {
		int res = 0;
		
		String sql = "insert into board values(seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
		
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			
			pstmt.setString(1, table.getTitle());
			pstmt.setString(2, table.getContent());
			pstmt.setString(3, table.getId());
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	/**
	 * 게시글 상세보기 (번호 입력받아서 조회)
	 * @param num
	 * @return
	 */
	public Table selectOne(String num) {
		// null 오류 발생 방지하고자 먼저 이렇게 table 객체를 생성함
		Table table = null;
		
		if(num == null || "".equals(num)) {
			return null;
		}
		
		String sql = "select * from board where num=? order by num desc";
	
	try (	Connection con = DBConnectionPool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
		pstmt.setString(1, num);
		ResultSet rs = pstmt.executeQuery();

		// 1건의 게시글을 조회해서 board 객체에 담아준다.
		if(rs.next()) {
			table = new Table();
			/* rs.getString("num"); */
			table.setNum(rs.getString(1));
			table.setTitle(rs.getString("title"));
			table.setContent(rs.getString("content"));
			table.setId(rs.getString("id"));
			table.setPostdate(rs.getString("postdate"));
			table.setVisitcount(rs.getString("visitcount"));
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return table;
	}
	
	
	/**
	 * 게시글 조회수를 1 증가
	 * @param num 게시물 일련번호
	 * @return 업데이트 된 건수
	 */
	public int updateVstCnt(String num) {
		int res = 0;
		
		String sql = "update board set visitcount =  visitcount+1 where num = ?";
		try (	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			
			pstmt.setString(1, num);
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	/**
	 * 페이징 처리
	 * @param sField
	 * @param sWord
	 * @return
	 */
	public List<Table> getListPage(String sField, String sWord, int currentPage, int pageSize) {
	    List<Table> list = new ArrayList<Table>();
	    int totalCount = 0;
	    int totalPage = 0;
	    
	    // 게시글 총 개수 조회
	    String countSql = "SELECT COUNT(*) AS total FROM board";
	    try (Connection con = DBConnectionPool.getConnection();
	         PreparedStatement countStmt = con.prepareStatement(countSql);
	         ResultSet countRs = countStmt.executeQuery();
	    ) {
	        if (countRs.next()) {
	            totalCount = countRs.getInt("total");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    // 전체 페이지 수 계산
	    if (totalCount > 0) {
	        totalPage = (int) Math.ceil((double) totalCount / pageSize);
	    }
	    
	    // 현재 페이지의 게시글 조회
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    
	    String sql = "SELECT * FROM (SELECT Tb.*, rownum rNum FROM (SELECT * FROM board ";
	    if (sWord != null && !"".equals(sWord)) {
	        sql += "WHERE " + sField + " LIKE '%" + sWord + "%' ";
	    }
	    sql += "ORDER BY num DESC) Tb) WHERE rNum BETWEEN ? AND ?";
	    
	    try (Connection con = DBConnectionPool.getConnection();
	         PreparedStatement pstmt = con.prepareStatement(sql);
	    ) {
	        pstmt.setInt(1, startRow);
	        pstmt.setInt(2, endRow);
	        
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Table table = new Table();
	            table.setNum(rs.getString("num"));
	            table.setTitle(rs.getString("title"));
	            table.setContent(rs.getString("content"));
	            table.setId(rs.getString("id"));
	            table.setPostdate(rs.getString("postdate"));
	            table.setVisitcount(rs.getString("visitcount"));
	            
	            list.add(table);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    // 이전, 다음, 페이지별 숫자 버튼 생성 등의 로직 구현
	    
	    return list;
	}

}




















