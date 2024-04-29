package com.namuuniv.vo;

public class EduStatusVO {

	private int idx;
	private int id;
	private String status;
	private String startYear;
	private String startSemester;
	private String finishYear;
	private String finisthSemester;
	private String approvalStatus;
	private String reporingDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	public String getStartSemester() {
		return startSemester;
	}

	public void setStartSemester(String startSemester) {
		this.startSemester = startSemester;
	}

	public String getFinishYear() {
		return finishYear;
	}

	public void setFinishYear(String finishYear) {
		this.finishYear = finishYear;
	}

	public String getFinisthSemester() {
		return finisthSemester;
	}

	public void setFinisthSemester(String finisthSemester) {
		this.finisthSemester = finisthSemester;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getReporingDate() {
		return reporingDate;
	}

	public void setReporingDate(String reporingDate) {
		this.reporingDate = reporingDate;
	}

	@Override
	public String toString() {
		return "EduStatusVO [idx=" + idx + ", id=" + id + ", status=" + status + ", startYear=" + startYear
				+ ", startSemester=" + startSemester + ", finishYear=" + finishYear + ", finisthSemester="
				+ finisthSemester + ", approvalStatus=" + approvalStatus + ", reporingDate=" + reporingDate + "]";
	}

}
