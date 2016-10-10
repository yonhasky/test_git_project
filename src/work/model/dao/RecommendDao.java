package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Recommend;


public class RecommendDao {
	/* Factory Pattern */
	FactoryDao factory = FactoryDao.getInstance();

	/* Singleton Pattern */
	private RecommendDao() {
	}

	private static RecommendDao instance = new RecommendDao();

	public static RecommendDao getInstance() {
		return instance;
	}

	/**
	 * 1.게시판 전체조회 메서드
	 * 
	 * @param pageNum
	 *            조회할 페이지 번호
	 * @return 10페이지씩 반환
	 */
	public ArrayList<Recommend> selectRecommendList(String pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pageNo = Integer.parseInt(pageNum);

		try {
			conn = factory.getConnection();
			String sql = "SELECT COUNT(R_NO) FROM RECOMMENDS";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int rCount = 0;
			if (rs.next()) {
				rCount = rs.getInt(1);
				rCount = ((rCount / 10) == 0) ? (rCount / 10) : (rCount / 10) + 1;
			}

			if (pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= rCount) {
				pageNo = rCount;
			}

			pstmt.close();
			rs.close();

			sql = "SELECT R_NO, R_TITLE, R_CONTENT, R_AUTHOR, R_DATE, R_TYPE, R_HIT FROM (SELECT rownum AS rown, R_NO, R_TITLE, R_CONTENT, R_AUTHOR, R_DATE, R_TYPE, R_HIT FROM RECOMMENDS ORDER BY R_DATE DESC)WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((pageNo - 1) * 10) + 1);
			pstmt.setInt(2, ((pageNo) * 10));
			rs = pstmt.executeQuery();

			ArrayList<Recommend> list = new ArrayList<Recommend>();
			Recommend dto = null;
			int rNo = 0;
			String rTitle = null;
			String rContent = null;
			String rAuthor = null;
			String rDate = null;
			String rType = null;
			int rHit = 0;

			while (rs.next()) {
				rNo = rs.getInt(1);
				rTitle = rs.getString(2);
				rContent = rs.getString(3);
				rAuthor = rs.getString(4);
				rDate = rs.getString(5);
				rType = rs.getString(6);
				rHit = rs.getInt(7);

				dto = new Recommend(rNo, rTitle, rContent, rAuthor, rDate, rType, null, null, rHit, rCount);
				list.add(dto);
			}

			return list;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}

	/**
	 * 2. 게시글 등록메서드
	 * 
	 * @param bTitle
	 *            게시글 제목
	 * @param bPw
	 *            게시글 비밀번호
	 * @param bContent
	 *            게시글 내용
	 * @param bAuthor
	 *            게시ㅏㅈ
	 * @return 등록성공여부
	 */
	public int insertRecommend(String rTitle, String rContent, String rAuthor, String rType, String rFile1, String rFile2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "INSERT INTO RECOMMENDS VALUES(seq_RECOMMENDS.nextval, ?, ?, ?, to_char(sysdate,'yy/MM/dd hh:mm:ss'), ?, ?, ?, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rTitle);
			pstmt.setString(2, rContent);
			pstmt.setString(3, rAuthor);
			pstmt.setString(4, rType);
			pstmt.setString(5, rFile1);
			pstmt.setString(6, rFile2);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}

		return 0;
	}

	public Recommend selectRecommend(String recommendNum, int flag) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "SELECT * FROM RECOMMENDS WHERE R_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recommendNum));
			rs = pstmt.executeQuery();
			int rNo = 0;
			String rTitle = null;
			String rContent = null;
			String rAuthor = null;
			String rDate = null;
			String rType = null;
			String rFile1 = null;
			String rFile2 = null;
			int rHit = 0;
			int rCount = 0;

			Recommend dto = null;

			if (rs.next()) {
				rNo = rs.getInt(1);
				rTitle = rs.getString(2);
				rContent = rs.getString(3);
				rAuthor = rs.getString(4);
				rDate = rs.getString(5);
				rType = rs.getString(6);
				rFile1 = rs.getString(7);
				rFile2 = rs.getString(8);
				rHit = rs.getInt(9);
				if(flag==0){
				    dto = new Recommend(rNo, rTitle, rContent, rAuthor, rDate, rType, rFile1, rFile2, rHit+1, rCount);
				} else {
				    dto = new Recommend(rNo, rTitle, rContent, rAuthor, rDate, rType, rFile1, rFile2, rHit, rCount);
					}
				pstmt.close();
				
				if(flag == 0) {
					sql="UPDATE RECOMMENDS SET R_HIT=?+1 WHERE R_NO=?";
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, rHit);
					pstmt.setInt(2, Integer.parseInt(recommendNum));
					pstmt.executeUpdate();
				} 
				
				return dto;
			}

		} catch (SQLException e) {

		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}

	public int deleteRecommend(String recommendNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "DELETE FROM RECOMMENDS WHERE R_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(recommendNum));

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}

	public int updateRecommend(String rTitle, String rContent, String rType, String recommendNum, String rFile1, String rFile2) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "UPDATE RECOMMENDS SET R_TITLE=?, R_CONTENT=?, R_DATE=to_char(sysdate,'yy/MM/dd hh24:mm:ss'),R_TYPE=?, R_FILE1=?, R_FILE2=? WHERE R_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rTitle);
			pstmt.setString(2, rContent);
			pstmt.setString(3, rType);
			pstmt.setString(4, rFile1);
			pstmt.setString(5, rFile2);
			pstmt.setInt(6, Integer.parseInt(recommendNum));

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}

	public ArrayList<Recommend> selectRecommendListSearch(String pageNum, String sType, String sTitle) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pageNo = Integer.parseInt(pageNum);
		
		try {
			conn = factory.getConnection();
			String sql = "SELECT COUNT(R_NO) FROM RECOMMENDS";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int rCount = 0;
			
			if(rs.next()) {
				rCount = rs.getInt(1);
				rCount = ((rCount / 10) == 0) ? (rCount/10) : (rCount/10)+1; 
			}
			
			if(pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= rCount) {
				pageNo = rCount;
			}
			
			pstmt.close();
			rs.close();
			
			sql = "SELECT R_NO, R_TITLE, R_CONTENT, R_AUTHOR, R_DATE, R_TYPE, R_HIT FROM ( SELECT rownum as rown, R_NO, R_TITLE, R_CONTENT, R_AUTHOR, R_DATE, R_TYPE, R_HIT FROM (SELECT rownum AS rown, R_NO, R_TITLE, R_CONTENT, R_AUTHOR, R_DATE, R_TYPE, R_HIT FROM RECOMMENDS WHERE "+sType+" LIKE ? ORDER BY  R_DATE DESC)) WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+sTitle+"%");
			pstmt.setInt(2, ((pageNo-1)*10)+1);
			pstmt.setInt(3, ((pageNo)*10));
			rs = pstmt.executeQuery();
			
			ArrayList<Recommend> list = new ArrayList<Recommend>();
			Recommend dto = null;
			int rNo = 0; 
			String rTitle = null;
			String rContent = null;
			String rAuthor = null;
			String rDate = null;
			String rType = null;
			int rHit = 0;
			
			while(rs.next()) {
				rNo = rs.getInt(1);
				rTitle = rs.getString(2);
				rContent = rs.getString(3);
				rAuthor = rs.getString(4);
				rDate = rs.getString(5);
				rType = rs.getString(6);
				rHit = rs.getInt(7);
				
				dto = new Recommend(rNo, rTitle, rContent, rAuthor, rDate, rType, null, null, rHit, rCount);
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


}
