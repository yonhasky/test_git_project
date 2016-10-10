package work.model.dto;

public class Kin {

	private int kNo;
	private String kType;
	private String kTitle;
	private String kAuthor;
	private String kDate;
	private String kContent;
	private int kHit;
	private int kRpl;
	private int kRecommends;
	private String kFile1;
	private String kFile2;
	private int kCount;
	
	public Kin() {}
	
	public Kin(int kNo, String kType, String kTitle, String kAuthor, String kDate, String kContent,
			int kHit, int kRpl, int kRecommends, String kFile1, String kFile2, int kCount) {
		this.kNo = kNo;
		this.kType = kType;
		this.kTitle = kTitle;
		this.kAuthor = kAuthor;
		this.kDate = kDate;
		this.kContent = kContent;
		this.kHit = kHit;
		this.kRpl = kRpl;
		this.kRecommends = kRecommends;
		this.kFile1 = kFile1;
		this.kFile2 = kFile2;
		this.kCount = kCount;
	}

	public int getkNo() {
		return kNo;
	}

	public void setkNo(int kNo) {
		this.kNo = kNo;
	}

	public String getkType() {
		return kType;
	}

	public void setkType(String kType) {
		this.kType = kType;
	}

	public String getkTitle() {
		return kTitle;
	}

	public void setkTitle(String kTitle) {
		this.kTitle = kTitle;
	}

	public String getkAuthor() {
		return kAuthor;
	}

	public void setkAuthor(String kAuthor) {
		this.kAuthor = kAuthor;
	}

	public String getkDate() {
		return kDate;
	}

	public void setkDate(String kDate) {
		this.kDate = kDate;
	}

	public String getkContent() {
		return kContent;
	}

	public void setkContent(String kContent) {
		this.kContent = kContent;
	}

	public int getkHit() {
		return kHit;
	}

	public void setkHit(int kHit) {
		this.kHit = kHit;
	}

	public int getkRpl() {
		return kRpl;
	}

	public void setkRpl(int kRpl) {
		this.kRpl = kRpl;
	}

	public int getkRecommends() {
		return kRecommends;
	}

	public void setkRecommends(int kRecommends) {
		this.kRecommends = kRecommends;
	}

	public String getkFile1() {
		return kFile1;
	}

	public void setkFile1(String kFile1) {
		this.kFile1 = kFile1;
	}

	public String getkFile2() {
		return kFile2;
	}

	public void setkFile2(String kFile2) {
		this.kFile2 = kFile2;
	}
	
	public int getkCount() {
		return kCount;
	}

	public void setkCount(int kCount) {
		this.kCount = kCount;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + kNo;
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
		Kin other = (Kin) obj;
		if (kNo != other.kNo)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Kin [kNo=" + kNo + ", kType=" + kType + ", kTitle=" + kTitle + ", kAuthor=" + kAuthor + ", kDate="
				+ kDate + ", kContent=" + kContent + ", kHit=" + kHit + ", kRpl=" + kRpl + ", kRecommends="
				+ kRecommends + ", kFile1=" + kFile1 + ", kFile2=" + kFile2 + ", kCount=" + kCount + "]";
	}

	
	
	
	
	
}
