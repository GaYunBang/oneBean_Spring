package com.ezen.controller;

import java.io.File;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.service.*;
import com.ezen.utils.UploadFileUtils;
import com.ezen.vo.*;

@Controller
@RequestMapping(value="/Manager/")
public class ManagerController {
	
	@Autowired
	ManagerService service;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//게시글 작성 화면으로 이동
	@RequestMapping(value="proWrite.do", method=RequestMethod.GET)
	public String write(Model model) {
		return "manager/proWrite";
	}
	// 게시글 작성 처리
	@RequestMapping(value="proWrite.do", method=RequestMethod.POST)
	public String write(ProductVO vo, MultipartFile file, MultipartFile detailFile) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String yearPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		String file2Name = null;

		if (file != null) {
			fileName = UploadFileUtils.productImageUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), yearPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "product" + File.separator + "none.png";
		}
		
		if (detailFile != null) {
			file2Name = UploadFileUtils.productDetailImageUpload(imgUploadPath, detailFile.getOriginalFilename(), detailFile.getBytes(), yearPath);
		} else {
			file2Name = uploadPath + File.separator + "images" + File.separator + "detail" + File.separator + "none.png";
		}

		vo.setProImg(File.separator + "imgUpload" + yearPath + File.separator + "product" + File.separator + fileName);
		vo.setProDetailImg(File.separator + "imgUpload" + yearPath + File.separator + "detail" +File.separator + file2Name);

		service.proWrite(vo);

		return "redirect:/Product/proListAll.do";
	}
	
	//게시글 작성 화면으로 이동
	@RequestMapping(value="proModify.do", method=RequestMethod.GET)
	public String modify(Locale locale, Model model, int proIdx) throws Exception {
		ProductVO product = service.proDetail(proIdx);
		model.addAttribute("product", product);
		return "manager/proModify";
	}
	
	@RequestMapping(value="proModify.do", method=RequestMethod.POST)
	public String modify(Locale locale, Model model, ProductVO vo) throws Exception {
		service.proModify(vo);
		return "redirect:/Product/proListAll.do";
	}
}
