package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

/**
 * @author user
 *
 */
/**
 * @author user
 *
 */
public class ConnectionUtill {

	public ConnectionUtill() {

	}

	/**
	 * DB Connection을 반환합니다.
	 * @return
	 */
	public static Connection getConnection() {
		// 접속 정보 						@ip:	port:	sid
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "jsp";
		String pw = "1234";
		
		Connection conn = null;
		
		// 커넥션 생성
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 생성
		 	conn = DriverManager.getConnection(url, id, pw);
			
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리 로드 중 오류 발생 : OracleDriver 확인");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("커넥션 생성 중 오류 발생 : url, id, pw 확인");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * web.xml 파일의 컨텍스트 초기화 매개변수를 읽어서
	 * DB 접속 정보를 설정
	 * @param application
	 * @return
	 */
	public static Connection getConnection(ServletContext application) {
		// 여기서 application은 서버가 올라갈 때 (톰켓이 연결될 때) 생성됩니당
		Connection con = null;
	
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleUrl");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		/*
		 * System.out.println("OracleDriver : " + driver);
		 * System.out.println("OracleUrl : " + url); System.out.println("OracleId : " +
		 * id); System.out.println("OraclePw : " + pw);
		 */
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리 로드 중 오류 발생 : OracleDriver 확인");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("커넥션 생성 중 오류 발생 : url, id, pw 확인");
			e.printStackTrace();
		}
		
		return con;
	}
	
	
	/**
	 * 커넥션 생성 테스트
	 * @param args
	 */
	public static void main(String[] args) {
		
		String sql = "select to_char(sysdate, 'yyyy-mm-dd') today from dual";
		
		try (	Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
			) {
			System.out.println("Connection : " + con);			
			
			ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행
			rs.next();
//			rs.getString(1);
			String today = rs.getString("today");
			System.out.println("Today : " + today);
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static void close(Connection con) {
		try {
			if(con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con, Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) stmt.close();
			if(con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed()) rs.close();
			if(stmt != null && !stmt.isClosed()) stmt.close();
			if(con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}


















