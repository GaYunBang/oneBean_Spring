package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.ProductDAO;
import com.ezen.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO dao;
	
	@Override
	public List<ProductVO> proListAll() throws Exception {
		return dao.proListAll();
	}

	@Override
	public ProductVO proDetail(int proIdx) throws Exception {
		return dao.proDetail(proIdx);
	}

	@Override
	public void proWrite(ProductVO vo) throws Exception {
		dao.proWrite(vo);
	}

}
