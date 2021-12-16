package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.*;

@Repository
public class PurchaseDAO {
	@Autowired
	SqlSession sql;
	
	private static final String Namespace = "com.ezen.mapper.CartMapper";
	private static final String Namespace2 = "com.ezen.mapper.PayPostMapper";
	
	public void addCart(CartVO cart) throws Exception {
		sql.insert(Namespace+".addCart",cart);
	}
	
	public List<CartVO> cartList(int midx) throws Exception {
		return sql.selectList(Namespace+".cartList",midx);
	}
	
	public void cartUpdate(CartVO vo) throws Exception {
		sql.update(Namespace+".cartUpdate", vo);
	}
	
	public int cartAllCount(int midx) throws Exception {
		return sql.selectOne(Namespace+".cartAllCount", midx);
	}
	
	public void cartAllDelete(int midx) throws Exception{
		sql.delete(Namespace+".cartAllDelete", midx);
	}
	
	public void cartButtonDelete(int cartIdx) throws Exception{
		sql.delete(Namespace+".cartButtonDelete", cartIdx);
	}
	
	public List<TempVO> cartProduct(CartVO vo) throws Exception {
		return sql.selectList(Namespace2+".cartProduct",vo);
	}
	
	public PayPostVO viewPay(PayPostVO vo) throws Exception {
		sql.insert(Namespace2+".addPay", vo);
		sql.insert(Namespace2+".addPayDetail", vo);
		sql.insert(Namespace2+".addPost",vo);
		return sql.selectOne(Namespace2+".viewPay", vo);
	}
	
	
	public PayPostVO viewPayMulti(PayPostVO vo) throws Exception {
		sql.insert(Namespace2+".addPay", vo);
		sql.insert(Namespace2+".addPayMultiDetail", vo);
		sql.insert(Namespace2+".addPost",vo);
		return sql.selectOne(Namespace2+".viewPay", vo);
	}
}
