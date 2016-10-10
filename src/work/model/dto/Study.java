package work.model.dto;

import java.io.Serializable;

/*
 * CREATE TABLE STUDIES (
ST_NO	number(10) primary key, -- ���͵� ��ȣ
ST_TITLE	varchar2(100) not null, -- ����
ST_AUTHOR	varchar2(20) not null, -- �ۼ���
ST_DATE		varchar2(15) not null, -- ���͵� �����
ST_PERIOD       varchar2(30) not null, -- ����Ⱓ(2016-03-09 ~ 2016-09-09)
ST_OVERVIEW	varchar2(100) not null, -- ���͵� ����
ST_CONTENT	varchar2(1000) not null, -- ���͵� ����
ST_FILE1	varchar2(100), -- ����1
ST_FILE2	varchar2(100), -- ����2
ST_HIT		number(10) not null, -- ��ȸ��
ST_STATUS	varchar2(1) not null -- ���͵� ������Ȳ ( A: ��û , P : ���� , T : ���� )
);
 */

public class Study implements Serializable{
	private int stNo;
	private String stTitle;
	private String stAuthor;
	private String stDate;
	private String stPeriod;
	private String stOverview;
	private String stContent;
	private String stFile1;
	private String stFile2;
	private int stHit;
	private String stStatus;
	private int stCount;
	
	public Study() { }
	
	public Study(int stNo, String stTitle, String stAuthor, String stDate, String stPeriod, String stOverview,
			String stContent, String stFile1, String stFile2, int stHit, String stStatus, int stCount) {
		this.stNo = stNo;
		this.stTitle = stTitle;
		this.stAuthor = stAuthor;
		this.stDate = stDate;
		this.stPeriod = stPeriod;
		this.stOverview = stOverview;
		this.stContent = stContent;
		this.stFile1 = stFile1;
		this.stFile2 = stFile2;
		this.stHit = stHit;
		this.stStatus = stStatus;
		this.stCount = stCount;
	}

	public int getStNo() {
		return stNo;
	}

	public void setStNo(int stNo) {
		this.stNo = stNo;
	}

	public String getStTitle() {
		return stTitle;
	}

	public void setStTitle(String stTitle) {
		this.stTitle = stTitle;
	}

	public String getStAuthor() {
		return stAuthor;
	}

	public void setStAuthor(String stAuthor) {
		this.stAuthor = stAuthor;
	}

	public String getStDate() {
		return stDate;
	}

	public void setStDate(String stDate) {
		this.stDate = stDate;
	}

	public String getStPeriod() {
		return stPeriod;
	}

	public void setStPeriod(String stPeriod) {
		this.stPeriod = stPeriod;
	}

	public String getStOverview() {
		return stOverview;
	}

	public void setStOverview(String stOverview) {
		this.stOverview = stOverview;
	}

	public String getStContent() {
		return stContent;
	}

	public void setStContent(String stContent) {
		this.stContent = stContent;
	}

	public String getStFile1() {
		return stFile1;
	}

	public void setStFile1(String stFile1) {
		this.stFile1 = stFile1;
	}

	public String getStFile2() {
		return stFile2;
	}

	public void setStFile2(String stFile2) {
		this.stFile2 = stFile2;
	}

	public int getStHit() {
		return stHit;
	}

	public void setStHit(int stHit) {
		this.stHit = stHit;
	}

	public String getStStatus() {
		return stStatus;
	}

	public void setStStatus(String stStatus) {
		this.stStatus = stStatus;
	}

	public int getStCount() {
		return stCount;
	}

	public void setStCount(int stCount) {
		this.stCount = stCount;
	}
}
