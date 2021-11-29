package com.ezen.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.service.ProductService;
import com.ezen.utils.UploadFileUtils;
import com.ezen.vo.ProductVO;

@Controller
@RequestMapping(value = "/Product/")
public class ProductController {

	@Autowired
	ProductService service;

	// 게시글 목록
	@RequestMapping(value = "proListAll.do")
	public ModelAndView proListAll() throws Exception {
		List<ProductVO> list = service.proListAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/proListAll");
		mav.addObject("list", list);
		return mav;
	}


	// 상세페이지
	@RequestMapping(value = "proDetail.do")
	public ModelAndView proDetail(int proIdx, ModelAndView mav) throws Exception {

		mav.setViewName("product/proDetail");
		mav.addObject("dto", service.proDetail(proIdx));
		return mav;
	}


	@RequestMapping(value = "coffeeProList.do")
	public String coffeeProductList() throws Exception {
		return "product/coffeeProductList";
	}

	@RequestMapping(value = "sampleBoxList.do")
	public String sampleBoxList() throws Exception {
		return "product/sampleBoxList";
	}
	
	@RequestMapping(value = ".do")
	public String product() throws Exception {
		return "product/";
	}
}