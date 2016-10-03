package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Mentoring;

public class MentoringDao {

	// Factory Pattern 적용 설계 : dao 공통 기능을 갖는 FactoryDao 객체 생성
	private FactoryDao factory = FactoryDao.getInstance();

	private static MentoringDao instance = new MentoringDao();

	/** 기본생성자 : jdbc driver 로딩 로직 => FactoryDao 위임 */
	private MentoringDao() {
	}

	public static MentoringDao getInstance() {
		return instance;
	}

	/**
	 * 등록기능
	 * 
	 * @param user
	 * @return int
	 */
	public int insert(Mentoring dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 아규먼트로 전달받은 객체의 멤버데이터 추출
		String mTitle = dto.getmTitle();
		String mAuthor = dto.getmAuthor();
		String mPeriod = dto.getmPeriod();
		String mOverview = dto.getmOverview();
		String mContent = dto.getmContent();
		String mFile1 = dto.getmFile1();
		String mFile2 = dto.getmFile2();
		int mHit = dto.getmHit();

		try {
			conn = factory.getConnection();
			String sql = "insert into Mentorings values(seq_Mentorings.nextval,?,?,sysdate,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mTitle);
			pstmt.setString(2, mAuthor);
			pstmt.setString(3, mPeriod);
			pstmt.setString(4, mOverview);
			pstmt.setString(5, mContent);
			pstmt.setString(6, mFile1);
			pstmt.setString(7, mFile2);
			pstmt.setInt(8, mHit);

			int rows = pstmt.executeUpdate();

			return rows;
		} catch (SQLException e) {
			System.out.println("error: 등록 오류");
			e.printStackTrace();

		} finally {
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * 전체조회
	 * 
	 * @return ArrayList 반환
	 */
	public ArrayList<Mentoring> selectList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Mentoring> arr = new ArrayList<Mentoring>();

		try {
			conn = factory.getConnection();
			String sql = "select * from Mentorings";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {

				int mNo = rs.getInt("m_no");
				String mTitle = rs.getString("m_title");
				String mAuthor = rs.getString("m_AUTHOR");
				String mDate = rs.getString("m_DATE");
				String mPeriod = rs.getString("m_PERIOD");
				String mOverview = rs.getString("m_OVERVIEW");
				String mContent = rs.getString("m_CONTENT");
				String mFile1 = rs.getString("m_FILE1");
				String mFile2 = rs.getString("m_FILE2");
				int mHit = rs.getInt("m_HIT");
				String mStatus = rs.getString("m_STATUS");
				
				Mentoring dto = new Mentoring(mNo, mTitle, mAuthor, mDate,
						mPeriod, mOverview, mContent, mFile1, mFile2, mHit, mStatus);

				arr.add(dto);
			}
			return arr;
		} catch (SQLException e) {
			System.out.println("error: 조회 오류");
			e.printStackTrace();

		} finally {
			// 자원해제
			factory.close(conn, pstmt, rs);
		}

		return null;
	}

	/**
	 * 상세조회
	 * 
	 * @param bNo
	 * @return Board
	 */
	public Mentoring selectOne(int mNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "select * from Mentorings where m_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);

			rs = pstmt.executeQuery();
			Mentoring dto = null;
			if (rs.next()) {
				String mTitle = rs.getString("m_title");
				String mAuthor = rs.getString("m_AUTHOR");
				String mDate = rs.getString("m_DATE");
				String mPeriod = rs.getString("m_PERIOD");
				String mOverview = rs.getString("m_OVERVIEW");
				String mContent = rs.getString("m_CONTENT");
				String mFile1 = rs.getString("m_FILE1");
				String mFile2 = rs.getString("m_FILE2");
				int mHit = rs.getInt("m_HIT");
				String mStatus = rs.getString("m_Status");

				dto = new Mentoring(mNo, mTitle, mAuthor, mDate, mPeriod,
						mOverview, mContent, mFile1, mFile2, mHit, mStatus);

				return dto;

			}
		} catch (SQLException e) {
			System.out.println("error: 조회 오류");
			e.printStackTrace();

		} finally {
			// 자원해제
			factory.close(conn, pstmt, rs);
		}

		return null;
	}

	/**
	 * 회원 게시글 정보 변경
	 * 
	 * @param board
	 * @return int
	 */
	public int updateUser(Mentoring dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int mNo = dto.getmNo();
		String mTitle = dto.getmTitle();
		String mPeriod = dto.getmPeriod();
		String mOverview = dto.getmOverview();
		String mContent = dto.getmContent();
		String mFile1 = dto.getmFile1();
		String mFile2 = dto.getmFile2();

		try {
			conn = factory.getConnection();
			String sql = "update Mentorings set M_TITLE=?, M_PERIOD=?, M_OVERVIEW=?, M_CONTENT=?, M_FILE1=?, M_FILE2=?  where M_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mTitle);
			pstmt.setString(2, mPeriod);
			pstmt.setString(3, mOverview);
			pstmt.setString(4, mContent);
			pstmt.setString(5, mFile1);
			pstmt.setString(6, mFile2);
			pstmt.setInt(7, mNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: 등록 오류");
			System.out.println(e.getMessage());
		} finally {
			// 자원해제
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * 관리자 - 게시글 정보 전체 변경
	 * 
	 * @param board
	 * @return int
	 */
	public int update(Mentoring dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 아규먼트로 전달받은 객체의 멤버데이터 추출
		int mNo = dto.getmNo();
		String mTitle = dto.getmTitle();
		String mAuthor = dto.getmAuthor();
		String mDate = dto.getmDate();
		String mPeriod = dto.getmPeriod();
		String mOverview = dto.getmOverview();
		String mContent = dto.getmContent();
		String mFile1 = dto.getmFile1();
		String mFile2 = dto.getmFile2();
		int mHit = dto.getmHit();
		
		try {
			conn = factory.getConnection();
			String sql = "update Mentorings set M_NO =?, M_TITLE=?, M_AUTHOR=?, M_DATE=?, M_PERIOD=?, M_OVERVIEW=?, M_CONTENT=?, M_FILE1=?, M_FILE2=?, M_HIT=? where M_NO=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mNo);
			pstmt.setString(2, mTitle);
			pstmt.setString(3, mAuthor);
			pstmt.setString(4, mDate);
			pstmt.setString(5, mPeriod);
			pstmt.setString(6, mOverview);
			pstmt.setString(7, mContent);
			pstmt.setString(8, mFile1);
			pstmt.setString(9, mFile2);
			pstmt.setInt(10, mHit);
			pstmt.setInt(11, mNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: 등록 오류");
			e.printStackTrace();

		} finally {
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * 멘토링 삭제
	 * 
	 * @param bNo
	 * @return
	 */
	public int deleteMentoring(int mNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "delete Mentorings where m_no= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: 삭제 오류");
			e.printStackTrace();

		} finally {
			// 자원해제
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * String으로 받아온 값으로 조회 (부분이름, 부분핸드폰, 부분아이디) 게시판 조회 :
	 * 
	 * @param search
	 *            , searchName
	 * @return ArrayList
	 */
	public ArrayList<Mentoring> searchMentoring(String search, String searchName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Mentoring> arr = new ArrayList<Mentoring>();

		try {
			conn = factory.getConnection();
			String sql = "select * from Mentorings where " + search + " like ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "%" + searchName + "%");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				int mNo = rs.getInt("m_no");
				String mTitle = rs.getString("m_title");
				String mAuthor = rs.getString("m_AUTHOR");
				String mDate = rs.getString("m_DATE");
				String mPeriod = rs.getString("m_PERIOD");
				String mOverview = rs.getString("m_OVERVIEW");
				String mContent = rs.getString("m_CONTENT");
				String mFile1 = rs.getString("m_FILE1");
				String mFile2 = rs.getString("m_FILE2");
				int mHit = rs.getInt("m_HIT");
				String mStatus = rs.getString("m_STATUS");

				Mentoring dto = new Mentoring(mNo, mTitle, mAuthor, mDate,
						mPeriod, mOverview, mContent, mFile1, mFile2, mHit, mStatus);

				arr.add(dto);
			}
			return arr;
		} catch (SQLException e) {
			System.out.println("error: 조회 오류");
			e.printStackTrace();

		} finally {
			// 자원해제
			factory.close(conn, pstmt, rs);

		}

		return null;
	}
}
