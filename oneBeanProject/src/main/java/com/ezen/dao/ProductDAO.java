package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.*;

@Repository
public class ProductDAO {

	@Autowired
	SqlSession sql;
	
	private static final String Namespace = "com.ezen.mapper.ProductMapper";
	
	public List<ProductVO> proListAll(PagingVO vo) throws Exception {
		return sql.selectList(Namespace+".proListAll",vo);
	}
	
	public List<ProductVO> coffeeProList(PagingVO vo) throws Exception {
		return sql.selectList(Namespace+".coffeeProList",vo);
	}
	
	public List<ProductVO> buisnessProList(PagingVO vo) throws Exception {
		return sql.selectList(Namespace+".buisnessProList",vo);
	}
	
	public List<ProductVO> sampleBoxList(PagingVO vo) throws Exception {
		return sql.selectList(Namespace+".sampleBoxList",vo);
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
