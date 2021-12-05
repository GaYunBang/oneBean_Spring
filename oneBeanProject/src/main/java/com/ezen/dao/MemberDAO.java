package com.ezen.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.ezen.mapper.MemberMapper";
	
	public void joinOk(MemberVO vo) throws Exception {
		sqlSession.insert(Namespace+".join",vo); //mapper.xml의 쿼리가 실행된다. 
	}
	
	public MemberVO login(MemberVO vo) throws Exception {
		return sqlSession.selectOne(Namespace+".login", vo);
	}
	
	public void gradeUP(MemberVO vo) throws Exception {
		sqlSession.update(Namespace+".gradeUP",vo);
	}
}
