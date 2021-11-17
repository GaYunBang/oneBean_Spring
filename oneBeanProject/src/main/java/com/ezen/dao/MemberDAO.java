package com.ezen.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void joinOk(MemberVO vo) throws Exception {
		sqlSession.insert("com.ezen.mapper.MemberMapper.join",vo); //mapper.xml의 쿼리가 실행된다. 
	}
}
