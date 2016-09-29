package work.model.dto;

public class Mentoring {

	int mNo;
	String mTitle;
	String mAuthor;
	String mDate;
	String mPeriod;
	String mOverview;
	String mContent;
	String mFile1;
	String mFile2;
	int mHit;
	
	
	public Mentoring(int mNo, String mTitle, String mAuthor, String mDate,
			String mPeriod, String mOverview, String mContent, String mFile1,
			String mFile2, int mHit) {
		super();
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


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mAuthor == null) ? 0 : mAuthor.hashCode());
		result = prime * result
				+ ((mContent == null) ? 0 : mContent.hashCode());
		result = prime * result + ((mDate == null) ? 0 : mDate.hashCode());
		result = prime * result + ((mFile1 == null) ? 0 : mFile1.hashCode());
		result = prime * result + ((mFile2 == null) ? 0 : mFile2.hashCode());
		result = prime * result + mHit;
		result = prime * result + mNo;
		result = prime * result
				+ ((mOverview == null) ? 0 : mOverview.hashCode());
		result = prime * result + ((mPeriod == null) ? 0 : mPeriod.hashCode());
		result = prime * result + ((mTitle == null) ? 0 : mTitle.hashCode());
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
		Mentoring other = (Mentoring) obj;
		if (mAuthor == null) {
			if (other.mAuthor != null)
				return false;
		} else if (!mAuthor.equals(other.mAuthor))
			return false;
		if (mContent == null) {
			if (other.mContent != null)
				return false;
		} else if (!mContent.equals(other.mContent))
			return false;
		if (mDate == null) {
			if (other.mDate != null)
				return false;
		} else if (!mDate.equals(other.mDate))
			return false;
		if (mFile1 == null) {
			if (other.mFile1 != null)
				return false;
		} else if (!mFile1.equals(other.mFile1))
			return false;
		if (mFile2 == null) {
			if (other.mFile2 != null)
				return false;
		} else if (!mFile2.equals(other.mFile2))
			return false;
		if (mHit != other.mHit)
			return false;
		if (mNo != other.mNo)
			return false;
		if (mOverview == null) {
			if (other.mOverview != null)
				return false;
		} else if (!mOverview.equals(other.mOverview))
			return false;
		if (mPeriod == null) {
			if (other.mPeriod != null)
				return false;
		} else if (!mPeriod.equals(other.mPeriod))
			return false;
		if (mTitle == null) {
			if (other.mTitle != null)
				return false;
		} else if (!mTitle.equals(other.mTitle))
			return false;
		return true;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Mentoring [mNo=");
		builder.append(mNo);
		builder.append(", mTitle=");
		builder.append(mTitle);
		builder.append(", mAuthor=");
		builder.append(mAuthor);
		builder.append(", mDate=");
		builder.append(mDate);
		builder.append(", mPeriod=");
		builder.append(mPeriod);
		builder.append(", mOverview=");
		builder.append(mOverview);
		builder.append(", mContent=");
		builder.append(mContent);
		builder.append(", mFile1=");
		builder.append(mFile1);
		builder.append(", mFile2=");
		builder.append(mFile2);
		builder.append(", mHit=");
		builder.append(mHit);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
}
