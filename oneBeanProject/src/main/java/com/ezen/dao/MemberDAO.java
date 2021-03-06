package com.ezen.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.*;

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
	
	public int idCheck(MemberVO vo) throws Exception {
		int idCheck = sqlSession.selectOne(Namespace+".idCheck", vo);
		return idCheck;
	}
	
	public AddrVO addrView(int midx) throws Exception {
		return sqlSession.selectOne(Namespace+".addrView", midx);
	}
	
	public void addrModify(AddrVO vo) throws Exception {
		sqlSession.update(Namespace+".addrModify", vo);
	}
	
	public void memberModify(MemberVO vo) throws Exception {
		sqlSession.update(Namespace+".memberModify", vo);
	}
	
	public void pwdModify(MemberVO vo)throws Exception {
		sqlSession.update(Namespace+".pwdModify", vo);
	}
	
	public int addrCount(int midx) throws Exception {
		return sqlSession.update(Namespace+".addrCount", midx);
	}
	
	public void addrPlus(AddrVO vo) throws Exception{
		sqlSession.insert(Namespace+".addrPlus", vo);
	}
	
	public void newShopQuestion(OpenVO vo) throws Exception {
		sqlSession.insert(Namespace+".newShopQuestion",vo);
	}
}
