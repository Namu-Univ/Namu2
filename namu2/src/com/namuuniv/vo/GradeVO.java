package com.namuuniv.vo;

public class GradeVO {
	private int id;
	private int stu_id;
	private int sub_id;
	private int absent;
	private int midExam;
	private int finExam;
	private int ex_score;
	private String rate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStu_id() {
		return stu_id;
	}
	public void setStu_id(int stu_id) {
		this.stu_id = stu_id;
	}
	public int getSub_id() {
		return sub_id;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	public int getAbsent() {
		return absent;
	}
	public void setAbsent(int absent) {
		this.absent = absent;
	}
	public int getMidExam() {
		return midExam;
	}
	public void setMidExam(int midExam) {
		this.midExam = midExam;
	}
	public int getFinExam() {
		return finExam;
	}
	public void setFinExam(int finExam) {
		this.finExam = finExam;
	}
	public int getEx_score() {
		return ex_score;
	}
	public void setEx_score(int ex_score) {
		this.ex_score = ex_score;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	
	@Override
	public String toString() {
		return "GradeVO [id=" + id + ", stu_id=" + stu_id + ", sub_id=" + sub_id + ", absent=" + absent + ", midExam="
				+ midExam + ", finExam=" + finExam + ", ex_score=" + ex_score + ", rate=" + rate + "]";
	}
	
}
