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
	
	public List<ProductVO> proListAll() throws Exception {
		return sql.selectList("com.ezen.mapper.ProductMapper.proListAll");
	}
	
	public ProductVO proDetail(int proIdx) throws Exception{
		return sql.selectOne("com.ezen.mapper.ProductMapper.proDetail",proIdx);
	}
}
