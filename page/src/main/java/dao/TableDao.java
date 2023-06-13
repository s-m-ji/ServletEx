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

public class TableDao {		

	public TableDao() {
		// TODO Auto-generated constructor stub
	}

	public List<Table> getList() {
		List<Table> list = new ArrayList<Table>();
		
		String sql = "select * from board order by num desc";
		
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
	
	public int getTotalCnt() {
		int totalCnt = 0;
		String sql = "select count(*) from board order by num desc";
		
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
	
	public int insert(Table table) {
		int i = 0;
		
		String sql = "insert into table values(?,?,?,?,sysdate,?)";
		
		try(	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			
			pstmt.setString(1, table.getNum());
			pstmt.setString(2, table.getTitle());
			pstmt.setString(3, table.getContent());
			pstmt.setString(4, table.getId());
			pstmt.setString(5, table.getVisitcount());
			
			i = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
}
