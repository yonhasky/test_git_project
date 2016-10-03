package work.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import work.model.dto.Student;

public class StudentDao {

	// Factory Pattern 적용 설계 : dao 공통 기능을 갖는 FactoryDao 객체 생성
	private FactoryDao factory = FactoryDao.getInstance();

	private static StudentDao instance = new StudentDao();

	/** 기본생성자 : jdbc driver 로딩 로직 => FactoryDao 위임 */
	private StudentDao() {
	}

	public static StudentDao getInstance() {
		return instance;
	}

	/**
	 * 회원 등록기능 (회원가입)
	 * 
	 * @param dto
	 * @return int
	 */
	public int insert(Student dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String id = dto.getId();
		String pw = dto.getPw();
		String name = dto.getName();
		String mobile = dto.getMobile();
		String email = dto.getEmail();
		int birth = dto.getBirth();
		String gender = dto.getGender();
		String major = dto.getMajor();
		String division = dto.getDivision();
		String grade = dto.getGrade();
		String img = dto.getImg();
		String gDate = dto.getgDate();
		String company = dto.getCompany();
		String job = dto.getJob();
		String career = dto.getCareer();
		String part = dto.getPart();

		try {
			conn = factory.getConnection();
			String sql = "insert into STUDENTS values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, mobile);
			pstmt.setString(5, email);
			pstmt.setInt(6, birth);
			pstmt.setString(7, gender);
			pstmt.setString(8, major);
			pstmt.setString(9, division);
			pstmt.setString(10, grade);
			pstmt.setString(11, img);
			pstmt.setString(12, gDate);
			pstmt.setString(13, company);
			pstmt.setString(14, job);
			pstmt.setString(15, career);
			pstmt.setString(16, part);
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
	 * 아이디 존재유무 검색 메서드 (중복조회)
	 * 
	 * @param id
	 * @return
	 */
	public boolean isUser(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "select name from STUDENTS where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return false;
	}

	/**
	 * 아이디 존재유무 검색 메서드 (중복조회)
	 * 
	 * @param id
	 * @return
	 */
	public boolean isPw(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "select name from STUDENTS where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			factory.close(conn, pstmt, rs);
		}
		return false;
	}

	/**
	 * 로그인 : 아이디, 비밀번호 이름(name), 회원등급(part) 반환
	 * 
	 * @param id
	 * @param pw
	 * @return HashMap
	 */

	public HashMap<String, String> login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String, String> loginmap = new HashMap<String, String>();
		try {
			conn = factory.getConnection();
			String sql = "select name, part from STUDENTS where id = ? and pw = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				String part = rs.getString("part");

				loginmap.put("name", name);
				loginmap.put("id", id);
				loginmap.put("pw", pw);
				loginmap.put("part", part);

				return loginmap;
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
	 * 전체조회
	 * 
	 * @return ArrayList 반환
	 */
	public ArrayList<Student> selectList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Student> arr = new ArrayList<Student>();

		try {
			conn = factory.getConnection();
			String sql = "select * from students ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				int birth = rs.getInt("birth");
				String gender = rs.getString("gender");
				String major = rs.getString("major");
				String division = rs.getString("division");
				String grade = rs.getString("grade");
				String img = rs.getString("img");
				String gDate = rs.getString("gDate");
				String company = rs.getString("company");
				String job = rs.getString("job");
				String career = rs.getString("career");
				String part = rs.getString("part");

				Student dto = new Student(id, pw, name, mobile, email, birth,
						gender, major, division, grade, img, gDate, company,
						job, career, part);

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
	 * 상세조회(id): 객체 User 아이디에 해당하는 회원 정보 조회
	 * 
	 * @param id
	 * @return Student 멤버객체 반환
	 */
	public Student selectOne(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = factory.getConnection();
			String sql = "select * from students where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				int birth = rs.getInt("birth");
				String gender = rs.getString("gender");
				String major = rs.getString("major");
				String division = rs.getString("division");
				String grade = rs.getString("grade");
				String img = rs.getString("img");
				String gDate = rs.getString("gDate");
				String company = rs.getString("company");
				String job = rs.getString("job");
				String career = rs.getString("career");
				String part = rs.getString("part");

				return new Student(id, pw, name, mobile, email, birth, gender,
						major, division, grade, img, gDate, company, job,
						career, part);

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
	 * 전체조회
	 * 
	 * @return ArrayList 반환
	 */
	public ArrayList<Student> graduationList(String major) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Student> arr = new ArrayList<Student>();

		try {
			conn = factory.getConnection();
			String sql = "select * from students where major=? and part='G'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, major);

			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String mobile = rs.getString("mobile");
				String email = rs.getString("email");
				int birth = rs.getInt("birth");
				String gender = rs.getString("gender");
				String division = rs.getString("division");
				String grade = rs.getString("grade");
				String img = rs.getString("img");
				String gDate = rs.getString("gDate");
				String company = rs.getString("company");
				String job = rs.getString("job");
				String career = rs.getString("career");
				String part = rs.getString("part");

				Student dto = new Student(id, pw, name, mobile, email, birth,
						gender, major, division, grade, img, gDate, company,
						job, career, part);

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
	 * 회원 - 회원 정보 변경
	 * 
	 * @param dto
	 * @return int
	 */
	public int updateUser(Student dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 아규먼트로 전달받은 객체의 멤버데이터 추출
		String id = dto.getId();
		String pw = dto.getPw();
		String name = dto.getName();
		String mobile = dto.getName();
		String email = dto.getEmail();
		int birth = dto.getBirth();
		String gender = dto.getGender();
		String major = dto.getMajor();
		String division = dto.getDivision();
		String grade = dto.getGrade();
		String img = dto.getImg();
		String gDate = dto.getgDate();
		String company = dto.getCompany();
		String job = dto.getJob();
		String career = dto.getCareer();

		try {
			conn = factory.getConnection();
			String sql = "update STUDENTS set pw=?, name=?, mobile=?, email=?, birth=?, gender=?, major=?, division=?, grade=?, img=?, gDate=?, company=?, job=?, career=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, mobile);
			pstmt.setString(4, email);
			pstmt.setInt(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, major);
			pstmt.setString(8, division);
			pstmt.setString(9, grade);
			pstmt.setString(10, img);
			pstmt.setString(11, gDate);
			pstmt.setString(12, company);
			pstmt.setString(13, job);
			pstmt.setString(14, career);
			pstmt.setString(15, id);

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
	 * 관리자 - 회원 정보 전체 변경
	 * 
	 * @param dto
	 * @return int
	 */
	public int update(Student dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 아규먼트로 전달받은 객체의 멤버데이터 추출
		String id = dto.getId();
		String pw = dto.getPw();
		String name = dto.getName();
		String mobile = dto.getName();
		String email = dto.getEmail();
		int birth = dto.getBirth();
		String gender = dto.getGender();
		String major = dto.getMajor();
		String division = dto.getDivision();
		String grade = dto.getGrade();
		String img = dto.getImg();
		String gDate = dto.getgDate();
		String company = dto.getCompany();
		String job = dto.getJob();
		String career = dto.getCareer();
		String part = dto.getPart();

		try {
			conn = factory.getConnection();
			// 1. sql 전용통로 개설
			String sql = "update STUDENTS set pw=?, name=?, mobile=?, email=?, birth=?, gender=?, major=?, division=?, grade=?, img=?, gDate=?, company=?, job=?, career=?, part=? where id=?";
			pstmt = conn.prepareStatement(sql);
			// 2. 매핑되도록 전달값 설정
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, mobile);
			pstmt.setString(4, email);
			pstmt.setInt(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, major);
			pstmt.setString(8, division);
			pstmt.setString(9, grade);
			pstmt.setString(10, img);
			pstmt.setString(11, gDate);
			pstmt.setString(12, company);
			pstmt.setString(13, job);
			pstmt.setString(14, career);
			pstmt.setString(15, part);
			pstmt.setString(16, id);

			// 3. sql 실행 요청 (전용통로이므로 실행시 sql 구문 지정해서는 안됨)
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: 등록 오류");
			e.printStackTrace();

		} finally {
			// 자원해제
			factory.close(conn, pstmt);

		}

		return 0;
	}

	/**
	 * 회원 삭제기능 - 회원의 아이디와 비밀번호 재확인을 거쳐 삭제 아이디와 비밀번호 일치시에 삭제
	 * 
	 * @param id
	 *            , pw
	 * @return int
	 */
	public int delete(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "delete from STUDENTS where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

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
	 * 관리자 - 회원 삭제기능 아이디로만 삭제
	 * 
	 * @param userId
	 * @return int
	 */
	public int delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = factory.getConnection();
			String sql = "delete STUDENTS where id= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

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
	 * 비밀번호 변경
	 * 
	 * @param userId
	 * @param userPw
	 * @param newPw
	 * @return int
	 */
	public int updatePw(String id, String pw, String newPw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println(id + pw + newPw);
		try {
			conn = factory.getConnection();
			// 1. sql 전용통로 개설
			String sql = "update STUDENTS set pw=? where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			// 2. 매핑되도록 전달값 설정
			pstmt.setString(1, newPw);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);

			// 3. sql 실행 요청 (전용통로이므로 실행시 sql 구문 지정해서는 안됨)
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("error: 등록 오류");
			e.printStackTrace();

		} finally {
			// 자원해제
			factory.close(conn, pstmt);

		}

		return 0;
	}
}
