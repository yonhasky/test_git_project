package work.model.dto;

public class Kinreplie {

	private int rNo;
	private String rTitle;
	private String rAuthor;
	private String rDate;
	private String rContent;
	private String rRecommends;
	private String rFile1;
	private String rFile2;
	private String rConfirm;
	private int kNo;
	
	public Kinreplie() {}
	
	public Kinreplie(int rNo, String rTitle, String rAuthor, String rDate, String rContent,
			String rRecommends, String rFile1, String rFile2, String rConfirm, int kNo) {
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rAuthor = rAuthor;
		this.rDate = rDate;
		this.rContent = rContent;
		this.rRecommends = rRecommends;
		this.rFile1 = rFile1;
		this.rFile2 = rFile2;
		this.rConfirm = rConfirm;
		this.kNo = kNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrAuthor() {
		return rAuthor;
	}

	public void setrAuthor(String rAuthor) {
		this.rAuthor = rAuthor;
	}

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrRecommends() {
		return rRecommends;
	}

	public void setrRecommends(String rRecommends) {
		this.rRecommends = rRecommends;
	}

	public String getrFile1() {
		return rFile1;
	}

	public void setrFile1(String rFile1) {
		this.rFile1 = rFile1;
	}

	public String getrFile2() {
		return rFile2;
	}

	public void setrFile2(String rFile2) {
		this.rFile2 = rFile2;
	}

	public String getrConfirm() {
		return rConfirm;
	}

	public void setrConfirm(String rConfirm) {
		this.rConfirm = rConfirm;
	}

	public int getkNo() {
		return kNo;
	}

	public void setkNo(int kNo) {
		this.kNo = kNo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rNo;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Kinreplie other = (Kinreplie) obj;
		if (rNo != other.rNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Kinreplie [rNo=" + rNo + ", rTitle=" + rTitle + ", rAuthor=" + rAuthor + ", rDate=" + rDate
				+ ", rContent=" + rContent + ", rRecommends=" + rRecommends + ", rFile1=" + rFile1 + ", rFile2="
				+ rFile2 + ", rConfirm=" + rConfirm + ", kNo=" + kNo + "]";
	}
	
	
	
	
}
