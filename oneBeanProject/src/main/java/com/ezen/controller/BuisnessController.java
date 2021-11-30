package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Buisness/")
public class BuisnessController {
	
	@RequestMapping(value="deliveryApply.do")
	public String deliveryApply() {
		return "buisness/deliveryApply";
	}
	
	@RequestMapping(value="deliveryApply.do", method=RequestMethod.POST)
	public String deliveryApply(int a) {
		return "buisness/deliveryApply";
	}
	
	@RequestMapping(value="buisnessProductList.do")
	public String buisnessProductList() {
		return "buisness/buisnessProductList";
	}
}
