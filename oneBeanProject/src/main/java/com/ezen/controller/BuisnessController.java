package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.service.*;
import com.ezen.vo.*;

@Controller
@RequestMapping(value="/Buisness/")
public class BuisnessController {
	
	@Autowired
	MemberService MemberService;
	
	@Autowired
	ProductService productService;
	
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
	public String buisnessProductList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, HttpSession session) throws Exception {
		int total = productService.buisnessProListCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging",vo);
		List<ProductVO> list = productService.buisnessProList();
		model.addAttribute("list", list);
		return "buisness/buisnessProductList";
	}
	
	@RequestMapping(value="newShopQuestion.do")
	public String newShopQuestion() {
		return "buisness/newShopQuestion";
	}
}
