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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.service.CommentService;
import com.ezen.service.QuestionService;
import com.ezen.vo.CommentVO;
import com.ezen.vo.PagingVO;
import com.ezen.vo.QuestionVO;


@Controller
@RequestMapping(value="/Question/")
public class QuestionController {

	@Autowired
	QuestionService service;
	
	@Autowired
	CommentService cService;
	
	@RequestMapping(value="list.do")
	public String list(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage,HttpSession session) throws Exception{
		int total = service.listCount();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		}else if(nowPage == null) {
			nowPage = "1";
		}else if(cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("listAll", service.listAll(vo));
		model.addAttribute("list", service.list(vo,(String)session.getAttribute("memberId")));
		
		return "etc/question";
	}
	
	@RequestMapping(value="write.do", method= RequestMethod.GET)
	public String write() throws Exception {
		return "etc/questionWrite";
	}
	
	@RequestMapping(value="write.do", method = RequestMethod.POST)
	public String write(QuestionVO vo) throws Exception {
		service.write(vo);
		return "redirect:/Question/list.do";
	}
	
	@RequestMapping(value="view.do")
	public ModelAndView view(int qidx,  QuestionVO qvo, ModelAndView mav, Model model) throws Exception{
		mav.setViewName("etc/questionView");
		mav.addObject("view", service.view(qidx));
		
		List<CommentVO> commentList = cService.commentList(qvo.getQidx());
		model.addAttribute("commentList", commentList);
		return mav;
	}
	
	@RequestMapping(value="modify.do", method = RequestMethod.GET)
	public ModelAndView modify(int qidx, ModelAndView mav) throws Exception{
		mav.setViewName("etc/questionModify");
		mav.addObject("view", service.view(qidx));
		return mav;
	}
	
	@RequestMapping(value="modify.do", method = RequestMethod.POST)
	public String modify(QuestionVO vo) throws Exception{
		service.Modify(vo);
		return "redirect:/Question/list.do";
	}
	
	@RequestMapping(value="Del.do")
	public String delete(int qidx) throws Exception {
		service.delete(qidx);
		return "redirect:/Question/list.do";
	}
	
	@RequestMapping(value="commentWrite.do", method = RequestMethod.POST)
	public String commentWrite(CommentVO vo, RedirectAttributes rttr) throws Exception {
		cService.commentWrite(vo);
		
		return "redirect:/Question/view.do?qidx=" + vo.getQidx();
	}
	
	
}