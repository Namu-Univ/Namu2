package com.namuuniv.vo;

public class EnrollStuVO {
	
	private int userId;
	private int idx;
	private int grade;
	private int semester;
	private int stuId;
	private String deptName;
	private String stuName;
	private String tel;
	private String gender;
	private String subName;
	private int year;

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	
	@Override
	public String toString() {
		return "EnrollStuVO [userId=" + userId + ", idx=" + idx + ", grade=" + grade + ", semester=" + semester
				+ ", stuId=" + stuId + ", deptName=" + deptName + ", stuName=" + stuName + ", tel=" + tel + ", gender="
				+ gender + ", subName=" + subName + ", year=" + year + "]";
	}

}
