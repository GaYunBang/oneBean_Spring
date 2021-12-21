package com.ezen.service;

import java.util.List;

import com.ezen.vo.*;

public interface PurchaseService {
	
	public void addCart(CartVO cart) throws Exception;
	
	public List<CartVO> cartList(int midx) throws Exception;
	
	public void cartUpdate(CartVO vo) throws Exception;
	
	public int cartAllCount(int midx) throws Exception;
	
	public void cartButtonDelete(int cartIdx) throws Exception;
	
	public void cartAllDelete(int midx) throws Exception;
	
	public List<TempVO> cartProduct(CartVO vo) throws Exception;
	
	public PayPostVO viewPay(PayPostVO vo) throws Exception;
	
	public PayPostVO viewPayMulti(PayPostVO vo) throws Exception;
	
	public List<PayPostVO> searchOrder(PayPostVO vo) throws Exception;
	
}
