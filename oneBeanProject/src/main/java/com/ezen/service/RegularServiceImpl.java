package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.RegularDAO;
import com.ezen.vo.*;

@Service
public class RegularServiceImpl implements RegularService{

	@Autowired
	RegularDAO regularDAO;
	
	@Override
	public List<RegularVO> regularList(PagingVO vo) throws Exception {
		return regularDAO.regularList(vo);
	}
	@Override
	public void addRegular(RegularPayPostVO vo) throws Exception {
		regularDAO.addRegular(vo);
	}
	@Override
	public int regCount() throws Exception {
		return regularDAO.regCount();
	}

	@Override
	public RegularVO regDetail(int regIdx) throws Exception {
		return regularDAO.regDetail(regIdx);
	}
	@Override
	public List<RegularPayPostVO> autoSelect(String today) throws Exception {
		return regularDAO.autoSelect(today);
	}

	
	
}
