package work.model.service;

import java.util.ArrayList;

import work.model.dao.MentoringDao;
import work.model.dto.Mentoring;
import work.util.Utility;

public class MentoringService {

	/**
	 * 게시판 DAO 클래스
	 */
	private MentoringDao dao = MentoringDao.getInstance();

	/**
	 * 멘토링 회원 등록
	 * @param dto
	 * @return
	 */
	public int Mentoringinsert(Mentoring dto) {
	
		return dao.insert(dto);
	}

	// 게시판 전체조회
	public  ArrayList<Mentoring> memtoringSelectList() {
		return dao.selectList();
	}
	
	//멘토별 멘티리스트
	public  ArrayList<Mentoring> memtoringSelectList(String id) {
		return dao.selectList(id);
	}
	//회원 자신의 멘토링신청조회
	public ArrayList<Mentoring> myList(String id) {
		return dao.myList(id);
	}


	// 게시판 상세조회
	public Mentoring mentroingSelectOne(int mNo) {
		return dao.selectOne(mNo);
	}
	
	// 회원 게시판 수정
	public int boardupdateUser(Mentoring dto) {
		return dao.updateUser(dto);
	}
	
	// 관리자 게시판 수정
	public int boardupdate(Mentoring board) {
		return dao.update(board);
	}

	// 게시글 삭제
	public int deleteMentoring(int mNo) {
		return dao.deleteMentoring(mNo);
	}
	
	public int mentoringAccept(int mNo) {
		return dao.mentoringAccept(mNo);
	}


}
