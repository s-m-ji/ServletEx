package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnectionPool;
import dto.Board;
import dto.Criteria;

public class NewBoardDao {

	public NewBoardDao() {
	}

	public List<Board> getList(Criteria cr) {
		List<Board> list = new ArrayList<Board>();

		String sql = "select num, title, content, id, visitcount," 
				+ ", decode( trunc(sysdate), trunc(postdate)"
				+ ", to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd') ) postdate" 
				+ ", decode( trunc(sysdate), trunc(editdate)"
				+ ", to_char(editdate, 'hh24:mi:ss'), to_char(editdate, 'yyyy-mm-dd') ) editdate" 
				+ " from board";
		if (cr.getsWord() != null && !"".equals(cr.getsWord())) {
			sql += " where " + cr.getsField() + " like '%" + cr.getsWord() + "%'";
		}
		sql += " order by num desc";

		try (Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {

			while (rs.next()) {
				Board b = new Board();

				b.setNum(rs.getInt("num"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setPostdate(rs.getString("postdate"));
				b.setEditdate(rs.getString("editdate"));
				b.setCount(rs.getInt("visitcount"));

				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Board> getListPage(Criteria cr) {
		List<Board> list = new ArrayList<Board>();

		String sql = "select * from ("
					+ " select rownum rn, t.* from ("
					+ " select num, title, content, id, visitcount" 
					+ ", decode( trunc(sysdate), trunc(postdate)"
					+ ", to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd') ) postdate"
					+ ", decode( trunc(sysdate), trunc(editdate)"
					+ ", to_char(editdate, 'hh24:mi:ss'), to_char(editdate, 'yyyy-mm-dd') ) editdate"
					+ " from board";
			if (cr.getsWord() != null && !"".equals(cr.getsWord())) {
				sql += " where " + cr.getsField() + " like '%" + cr.getsWord() + "%'";
			}
				sql += " order by num desc ) t ) where rn between " + cr.getStartNo() + " and " + cr.getEndNo();
		
		try (Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {

			while (rs.next()) {
				Board b = new Board();

				b.setNum(rs.getInt("num"));
				b.setTitle(rs.getString("title"));
				b.setContent(rs.getString("content"));
				b.setId(rs.getString("id"));
				b.setPostdate(rs.getString("postdate"));
				b.setEditdate(rs.getString("editdate"));
				b.setCount(rs.getInt("visitcount"));

				list.add(b);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Board getPostOne(String num) {
		Board b = null;
		if(num == null || "".equals(num)) {
			return null;
		}
		String sql = "select num, title, content, id, visitcount"
				+ ", decode( trunc(sysdate), trunc(postdate)"
				+ ", to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd') ) postdate"
				+ ", decode( trunc(sysdate), trunc(editdate)"
				+ ", to_char(editdate, 'hh24:mi:ss'), to_char(editdate, 'yyyy-mm-dd') ) editdate"
				+ "  from board where num = ? order by num desc";
		
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			pstmt.setString(1, num);
			ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					b = new Board();
					b.setNum(rs.getInt("num"));
					b.setTitle(rs.getString("title"));
					b.setContent(rs.getString("content"));
					b.setId(rs.getString("id"));
					b.setPostdate(rs.getString("postdate"));
					b.setEditdate(rs.getString("editdate"));
					b.setCount(rs.getInt("visitcount"));
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public int insert(Board b) {
		int res = 0;
		
		String sql = "insert into board values (seq_board_num.nextval, ?, ?, ?, sysdate, sysdate, 0)";
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setString(3, b.getId());

			res = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	public void updateVsCnt(String num) {
		String sql = "update board set visitcount = visitcount+1 where num = ?";
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int update(Board b) {
		int res = 0;
		
		String sql = "update board set title = ?, content = ?, editdate = ? where num = ?";
				
		try (	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			
			// TODO String을 Date로 형변환 해야하는데 어찌하압니이까아..
			pstmt.setString(3, b.getEditdate());

			pstmt.setInt(4, b.getNum());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
		    e.printStackTrace();
		    // 또는 다른 예외 처리 로직을 추가할 수 있습니다.
		}
		
		return res;
	}
	
}





















