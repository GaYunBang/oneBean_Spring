package com.ezen.service;

import java.util.List;

import com.ezen.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> proListAll() throws Exception;
	
	public ProductVO proDetail(int proIdx) throws Exception;
	
	public int proListAllCount() throws Exception;
}
