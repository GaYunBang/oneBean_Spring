package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.PurchaseDAO;
import com.ezen.vo.CartVO;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Autowired
	PurchaseDAO purchaseDAO;

	@Override
	public void addCart(CartVO cart) throws Exception {
		purchaseDAO.addCart(cart);
	}

	@Override
	public List<CartVO> cartList(int midx) throws Exception {
		return purchaseDAO.cartList(midx);
	}

	@Override
	public int cartAllCount(int midx) throws Exception {
		return purchaseDAO.cartAllCount(midx);
	}

	@Override
	public void cartButtonDelete(int cartIdx) throws Exception {
		purchaseDAO.cartButtonDelete(cartIdx);
	}

	@Override
	public void cartAllDelete(int midx) throws Exception {
		purchaseDAO.cartAllDelete(midx);
	}
}
