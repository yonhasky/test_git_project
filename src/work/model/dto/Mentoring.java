package work.model.dto;

import java.io.Serializable;
/*
 CREATE TABLE STUDIES (
ST_NO	number(10) primary key, -- 스터디 번호
ST_TITLE	varchar2(100) not null, -- 제목
ST_AUTHOR	varchar2(20) not null, -- 작성자
ST_DATE		varchar2(15) not null, -- 스터디 등록일
ST_PERIOD       varchar2(30) not null, -- 수행기간(2016-03-09 ~ 2016-09-09)
ST_OVERVIEW	varchar2(100) not null, -- 스터디 개요
ST_CONTENT	varchar2(1000) not null, -- 스터디 내용
ST_FILE1	varchar2(100), -- 파일1
ST_FILE2	varchar2(100), -- 파일2
ST_HIT		number(10) not null, -- 조회수
ST_STATUS	varchar2(1) not null -- 스터디 진행현황 ( A: 신청 , P : 진행 , T : 종료 )
);
 */
public class Mentoring implements Serializable{

	private int mNo;
	private String mTitle;
	private String mAuthor;
	private String mDate;
	private String mPeriod;
	private String mOverview;
	private String mContent;
	private String mFile1;
	private String mFile2;
	private int mHit;
	private String mStatus;
		
	public Mentoring() { }

	public Mentoring(int mNo, String mTitle, String mAuthor, String mDate, String mPeriod, String mOverview,
			String mContent, String mFile1, String mFile2, int mHit, String mStatus) {
		this.mNo = mNo;
		this.mTitle = mTitle;
		this.mAuthor = mAuthor;
		this.mDate = mDate;
		this.mPeriod = mPeriod;
		this.mOverview = mOverview;
		this.mContent = mContent;
		this.mFile1 = mFile1;
		this.mFile2 = mFile2;
		this.mHit = mHit;
		this.mStatus = mStatus;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmTitle() {
		return mTitle;
	}

	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}

	public String getmAuthor() {
		return mAuthor;
	}

	public void setmAuthor(String mAuthor) {
		this.mAuthor = mAuthor;
	}

	public String getmDate() {
		return mDate;
	}

	public void setmDate(String mDate) {
		this.mDate = mDate;
	}

	public String getmPeriod() {
		return mPeriod;
	}

	public void setmPeriod(String mPeriod) {
		this.mPeriod = mPeriod;
	}

	public String getmOverview() {
		return mOverview;
	}

	public void setmOverview(String mOverview) {
		this.mOverview = mOverview;
	}

	public String getmContent() {
		return mContent;
	}

	public void setmContent(String mContent) {
		this.mContent = mContent;
	}

	public String getmFile1() {
		return mFile1;
	}

	public void setmFile1(String mFile1) {
		this.mFile1 = mFile1;
	}

	public String getmFile2() {
		return mFile2;
	}

	public void setmFile2(String mFile2) {
		this.mFile2 = mFile2;
	}

	public int getmHit() {
		return mHit;
	}

	public void setmHit(int mHit) {
		this.mHit = mHit;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	@Override
	public String toString() {
		return "Mentoring [mNo=" + mNo + ", mTitle=" + mTitle + ", mAuthor=" + mAuthor + ", mDate=" + mDate
				+ ", mPeriod=" + mPeriod + ", mOverview=" + mOverview + ", mContent=" + mContent + ", mFile1=" + mFile1
				+ ", mFile2=" + mFile2 + ", mHit=" + mHit + ", mStatus=" + mStatus + "]";
	}
}