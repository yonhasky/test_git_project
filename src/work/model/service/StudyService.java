package work.model.service;

import java.util.ArrayList;

import work.model.dao.StudyDao;
import work.model.dto.Note;
import work.model.dto.Study;
import work.model.dto.StudyMatch;

public class StudyService {
	private StudyDao dao = StudyDao.getInstance();
	
	public int insertStudy(Study dto) {
		return dao.insertStudy(dto);
	}
	
	public ArrayList selectStudy(String stNo) {
		return dao.selectStudy(stNo);
	}
	
	public ArrayList<Study> selectStudyList(String pageNum) {
		return dao.selectStudyList(pageNum);
	}
	
	public ArrayList<Study> selectKeywordList(String pageNum, String type, String keyword) {
		return dao.selectKeywordList(pageNum, type, keyword);
	}
	
	public int deleteStudy(String stNo) {
		return dao.deleteStudy(stNo);
	}
	
	public int updateStudy(String stPeriod, String stTitle, String stOverview, String stContent, String stFile1, String stFile2, String stStatus, String stNo) {
		return dao.updateStudy(stPeriod, stTitle, stOverview, stContent, stFile1, stFile2, stStatus, stNo);
	}
	
	public int addStudyMatch(StudyMatch dto, String stNo, String stmTitle) {
		return dao.addStudyMatch(dto, stNo, stmTitle);
	}
	
	public int sendNote(Note dto) {
		return dao.sendNote(dto);
	}
	
	public int updateStatus(String status, String stNo, String stmEntry) {
		return dao.updateStatus(status, stNo, stmEntry);
	}
	
	public ArrayList<Note> searchNoteList(String receiver) {
		return dao.searchNoteList(receiver);
	}
}
 