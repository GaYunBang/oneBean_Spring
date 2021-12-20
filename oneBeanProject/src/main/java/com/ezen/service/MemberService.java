package com.ezen.service;

import com.ezen.vo.AddrVO;
import com.ezen.vo.MemberVO;
import com.ezen.vo.OpenVO;

public interface MemberService {
	
	void joinOK(MemberVO vo) throws Exception;
	
	MemberVO login(MemberVO vo) throws Exception;
	
	public void gradeUP(MemberVO vo) throws Exception;
	
	public int idCheck(MemberVO vo) throws Exception;
	
	public AddrVO addrView(int midx)throws Exception;
	
	public void addrModify(AddrVO vo)throws Exception;
	
	public void memberModify(MemberVO vo)throws Exception;
	
	public void pwdModify(MemberVO vo)throws Exception;
<<<<<<< HEAD
	
	public int addrCount(int midx)throws Exception;
	
	public void addrPlus(AddrVO vo)throws Exception;
	
	public void newShopQuestion(OpenVO vo) throws Exception;
=======
>>>>>>> branch 'dh' of https://github.com/GaYunBang/oneBean_Spring.git
}
