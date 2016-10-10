package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import work.model.dto.Kin;


public class KinDao {
	
	FactoryDao factory = FactoryDao.getInstance();
	
	private KinDao() {
		
	}
	
	private static KinDao instance = new KinDao();
	
	public static KinDao getInstance() {
		return instance;
	}
	
	
	/** 1-1. 지식인 전체 조회 메서드
	 * 
	 */
	public ArrayList<Kin> selectKinList(String pageNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pageNo = Integer.parseInt(pageNum);
		ArrayList<Kin> list = new ArrayList<Kin>();
		Kin dto = null;
		
		try {
			conn = factory.getConnection();
			String sql = "select count(*) from kins";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int kCount = 0;
			
			if (rs.next()) {
				kCount = rs.getInt(1);
				kCount = ((kCount / 10) == 0) ? (kCount / 10) : (kCount / 10) + 1;
			}
			
			if (pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= kCount) {
				pageNo = kCount;
			}

			pstmt.close();
			rs.close();
			
			sql = "SELECT k_no, k_type ,k_title, k_author, k_date, k_content, k_hit, k_rpl FROM ( SELECT rownum as rown, k_no, k_type ,k_title, k_author, k_date, k_content, k_hit, k_rpl FROM (SELECT rownum AS rown, k_no, k_type ,k_title, k_author, k_date, k_content, k_hit, k_rpl FROM kins ORDER BY k_date DESC)) WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((pageNo - 1) * 10) + 1);
			pstmt.setInt(2, ((pageNo) * 10));
			rs = pstmt.executeQuery();

			
			int kNo = 0;;
			String kType = null;
			String kTitle = null;
			String kAuthor = null;
			String kDate = null;
			String kContent = null;
			int kHit = 0;
			int kRpl = 0;
			int kRecommends = 0;
			String kFile1 = null;
			String kFile2 = null;

			while(rs.next()) {
				kNo = rs.getInt("k_no");
				kType = rs.getString("k_type");
				kTitle = rs.getString("k_title");
				kAuthor = rs.getString("k_author");
				kDate = rs.getString("k_date");
				kContent = rs.getString("k_content");
				kHit = rs.getInt("k_hit");
				kRpl = rs.getInt("k_rpl");

				dto = new Kin(kNo, kType, kTitle, kAuthor, kDate, kContent,
						kHit, kRpl, kRecommends, kFile1, kFile2, kCount);
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
	
	/** 1-2. 지식인 타입별 조회 메서드
	 * 
	 */
	public ArrayList<Kin> selectKinListByType(String category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = factory.getConnection();
			String sql = "select * from KINS where k_type = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();

			ArrayList<Kin> list = new ArrayList<Kin>();
			Kin dto = null;
			int kNo = 0;;
			String kType = null;
			String kTitle = null;
			String kAuthor = null;
			String kDate = null;
			String kContent = null;
			int kHit = 0;
			int kRpl = 0;
			int kRecommends = 0;
			String kFile1 = null;
			String kFile2 = null;
			int kCount = 0;

			while (rs.next()) {
				kNo = rs.getInt(1);
				kType = rs.getString(2);
				kTitle = rs.getString(3);
				kAuthor = rs.getString(4);
				kDate = rs.getString(5);
				kContent = rs.getString(6);
				kHit = rs.getInt(7);
				kRpl = rs.getInt(8);
				kRecommends = rs.getInt(9);
				kFile1 = rs.getString(10);
				kFile2 = rs.getString(11);
				kCount = rs.getInt(12);

				dto = new Kin(kNo, kType, kTitle, kAuthor, kDate, kContent,
						kHit, kRpl, kRecommends, kFile1, kFile2 ,kCount);
						
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
	
	/** 1-3. 리스트 부분검색 조회 메서드
	 * 
	 */
	public ArrayList<Kin> selectKinListSearch(String pageNum, String keywordType, String keyword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Kin> list = new ArrayList<Kin>();
		Kin dto = null;
		int pageNo = Integer.parseInt(pageNum);
		
		try {
			conn = factory.getConnection();
			String sql = "SELECT COUNT(b_number) FROM boards";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int bCount = 0;
			
			if(rs.next()) {
				bCount = rs.getInt(1);
				bCount = ((bCount / 10) == 0) ? (bCount/10) : (bCount/10)+1; 
			}
			
			if(pageNo == 0) {
				pageNo = 1;
			} else if (pageNo >= bCount) {
				pageNo = bCount;
			}
			pstmt.close();
			rs.close();
			
			sql = "SELECT k_no, k_type ,k_title, k_author, k_date, k_content, k_hit, k_rpl FROM ( SELECT rownum as rown, k_no, k_type ,k_title, k_author, k_date, k_content, k_hit, k_rpl FROM (SELECT rownum AS rown, k_no, k_type ,k_title, k_author, k_date, k_content, k_hit, k_rpl FROM boards WHERE "+keyword+" LIKE ? ORDER BY b_date DESC)) WHERE rown>=? AND rown<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, ((pageNo-1)*10)+1);
			pstmt.setInt(3, ((pageNo)*10));
			rs = pstmt.executeQuery();
			
			int kNo = 0;;
			String kType = null;
			String kTitle = null;
			String kAuthor = null;
			String kDate = null;
			String kContent = null;
			int kHit = 0;
			int kRpl = 0;
			int kRecommends = 0;
			String kFile1 = null;
			String kFile2 = null;
			int kCount = 0;
			
			while(rs.next()) {
				kNo = rs.getInt(1);
				kType = rs.getString(2);
				kTitle = rs.getString(3);
				kAuthor = rs.getString(4);
				kDate = rs.getString(5);
				kContent = rs.getString(6);
				kHit = rs.getInt(7);
				kRpl = rs.getInt(8);
				kRecommends = rs.getInt(9);
				kFile1 = rs.getString(10);
				kFile2 = rs.getString(11);
				kCount = rs.getInt("k_count");
				
				dto = new Kin(kNo, kType, kTitle, kAuthor, kDate, kContent,
						kHit, kRpl, kRecommends, kFile1, kFile2, kCount);
				list.add(dto);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("Error : 전체조회 오류");
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 2. 지식인 질문 등록 메서드
	 * 
	 */
	public int insertKin(Kin dto) {
		System.out.println("등록들어옴");
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "INSERT INTO KINS VALUES(seq_kin_num.nextval,?,?,?,to_char(sysdate, 'yyyy-mm-dd'),?,0,0,0,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getkType());
			pstmt.setString(2, dto.getkTitle());
			pstmt.setString(3, dto.getkAuthor());
			pstmt.setString(4, dto.getkContent());
			pstmt.setString(5, dto.getkFile1());
			pstmt.setString(6, dto.getkFile2());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	/** 3. 질문 내용 상세보기 메서드
	 * 
	 */
	public Kin selectKin(int kNo, int flag) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "SELECT * FROM KINS WHERE k_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, kNo);
			rs = pstmt.executeQuery();
			String kType = null;
			String kTitle = null;
			String kAuthor = null;
			String kDate = null;
			String kContent = null;
			int kHit = 0;
			int kRpl = 0;
			int kRecommends = 0;
			String kFile1 = null;
			String kFile2 = null;
			int kCount = 0;

			Kin dto = null;

			System.out.println(flag);
			if (rs.next()) {
				kNo = rs.getInt(1);
				kType = rs.getString(2);
				kTitle = rs.getString(3);
				kAuthor = rs.getString(4);
				kDate = rs.getString(5);
				kContent = rs.getString(6);
				kHit = rs.getInt(7);
				kRpl = rs.getInt(8);
				kRecommends = rs.getInt(9);
				kFile1 = rs.getString(10);
				kFile2 = rs.getString(11);
				kCount = rs.getInt("k_count");
//				if(flag==0){
					dto = new Kin(kNo, kType, kTitle, kAuthor, kDate, kContent,
							kHit+1, kRpl, kRecommends, kFile1, kFile2, kCount);
//				} else {
//					dto = new Kin(kNo, kType, kTitle, kAuthor, kDate, kContent,
//							kHit+1, kRpl, kRecommends, kFile1, kFile2, kCount);
//				}
				pstmt.close();
				
//				if(flag == 0) {
					sql="UPDATE KINS SET k_hit=?+1 WHERE k_no=?";
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, kHit);
					pstmt.setInt(2, kNo);
					pstmt.executeUpdate();
//				} 
				
				return dto;
			}

		} catch (SQLException e) {

		} finally {
			factory.close(conn, pstmt, rs);
		}
		return null;
	}
	
	/** 4. 질문 삭제 메서드
	 * 
	 */
	public int deleteKin(int kNo) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "DELETE FROM kins WHERE k_no=?";
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
	
	/** 5. 질문 수정 메서드
	 * 
	 */
	public int updateKin(Kin dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = factory.getConnection();
			String sql = "UPDATE kins SET k_title=?, k_type=?, k_date=to_char(sysdate,'yyyy-MM-dd'), k_content=?, k_file1=?, k_file2=? WHERE k_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getkTitle());
			pstmt.setString(2, dto.getkType());
			pstmt.setString(3, dto.getkContent());
			pstmt.setString(4, dto.getkFile1());
			pstmt.setString(5, dto.getkFile2());
			pstmt.setInt(6, dto.getkNo());

			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			factory.close(conn, pstmt);
		}
		return 0;
	}
	
	
	/** 6. 질문 추천수 증가 메서드
	 * 
	 */
	public int updateRecKin(int kNo){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = factory.getConnection();
			String sql = "UPDATE kins SET k_recommends=k_recommends+1 WHERE k_no=?";
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
