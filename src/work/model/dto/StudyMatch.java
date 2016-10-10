package work.model.dto;

import java.io.Serializable;

/* CREATE TABLE STUDYMATCHES (
STM_NO	number(10) primary key,
STM_HOST	varchar2(20) not null,	-- 스터디 주최자
STM_ENTRY	varchar2(20) not null,	-- 스터디 참가자           
STM_ENTRY_COMMENT	varchar2(100) not null,    -- 스터디 참가 신청 한마디
STM_ENTRY_DATE	varchar2(15) not null,       -- 스터디 신청일
STM_ENTRY_STATUS	varchar2(1) not null,    -- 스터디 신청 허락/거절 여부
ST_NO	number(10) not null,
FOREIGN KEY(ST_NO) REFERENCES STUDIES(ST_NO)
); 

*/
public class StudyMatch implements Serializable{
	private int stmNo;
	private String stmHost;
	private String stmEntry;
	private String stmEntryComment;
	private String stmEntryDate;
	private String stmEntryStatus;
	
	public StudyMatch() { }
	
	public StudyMatch(int stmNo, String stmHost, String stmEntry, String stmEntryComment, String stmEntryDate,
			String stmEntryStatus) {
		this.stmNo = stmNo;
		this.stmHost = stmHost;
		this.stmEntry = stmEntry;
		this.stmEntryComment = stmEntryComment;
		this.stmEntryDate = stmEntryDate;
		this.stmEntryStatus = stmEntryStatus;
	}

	public int getStmNo() {
		return stmNo;
	}

	public void setStmNo(int stmNo) {
		this.stmNo = stmNo;
	}

	public String getStmHost() {
		return stmHost;
	}

	public void setStmHost(String stmHost) {
		this.stmHost = stmHost;
	}

	public String getStmEntry() {
		return stmEntry;
	}

	public void setStmEntry(String stmEntry) {
		this.stmEntry = stmEntry;
	}

	public String getStmEntryComment() {
		return stmEntryComment;
	}

	public void setStmEntryComment(String stmEntryComment) {
		this.stmEntryComment = stmEntryComment;
	}

	public String getStmEntryDate() {
		return stmEntryDate;
	}

	public void setStmEntryDate(String stmEntryDate) {
		this.stmEntryDate = stmEntryDate;
	}

	public String getStmEntryStatus() {
		return stmEntryStatus;
	}

	public void setStmEntryStatus(String stmEntryStatus) {
		this.stmEntryStatus = stmEntryStatus;
	}

	@Override
	public String toString() {
		return "StudyMatch [stmNo=" + stmNo + ", stmHost=" + stmHost + ", stmEntry=" + stmEntry + ", stmEntryComment="
				+ stmEntryComment + ", stmEntryDate=" + stmEntryDate + ", stmEntryStatus=" + stmEntryStatus + ", stNo="
			 + "]";
	}
	
	
}
