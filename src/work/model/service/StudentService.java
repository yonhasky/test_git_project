package work.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import work.model.dao.StudentDao;
import work.model.dto.Student;

public class StudentService {

	/**
	 * 게시판 DAO 클래스
	 */
	private StudentDao dao = StudentDao.getInstance();

	/**
	 * 회원 등록(회원가입)
	 * 
	 * @param dto
	 * @return
	 */
	public int StudentInsert(Student dto) {

		return dao.insert(dto);

	}

	/**
	 * 아이디 중복조회
	 * 
	 * @param id
	 * @return
	 */
	public boolean isUser(String id) {
		return dao.isUser(id);
	}

	/**
	 * 비밀번호 체크
	 * 
	 * @param id
	 * @return
	 */
	public boolean isPw(String id, String pw) {
	
		return dao.isPw(id, pw);
	}

	
	/**
	 * 회원 로그인
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public HashMap<String, String> login(String id, String pw) {
		return dao.login(id, pw);
	}

	/**
	 * 회원 전체조회
	 * 
	 * @return
	 */
	public ArrayList<Student> selectList() {
		return dao.selectList();
	}

	/**
	 * 회원 상세조회
	 * 
	 * @param id
	 * @return
	 */
	public Student selectOne(String id) {
		return dao.selectOne(id);
	}

	/**
	 * 회원 - 회원정보변경
	 * 
	 * @param dto
	 * @return
	 */
	public int updateStudent(Student dto) {
		return dao.updateUser(dto);

	}

	/**
	 * 관리자- 회원 전체정보 변경
	 * 
	 * @param dto
	 * @return
	 */
	public int update(Student dto) {
		return dao.update(dto);

	}

	/**
	 * 회원- 회원탈퇴
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public int delete(String id, String pw) {
		return dao.delete(id, pw);

	}

	/**
	 * 관리자 - 회원삭제
	 * 
	 * @param id
	 * @return
	 */
	public int delete(String id) {
		return dao.delete(id);

	}
	
	/**
	 * 비밀번호 변경
	 * @param id
	 * @param pw
	 * @param newPw
	 * @return
	 */
	public int updatePw(String id, String pw, String newPw) {
		return dao.updatePw(id, pw, newPw);
	}


}
