package work.model.dto;

import java.io.Serializable;
/*
CREATE TABLE MENTORINGS (
M_NO number(10) primary key, -- ���丵 ��Ī ��ȣ
M_HOST      varchar2(20) not null, -- ���丵 ������
M_ENTRY    varchar2(20) not null, -- ���丵 ������
M_NAME  varchar2(20) not null, -- ���丵 ������ �̸�
M_MAJOR varchar2(20), -- �а�
M_GRADE varchar2(10), -- �й�
M_COMMENT   varchar2(100) not null, -- ���丵 ���� ��û �Ѹ���
M_DATE       varchar2(15) not null, -- ��û��
M_STATUS      varchar2(10) not null -- ���丵 ��û ���/���� ���� (��� : A, �ź� : D)
);
 */
public class Mentoring implements Serializable{

	private int mNo;
	private String mHost;
	private String mEntry;
	private String mName;
	private String mMajor;
	private String mGrade;
	private String mComment;
	private String mDate;
	private String mStatus;
	

	
	public Mentoring() { }



	public Mentoring(int mNo, String mHost, String mEntry, String mName,
			String mMajor, String mGrade, String mComment, String mDate,
			String mStatus) {
		super();
		this.mNo = mNo;
		this.mHost = mHost;
		this.mEntry = mEntry;
		this.mName = mName;
		this.mMajor = mMajor;
		this.mGrade = mGrade;
		this.mComment = mComment;
		this.mDate = mDate;
		this.mStatus = mStatus;
	}



	public int getmNo() {
		return mNo;
	}



	public void setmNo(int mNo) {
		this.mNo = mNo;
	}



	public String getmHost() {
		return mHost;
	}



	public void setmHost(String mHost) {
		this.mHost = mHost;
	}



	public String getmEntry() {
		return mEntry;
	}



	public void setmEntry(String mEntry) {
		this.mEntry = mEntry;
	}



	public String getmName() {
		return mName;
	}



	public void setmName(String mName) {
		this.mName = mName;
	}



	public String getmMajor() {
		return mMajor;
	}



	public void setmMajor(String mMajor) {
		this.mMajor = mMajor;
	}



	public String getmGrade() {
		return mGrade;
	}



	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}



	public String getmComment() {
		return mComment;
	}



	public void setmComment(String mComment) {
		this.mComment = mComment;
	}



	public String getmDate() {
		return mDate;
	}



	public void setmDate(String mDate) {
		this.mDate = mDate;
	}



	public String getmStatus() {
		return mStatus;
	}



	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mentoring [mNo=");
		builder.append(mNo);
		builder.append(", mHost=");
		builder.append(mHost);
		builder.append(", mEntry=");
		builder.append(mEntry);
		builder.append(", mName=");
		builder.append(mName);
		builder.append(", mMajor=");
		builder.append(mMajor);
		builder.append(", mGrade=");
		builder.append(mGrade);
		builder.append(", mComment=");
		builder.append(mComment);
		builder.append(", mDate=");
		builder.append(mDate);
		builder.append(", mStatus=");
		builder.append(mStatus);
		builder.append("]");
		return builder.toString();
	}

	
}