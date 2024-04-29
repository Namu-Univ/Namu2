package com.namuuniv.vo;

public class SubjectVO {
	private int id;
	private String deptName;
	private int deptId;
	private int professorId;
	private String name;
	private String room;
	private String type;
	private int year;
	private int semester;
	private String time;
	private int grades;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public int getProfessorId() {
		return professorId;
	}
	public void setProfessorId(int professorId) {
		this.professorId = professorId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getGrades() {
		return grades;
	}
	public void setGrades(int grades) {
		this.grades = grades;
	}
	
	@Override
	public String toString() {
		return "SubjectVO [id=" + id + ", deptId=" + deptId + ", deptName=" + deptName + ", professorId=" + professorId
				+ ", name=" + name + ", room=" + room + ", type=" + type + ", year=" + year + ", semester=" + semester
				+ ", time=" + time + ", grades=" + grades + "]";
	}

}
