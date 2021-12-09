package com.ezen.vo;

import java.util.Date;

public class QuestionVO {

	private int qidx;
	private int midx;
	private String quesCate;
	private String quesSubject;
	private String quesWriter;
	private Date quesDate;
	private String quesContents;
	private String memberId;
	private int commentCnt;
	private String quesDel;
	
	
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	public String getQuesDel() {
		return quesDel;
	}
	public void setQuesDel(String quesDel) {
		this.quesDel = quesDel;
	}
}
