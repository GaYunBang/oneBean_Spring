package com.ezen.vo;

public class CartVO {
	private int cartIdx;
	private int midx;
	private int proIdx;
	private int cartCount;
	private int cartPrice;
	private String[] cartIdxs;
	
	private String proName;
    private int proPrice;
    private int proPrice2;
    private String proImg;
    
    private int totalPrice;

    
	public int getCartIdx() {
		return cartIdx;
	}

	public void setCartIdx(int cartIdx) {
		this.cartIdx = cartIdx;
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

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	
	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	
	
	//db에 없는 것
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

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cartIdx=" + cartIdx + ", midx=" + midx + ", proIdx=" + proIdx + ", cartCount="
				+ cartCount + ", proName=" + proName + ", proPrice=" + proPrice + ", proPrice2=" + proPrice2
				+ ", totalPrice=" + totalPrice + "]";
	}

	public String[] getCartIdxs() {
		return cartIdxs;
	}

	public void setCartIdxs(String[] cartIdxs) {
		this.cartIdxs = cartIdxs;
	}
}
