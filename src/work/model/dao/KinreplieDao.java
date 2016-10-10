package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Kinreplie;


public class KinreplieDao {

	FactoryDao factory = FactoryDao.getInstance();
	
	private KinreplieDao() {
		
	}
	
	private static KinreplieDao instance = new KinreplieDao();
	
	public static KinreplieDao getInstance() {
		return instance;
	}
	
	
	/** 0. 답변 리스트(질문 상세보기할때 답변도 보이게)
	 * 
	 */
	public ArrayList<Kinreplie> selectRplList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			String sql = "select * from Kinreplies";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			ArrayList<Kinreplie> list = new ArrayList<Kinreplie>();
			Kinreplie dto = null;
			int rNo = 0;
			String rTitle = null;
			String rAuthor = null;
			String rDate = null;
			String rContent = null;
			String rRecommends = null;
			String rFile1 = null;
			String rFile2 = null;
			String rConfirm = null;
			int kNo = 0;

			while (rs.next()) {
				rNo = rs.getInt(1);
				rTitle = rs.getString(2);
				rAuthor = rs.getString(3);
				rDate = rs.getString(4);
				rContent = rs.getString(5);
				rRecommends = rs.getString(6);
				rFile1 = rs.getString(7);
				rFile2 = rs.getString(8);
				rConfirm = rs.getString(9);
				kNo = rs.getInt(10);

				dto = new Kinreplie(rNo, rTitle, rAuthor, rDate, rContent, rRecommends, rFile1, rFile2, rConfirm, kNo);
						
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
	
	
	/** 1. 답변 달기 메서드
	 * 
	 */
	public int insertRpl(Kinreplie dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "INSERT INTO kinreplies VALUES(seq_rpl_num.nextval,?,?,to_char(sysdate, 'yyyy-mm-dd'),?,0,?,?,F,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getrTitle());
			pstmt.setString(2, dto.getrAuthor());
			pstmt.setString(3, dto.getrContent());
			pstmt.setString(4, dto.getrFile1());
			pstmt.setString(5, dto.getrFile2());
			pstmt.setInt(6, dto.getkNo());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	
	/** 2. 답변 상세 보기 메서드
	 * 
	 */
	public Kinreplie selectRpl(int kNo, int rNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "SELECT * FROM kinreplies WHERE k_no=? and r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, kNo);
			pstmt.setInt(2, rNo);
			rs = pstmt.executeQuery();
			Kinreplie dto = null;
			String rTitle = null;
			String rAuthor = null;
			String rDate = null;
			String rContent = null;
			String rRecommends = null;
			String rFile1 = null;
			String rFile2 = null;
			String rConfirm = null;

			if (rs.next()) {
				rNo = rs.getInt(1);
				rTitle = rs.getString(2);
				rAuthor = rs.getString(3);
				rDate = rs.getString(4);
				rContent = rs.getString(5);
				rRecommends = rs.getString(6);
				rFile1 = rs.getString(7);
				rFile2 = rs.getString(8);
				rConfirm = rs.getString(9);
				kNo = rs.getInt(10);
				
				dto = new Kinreplie(rNo, rTitle, rAuthor, rDate, rContent, rRecommends, rFile1, rFile2, rConfirm, kNo);
				pstmt.close();
				return dto;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 3. 답변 삭제 메서드
	 * 
	 */
	public int deleteRpl(int kNo, int rNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "DELETE FROM kinreplies WHERE k_no=? and r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, kNo);
			pstmt.setInt(2, rNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	
	/** 4. 답변 수정 메서드
	 * 
	 */
	public int updateRpl(Kinreplie dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "UPDATE kinreplies SET r_title=?, r_date=to_char(sysdate,'yy-MM-dd'), r_content=?, r_file1=?, r_file2=? WHERE k_no=? and r_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getrTitle());
			pstmt.setString(2, dto.getrContent());
			pstmt.setString(3, dto.getrFile1());
			pstmt.setString(4, dto.getrFile2());
			pstmt.setInt(5, dto.getkNo());
			pstmt.setInt(6, dto.getrNo());


			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/** 5. 답변수 증가 메서드(질문에 달린)
	 * 
	 */
	public int updateRplCount(int kNo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = factory.getConnection();
			String sql = "UPDATE kins SET k_rpl=k_rpl+1 WHERE k_no=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, kNo);

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	
	
	
	
}
