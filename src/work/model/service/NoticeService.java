package work.model.service;

import java.util.ArrayList;

import work.model.dao.NoticeDao;
import work.model.dto.Notice;


public class NoticeService {
	
	NoticeDao dao = NoticeDao.getInstance();
	
	public ArrayList<Notice> selectNoticeList(String pageNum) {
		return dao.selectNoticeList(pageNum);
	}
	
	public int insertNotice(String nTitle, String nContent, String nAuthor, String nType, String nFile1, String nFile2) {
		return dao.insertNotice(nTitle, nContent, nAuthor, nType, nFile1, nFile2);
	}
	
	public Notice selectNotice(String noticeNum, int flag) {
		return dao.selectNotice(noticeNum, flag);
	}
	
	public int updateNotice(String nTitle, String nContent, String nType, String noticeNum, String nFile1, String nFile2) {
		return dao.updateNotice(nTitle, nContent, nType, noticeNum, nFile1, nFile2);
	}
	
	public int deleteNotice(String noticeNum) {
		return dao.deleteNotice(noticeNum);
	}
	
	public ArrayList<Notice> selectNoticeListSearch(String pageNum, String sType, String sTitle) {
		return dao.selectNoticeListSearch(pageNum, sType, sTitle);
	}
	
}
