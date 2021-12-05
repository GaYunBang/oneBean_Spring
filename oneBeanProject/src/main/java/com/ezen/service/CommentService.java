package com.ezen.service;

import java.util.List;

import com.ezen.vo.CommentVO;

public interface CommentService {

	public List<CommentVO> commentList(int qidx) throws Exception;
	
	public void commentWrite(CommentVO vo)throws Exception;
}
