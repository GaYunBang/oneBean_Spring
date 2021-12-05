package com.ezen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.service.*;
import com.ezen.vo.MemberVO;

@Controller
@RequestMapping(value="/Buisness/")
public class BuisnessController {
	
	@Autowired
	MemberService MemberService;
	
	@RequestMapping(value="deliveryApply.do")
	public String deliveryApply() {
		return "buisness/deliveryApply";
	}
	
	@RequestMapping(value="deliveryApply.do", method=RequestMethod.POST)
	public String deliveryApply(MemberVO vo, HttpSession sesstion) throws Exception {
		MemberService.gradeUP(vo);
		sesstion.setAttribute("memberGrade", vo.getMemberGrade());
		return "redirect:/";
	}
	
	@RequestMapping(value="buisnessProductList.do")
	public String buisnessProductList() {
		return "buisness/buisnessProductList";
	}
}
