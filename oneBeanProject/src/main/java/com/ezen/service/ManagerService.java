package com.ezen.service;

import java.util.List;

import com.ezen.vo.*;

public interface ManagerService {
	public void proWrite(ProductVO vo) throws Exception;
	
	public void proModify(ProductVO vo) throws Exception;
	
	public void proDelete(int proIdx) throws Exception;
	
	public List<MemberVO> memberList(MemberVO vo) throws Exception;
	
	public List<OpenVO> openList() throws Exception;
	
	public void changeCall(OpenVO vo) throws Exception;
	
	//정기구독
	public void regWrite(RegularVO vo) throws Exception;
	
	public void regModify(RegularVO vo) throws Exception;
	
	public void regDelete(int regIdx) throws Exception;
}
