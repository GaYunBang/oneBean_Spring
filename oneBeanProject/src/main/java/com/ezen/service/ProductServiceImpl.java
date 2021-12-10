package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.ProductDAO;
import com.ezen.vo.PagingVO;
import com.ezen.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO productDao;
	
	@Override
	public List<ProductVO> proListAll(PagingVO vo) throws Exception {
		return productDao.proListAll(vo);
	}

	@Override
	public ProductVO proDetail(int proIdx) throws Exception {
		return productDao.proDetail(proIdx);
	}

	@Override
	public int proListAllCount() throws Exception {
		return productDao.proListAllCount();
	}

	@Override
	public List<ProductVO> coffeeProList() throws Exception {
		return productDao.coffeeProList();
	}

	@Override
	public List<ProductVO> buisnessProList() throws Exception {
		return productDao.buisnessProList();
	}

	@Override
	public List<ProductVO> sampleBoxList() throws Exception {
		return productDao.sampleBoxList();
	}

	@Override
	public int coffeeProListCount() throws Exception {
		return productDao.coffeeProListCount();
	}

	@Override
	public int buisnessProListCount() throws Exception {
		return productDao.buisnessProListCount();
	}

	@Override
	public int sampleBoxListCount() throws Exception {
		return productDao.sampleBoxListCount();
	}

	@Override
	public ProductVO newPro() throws Exception {
		return productDao.newPro();
	}
}
