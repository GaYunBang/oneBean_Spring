package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.service.PurchaseService;
import com.ezen.vo.CartVO;
import com.ezen.vo.MemberVO;
import com.ezen.vo.ProductOrderVO;

@Controller
@RequestMapping(value="/Purchase/")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping(value="addCart.do")
	@ResponseBody
	public String addCart(CartVO cart, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		cart.setMidx(vo.getMidx());
		purchaseService.addCart(cart);
		return "";
	}
	
	@RequestMapping(value="cartList.do")
	public String cartList(Model model, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		List<CartVO> list = purchaseService.cartList(vo.getMidx());
		int count = purchaseService.cartAllCount(vo.getMidx());
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		return "purchase/cart";
	}
	
	@RequestMapping(value="cartButtonDelete.do")
	@ResponseBody
	public String cartButtonDelete(int cartIdx) throws Exception {
		purchaseService.cartButtonDelete(cartIdx);
		return "";
	}
	
	@RequestMapping(value="cartAllDelete.do")
	@ResponseBody
	public String cartAllDelete(int midx) throws Exception {
		purchaseService.cartAllDelete(midx);
		return "";
	}
	
	@RequestMapping(value="orderOne.do")
	@ResponseBody
	public String order(Model model,ProductOrderVO vo ,HttpSession session) throws Exception {
		MemberVO midx = (MemberVO)session.getAttribute("member");
		vo.setMidx(midx.getMidx());
		purchaseService.addOrder(vo);
		return "";
	}
	
	@RequestMapping(value="one.do")
	public String order(Model model, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		int midx = member.getMidx();
		ProductOrderVO vo = purchaseService.one(midx);
		model.addAttribute("vo", vo);
		return "purchase/payApply";
	}
	
	@RequestMapping(value="order.do")
	public String orderOne(Model model, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		int midx = member.getMidx();
		ProductOrderVO vo = purchaseService.one(midx);
		model.addAttribute("vo", vo);
		System.out.println(vo.getProImg());
		return "purchase/payApply";
	}
	
	@RequestMapping(value="order.do", method=RequestMethod.POST)
	public String orderSelect(Model model, ProductOrderVO vo, HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMidx(member.getMidx());
		for(int i=0;i<vo.getCartIdxs().length;i++) {
			purchaseService.addOrder(vo);
		}
		
		return "purchase/payApply";
	}
	
	@RequestMapping(value="orderList.do")
	public String orderList() {
		return "member/orderList";
	}

}
