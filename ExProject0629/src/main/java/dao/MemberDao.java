package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.DBConnectionPool;
import dto.Member;

public class MemberDao {

	public MemberDao() {
	}
	
	/**
	 * 로그인
	 * id/pw가 일치하는 회원을 조회
	 * 
	 * 회원이 존재하는 경우 Member 객체를 반환
	 * 		존재하지않을 경우 null 반환
	 * @param id : 입력한 회원 id
	 * @param pw : 입력한 회원 pw
	 * @return
	 */
	public Member login(String id, String pw) {
		Member member = null;
		String sql = "select * from member where id=? and pass=?";
//		String sql = "select * from member where id='" + id + "' and pass='" + pw + "'";
		
		
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt =  con.prepareStatement(sql);
				) {
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					String loginId = rs.getString("id");
					String name = rs.getString("name");
					String regidate = rs.getString("regidate");
					
					member = new Member(loginId, "", name, regidate);
				}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	/**
	 * 회원 등록
	 * @param member
	 * @return 등록이 몇 건 처리되었는지 반환
	 */
	public int insert(Member member) {
		int i = 0;
		String sql = "insert into member values (?, ?, ?, sysdate)";
		
		try (	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());

			i = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
		
	}
	


}

















