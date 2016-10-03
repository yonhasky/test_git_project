package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		
		int stNo = dto.getStNo();
		String stTitle = dto.getStTitle();
		String stAuthor = dto.getStAuthor();
		String stDate = dto.getStDate();
		String stPeriod = dto.getStPeriod();
		String stOverview = dto.getStOverview();
		String stContent = dto.getStContent();
		String stFile1 = dto.getStFile1();
		String stFile2 = dto.getStFile2();
		int stHit = dto.getStHit();
		String stStatus = dto.getStStatus();
		
		try {
			conn = factory.getConnection();
			String sql = "INSERT INTO studies VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stNo);
			pstmt.setString(2, stTitle);
			pstmt.setString(3, stAuthor);
			pstmt.setString(4, stDate);
			pstmt.setString(5, stPeriod);
			pstmt.setString(6, stOverview);
			pstmt.setString(7, stContent);
			pstmt.setString(8, stFile1);
			pstmt.setString(9, stFile2);
			pstmt.setInt(10, stHit);
			pstmt.setString(11, stStatus);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		
		return 0;
	}
	
}
