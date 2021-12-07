package com.ezen.service;

import java.util.List;

import com.ezen.vo.*;

public interface ProductService {

	//상품 리스트 불러오기
	public List<ProductVO> proListAll() throws Exception;
	
	public List<ProductVO> coffeeProList() throws Exception;
	
	public List<ProductVO> buisnessProList() throws Exception;
	
	public List<ProductVO> sampleBoxList() throws Exception;
	
	//상품 상세보기
	public ProductVO proDetail(int proIdx) throws Exception;
	
	//새상품 페이지
	public ProductVO newPro() throws Exception;
	
	//페이징을 위한 상품 갯수 세기
	public int proListAllCount() throws Exception;
	
	public int coffeeProListCount() throws Exception;
	
	public int buisnessProListCount() throws Exception;
	
	public int sampleBoxListCount() throws Exception; 
}
