package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.service.*;
import com.ezen.vo.*;

@Controller
@RequestMapping(value = "/Product/")
public class ProductController {

	@Autowired
	ProductService productService;

	// 모든상품 목록
	@RequestMapping(value = "proListAll.do")
	public ModelAndView proListAll(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage,HttpSession session) throws Exception{
		int total = productService.proListAllCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<ProductVO> list = productService.proListAll(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/proListAll");
		mav.addObject("list", list);
		model.addAttribute("paging", vo);
		return mav;
	}


	// 상세페이지
	@RequestMapping(value="proDetail.do")
	public ModelAndView proDetail(int proIdx, ModelAndView mav) throws Exception {

		mav.setViewName("product/proDetail");
		mav.addObject("dto", productService.proDetail(proIdx));
		return mav;
	}
	
	@RequestMapping(value = "coffeeProList.do")
	public String coffeeProductList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, HttpSession session) throws Exception {
		int total = productService.coffeeProListCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		List<ProductVO> list = productService.coffeeProList(vo);
		model.addAttribute("list", list);
		return "product/coffeeProList";
	}

	@RequestMapping(value = "sampleBoxList.do")
	public String sampleBoxList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, HttpSession session) throws Exception {
		int total = productService.sampleBoxListCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "12";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		List<ProductVO> list = productService.sampleBoxList(vo);
		model.addAttribute("list", list);
		return "product/sampleBoxList";
	}
	
	@RequestMapping(value = "newProduct.do")
	public String newProduct(Model model) throws Exception {
		ProductVO vo = productService.newPro();
		model.addAttribute("vo", vo);
		return "product/newProduct";
	}
	
	@RequestMapping(value = ".do")
	public String product() throws Exception {
		return "product/";
	}
}