package com.namuuniv.vo;

public class StuSubjectVO {
	private int stuId; 
	private int year; 
	private int semester;
	private String subName;
	private int rate;
	
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	@Override
	public String toString() {
		return "StuSubjectVO [stuId=" + stuId + ", year=" + year + ", semester=" + semester + ", subName=" + subName
				+ ", rate=" + rate + "]";
	}  
}
