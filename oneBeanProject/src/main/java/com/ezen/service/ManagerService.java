package com.ezen.service;

import java.util.List;

<<<<<<< HEAD
import com.ezen.vo.*;
=======
import com.ezen.vo.MemberVO;
import com.ezen.vo.ProductVO;
>>>>>>> branch 'dh' of https://github.com/GaYunBang/oneBean_Spring.git

public interface ManagerService {
	public void proWrite(ProductVO vo) throws Exception;
	
	public ProductVO proDetail(int proIdx) throws Exception;
	
	public void proModify(ProductVO vo) throws Exception;
	
	public void proDelete(int proIdx) throws Exception;
	
	public List<MemberVO> memberList(MemberVO vo) throws Exception;
<<<<<<< HEAD
	
	public List<OpenVO> openList() throws Exception;
	
	public void changeCall(OpenVO vo) throws Exception;
=======
>>>>>>> branch 'dh' of https://github.com/GaYunBang/oneBean_Spring.git
}
