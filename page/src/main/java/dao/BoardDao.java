package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.ConnectionUtill;
import dto.Board;

public class BoardDao {

	public BoardDao() {
	}
	
	public int insert(Board board) {
		int i = 0;
		String sql = "insert into board values(seq_board_num.nextval, ?, ?, ?, sysdate, ?)";
		 
		try (	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getId());
			pstmt.setInt(4, board.getCount());
			
			i = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}

}
