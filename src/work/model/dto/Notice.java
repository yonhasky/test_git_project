package work.model.dto;


public class Notice {

	private int nNo;
	private String nTitle;
	private String nContent;
	private String nAuthor;
	private String nDate;
	private String nType;
	private String nFile1;
	private String nFile2;
	private int nHit;
	private int nCount;
		
	public Notice() { }

	public Notice(int nNo, String nTitle, String nContent, String nAuthor, String nDate, String nType, String nFile1, String nFile2, int nHit, int nCount) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nAuthor = nAuthor;
		this.nDate = nDate;
		this.nType = nType;
		this.nFile1 = nFile1;
		this.nFile2 = nFile2;
		this.nHit = nHit;
		this.nCount = nCount;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Notice [nNo=");
		builder.append(nNo);
		builder.append(", nTitle=");
		builder.append(nTitle);
		builder.append(", nContent=");
		builder.append(nContent);
		builder.append(", nAuthor=");
		builder.append(nAuthor);
		builder.append(", nDate=");
		builder.append(nDate);
		builder.append(", nType=");
		builder.append(nType);
		builder.append(", nFile1=");
		builder.append(nFile1);
		builder.append(", nFile2=");
		builder.append(nFile2);
		builder.append(", nHit=");
		builder.append(nHit);
		builder.append(", nCount=");
		builder.append(nCount);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nAuthor == null) ? 0 : nAuthor.hashCode());
		result = prime * result + ((nContent == null) ? 0 : nContent.hashCode());
		result = prime * result + nCount;
		result = prime * result + ((nDate == null) ? 0 : nDate.hashCode());
		result = prime * result + ((nFile1 == null) ? 0 : nFile1.hashCode());
		result = prime * result + ((nFile2 == null) ? 0 : nFile2.hashCode());
		result = prime * result + nHit;
		result = prime * result + nNo;
		result = prime * result + ((nTitle == null) ? 0 : nTitle.hashCode());
		result = prime * result + ((nType == null) ? 0 : nType.hashCode());
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
		Notice other = (Notice) obj;
		if (nAuthor == null) {
			if (other.nAuthor != null)
				return false;
		} else if (!nAuthor.equals(other.nAuthor))
			return false;
		if (nContent == null) {
			if (other.nContent != null)
				return false;
		} else if (!nContent.equals(other.nContent))
			return false;
		if (nCount != other.nCount)
			return false;
		if (nDate == null) {
			if (other.nDate != null)
				return false;
		} else if (!nDate.equals(other.nDate))
			return false;
		if (nFile1 == null) {
			if (other.nFile1 != null)
				return false;
		} else if (!nFile1.equals(other.nFile1))
			return false;
		if (nFile2 == null) {
			if (other.nFile2 != null)
				return false;
		} else if (!nFile2.equals(other.nFile2))
			return false;
		if (nHit != other.nHit)
			return false;
		if (nNo != other.nNo)
			return false;
		if (nTitle == null) {
			if (other.nTitle != null)
				return false;
		} else if (!nTitle.equals(other.nTitle))
			return false;
		if (nType == null) {
			if (other.nType != null)
				return false;
		} else if (!nType.equals(other.nType))
			return false;
		return true;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnAuthor() {
		return nAuthor;
	}

	public void setnAuthor(String nAuthor) {
		this.nAuthor = nAuthor;
	}

	public String getnDate() {
		return nDate;
	}

	public void setnDate(String nDate) {
		this.nDate = nDate;
	}

	public String getnType() {
		return nType;
	}

	public void setnType(String nType) {
		this.nType = nType;
	}

	public String getnFile1() {
		return nFile1;
	}

	public void setnFile1(String nFile1) {
		this.nFile1 = nFile1;
	}

	public String getnFile2() {
		return nFile2;
	}

	public void setnFile2(String nFile2) {
		this.nFile2 = nFile2;
	}

	public int getnHit() {
		return nHit;
	}

	public void setnHit(int nHit) {
		this.nHit = nHit;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	
}
