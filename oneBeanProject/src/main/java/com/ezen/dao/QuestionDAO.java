package com.ezen.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.PagingVO;
import com.ezen.vo.QuestionVO;


@Repository
public class QuestionDAO {

	@Autowired
	SqlSession sql;
	
	public List<QuestionVO> listAll(PagingVO vo) throws Exception {
		return sql.selectList("com.ezen.mapper.questionMapper.listAll", vo);
	}
	
	public List<QuestionVO> list(HashMap<String,String> hm)throws Exception {
		return sql.selectList("com.ezen.mapper.questionMapper.list", hm);
	}
	
	public int listCount() throws Exception {
		return sql.selectOne("com.ezen.mapper.questionMapper.listCount");
	}
	
	public void write(QuestionVO vo) throws Exception {
		sql.insert("com.ezen.mapper.questionMapper.write", vo);
	}
	
	public QuestionVO view(int qidx) throws Exception {
		return sql.selectOne("com.ezen.mapper.questionMapper.view", qidx);
	}
	
	public void modify(QuestionVO vo) throws Exception {
		sql.update("com.ezen.mapper.questionMapper.modify", vo);
	}
	
	public void delete(int qidx) throws Exception {
		sql.delete("com.ezen.mapper.questionMapper.delete", qidx);
	}
}
