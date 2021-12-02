package com.ezen.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.ProductVO;

@Repository
public class ManagerDAO {
	
	@Autowired
	SqlSession sql;

	public void proWrite(ProductVO vo) throws Exception {
		sql.insert("com.ezen.mapper.ProductMapper.insert", vo);
	}
	
	public ProductVO proDetail(int proIdx) throws Exception {
		return sql.selectOne("com.ezen.mapper.ProductMapper.proDetail", proIdx);
	}
	
	public void proModify(ProductVO vo) throws Exception {
		sql.update("com.ezen.mapper.ProductMapper.modify", vo);
	}
	
	public void proDelete(int proIdx) throws Exception {
		sql.update("com.ezen.mapper.ProductMapper.delete",proIdx);
	}
}
