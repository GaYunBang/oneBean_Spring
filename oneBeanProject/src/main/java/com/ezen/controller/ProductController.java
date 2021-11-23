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

	@Resource(name = "uploadPath")
	private String uploadPath;

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
	
	//게시글 작성 화면으로 이동
	@RequestMapping(value="proWrite.do", method=RequestMethod.GET)
	public String write(Model model) {
		return "product/proWrite";
	}

	// 게시글 작성 처리
	@RequestMapping(value="proWrite.do", method=RequestMethod.POST)
	public String write(ProductVO vo, MultipartFile file, MultipartFile file2) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		String file2Name = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		
		if (file2 != null) {
			file2Name = UploadFileUtils.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(), ymdPath);
		} else {
			file2Name = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setProImg(File.separator + "imgUpload" + ymdPath + File.separator + file2Name);
		vo.setProImgThumb("s_" + file2Name);

		service.proWrite(vo);

		return "redirect:/Product/proListAll.do";
	}

	@RequestMapping(value = "coffeeProList.do")
	public String coffeeProductList() throws Exception {
		return "product/coffeeProductList";
	}

	@RequestMapping(value = ".do")
	public String product() throws Exception {
		return "product/";
	}
}