package work.model.dto;


public class Recommend {

	private int rNo;
	private String rTitle;
	private String rContent;
	private String rAuthor;
	private String rDate;
	private String rType;
	private String rFile1;
	private String rFile2;
	private int rHit;
	private int rCount;
		
	public Recommend() { }

	public Recommend(int rNo, String rTitle, String rContent, String rAuthor, String rDate, String rType, String rFile1,
			String rFile2, int rHit, int rCount) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rAuthor = rAuthor;
		this.rDate = rDate;
		this.rType = rType;
		this.rFile1 = rFile1;
		this.rFile2 = rFile2;
		this.rHit = rHit;
		this.rCount = rCount;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Recommend [rNo=");
		builder.append(rNo);
		builder.append(", rTitle=");
		builder.append(rTitle);
		builder.append(", rContent=");
		builder.append(rContent);
		builder.append(", rAuthor=");
		builder.append(rAuthor);
		builder.append(", rDate=");
		builder.append(rDate);
		builder.append(", rType=");
		builder.append(rType);
		builder.append(", rFile1=");
		builder.append(rFile1);
		builder.append(", rFile2=");
		builder.append(rFile2);
		builder.append(", rHit=");
		builder.append(rHit);
		builder.append(", rCount=");
		builder.append(rCount);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((rAuthor == null) ? 0 : rAuthor.hashCode());
		result = prime * result + ((rContent == null) ? 0 : rContent.hashCode());
		result = prime * result + rCount;
		result = prime * result + ((rDate == null) ? 0 : rDate.hashCode());
		result = prime * result + ((rFile1 == null) ? 0 : rFile1.hashCode());
		result = prime * result + ((rFile2 == null) ? 0 : rFile2.hashCode());
		result = prime * result + rHit;
		result = prime * result + rNo;
		result = prime * result + ((rTitle == null) ? 0 : rTitle.hashCode());
		result = prime * result + ((rType == null) ? 0 : rType.hashCode());
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
		Recommend other = (Recommend) obj;
		if (rAuthor == null) {
			if (other.rAuthor != null)
				return false;
		} else if (!rAuthor.equals(other.rAuthor))
			return false;
		if (rContent == null) {
			if (other.rContent != null)
				return false;
		} else if (!rContent.equals(other.rContent))
			return false;
		if (rCount != other.rCount)
			return false;
		if (rDate == null) {
			if (other.rDate != null)
				return false;
		} else if (!rDate.equals(other.rDate))
			return false;
		if (rFile1 == null) {
			if (other.rFile1 != null)
				return false;
		} else if (!rFile1.equals(other.rFile1))
			return false;
		if (rFile2 == null) {
			if (other.rFile2 != null)
				return false;
		} else if (!rFile2.equals(other.rFile2))
			return false;
		if (rHit != other.rHit)
			return false;
		if (rNo != other.rNo)
			return false;
		if (rTitle == null) {
			if (other.rTitle != null)
				return false;
		} else if (!rTitle.equals(other.rTitle))
			return false;
		if (rType == null) {
			if (other.rType != null)
				return false;
		} else if (!rType.equals(other.rType))
			return false;
		return true;
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

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
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

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
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

	public int getrHit() {
		return rHit;
	}

	public void setrHit(int rHit) {
		this.rHit = rHit;
	}

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}


}
