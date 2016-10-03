package work.model.dto;

import java.io.Serializable;

/*
  	CREATE TABLE MENTOMATCHES (
			MM_NO number(10) primary key, -- 멘토링 매칭 번호
			MM_HOST		varchar2(20) not null, -- 멘토링 주최자
			MM_ENTRY 	varchar2(20) not null, -- 멘토링 참가자
			MM_ENTRY_COMMENT	varchar2(100) not null, -- 멘토링 참가 신청 한마디
			MM_ENTRY_DATE 		varchar2(15) not null, -- 신청일
			MM_ENTRY_STATUS		varchar2(1) not null, -- 멘토링 신청 허락/거절 여부 (허락 : A, 거부 : D)
			M_NO 		number(10) not null,
			FOREIGN KEY(M_NO) REFERENCES MENTORINGS(M_NO)
		);

 */
public class MentoMatch implements Serializable{
	
	private int mmNo; 
	private String mmHost; 
	private String mmEntry; 
	private String mmEntryComment;
	private String mmEntryDate;
	private String mmEntryStatus;
	private int mNo;
	public MentoMatch() {
		super();
	}
	public MentoMatch(int mmNo, String mmHost, String mmEntry, String mmEntryComment, String mmEntryDate,
			String mmEntryStatus, int mNo) {
		super();
		this.mmNo = mmNo;
		this.mmHost = mmHost;
		this.mmEntry = mmEntry;
		this.mmEntryComment = mmEntryComment;
		this.mmEntryDate = mmEntryDate;
		this.mmEntryStatus = mmEntryStatus;
		this.mNo = mNo;
	}
	public int getMmNo() {
		return mmNo;
	}
	public void setMmNo(int mmNo) {
		this.mmNo = mmNo;
	}
	public String getMmHost() {
		return mmHost;
	}
	public void setMmHost(String mmHost) {
		this.mmHost = mmHost;
	}
	public String getMmEntry() {
		return mmEntry;
	}
	public void setMmEntry(String mmEntry) {
		this.mmEntry = mmEntry;
	}
	public String getMmEntryComment() {
		return mmEntryComment;
	}
	public void setMmEntryComment(String mmEntryComment) {
		this.mmEntryComment = mmEntryComment;
	}
	public String getMmEntryDate() {
		return mmEntryDate;
	}
	public void setMmEntryDate(String mmEntryDate) {
		this.mmEntryDate = mmEntryDate;
	}
	public String getMmEntryStatus() {
		return mmEntryStatus;
	}
	public void setMmEntryStatus(String mmEntryStatus) {
		this.mmEntryStatus = mmEntryStatus;
	}
	public int getmNo() {
		return mNo;
	}
	public void setmNo(int mNo) {
		this.mNo = mNo;
	}
	
	@Override
	public String toString() {
		return "MentoMatch [mmNo=" + mmNo + ", mmHost=" + mmHost + ", mmEntry=" + mmEntry + ", mmEntryComment="
				+ mmEntryComment + ", mmEntryDate=" + mmEntryDate + ", mmEntryStatus=" + mmEntryStatus + ", mNo=" + mNo
				+ "]";
	}
}
