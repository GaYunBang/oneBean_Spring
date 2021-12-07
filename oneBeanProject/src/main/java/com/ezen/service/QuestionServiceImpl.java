package com.ezen.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.QuestionDAO;
import com.ezen.vo.PagingVO;
import com.ezen.vo.QuestionVO;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	QuestionDAO dao;
	
	@Override
	public List<QuestionVO> listAll(PagingVO vo) throws Exception {
		return dao.listAll(vo);
	}
	
	@Override
	public List<QuestionVO> list(PagingVO vo, String memberId) throws Exception {
		
		HashMap<String,String> hm = new HashMap<String, String>();		
		hm.put("start",vo.getStart()+"");
		hm.put("end", vo.getEnd()+"");
		hm.put("memberId",memberId);
		
		return dao.list(hm);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public void write(QuestionVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public QuestionVO view(int qidx) throws Exception {
		return dao.view(qidx);
	}

	@Override
	public void Modify(QuestionVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void delete(int qidx) throws Exception {
		dao.delete(qidx);
	}

	@Override
	public int commentCnt(QuestionVO vo) throws Exception {
		return dao.commentCnt(vo);
	}

}
