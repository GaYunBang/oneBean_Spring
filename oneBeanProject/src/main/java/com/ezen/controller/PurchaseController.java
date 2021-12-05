package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.service.PurchaseService;
import com.ezen.vo.CartVO;
import com.ezen.vo.MemberVO;

@Controller
@RequestMapping(value="/Purchase/")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@RequestMapping(value="addCart.do")
	public String addCart(int proIdx, CartVO cart, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		cart.setMidx(vo.getMidx());
		purchaseService.addCart(cart);
		return "redirect:cartList.do";
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
	
	@RequestMapping(value="order.do")
	public String order() {
		return "purchase/payApply";
	}
	
	@RequestMapping(value="orderList.do")
	public String orderList() {
		return "member/orderList";
	}

}
