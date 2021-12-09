package com.ezen.vo;

public class ProductOrderVO {
	private int orderIdx;
	private int midx;
	private int proIdx;
	private int orderCount;
	private int orderPrice;
	private String orderDay;
	
	private String proName;
    private int proPrice;
    private int proPrice2;
    private String proImg;
    private String proContents;
    private String[] cartIdxs;
	
    
	public int getOrderIdx() {
		return orderIdx;
	}
	public void setOrderIdx(int orderIdx) {
		this.orderIdx = orderIdx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getProIdx() {
		return proIdx;
	}
	public void setProIdx(int proIdx) {
		this.proIdx = proIdx;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
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
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProContents() {
		return proContents;
	}
	public void setProContents(String proContents) {
		this.proContents = proContents;
	}
	public String[] getCartIdxs() {
		return cartIdxs;
	}
	public void setCartIdxs(String[] cartIdxs) {
		this.cartIdxs = cartIdxs;
	}
}
