package com.ezen.service;

import javax.servlet.http.HttpSession;

import com.ezen.vo.MemberVO;

public interface MemberService {
	
	void joinOK(MemberVO vo) throws Exception;
	
	MemberVO login(MemberVO vo) throws Exception;
}
