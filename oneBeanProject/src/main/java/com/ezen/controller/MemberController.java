package com.ezen.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.service.MemberService;
import com.ezen.vo.MemberVO;


@RequestMapping(value="/Member/")
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
		
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
	
	@RequestMapping(value="memInfoModify.do")
	public String memInfoModify() {
		return "member/memInfoModify";
	}
	
	@RequestMapping(value="addrList.do")
	public String addrList() {
		return "member/memAddr";
	}
	
	@RequestMapping(value="addrListModify.do")
	public String addrListModify() {
		return "member/memAddrModify";
	}

}