package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Study;
import work.model.dto.StudyMatch;

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
			String sql = "INSERT INTO studies VALUES(seq_studies.nextval, ?, ?, to_char(sysdate,'yyyy/MM/dd'), ?, ?, ?, ?, ?, ?, ?)";
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
	
	public ArrayList<Study> selectStudyList(String pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pageNo = Integer.parseInt(pageNum);
		
		try{
			conn = factory.getConnection();
			String sql = "SELECT COUNT(st_no) FROM studies";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int stCount = 0;
			if (rs.next()) {
				stCount = rs.getInt(1);
				stCount = ((stCount / 10) == 0) ? (stCount / 10) : (stCount / 10) + 1;
			}

			if (pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= stCount) {
				pageNo = stCount;
			}

			pstmt.close();
			rs.close();
			
			sql="SELECT rown, st_no, st_title, st_author, st_date, st_period, st_overview, st_content, st_file1, st_file2, st_hit, st_status FROM (SELECT rownum AS rown, st_no, st_title, st_author, st_date, st_period, st_overview, st_content, st_file1, st_file2, st_hit, st_status FROM (SELECT rownum AS rown, st_no, st_title, st_author, st_date, st_period, st_overview, st_content, st_file1, st_file2, st_hit, st_status FROM studies ORDER BY st_date DESC)) WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((pageNo - 1) * 10) + 1);
			pstmt.setInt(2, ((pageNo) * 10));
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
				 stNo = rs.getInt("ST_NO");
				 stTitle = rs.getString("ST_TITLE");
				 stAuthor = rs.getString("ST_AUTHOR");
				 stDate = rs.getString("ST_DATE");
				 stPeriod = rs.getString("ST_PERIOD");
				 stOverview = rs.getString("ST_OVERVIEW");
				 stContent = rs.getString("ST_CONTENT");
				 stFile1 = rs.getString("ST_FILE1");
				 stFile2 = rs.getString("ST_FILE2");
				 stHit = rs.getInt("ST_HIT");
				 stStatus = rs.getString("ST_STATUS");
				 dto = new Study(stNo, stTitle, stAuthor, stDate, stPeriod, stOverview, stContent, stFile1, stFile2, stHit, stStatus, stCount);
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
	
	public ArrayList selectStudy(String stNo) {
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
			ArrayList list = new ArrayList();
			
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
				list.add(dto);
			}
			pstmt.close();
			rs.close();
			
			
			sql = "select STM_NO, STM_HOST, STM_ENTRY, STM_ENTRY_COMMENT, STM_ENTRY_DATE, STM_ENTRY_STATUS from studymatches WHERE ST_NO=?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stNo));
			rs = pstmt.executeQuery();
			
			StudyMatch dto1 = null;
			int stmNo = 0;
			String stmHost = null;
			String stmEntry = null;
			String stmEntryComment = null;
			String stmEntryDate = null;
			String stmEntryStatus = null;
			
			while(rs.next()) {
				stmNo = rs.getInt("STM_NO");
				stmHost = rs.getString("STM_HOST");
				stmEntry = rs.getString("STM_ENTRY");
				stmEntryComment = rs.getString("STM_ENTRY_COMMENT");
				stmEntryDate = rs.getString("STM_ENTRY_DATE");
				stmEntryStatus = rs.getString("STM_ENTRY_STATUS");
				dto1 = new StudyMatch(stmNo, stmHost, stmEntry, stmEntryComment, stmEntryDate, stmEntryStatus);
				list.add(dto1);
			}
			
			return list;
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
	