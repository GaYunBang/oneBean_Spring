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
	
	public List<ProductVO> coffeeProList() throws Exception {
		return sql.selectList(Namespace+".coffeeProList");
	}
	
	public List<ProductVO> buisnessProList() throws Exception {
		return sql.selectList(Namespace+".buisnessProList");
	}
	
	public List<ProductVO> sampleBoxList() throws Exception {
		return sql.selectList(Namespace+".sampleBoxList");
	}
	
	public ProductVO proDetail(int proIdx) throws Exception {
		return sql.selectOne(Namespace+".proDetail",proIdx);
	}
	
	public int proListAllCount() throws Exception {
		return sql.selectOne(Namespace+".proListAllCount");
	}
	
	public int coffeeProListCount() throws Exception {
		return sql.selectOne(Namespace+".coffeeProListCount");
	}
	
	public int buisnessProListCount() throws Exception {
		return sql.selectOne(Namespace+".buisnessProListCount");
	}
	
	public int sampleBoxListCount() throws Exception {
		return sql.selectOne(Namespace+".sampleBoxListCount");
	}
	
	public ProductVO newPro() throws Exception {
		return sql.selectOne(Namespace+".newPro");
	}
}
