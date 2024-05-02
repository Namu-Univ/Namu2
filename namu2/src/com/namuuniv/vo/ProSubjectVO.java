package com.namuuniv.vo;

public class ProSubjectVO {
	
	private int subId;
	private int year;
	private int semester;
	private String deptName;
	private String subName;
	private String room;
	private int grades;	
	private String type;
	private String time;
	
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
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
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public int getGrades() {
		return grades;
	}
	public void setGrades(int grades) {
		this.grades = grades;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	@Override
	public String toString() {
		return "ProSubjectVO [subId=" + subId + ", year=" + year + ", semester=" + semester + ", deptName=" + deptName
				+ ", subName=" + subName + ", room=" + room + ", grades=" + grades + ", type=" + type + ", time=" + time
				+ "]";
	}

}
