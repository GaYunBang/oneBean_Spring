package com.ezen.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.MemberDAO;
import com.ezen.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public void joinOK(MemberVO vo) throws Exception {
		memberDao.joinOk(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return memberDao.login(vo);
	}


}
