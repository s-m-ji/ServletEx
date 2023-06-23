package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtill;
import common.DBConnectionPool;
import dto.Board;
import dto.Criteria;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	// 게시글 목록 조회 - 페이징 처리 (o)
	public List<MVCBoardDto> getBoardList(Criteria cr){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		
		String qry = "SELECT * FROM (" 
				+ " SELECT ROWNUM rn, t.* FROM (" 
				+ " SELECT idx, name, title, content, postdate, ofile, sfile, downcount, pass, visitcount "
				+ " FROM mvcboard";
		if (cr.getsWord() != null && !"".equals(cr.getsWord())) {
			qry += " WHERE " + cr.getsField() + " LIKE '%" + cr.getsWord() + "%'";
		}
			qry += " ORDER BY idx DESC )"
				+ " t )"
				+ " WHERE rn BETWEEN " 
				+ cr.getStartNo() + " AND " + cr.getEndNo();
			
		try (	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);
				ResultSet rs = pstmt.executeQuery();
				) {
			while(rs.next()) {
				
				MVCBoardDto mDto = new MVCBoardDto();
				
				mDto.setIdx(rs.getString("idx"));
				mDto.setName(rs.getString("name"));
				mDto.setTitle(rs.getString("title"));
				mDto.setContent(rs.getString("content"));
				mDto.setPostdate(rs.getString("postdate"));
				mDto.setOfile(rs.getString("ofile"));
				mDto.setSfile(rs.getString("sfile"));
				mDto.setDowncount(rs.getInt("downcount"));
				mDto.setPass(rs.getString("pass"));
				mDto.setVisitcount(rs.getInt("visitcount"));
				
				list.add(mDto);
			}
			/*
			 * System.out.println("----- list : " + list);
			 * System.out.println("----- mvcboard 목록 조회 성공 ^-^");
			 */
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("---------- mvcboard 목록 조회 실패!!!");
		}
		
		return list;
	}
	
	
	// 게시글 상세 조회
	public MVCBoardDto getBoardView(String idx){
		MVCBoardDto mDto = null;
		if(idx == null || "".equals(idx)) {
			return null;
		}
		
		String qry = "SELECT * FROM mvcboard WHERE idx = ? ";
		
		try (	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);
				) {
			pstmt.setString(1, idx);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				mDto = new MVCBoardDto();
				
				mDto.setIdx(rs.getString("idx"));
				mDto.setName(rs.getString("name"));
				mDto.setTitle(rs.getString("title"));
				mDto.setContent(rs.getString("content").replace("\r\n", "<br>"));
				mDto.setPostdate(rs.getString("postdate"));
				mDto.setOfile(rs.getString("ofile"));
				mDto.setSfile(rs.getString("sfile"));
				mDto.setDowncount(rs.getInt("downcount"));
				mDto.setPass(rs.getString("pass"));
				mDto.setVisitcount(rs.getInt("visitcount"));
			}
			
			System.out.println("----- mDto : " + mDto);
			System.out.println("----- mvcboard 상세 조회 성공 ^-^");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("---------- mvcboard 상세 조회 실패!!!");
		}
		
		return mDto;
	}

	
	// 게시글 추가 기능
	public int insert(MVCBoardDto mDto) {
		int res = 0;

		String qry = "INSERT INTO mvcboard VALUES ("
				+ "seq_mvcboard_num.nextval, ?, ?, ?, sysdate, ?, ?, 0, ?, 0)";
		try (Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);
				) {
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2, mDto.getTitle());
			pstmt.setString(3, mDto.getContent());
			pstmt.setString(4, mDto.getOfile());
			pstmt.setString(5, mDto.getSfile());
			pstmt.setString(6, mDto.getPass());

			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("---------- mvcboard 게시글 작성 실패!!!");
		}

		return res;
	}

	
	// 게시글 총 개수 반환
	public int getTotalCnt(Criteria cr) {
		int res = 0;
		String qry = "SELECT COUNT(*) FROM mvcboard";
			if(cr.getsWord() != null && !"".equals(cr.getsWord())) {
				qry += " WHERE "	+ cr.getsField()
						+ " LIKE '%" + cr.getsWord() + "%'";
			}
		try (Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				res = rs.getInt(1);
			}
	
		System.out.println("qry : " + qry);
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("게시글 총 개수를 조회하던 중 예외 발생 🤦‍♀️");
		}

		return res;
	}

	// 비밀번호 검증 기능
	public boolean confirmPassword(String pass, String idx) {
		boolean res = false;
		String qry = "SELECT * FROM mvcboard WHERE idx = ? AND pass = ? ";
		try (	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);
				) {
			pstmt.setString(1, idx);
			pstmt.setString(2, pass);
			
			ResultSet rs = pstmt.executeQuery();
			res = rs.next(); // 일치하는 게시글이 있다면 true를 반환
			
		} catch (SQLException e) {
			System.err.println("비밀번호/게시글번호를 조회하던 중 예외 발생 🤦‍♀️");
			e.printStackTrace();
		}
		return res;
	}
	
	// 게시글 삭제
	public int deletePost(String idx) {
		int res = 0;
		String qry = "DELETE mvcboard WHERE idx = ?";
		
		try(	Connection con = DBConnectionPool.getConnection();
				PreparedStatement pstmt = con.prepareStatement(qry);
			) {
			pstmt.setString(1, idx);
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	// 게시글 수정
	public int updatePost(MVCBoardDto mDto) {
		int res = 0;

		String qry = "update mvcboard set name = ?, title = ?, content = ? where idx = ?";

		try (Connection con = DBConnectionPool.getConnection(); 
				PreparedStatement pstmt = con.prepareStatement(qry);
				) {
			
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2, mDto.getTitle());
			pstmt.setString(3, mDto.getContent());
			pstmt.setString(4, mDto.getIdx());
			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}

		return res;
	}
}
