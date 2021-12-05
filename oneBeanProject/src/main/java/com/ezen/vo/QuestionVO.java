package com.ezen.vo;

import java.util.Date;

public class QuestionVO {

	private int qidx;
	private String quesCate;
	private String quesSubject;
	private String quesWriter;
	private Date quesDate;
	private String quesContents;
	private String memberId;
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getQuesCate() {
		return quesCate;
	}
	public void setQuesCate(String quesCate) {
		this.quesCate = quesCate;
	}
	public String getQuesSubject() {
		return quesSubject;
	}
	public void setQuesSubject(String quesSubject) {
		this.quesSubject = quesSubject;
	}
	public String getQuesWriter() {
		return quesWriter;
	}
	public void setQuesWriter(String quesWriter) {
		this.quesWriter = quesWriter;
	}
	public Date getQuesDate() {
		return quesDate;
	}
	public void setQuesDate(Date quesDate) {
		this.quesDate = quesDate;
	}
	public String getQuesContents() {
		return quesContents;
	}
	public void setQuesContents(String quesContents) {
		this.quesContents = quesContents;
	}
	
	
}
