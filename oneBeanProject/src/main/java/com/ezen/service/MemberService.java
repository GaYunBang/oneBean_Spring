package com.ezen.service;

import com.ezen.vo.AddrVO;
import com.ezen.vo.MemberVO;

public interface MemberService {
	
	void joinOK(MemberVO vo) throws Exception;
	
	MemberVO login(MemberVO vo) throws Exception;
	
	public void gradeUP(MemberVO vo) throws Exception;
	
	public int idCheck(MemberVO vo) throws Exception;
	
	public AddrVO addrView(int midx)throws Exception;
	
	public void addrModify(AddrVO vo)throws Exception;
}
