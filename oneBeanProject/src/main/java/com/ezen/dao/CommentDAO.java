package com.ezen.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.vo.CommentVO;

@Repository
public class CommentDAO {

	@Autowired
	SqlSession sql;
	
	public List<CommentVO> commentList(int qidx)throws Exception {
		return sql.selectList("com.ezen.mapper.commentMapper.commentList", qidx);
	}
	
	public void commentWrite(CommentVO vo)throws Exception {
		sql.insert("com.ezen.mapper.commentMapper.commentWrite", vo);
	}
}
