package com.ezen.vo;

import java.util.Date;

public class CommentVO {

	private int comidx;
	private int qidx;
	private String comWriter;
	private String comContents;
	private Date comDate;
	
	
	public int getComidx() {
		return comidx;
	}
	public void setComidx(int comidx) {
		this.comidx = comidx;
	}
	public int getQidx() {
		return qidx;
	}
	public void setQidx(int qidx) {
		this.qidx = qidx;
	}
	public String getComWriter() {
		return comWriter;
	}
	public void setComWriter(String comWriter) {
		this.comWriter = comWriter;
	}
	public String getComContents() {
		return comContents;
	}
	public void setComContents(String comContents) {
		this.comContents = comContents;
	}
	public Date getComDate() {
		return comDate;
	}
	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}
	
	
}
