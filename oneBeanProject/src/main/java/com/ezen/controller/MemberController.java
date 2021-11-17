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


@RequestMapping(value="/Member")
@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
		
	@RequestMapping(value="/join.do", method = RequestMethod.GET)
	public String joinOK(Locale locale, Model model) throws Exception {
		
		return "member/join";
	}
	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	public String joinOK(Locale locale, Model model, MemberVO vo) throws Exception {
		
		return "redirect:login.do";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(Locale locale, Model model) throws Exception {
		
		return "member/login";
	}
	
	
	@RequestMapping(value="/main.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String main() throws Exception {
		
		return "index";
	}
}