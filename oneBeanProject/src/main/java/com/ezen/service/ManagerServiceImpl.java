package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.ManagerDAO;
import com.ezen.vo.MemberVO;
import com.ezen.vo.OpenVO;
import com.ezen.vo.ProductVO;
import com.ezen.vo.RegularVO;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	ManagerDAO managerDao;
	
	@Override
	public void proWrite(ProductVO vo) throws Exception {
		managerDao.proWrite(vo);
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

	@Override
	public List<OpenVO> openList() throws Exception {
		return managerDao.openList();
	}

	@Override
	public void changeCall(OpenVO vo) throws Exception {
		managerDao.changeCall(vo);
	}

	
	//정기구독
	@Override
	public void regWrite(RegularVO vo) throws Exception {
		managerDao.regWrite(vo);
	}

	@Override
	public void regModify(RegularVO vo) throws Exception {
		managerDao.regModify(vo);
	}

	@Override
	public void regDelete(int regIdx) throws Exception {
		managerDao.regDelete(regIdx);
	}
}
