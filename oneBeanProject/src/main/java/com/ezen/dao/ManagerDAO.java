package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.*;

@Repository
public class ManagerDAO {
	
	@Autowired
	SqlSession sql;

	private static final String Namespace = "com.ezen.mapper.ManagerMapper";
	
	public void proWrite(ProductVO vo) throws Exception {
		sql.insert(Namespace+".insert", vo);
	}
	
	public void proModify(ProductVO vo) throws Exception {
		sql.update(Namespace+".modify", vo);
	}
	
	public void proDelete(int proIdx) throws Exception {
		sql.delete(Namespace+".delete",proIdx);
	}
	public List<MemberVO> memberList(MemberVO vo) throws Exception {
		return sql.selectList(Namespace+".memberList", vo);
	}
	public List<OpenVO> openList() throws Exception {
		return sql.selectList(Namespace+".openList");
	}
	public void changeCall (OpenVO vo) throws Exception {
		sql.update(Namespace+".changeCall", vo);
	}
	
	//정기구독
	public void regWrite(RegularVO vo) throws Exception {
		sql.insert(Namespace+".regInsert", vo);
	}
	public void regModify(RegularVO vo) throws Exception {
		sql.update(Namespace+".regModify", vo);
	}
	
	public void regDelete(int regIdx) throws Exception {
		sql.delete(Namespace+".regDelete",regIdx);
	}
}
