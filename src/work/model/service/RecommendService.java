package work.model.service;

import java.util.ArrayList;

import work.model.dao.RecommendDao;
import work.model.dto.Recommend;



public class RecommendService {
	
	RecommendDao dao = RecommendDao.getInstance();
	
	public ArrayList<Recommend> selectRecommendList(String pageNum) {
		return dao.selectRecommendList(pageNum);
	}
	
	public int insertRecommend(String rTitle, String rContent, String rAuthor, String rType, String rFile1, String rFile2) {
		return dao.insertRecommend(rTitle, rContent, rAuthor, rType, rFile1, rFile2);
	}
	
	public Recommend selectRecommend(String recommendNum, int flag) {
		return dao.selectRecommend(recommendNum, flag);
	}
	
	public int updateRecommend(String rTitle, String rContent, String rType, String recommendNum, String rFile1, String rFile2) {
		return dao.updateRecommend(rTitle, rContent, rType, recommendNum, rFile1, rFile2);
	}
	
	public int deleteRecommend(String recommendNum) {
		return dao.deleteRecommend(recommendNum);
	}
	
	public ArrayList<Recommend> selectRecommendListSearch(String pageNum, String sType, String sTitle) {
		return dao.selectRecommendListSearch(pageNum, sType, sTitle);
	}
	
}
