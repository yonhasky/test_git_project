package work.model.service;

import java.util.ArrayList;
import work.model.dao.StudyDao;
import work.model.dto.Study;

public class StudyService {
	private StudyDao dao = StudyDao.getInstance();
	
	public int insertStudy(Study dto) {
		return dao.insertStudy(dto);
	}
	
	public Study selectStudy(String stNo) {
		return dao.selectStudy(stNo);
	}
	
	public ArrayList<Study> selectStudyList() {
		return dao.selectStudyList();
	}
	
	public int deleteStudy(String stNo) {
		return dao.deleteStudy(stNo);
	}
	
	public int updateStudy(String stTitle, String stOverview, String stContent, String stFile1, String stFile2, String stStatus, String stNo) {
		return dao.updateStudy(stTitle, stOverview, stContent, stFile1, stFile2, stStatus, stNo);
	}
}
 