package com.ezen.service;

import java.util.List;

import com.ezen.vo.*;

public interface ManagerService {
	public void proWrite(ProductVO vo) throws Exception;
	
	public ProductVO proDetail(int proIdx) throws Exception;
	
	public void proModify(ProductVO vo) throws Exception;
	
	public void proDelete(int proIdx) throws Exception;
	
	public List<MemberVO> memberList(MemberVO vo) throws Exception;
}
