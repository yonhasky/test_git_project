package work.model.dto;

public class Student {

	private String id;
	private String pw;
	private String name;
	private String mobile;
	private String email;
	private int birth;
	private String gender;
	private String major;
	private String division;
	// 학번
	private String grade;
	private String img;
	// 졸업생기준
	private String gDate;
	private String company;
	private String job;
	private String career;
	// 학생, 졸업생, 관리자 구분
	private String part;

	public Student() {
	}

	
	
	
	
	
	public Student(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}






	/**
	 * 재학생 회원
	 * @param id
	 * @param pw
	 * @param name
	 * @param mobile
	 * @param email
	 * @param birth
	 * @param gender
	 * @param major
	 * @param division
	 * @param grade
	 * @param img
	 */
	public Student(String id, String pw, String name, String mobile,
			String email, int birth, String gender, String major,
			String division, String grade, String img) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.major = major;
		this.division = division;
		this.grade = grade;
		this.img = img;
	}


	/**
	 * 졸업생 초기화
	 * @param id
	 * @param pw
	 * @param name
	 * @param mobile
	 * @param email
	 * @param birth
	 * @param gender
	 * @param major
	 * @param division
	 * @param grade
	 * @param img
	 * @param gDate
	 * @param company
	 * @param job
	 * @param career
	 */
	public Student(String id, String pw, String name, String mobile,
			String email, int birth, String gender, String major,
			String division, String grade, String img, String gDate,
			String company, String job, String career) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.major = major;
		this.division = division;
		this.grade = grade;
		this.img = img;
		this.gDate = gDate;
		this.company = company;
		this.job = job;
		this.career = career;
	}






	/**
	 * 전체 초기화 생성자
	 * @param id
	 * @param pw
	 * @param name
	 * @param mobile
	 * @param email
	 * @param birth
	 * @param gender
	 * @param major
	 * @param division
	 * @param grade
	 * @param img
	 * @param gDate
	 * @param company
	 * @param job
	 * @param career
	 * @param part
	 */
	public Student(String id, String pw, String name, String mobile,
			String email, int birth, String gender, String major,
			String division, String grade, String img, String gDate,
			String company, String job, String career, String part) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.birth = birth;
		this.gender = gender;
		this.major = major;
		this.division = division;
		this.grade = grade;
		this.img = img;
		this.gDate = gDate;
		this.company = company;
		this.job = job;
		this.career = career;
		this.part = part;
	}

	
	
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getgDate() {
		return gDate;
	}

	public void setgDate(String gDate) {
		this.gDate = gDate;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	

	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + birth;
		result = prime * result + ((career == null) ? 0 : career.hashCode());
		result = prime * result + ((company == null) ? 0 : company.hashCode());
		result = prime * result
				+ ((division == null) ? 0 : division.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((gDate == null) ? 0 : gDate.hashCode());
		result = prime * result + ((gender == null) ? 0 : gender.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((img == null) ? 0 : img.hashCode());
		result = prime * result + ((job == null) ? 0 : job.hashCode());
		result = prime * result + ((major == null) ? 0 : major.hashCode());
		result = prime * result + ((mobile == null) ? 0 : mobile.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((part == null) ? 0 : part.hashCode());
		result = prime * result + ((pw == null) ? 0 : pw.hashCode());
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
		Student other = (Student) obj;
		if (birth != other.birth)
			return false;
		if (career == null) {
			if (other.career != null)
				return false;
		} else if (!career.equals(other.career))
			return false;
		if (company == null) {
			if (other.company != null)
				return false;
		} else if (!company.equals(other.company))
			return false;
		if (division == null) {
			if (other.division != null)
				return false;
		} else if (!division.equals(other.division))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (gDate == null) {
			if (other.gDate != null)
				return false;
		} else if (!gDate.equals(other.gDate))
			return false;
		if (gender == null) {
			if (other.gender != null)
				return false;
		} else if (!gender.equals(other.gender))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (img == null) {
			if (other.img != null)
				return false;
		} else if (!img.equals(other.img))
			return false;
		if (job == null) {
			if (other.job != null)
				return false;
		} else if (!job.equals(other.job))
			return false;
		if (major == null) {
			if (other.major != null)
				return false;
		} else if (!major.equals(other.major))
			return false;
		if (mobile == null) {
			if (other.mobile != null)
				return false;
		} else if (!mobile.equals(other.mobile))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (part == null) {
			if (other.part != null)
				return false;
		} else if (!part.equals(other.part))
			return false;
		if (pw == null) {
			if (other.pw != null)
				return false;
		} else if (!pw.equals(other.pw))
			return false;
		return true;
	}






	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Student [id=");
		builder.append(id);
		builder.append(", pw=");
		builder.append(pw);
		builder.append(", name=");
		builder.append(name);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", email=");
		builder.append(email);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", major=");
		builder.append(major);
		builder.append(", division=");
		builder.append(division);
		builder.append(", grade=");
		builder.append(grade);
		builder.append(", img=");
		builder.append(img);
		builder.append(", gDate=");
		builder.append(gDate);
		builder.append(", company=");
		builder.append(company);
		builder.append(", job=");
		builder.append(job);
		builder.append(", career=");
		builder.append(career);
		builder.append(", part=");
		builder.append(part);
		builder.append("]");
		return builder.toString();
	}

}
