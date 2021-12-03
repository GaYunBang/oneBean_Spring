package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.ProductDAO;
import com.ezen.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO productDao;
	
	@Override
	public List<ProductVO> proListAll() throws Exception {
		return productDao.proListAll();
	}

	@Override
	public ProductVO proDetail(int proIdx) throws Exception {
		return productDao.proDetail(proIdx);
	}

	@Override
	public int proListAllCount() throws Exception {
		return productDao.proListAllCount();
	}
}
