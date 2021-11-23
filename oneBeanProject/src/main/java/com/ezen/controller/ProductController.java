package com.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.service.ProductService;
import com.ezen.vo.ProductVO;

@Controller
@RequestMapping(value="/Product/")
public class ProductController {

	@Autowired
	ProductService service;
	
	//게시글 목록
	@RequestMapping(value="proListAll.do")
	public ModelAndView proListAll() throws Exception {
		List<ProductVO> list = service.proListAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/list");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping(value=".do")
	public String product() throws Exception{
		return "product/product2";
	}
}
