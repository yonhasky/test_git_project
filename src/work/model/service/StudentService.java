package work.model.service;

import work.model.dao.StudentDao;
import work.model.dto.Student;

public class StudentService {

	
	/**
	 * 게시판 DAO 클래스
	 */
	private StudentDao dao = StudentDao.getInstance();

	
	
	/**
	 * 멘토링 회원 등록
	 * @param dto
	 * @return
	 */
	public int StudentInsert(Student dto) {
	
		return dao.insert(dto);
		
	}
	
	public boolean isUser(String id) {
		return dao.isUser(id);
	}
}
