package com.ezen.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.service.*;
import com.ezen.vo.*;

@Controller
@RequestMapping(value="/Purchase/")
public class PurchaseController {
	
	@Autowired
	PurchaseService purchaseService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	//장바구니 추가
	@RequestMapping(value="addCart.do")
	@ResponseBody
	public String addCart(CartVO cart, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		cart.setMidx(vo.getMidx());
		purchaseService.addCart(cart);
		return "";
	}
	
	//장바구니 리스트
	@RequestMapping(value="cartList.do")
	public String cartList(Model model, HttpSession session) throws Exception {
		MemberVO vo = (MemberVO)session.getAttribute("member");
		List<CartVO> list = purchaseService.cartList(vo.getMidx());
		int count = purchaseService.cartAllCount(vo.getMidx());
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		return "purchase/cart";
	}
	
	//수량 변경시 새로고침해도 똑같게 만들기
	@RequestMapping(value="cartUpdate.do")
	@ResponseBody
	public void cartUpdate(CartVO vo) throws Exception {
		purchaseService.cartUpdate(vo);
	}
	
	//장바구니 리스트에서 하나 삭제
	@RequestMapping(value="cartButtonDelete.do")
	@ResponseBody
	public String cartButtonDelete(int cartIdx) throws Exception {
		purchaseService.cartButtonDelete(cartIdx);
		return "";
	}
	
	//장바구니 전체 삭제
	@RequestMapping(value="cartAllDelete.do")
	@ResponseBody
	public String cartAllDelete(int midx) throws Exception {
		purchaseService.cartAllDelete(midx);
		return "";
	}
	
	//주문하기 버튼 눌렀을때 페이지 이동
	@RequestMapping(value="order.do")
	public String order(Model model, TempVO vo, CartVO cart ,HttpSession session) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMidx(member.getMidx());
		if (cart.getCartIdxs() == null) {
			ProductVO product = productService.proDetail(vo.getProIdx());
			
			vo.setProContents(product.getProContents());
			vo.setProName(product.getProName());
			vo.setProImg(product.getProImg());
			vo.setProIdx(product.getProIdx());
			vo.setCartIdx(0);
			
			ArrayList<TempVO> list = new ArrayList<TempVO>();
			list.add(vo);
			
			model.addAttribute("list", list);
		}else {
			cart.setMidx(member.getMidx());
			List<TempVO> list =purchaseService.cartProduct(cart);
			
			model.addAttribute("list", list);
		}
		
		model.addAttribute("addr", memberService.addrView(vo.getMidx()));
		return "purchase/payApply";
	}
	
	@RequestMapping(value="orderList.do")
	public String orderList() {
		return "member/orderList";
	}
	
	@RequestMapping(value="searchOrder.do")
	@ResponseBody
	public HashMap<String,Object> searchOrder(PayPostVO vo, HttpSession session) throws Exception {	
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setMidx(member.getMidx());
		List<PayPostVO> list = purchaseService.searchOrder(vo);
		HashMap<String,Object> hm = new HashMap<String,Object>();
		hm.put("list", list);
		return hm;
	}
	
	@RequestMapping(value="accountPay.do")
	public String accountPay(PayPostVO vo, HttpSession session, AddrVO addr, Model model) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		int midx = member.getMidx();
		vo.setMidx(midx);
		PayPostVO pay = null;
		int addrCount = memberService.addrCount(midx);
		
		if(addrCount == 0) {
			addr.setMidx(member.getMidx());
			addr.setMemberPostNum(vo.getPostNum());
			addr.setMemberAddr(vo.getPostAddr());
			addr.setMemberDetailAddr(vo.getPostDetailAddr());
			memberService.addrPlus(addr);
		}
		if(vo.getCartIdxs() != null) {
			pay = purchaseService.viewPayMulti(vo);
		}else {
			pay = purchaseService.viewPay(vo);
		}
		
		model.addAttribute("pay", pay);
		
		return "purchase/accountPay";
	}

}
