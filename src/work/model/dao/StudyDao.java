package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Study;

public class StudyDao {
	private FactoryDao factory = FactoryDao.getInstance();
	
	private static StudyDao instance = new StudyDao();
	
	private StudyDao() { }
	
	public static StudyDao getInstance() {
		return instance;
	}
	
	public int insertStudy(Study dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String stTitle = dto.getStTitle();
		String stAuthor = dto.getStAuthor();
		String stPeriod = dto.getStPeriod();
		String stOverview = dto.getStOverview();
		String stContent = dto.getStContent();
		String stFile1 = dto.getStFile1();
		String stFile2 = dto.getStFile2();
		int stHit = dto.getStHit();
		String stStatus = dto.getStStatus();
		
		try {
			conn = factory.getConnection();
			String sql = "INSERT INTO studies VALUES(seq_study.nextval, ?, ?, to_char(sysdate,'yyyy/MM/dd'), concat(to_char(sysdate,'yyyy/MM/dd ~ '),to_char(sysdate+60,'yyyy/MM/dd')), ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, stTitle);
			pstmt.setString(2, stAuthor);
			pstmt.setString(3, stPeriod);
			pstmt.setString(4, stOverview);
			pstmt.setString(5, stContent);
			pstmt.setString(6, stFile1);
			pstmt.setString(7, stFile2);
			pstmt.setInt(8, stHit);
			pstmt.setString(9, stStatus);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		
		return 0;
	}
	
	public ArrayList<Study> selectStudyList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = factory.getConnection();
			String sql="SELECT * FROM studies";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			Study dto = null;
			int stNo = 0;
			String stTitle = null;
			String stAuthor = null;
			String stDate = null;
			String stPeriod = null;
			String stOverview = null;
			String stContent = null;
			String stFile1 = null;
			String stFile2 = null;
			int stHit = 0;
			String stStatus = null;
			ArrayList<Study> list = new ArrayList<Study>();
			
			while(rs.next()) {
				 stNo = rs.getInt("");
				 stTitle = rs.getString("");
				 stAuthor = rs.getString("");
				 stDate = rs.getString("");
				 stPeriod = rs.getString("");
				 stOverview = rs.getString("");
				 stContent = rs.getString("");
				 stFile1 = rs.getString("");
				 stFile2 = rs.getString("");
				 stHit = rs.getInt("");
				 stStatus = rs.getString("");
				 dto = new Study(stNo, stTitle, stAuthor, stDate, stPeriod, stOverview, stContent, stFile1, stFile2, stHit, stStatus);
				 list.add(dto);
			}
			
			return list;
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public Study selectStudy(String stNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			String sql = "SELECT * FROM studies WHERE st_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stNo));
			rs = pstmt.executeQuery();
			
			Study dto = new Study();
			
			if(rs.next()) {
				dto.setStNo(Integer.parseInt(stNo));
				dto.setStTitle(rs.getString("ST_TITLE"));
				dto.setStAuthor(rs.getString("ST_AUTHOR"));
				dto.setStDate(rs.getString("ST_DATE"));
				dto.setStPeriod(rs.getString("ST_PERIOD"));
				dto.setStOverview(rs.getString("ST_OVERVIEW"));
				dto.setStContent(rs.getString("ST_CONTENT"));
				dto.setStFile1(rs.getString("ST_FILE1"));
				dto.setStFile2(rs.getString("ST_FILE2"));
				dto.setStHit(rs.getInt("ST_Hit"));
				dto.setStStatus(rs.getString("ST_STATUS"));
				return dto;
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	public int deleteStudy(String stNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = factory.getConnection();
			String sql = "DELETE FROM studies WHERE st_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stNo));
			
			return pstmt.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		
		return 0;
	}
	
	public int updateStudy(String stTitle, String stOverview, String stContent, String stFile1, String stFile2, String stStatus, String stNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = factory.getConnection();
			String sql = "UPDATE studies SET st_title=?, ST_DATE=to_char(sysdate,'yyyy/MM/dd'), st_overview=?, st_content=?, st_file1=?, st_file2=?, st_status=? WHERE st_no=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, stTitle);
			pstmt.setString(2, stOverview);
			pstmt.setString(3, stContent);
			pstmt.setString(4, stFile1);
			pstmt.setString(5, stFile2);
			pstmt.setString(6, stStatus);
			pstmt.setInt(7, Integer.parseInt(stNo));
			
			return pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		
		return 0;
	}
}
	