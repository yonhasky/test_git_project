package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Mentoring;

public class MentoringDao {

	// Factory Pattern ���� ���� : dao ���� ����� ���� FactoryDao ��ü ����
	private FactoryDao factory = FactoryDao.getInstance();

	private static MentoringDao instance = new MentoringDao();

	/** �⺻������ : jdbc driver �ε� ���� => FactoryDao ���� */
	private MentoringDao() {
	}

	public static MentoringDao getInstance() {
		return instance;
	}

	/**
	 * ��ϱ��
	 * 
	 * @param user
	 * @return int
	 */
	public int insert(Mentoring dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		// �ƱԸ�Ʈ�� ���޹��� ��ü�� ��������� ����
		int mNo = dto.getmNo();
		String mHost = dto.getmHost();
		String mEntry = dto.getmEntry();
		String mName = dto.getmName();
		String mMajor = dto.getmMajor();
		String mGrade = dto.getmGrade();
		String mComment = dto.getmComment();
		String mDate= dto.getmDate();
		String mStatus = dto.getmStatus();

		try {
			conn = factory.getConnection();
			String sql = "insert into Mentorings values(seq_Mentorings.nextval,?,?,?,?,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mHost);
			pstmt.setString(2, mEntry);
			pstmt.setString(3, mName);
			pstmt.setString(4, mMajor);
			pstmt.setString(5, mGrade);
			pstmt.setString(6, mComment);
			pstmt.setString(7, mStatus);

			int rows = pstmt.executeUpdate();

			return rows;
		} catch (SQLException e) {
			System.out.println("error: ��� ����");
			e.printStackTrace();

		} finally {
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * ��ü��ȸ
	 * 
	 * @return ArrayList ��ȯ
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
				String mHost = rs.getString("m_host");
				String mEntry = rs.getString("m_entry");
				String mName = rs.getString("m_name");
				String mMajor = rs.getString("m_major");
				String mGrade = rs.getString("m_grade");
				String mComment = rs.getString("m_comment");
				String mDate = rs.getString("m_date");
				String mStatus = rs.getString("m_STATUS");
				
				Mentoring dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor, mGrade,
						mComment, mDate, mStatus);

				arr.add(dto);
			}
			return arr;
		} catch (SQLException e) {
			System.out.println("error: ��ȸ ����");
			e.printStackTrace();

		} finally {
			// �ڿ�����
			factory.close(conn, pstmt, rs);
		}

		return null;
	}

	
	/**
	 * ��ü��ȸ
	 * 
	 * @return ArrayList ��ȯ
	 */
	public ArrayList<Mentoring> selectList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Mentoring> arr = new ArrayList<Mentoring>();

		try {
			conn = factory.getConnection();
			String sql = "select * from Mentorings where m_host=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				int mNo = rs.getInt("m_no");
				String mHost = rs.getString("m_host");
				String mEntry = rs.getString("m_entry");
				String mName = rs.getString("m_name");
				String mMajor = rs.getString("m_major");
				String mGrade = rs.getString("m_grade");
				String mComment = rs.getString("m_comment");
				String mDate = rs.getString("m_date");
				String mStatus = rs.getString("m_STATUS");
				
				Mentoring dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor, mGrade,
						mComment, mDate, mStatus);

				arr.add(dto);
			}
			return arr;
		} catch (SQLException e) {
			System.out.println("error: ��ȸ ����");
			e.printStackTrace();

		} finally {
			// �ڿ�����
			factory.close(conn, pstmt, rs);
		}

		return null;
	}
	
	
	

	/**
	 * ȸ�� ���� ���丵��û ��ȸ
	 * 
	 * @return ArrayList ��ȯ
	 */
	public ArrayList<Mentoring> myList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Mentoring> arr = new ArrayList<Mentoring>();

		try {
			conn = factory.getConnection();
			String sql = "select * from Mentorings where m_entry=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {

				int mNo = rs.getInt("m_no");
				String mHost = rs.getString("m_host");
				String mEntry = rs.getString("m_entry");
				String mName = rs.getString("m_name");
				String mMajor = rs.getString("m_major");
				String mGrade = rs.getString("m_grade");
				String mComment = rs.getString("m_comment");
				String mDate = rs.getString("m_date");
				String mStatus = rs.getString("m_STATUS");
				
				Mentoring dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor, mGrade,
						mComment, mDate, mStatus);

				arr.add(dto);
			}
			return arr;
		} catch (SQLException e) {
			System.out.println("error: ��ȸ ����");
			e.printStackTrace();

		} finally {
			// �ڿ�����
			factory.close(conn, pstmt, rs);
		}

		return null;
	}
	
	
	
	
	/**
	 * ����ȸ
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
				String mHost = rs.getString("m_host");
				String mEntry = rs.getString("m_entry");
				String mName = rs.getString("m_name");
				String mMajor = rs.getString("m_major");
				String mGrade = rs.getString("m_grade");
				String mComment = rs.getString("m_comment");
				String mDate = rs.getString("m_date");
				String mStatus = rs.getString("m_STATUS");

				dto = new Mentoring(mNo, mHost, mEntry, mName, mMajor, mGrade,
						mComment, mDate, mStatus);
				System.out.println(dto);

				return dto;
			}
		} catch (SQLException e) {
			System.out.println("error: ��ȸ ����");
			e.printStackTrace();

		} finally {
			// �ڿ�����
			factory.close(conn, pstmt, rs);
		}

		return null;
	}

	/**
	 * ȸ�� �Խñ� ���� ����
	 * 
	 * @param board
	 * @return int
	 */
	public int updateUser(Mentoring dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int mNo = dto.getmNo();

		String mComment = dto.getmComment();

		try {
			conn = factory.getConnection();
			String sql = "update Mentorings set m_date=sysdate, m_comment=? where M_NO=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mComment);
			pstmt.setInt(2, mNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: ��� ����");
			System.out.println(e.getMessage());
		} finally {
			// �ڿ�����
			factory.close(conn, pstmt);
		}
		return 0;
	}

	/**
	 * ������ - �Խñ� ���� ��ü ����
	 * 
	 * @param board
	 * @return int
	 */
	public int update(Mentoring dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		// �ƱԸ�Ʈ�� ���޹��� ��ü�� ��������� ����
		int mNo = dto.getmNo();
		String mHost = dto.getmHost();
		String mEntry = dto.getmEntry();
		String mName = dto.getmName();
		String mMajor = dto.getmMajor();
		String mGrade = dto.getmGrade();
		String mComment = dto.getmComment();
		String mDate= dto.getmDate();
		String mStatus = dto.getmStatus();
		
		try {
			conn = factory.getConnection();
			String sql = "update Mentorings set M_NO =?, M_host=?, M_entry=?, M_name=?, m_major=?, m_grade, M_comment=?, M_date=?, M_status=? where M_NO=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, mNo);
			pstmt.setString(2, mHost);
			pstmt.setString(3, mEntry);
			pstmt.setString(4, mName);
			pstmt.setString(5, mMajor);
			pstmt.setString(6, mGrade);
			pstmt.setString(7, mComment);
			pstmt.setString(8, mDate);
			pstmt.setString(9, mStatus);
			pstmt.setInt(10, mNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: ��� ����");
			e.printStackTrace();

		} finally {
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * ���丵 ����
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
			System.out.println("error: ���� ����");
			e.printStackTrace();

		} finally {
			// �ڿ�����
			factory.close(conn, pstmt);
		}
		return 0;
	}
}
