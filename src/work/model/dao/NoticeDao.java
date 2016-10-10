package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Notice;

public class NoticeDao {
	/* Factory Pattern */
	FactoryDao factory = FactoryDao.getInstance();

	/* Singleton Pattern */
	private NoticeDao() {
	}

	private static NoticeDao instance = new NoticeDao();

	public static NoticeDao getInstance() {
		return instance;
	}

	/**
	 * 1.게시판 전체조회 메서드
	 * 
	 * @param pageNum
	 *            조회할 페이지 번호
	 * @return 10페이지씩 반환
	 */
	public ArrayList<Notice> selectNoticeList(String pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pageNo = Integer.parseInt(pageNum);

		try {
			conn = factory.getConnection();
			String sql = "SELECT COUNT(N_NO) FROM NOTICES";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int nCount = 0;
			if (rs.next()) {
				nCount = rs.getInt(1);
				nCount = ((nCount / 10) == 0) ? (nCount / 10) : (nCount / 10) + 1;
				
			}

			if (pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= nCount) {
				pageNo = nCount;
			}
			pstmt.close();
			rs.close();

			sql = "SELECT N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM (SELECT rownum AS rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM NOTICES ORDER BY N_DATE DESC)WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((pageNo - 1) * 10) + 1);
			pstmt.setInt(2, ((pageNo) * 10));
			rs = pstmt.executeQuery();
			ArrayList<Notice> list = new ArrayList<Notice>();
			Notice dto = null;
			int nNo = 0;
			String nTitle = null;
			String nContent = null;
			String nAuthor = null;
			String nDate = null;
			String nType = null;
			int nHit = 0;

			while (rs.next()) {
				nNo = rs.getInt(1);
				nTitle = rs.getString(2);
				nContent = rs.getString(3);
				nAuthor = rs.getString(4);
				nDate = rs.getString(5);
				nType = rs.getString(6);
				nHit = rs.getInt(7);

				dto = new Notice(nNo, nTitle, nContent, nAuthor, nDate, nType, null, null, nHit, nCount);
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
	public int insertNotice(String nTitle, String nContent, String nAuthor, String nType, String nFile1, String nFile2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "INSERT INTO NOTICES VALUES(seq_NOTICES.nextval, ?, ?, ?, to_char(sysdate,'yy/MM/dd hh:mm:ss'), ?, ?, ?, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nTitle);
			pstmt.setString(2, nContent);
			pstmt.setString(3, nAuthor);
			pstmt.setString(4, nType);
			pstmt.setString(5, nFile1);
			pstmt.setString(6, nFile2);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}

		return 0;
	}

	public Notice selectNotice(String noticeNum, int flag) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "SELECT * FROM NOTICES WHERE N_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(noticeNum));
			rs = pstmt.executeQuery();
			int nNo = 0;
			String nTitle = null;
			String nContent = null;
			String nAuthor = null;
			String nDate = null;
			String nType = null;
			String nFile1 = null;
			String nFile2 = null;
			int nHit = 0;
			int nCount = 0;

			Notice dto = null;

			if (rs.next()) {
				nNo = rs.getInt(1);
				nTitle = rs.getString(2);
				nContent = rs.getString(3);
				nAuthor = rs.getString(4);
				nDate = rs.getString(5);
				nType = rs.getString(6);
				nFile1 = rs.getString(7);
				nFile2 = rs.getString(8);
				nHit = rs.getInt(9);
				if(flag==0){
				    dto = new Notice(nNo, nTitle, nContent, nAuthor, nDate, nType, nFile1, nFile2, nHit+1, nCount);
				} else {
				    dto = new Notice(nNo, nTitle, nContent, nAuthor, nDate, nType, nFile1, nFile2, nHit, nCount);
					}
				pstmt.close();
				
				if(flag == 0) {
					sql="UPDATE NOTICES SET N_HIT=?+1 WHERE N_NO=?";
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, nHit);
					pstmt.setInt(2, Integer.parseInt(noticeNum));
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

	public int deleteNotice(String noticeNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "DELETE FROM NOTICES WHERE N_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(noticeNum));

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}

	public int updateNotice(String nTitle, String nContent, String nType, String noticeNum, String nFile1, String nFile2) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "UPDATE NOTICES SET N_TITLE=?, N_CONTENT=?, N_DATE=to_char(sysdate,'yy/MM/dd hh24:mm:ss'),N_TYPE=?, N_FILE1=?, N_FILE2=? WHERE N_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nTitle);
			pstmt.setString(2, nContent);
			pstmt.setString(3, nType);
			pstmt.setString(4, nFile1);
			pstmt.setString(5, nFile2);
			pstmt.setInt(6, Integer.parseInt(noticeNum));

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}

	public ArrayList<Notice> selectNoticeListSearch(String pageNum, String sType, String sTitle) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pageNo = Integer.parseInt(pageNum);
		
		try {
			conn = factory.getConnection();
			String sql = "SELECT COUNT(N_NO) FROM NOTICES";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int nCount = 0;
			
			if(rs.next()) {
				nCount = rs.getInt(1);
				nCount = ((nCount / 10) == 0) ? (nCount/10) : (nCount/10)+1; 
			}
			
			if(pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= nCount) {
				pageNo = nCount;
			}
			
			pstmt.close();
			rs.close();
			
			sql = "SELECT N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM ( SELECT rownum as rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM (SELECT rownum AS rown, N_NO, N_TITLE, N_CONTENT, N_AUTHOR, N_DATE, N_TYPE, N_HIT FROM NOTICES WHERE "+sType+" LIKE ? ORDER BY  N_DATE DESC)) WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+sTitle+"%");
			pstmt.setInt(2, ((pageNo-1)*10)+1);
			pstmt.setInt(3, ((pageNo)*10));
			rs = pstmt.executeQuery();
			
			ArrayList<Notice> list = new ArrayList<Notice>();
			Notice dto = null;
			int nNo = 0; 
			String nTitle = null;
			String nContent = null;
			String nAuthor = null;
			String nDate = null;
			String nType = null;
			int nHit = 0;
			
			while(rs.next()) {
				nNo = rs.getInt(1);
				nTitle = rs.getString(2);
				nContent = rs.getString(3);
				nAuthor = rs.getString(4);
				nDate = rs.getString(5);
				nType = rs.getString(6);
				nHit = rs.getInt(7);

				dto = new Notice(nNo, nTitle, nContent, nAuthor, nDate, nType, null, null, nHit, nCount);
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
