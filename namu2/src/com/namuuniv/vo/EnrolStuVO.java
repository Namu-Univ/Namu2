package com.namuuniv.vo;

public class EnrolStuVO {
	private int stu_id;
	private int year;
	private int semester;
	private String subName;
	private String room;
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
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
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
	@Override
	public String toString() {
		return "GradeVO [stu_id=" + stu_id + ", year=" + year + ", semester=" + semester + ", subName=" + subName
				+ ", room=" + room + "]";
	}

	
}
