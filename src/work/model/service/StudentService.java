package work.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import work.model.dao.StudentDao;
import work.model.dto.Student;

public class StudentService {

	/**
	 * �Խ��� DAO Ŭ����
	 */
	private StudentDao dao = StudentDao.getInstance();

	/**
	 * ȸ�� ���(ȸ������)
	 * 
	 * @param dto
	 * @return
	 */
	public int StudentInsert(Student dto) {

		return dao.insert(dto);

	}

	/**
	 * ���̵� �ߺ���ȸ
	 * 
	 * @param id
	 * @return
	 */
	public boolean isUser(String id) {
		return dao.isUser(id);
	}

	/**
	 * ��й�ȣ üũ
	 * 
	 * @param id
	 * @return
	 */
	public boolean isPw(String id, String pw) {
	
		return dao.isPw(id, pw);
	}

	
	/**
	 * ȸ�� �α���
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public HashMap<String, String> login(String id, String pw) {
		return dao.login(id, pw);
	}

	/**
	 * ȸ�� ��ü��ȸ
	 * 
	 * @return
	 */
	public ArrayList<Student> selectList() {
		return dao.selectList();
	}

	/**
	 * ȸ�� ����ȸ
	 * 
	 * @param id
	 * @return
	 */
	public Student selectOne(String id) {
		return dao.selectOne(id);
	}

	/**
	 * ȸ�� - ȸ����������
	 * 
	 * @param dto
	 * @return
	 */
	public int updateStudent(Student dto) {
		return dao.updateUser(dto);

	}

	/**
	 * ������- ȸ�� ��ü���� ����
	 * 
	 * @param dto
	 * @return
	 */
	public int update(Student dto) {
		return dao.update(dto);

	}

	/**
	 * ȸ��- ȸ��Ż��
	 * 
	 * @param id
	 * @param pw
	 * @return
	 */
	public int delete(String id, String pw) {
		return dao.delete(id, pw);

	}

	/**
	 * ������ - ȸ������
	 * 
	 * @param id
	 * @return
	 */
	public int delete(String id) {
		return dao.delete(id);

	}
	
	/**
	 * ��й�ȣ ����
	 * @param id
	 * @param pw
	 * @param newPw
	 * @return
	 */
	public int updatePw(String id, String pw, String newPw) {
		return dao.updatePw(id, pw, newPw);
	}
	
	public ArrayList<Student> graduationList(String major) {
		return dao.graduationList(major);
	}



}
