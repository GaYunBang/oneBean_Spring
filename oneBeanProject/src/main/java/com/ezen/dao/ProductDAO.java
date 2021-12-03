package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	SqlSession sql;
	
	private static final String Namespace = "com.ezen.mapper.ProductMapper";
	
	public List<ProductVO> proListAll() throws Exception {
		return sql.selectList(Namespace+".proListAll");
	}
	
	public ProductVO proDetail(int proIdx) throws Exception {
		return sql.selectOne(Namespace+".proDetail",proIdx);
	}
	
	public int proListAllCount() throws Exception {
		return sql.selectOne(Namespace+".proListAllCount");
	}
}
