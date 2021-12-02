package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.CommentDAO;
import com.ezen.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentDAO dao;
	
	@Override
	public List<CommentVO> commentList(int qidx) throws Exception {
		return dao.commentList(qidx);
	}

	@Override
	public void commentWrite(CommentVO vo) throws Exception {
		dao.commentWrite(vo);
	}

}
