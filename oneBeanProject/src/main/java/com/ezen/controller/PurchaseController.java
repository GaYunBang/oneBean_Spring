package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/Purchase/")
public class PurchaseController {
	
	@RequestMapping(value="cartList.do")
	public String cartList() {
		return "purchase/cart";
	}

}
