package com.namuuniv.vo;

public class GradeVO {
	private int gradeId;
	private int stuId;
	private int subId;
	private int absent;
	private int midExam;
	private int finExam;
	private double exScore;
	private String rate;
	
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getSubId() {
		return subId;
	}
	public void setSubId(int subId) {
		this.subId = subId;
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
	public double getExScore() {
		return exScore;
	}
	public void setExScore(double exScore) {
		this.exScore = exScore;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	
	@Override
	public String toString() {
		return "GradeVO [gradeId=" + gradeId + ", stuId=" + stuId + ", subId=" + subId + ", absent=" + absent
				+ ", midExam=" + midExam + ", finExam=" + finExam + ", exScore=" + exScore + ", rate=" + rate + "]";
	}
}
