package com.ezen.service;

import java.util.List;

import com.ezen.vo.PagingVO;
import com.ezen.vo.QuestionVO;


public interface QuestionService {

	public List<QuestionVO> listAll(PagingVO vo) throws Exception;
	
	public List<QuestionVO> list(PagingVO vo) throws Exception;
	
	public int listCount() throws Exception;
	
	public int listCountMember(PagingVO vo) throws Exception;
	
	public void write(QuestionVO vo) throws Exception;
	
	public QuestionVO view(int qidx) throws Exception;
	
	public void Modify(QuestionVO vo) throws Exception;
	
	public void delete(int qidx) throws Exception;
	
	public int commentCnt(QuestionVO vo) throws Exception;
	
	public List<QuestionVO> deleteList(PagingVO vo) throws Exception;
	
	public int deleteListCount() throws Exception;
	
}
