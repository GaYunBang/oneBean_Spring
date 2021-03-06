package com.ezen.controller;

import java.io.File;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.service.ManagerService;
import com.ezen.service.ProductService;
import com.ezen.service.RegularService;
import com.ezen.utils.UploadFileUtils;
import com.ezen.vo.MemberVO;
import com.ezen.vo.OpenVO;
import com.ezen.vo.ProductVO;
import com.ezen.vo.RegularVO;

@Controller
@RequestMapping(value="/Manager/")
public class ManagerController {
	
	@Autowired
	ManagerService managerService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	RegularService regularService;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	//상품 작성 화면으로 이동
	@RequestMapping(value="proWrite.do", method=RequestMethod.GET)
	public String write(Model model) {
		return "manager/proWrite";
	}
	
	//상품 등록 처리
	@RequestMapping(value="proWrite.do", method=RequestMethod.POST)
	public String write(ProductVO vo, MultipartFile file, MultipartFile detailFile, MultipartFile newFile) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String yearPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		String file2Name = null;
		String file3Name = null;

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
		
		if (newFile != null) {
			file3Name = UploadFileUtils.eventImageUpload(imgUploadPath, newFile.getOriginalFilename(), newFile.getBytes(), yearPath);
			vo.setNewProThumb(File.separator + "imgUpload" + yearPath + File.separator + "event" +File.separator + file3Name);
		}else {
			file3Name = null;
		}
		vo.setProImg(File.separator + "imgUpload" + yearPath + File.separator + "product" + File.separator + fileName);
		vo.setProDetailImg(File.separator + "imgUpload" + yearPath + File.separator + "detail" +File.separator + file2Name);
		
		if(vo.getNewProYN() == null) {
			vo.setNewProYN("N");
		}
		
		managerService.proWrite(vo);

		return "redirect:/Product/proListAll.do";
	}
	
	//상품 수정 화면으로 이동
	@RequestMapping(value="proModify.do", method=RequestMethod.GET)
	public String modify(Locale locale, Model model, int proIdx) throws Exception {
		ProductVO product = productService.proDetail(proIdx);
		model.addAttribute("product", product);
		return "manager/proModify";
	}
	
	//상품 수정 기능
	@RequestMapping(value="proModify.do", method=RequestMethod.POST)
	public String modify(ProductVO vo, MultipartFile file, MultipartFile detailFile, HttpServletRequest req) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String yearPath = UploadFileUtils.calcPath(imgUploadPath);
		
		//상품 이미지에 새로운 파일이 등록되었는지 확인(새로운 파일일 경우)
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			//기존 파일을 삭제
			new File(uploadPath + req.getParameter("proImg")).delete();
			
			//새로 첨부한 파일을 등록
			String fileName = UploadFileUtils.productImageUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), yearPath);
			
			vo.setProImg(File.separator + "imgUpload" + yearPath + File.separator + "product" + File.separator + fileName);
		}else {
			vo.setProImg("");
		}
		
		//상품 이미지에 새로운 파일이 등록되었는지 확인(새로운 파일일 경우)
		if(detailFile.getOriginalFilename() != null && detailFile.getOriginalFilename() != "") {
			//기존 파일을 삭제
			new File(uploadPath + req.getParameter("proDetailImg")).delete();
			
			//새로 첨부한 파일을 등록
			String file2Name = UploadFileUtils.productDetailImageUpload(imgUploadPath, detailFile.getOriginalFilename(), detailFile.getBytes(), yearPath);
			
			vo.setProDetailImg(File.separator + "imgUpload" + yearPath + File.separator + "detail" +File.separator + file2Name);
		}else {
			vo.setProDetailImg("");
		}
		managerService.proModify(vo);
		return "redirect:/Product/proListAll.do";
	}
	
	//상품 삭제
	@RequestMapping(value="proDelete.do")
	public String delete(int proIdx) throws Exception {
		managerService.proDelete(proIdx);
		return "redirect:/Product/proListAll.do";
	}
	//회원 리스트 페이지 이동
	@RequestMapping(value="memberList.do")
	public String memberList(MemberVO vo, Model model) throws Exception {
		model.addAttribute("memberList", managerService.memberList(vo));
		return "manager/memberList";
	}
	
	//창업문의 리스트 페이지 이동
	@RequestMapping(value="openList.do")
	public String openList(OpenVO vo, Model model) throws Exception {
		model.addAttribute("openList",managerService.openList());
		return "manager/openList";
	}
	
	@RequestMapping(value="changeCall.do")
	public String changeCall(OpenVO vo) throws Exception {
		managerService.changeCall(vo);
		return "redirect:/Manager/openList.do";
	}
	
	//정기구독 상품 등록
	@RequestMapping(value="regWrite.do", method=RequestMethod.GET)
	public String regWrite(Model model) {
		return "manager/regWrite";
	}
	
	//정기구독 상품 등록 기능 
	@RequestMapping(value="regWrite.do", method=RequestMethod.POST)
	public String regWrite(RegularVO vo, MultipartFile file, MultipartFile detailFile) throws Exception {
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
		
		vo.setRegImg(File.separator + "imgUpload" + yearPath + File.separator + "product" + File.separator + fileName);
		vo.setRegDetailImg(File.separator + "imgUpload" + yearPath + File.separator + "detail" +File.separator + file2Name);
		
		managerService.regWrite(vo);
		
		return "redirect:/Regular/regularList.do";
	}
	
	//정기구독 상품 수정 화면으로 이동
	@RequestMapping(value="regModify.do", method=RequestMethod.GET)
	public String regModify(Locale locale, Model model, int regIdx) throws Exception {
		RegularVO regular = regularService.regDetail(regIdx);
		model.addAttribute("regular", regular);
		return "manager/regModify";
	}
	
	//정기구독 상품 수정 기능
	@RequestMapping(value="regModify.do", method=RequestMethod.POST)
	public String regModify(RegularVO vo, MultipartFile file, MultipartFile detailFile, HttpServletRequest req) throws Exception {
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String yearPath = UploadFileUtils.calcPath(imgUploadPath);
		
		//상품 이미지에 새로운 파일이 등록되었는지 확인(새로운 파일일 경우)
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			//기존 파일을 삭제
			new File(uploadPath + req.getParameter("regImg")).delete();
			
			//새로 첨부한 파일을 등록
			String fileName = UploadFileUtils.productImageUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), yearPath);
			
			vo.setRegImg(File.separator + "imgUpload" + yearPath + File.separator + "product" + File.separator + fileName);
		}else {
			vo.setRegImg("");
		}
		
		//상품 이미지에 새로운 파일이 등록되었는지 확인(새로운 파일일 경우)
		if(detailFile.getOriginalFilename() != null && detailFile.getOriginalFilename() != "") {
			//기존 파일을 삭제
			new File(uploadPath + req.getParameter("regDetailImg")).delete();
			
			//새로 첨부한 파일을 등록
			String file2Name = UploadFileUtils.productDetailImageUpload(imgUploadPath, detailFile.getOriginalFilename(), detailFile.getBytes(), yearPath);
			
			vo.setRegDetailImg(File.separator + "imgUpload" + yearPath + File.separator + "detail" +File.separator + file2Name);
		}else {
			vo.setRegDetailImg("");
		}
		managerService.regModify(vo);
		return "redirect:/Regular/regularList.do";
	}
}
