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
	
	public void addCart(CartVO cart) throws Exception {
		sql.insert(Namespace+".addCart",cart);
	}
	
	public List<CartVO> cartList(int midx) throws Exception {
		return sql.selectList(Namespace+".cartList",midx);
	}
	
	public int cartAllCount(int midx) throws Exception {
		return sql.selectOne(Namespace+".cartAllCount", midx);
	}
	
	public void cartAllDelete(int midx) {
		sql.delete(Namespace+".cartAllDelete", midx);
	}
	
	public void cartButtonDelete(int cartIdx) {
		sql.delete(Namespace+".cartButtonDelete", cartIdx);
	}
}
