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

	/**
	 * 게시글 목록 조회: 오늘 등록한 게시글은 시간, 이 외는 날짜를 표시
	 * 
	 * @param cr
	 * @return
	 */
	public List<Board> getList(Criteria cr) {
		List<Board> list = new ArrayList<Board>();

		String sql = "select num, title, content, id, visitcount," + ", decode( trunc(sysdate), trunc(postdate)"
				+ ", to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd') ) postdate"
				+ ", decode( trunc(sysdate), trunc(editdate)"
				+ ", to_char(editdate, 'hh24:mi:ss'), to_char(editdate, 'yyyy-mm-dd') ) editdate" + " from board";
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

		String sql = "select * from (" + " select rownum rn, t.* from (" + " select num, title, content, id, visitcount"
				+ ", decode( trunc(sysdate), trunc(postdate)"
				+ ", to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd') ) postdate"
				+ ", decode( trunc(sysdate), trunc(editdate)"
				+ ", to_char(editdate, 'hh24:mi:ss'), to_char(editdate, 'yyyy-mm-dd') ) editdate" + " from board";
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
		if (num == null || "".equals(num)) {
			return null;
		}
		String sql = "select num, title, content, id, visitcount" + ", decode( trunc(sysdate), trunc(postdate)"
				+ ", to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd') ) postdate"
				+ ", decode( trunc(sysdate), trunc(editdate)"
				+ ", to_char(editdate, 'hh24:mi:ss'), to_char(editdate, 'yyyy-mm-dd') ) editdate"
				+ "  from board where num = ? order by num desc";

		try (Connection con = DBConnectionPool.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, num);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				b = new Board();
				b.setNum(rs.getInt("num"));
				b.setTitle(rs.getString("title"));
				// 줄바꿈처리를 메소드에서 미리 처리해주었음
				b.setContent(rs.getString("content").replace("\r\n", "<br>"));
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

		String sql = "insert into board values (seq_board_num.nextval, ?, ?, ?, sysdate, 0, sysdate)";
		try (Connection con = DBConnectionPool.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
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
		try (Connection con = DBConnectionPool.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int update(Board b) {
		int res = 0;

		String sql = "update board set title = ?, content = ?, editdate = sysdate where num = ?";

		try (Connection con = DBConnectionPool.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getNum());
			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}

		return res;
	}

	public int getTotalCnt(Criteria cr) {
		int res = 0;
		String sql = "select count(*) from board ";
		if (cr.getsWord() != null && !"".equals(cr.getsWord())) {
			sql += "where " + cr.getsField() + " like '%" + cr.getsWord() + "%' ";
		}
		sql += "order by num desc";
		try (Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				res = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.err.println("총 게시물의 수를 조회하던 중 예외 발생 🤦‍♀️");
			e.printStackTrace();
		}

		return res;
	}
	
	
	public int delete(String num) {
		int res = 0;
		String sql = "delete board where num = ?";
		
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			pstmt.setString(1, num);
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int latest() {
		int res = 0;
		String sql = "select * from ( select b.*, rownum rn from ( select * from board order by num desc ) b ) where rn between 1 and 1";
		try (Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("최근 게시물을 조회하던 중 예외 발생 🤦‍♀️");
			e.printStackTrace();
		}
		
		return res;
	}

}
