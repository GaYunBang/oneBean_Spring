package com.ezen.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dao.MemberDAO;
import com.ezen.vo.AddrVO;
import com.ezen.vo.MemberVO;
import com.ezen.vo.OpenVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public void joinOK(MemberVO vo) throws Exception {
		memberDao.joinOk(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return memberDao.login(vo);
	}

	@Override
	public void gradeUP(MemberVO vo) throws Exception {
		memberDao.gradeUP(vo);
	}

	@Override
	public int idCheck(MemberVO vo) throws Exception {
		int idCheck = memberDao.idCheck(vo);
		return idCheck;
	}

	@Override
	public AddrVO addrView(int midx) throws Exception {
		return memberDao.addrView(midx);
	}

	@Override
	public void addrModify(AddrVO vo) throws Exception {
		memberDao.addrModify(vo);
	}
	
	@Override
	public void memberModify(MemberVO vo) throws Exception {
		memberDao.memberModify(vo);
	}

	@Override
	public void pwdModify(MemberVO vo) throws Exception {
		memberDao.pwdModify(vo);
	}

	@Override
	public int addrCount(int midx) throws Exception {
		return memberDao.addrCount(midx);
	}

	@Override
	public void addrPlus(AddrVO vo) throws Exception {
		memberDao.addrPlus(vo);
	}

	@Override
	public void newShopQuestion(OpenVO vo) throws Exception {
		memberDao.newShopQuestion(vo);
	}
}
