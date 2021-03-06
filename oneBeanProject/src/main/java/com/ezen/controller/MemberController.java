package com.ezen.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.service.MemberService;
import com.ezen.service.RegularService;
import com.ezen.vo.AddrVO;
import com.ezen.vo.MemberVO;
import com.ezen.vo.PayPostVO;
import com.ezen.vo.RegularPayPostVO;


@RequestMapping(value="/Member/")
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	RegularService regularService;
	
		
	@RequestMapping(value="join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model) throws Exception {
		return "member/join";
	}
	
	@RequestMapping(value="join.do", method = RequestMethod.POST)
	public String joinOK(Locale locale, Model model, MemberVO vo) throws Exception {
		vo.setMemberBirth(vo.getBirth1()+vo.getBirth2()+vo.getBirth3());
		vo.setMemberPhone(vo.getPhone1()+vo.getPhone2()+vo.getPhone3()); 
		vo.setMemberTel(vo.getTel1()+vo.getTel2()+vo.getTel3());	
		if(vo.getMemberSpam() == null) {
			vo.setMemberSpam("N");
		}
		memberService.joinOK(vo);
		
		return "redirect:login.do";
	}
	
	@RequestMapping(value="idCheck.do")
	@ResponseBody
	public int idCheck(MemberVO vo) throws Exception {
		int idCheck = memberService.idCheck(vo);
		return idCheck;
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login() throws Exception {
		return "member/login";
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String login(Locale locale, Model model, MemberVO vo, HttpSession session, RedirectAttributes ra) throws Exception {
		MemberVO login = memberService.login(vo);
		String memberName = (String)session.getAttribute("memberName");
		String memberId = (String)session.getAttribute("memberId");
		String memberGrade = (String)session.getAttribute("memberGrade");
		Integer midx = (Integer) session.getAttribute("midx");
		
		if(login == null) {
			session.setAttribute("member", null);
			ra.addFlashAttribute("msg", false);
			return "redirect:login.do"; 
		}else {
			memberName = login.getMemberName();
			memberId = login.getMemberId();
			memberGrade = login.getMemberGrade();
			midx = login.getMidx();
			session.setAttribute("memberName", memberName);
			session.setAttribute("memberId", memberId);
			session.setAttribute("memberGrade", memberGrade);
			session.setAttribute("midx", midx);
			System.out.println(login.getMemberBirth());
			session.setAttribute("member", login);
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="myPage.do")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping(value="memInfo.do")
	public String memInfo() {
		return "member/memInfo";
	}
	
	@RequestMapping(value="memInfoModify.do", method = RequestMethod.GET)
	public String memInfoModify() {
		return "member/memInfoModify";
	}
	
	@RequestMapping(value="memInfoModify.do", method = RequestMethod.POST)
	public String memInfoModify(MemberVO vo, HttpSession session) throws Exception {
		memberService.memberModify(vo);
		session.invalidate();
		return "redirect:login.do";
	}
	
	@RequestMapping(value="pwdModify.do", method = RequestMethod.GET)
	public String pwdModify() throws Exception {
		return "member/pwdModify";
	}
	
	@RequestMapping(value="pwdModify.do", method = RequestMethod.POST)
	public String pwdModify(MemberVO vo) throws Exception {
		memberService.pwdModify(vo);
		return "redirect:memInfoModify.do?midx="+vo.getMidx();
	}
	
	@RequestMapping(value="addrList.do")
	public String addrList(int midx, Model model) throws Exception {
		model.addAttribute("addr", memberService.addrView(midx));
		return "member/memAddr";
	}
	
	@RequestMapping(value="addrListModify.do", method = RequestMethod.GET)
	public String addrListModify(Model model, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		model.addAttribute("addr", memberService.addrView(vo.getMidx()));
		return "member/memAddrModify";
	}
	
	@RequestMapping(value="addrListModify.do", method = RequestMethod.POST)
	public String addrListModify(AddrVO vo) throws Exception {
		memberService.addrModify(vo);
		return "redirect:addrList.do?midx="+vo.getMidx();
	}
	
	@RequestMapping(value="regOrderList.do")
	public String regOrderList(Model model, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		int midx = member.getMidx();
		List<RegularPayPostVO> list = regularService.regularOrderList(midx);
		model.addAttribute("list", list);
		return "member/regOrderList";
	}

}