package com.ezen.service;

import com.ezen.vo.ProductVO;

public interface ManagerService {
	public void proWrite(ProductVO vo) throws Exception;
	
	public ProductVO proDetail(int proIdx) throws Exception;
	
	public void proModify(ProductVO vo) throws Exception;
	
	public void proDelete(int proIdx) throws Exception;
}
