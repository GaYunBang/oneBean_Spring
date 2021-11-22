package com.ezen.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.service.ProductService;
import com.ezen.vo.ProductVO;

@Controller
@RequestMapping(value="/Product/")
public class ProductController {

	@Autowired
	ProductService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//게시글 목록
	@RequestMapping(value="allProductList.do")
	public ModelAndView proListAll() throws Exception {
		List<ProductVO> list = service.proListAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/allProductList");
		mav.addObject("list", list);
		return mav;
	}
	
	//게시글 작성 화면으로 이동
	@RequestMapping(value="productPlus.do")
	public String write() {
		return "product/productPlus";
	}
	
	@RequestMapping(value="coffeeProductList.do")
	public String coffeeProductList() throws Exception{
		return "product/coffeeProductList";
	}
		
	
	@RequestMapping(value=".do")
	public String product() throws Exception{
		return "product/";
	}
}
