package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtill;
import dto.Criteria;

public class FileDao {

	public FileDao() {
	}
	
	// 파일 정보를 저장
	public int insetFile(FileDto file) {
		int res =0;
		String sql = "insert into myfile values (seq_myfile_num.nextval, ?, ? ,? ,?, ?, sysdate)";
		try(	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
			pstmt.setString(1, file.getName());
			pstmt.setString(2, file.getTitle());
			pstmt.setString(3, file.getCate());
			pstmt.setString(4, file.getOfile());
			pstmt.setString(5, file.getSfile());
			
			res = pstmt.executeUpdate();
			/* System.out.println("파일 업로드 성공 ~"); */
			
		} catch (SQLException e) {
			e.printStackTrace();
			/* System.err.println("파일 업로드 실패 !"); */
		}
		return res;
	}

	// 파일 목록을 조회
	public List<FileDto> getFileList(Criteria cr) {
		List<FileDto> list = new ArrayList<FileDto>();
		String sql = "select * from (" 
				+ " select rownum rn, t.* from (" 
				+ " select idx, name, title, cate, ofile, sfile, postdate"
				+ " from myfile";
		if (cr.getsWord() != null && !"".equals(cr.getsWord())) {
			sql += " where " + cr.getsField() + " like '%" + cr.getsWord() + "%'";
		}
			sql += " order by idx desc )"
				+ " t )"
				+ " where rn between " 
				+ cr.getStartNo() + " and " + cr.getEndNo();

		try(	Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				) {
			while(rs.next()) {
				FileDto file = new FileDto();
				file.setIdx(rs.getString("idx"));
				file.setName(rs.getString("name"));
				file.setTitle(rs.getString("title"));
				file.setCate(rs.getString("cate"));
				file.setOfile(rs.getString("ofile"));
				file.setSfile(rs.getString("sfile"));
				file.setPostdate(rs.getString("postdate"));
				list.add(file);
			}
			/* System.out.println("파일 목록 조회 성공 ~"); */
			
		} catch (SQLException e) {
			e.printStackTrace();
			/* System.err.println("파일 목록 조회 실패 !"); */
		}
		
		return list;
	}
	
	
	// 파일의 총 개수를 조회
	public int getTotalCnt(Criteria cr) {
		int res = 0;
		String sql = "select count(*) from myfile order by idx desc";
		try (Connection con = ConnectionUtill.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				res = rs.getInt(1);
			}
	
		} catch (SQLException e) {
			/* System.err.println("파일의 총 개수를 조회하던 중 예외 발생 🤦‍♀️"); */
			e.printStackTrace();
		}

		return res;
	}
}















