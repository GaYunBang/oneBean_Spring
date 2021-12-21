package com.ezen.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.service.RegularService;
import com.ezen.vo.*;

@Controller
@RequestMapping(value="/Regular/")
public class RegularController {
	
	@Autowired
	RegularService regularService;
	
	@RequestMapping(value="regularList.do")
	public String regularList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage,HttpSession session) throws Exception{
		int total = regularService.regCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<RegularVO> list = regularService.regularList(vo);
		model.addAttribute("list", list);
		model.addAttribute("paging", vo);
		return "regular/regularList";
	}
	

	//정기구독 상세페이지
	@RequestMapping(value="regDetail.do")
	public String regularDetail(int regIdx, Model model) throws Exception {
		model.addAttribute("dto", regularService.regDetail(regIdx));
		return "regular/regularDetail";
	}

	//정기구독 주문
	@RequestMapping(value="regOrder.do")
	public String regOrder(Model model,RegularVO vo) throws Exception {
		vo = regularService.regDetail(vo.getRegIdx());
		
		model.addAttribute("vo", vo);
		return "regular/regPayApply";
	}
	
	@RequestMapping(value="regularPay.do")
	public String regularPay(Model model,RegularPayPostVO vo,HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMidx(member.getMidx());
		regularService.addRegular(vo);
		return "member/regOrderList";
	}
	
	@RequestMapping(value="test.do")
	public String test(Model model,RegularPayPostVO vo,HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMidx(member.getMidx());
		Calendar cal = Calendar.getInstance();
		String today = cal.get(Calendar.YEAR)+"-"+new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1)+ "-"+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		System.out.println("tt"+today);
		List<RegularPayPostVO> list = regularService.autoSelect(today);
		model.addAttribute("list", list);
		return "member/regOrderList";
	}
}
