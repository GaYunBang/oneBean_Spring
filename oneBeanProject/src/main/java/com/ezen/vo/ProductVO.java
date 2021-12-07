package com.ezen.vo;

import java.util.Date;

public class ProductVO {

	private int proIdx;
	private String proType;
	private String proName;
	private int proPrice;
	private int proPrice2;
	private String proContents;
	private int proStock;
	private Date proDate;
	private String proDel;
	private String proImg;
	private String proDetailImg;
	private String newProYN;
	private String newProThumb;

	public int getProIdx() {
		return proIdx;
	}
	public void setProIdx(int proIdx) {
		this.proIdx = proIdx;
	}
	public String getProType() {
		return proType;
	}
	public void setProType(String proType) {
		this.proType = proType;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getProPrice2() {
		return proPrice2;
	}
	public void setProPrice2(int proPrice2) {
		this.proPrice2 = proPrice2;
	}
	public String getProContents() {
		return proContents;
	}
	public void setProContents(String proContents) {
		this.proContents = proContents;
	}
	public int getProStock() {
		return proStock;
	}
	public void setProStock(int proStock) {
		this.proStock = proStock;
	}
	public Date getProDate() {
		return proDate;
	}
	public void setProDate(Date proDate) {
		this.proDate = proDate;
	}
	public String getProDel() {
		return proDel;
	}
	public void setProDel(String proDel) {
		this.proDel = proDel;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProDetailImg() {
		return proDetailImg;
	}
	public void setProDetailImg(String proDetailImg) {
		this.proDetailImg = proDetailImg;
	}
	public String getNewProYN() {
		return newProYN;
	}
	public void setNewProYN(String newProYN) {
		this.newProYN = newProYN;
	}
	public String getNewProThumb() {
		return newProThumb;
	}
	public void setNewProThumb(String newProThumb) {
		this.newProThumb = newProThumb;
	}
	/*
	@Override
	public String toString() {
		return "ProductVO [proIdx=" + proIdx + ", proType=" + proType + ", proName=" + proName + ", proPrice="
				+ proPrice + ", proPrice2=" + proPrice2 + ", proContents=" + proContents + ", proStock=" + proStock
				+ ", proDate=" + proDate + ", proDel=" + proDel + ", proImg=" + proImg + ", proDetailImg=" + proDetailImg +"]";
	}*/
	
	
}
