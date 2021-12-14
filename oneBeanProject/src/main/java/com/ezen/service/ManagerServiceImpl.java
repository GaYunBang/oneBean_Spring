package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.ManagerDAO;
import com.ezen.vo.MemberVO;
import com.ezen.vo.ProductVO;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDAO managerDao;
	
	@Override
	public void proWrite(ProductVO vo) throws Exception {
		managerDao.proWrite(vo);
	}

	@Override
	public ProductVO proDetail(int proIdx) throws Exception {
		
		return managerDao.proDetail(proIdx);
	}

	@Override
	public void proModify(ProductVO vo) throws Exception {
		managerDao.proModify(vo);
	}

	@Override
	public void proDelete(int proIdx) throws Exception {
		managerDao.proDelete(proIdx);
	}

	@Override
	public List<MemberVO> memberList(MemberVO vo) throws Exception {
		return managerDao.memberList(vo);
	}
}
