package work.model.dto;

import java.io.Serializable;

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
	
	public Study() { }
	
	public Study(int stNo, String stTitle, String stAuthor, String stDate, String stPeriod, String stOverview,
			String stContent, String stFile1, String stFile2, int stHit, String stStatus) {
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
	}
	
	
}
