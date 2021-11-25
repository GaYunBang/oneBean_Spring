package com.ezen.controller;


import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	
	@RequestMapping(value="/Etc/about.do", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		
		return "etc/about";
	}
	
	@RequestMapping(value="/Etc/faq.do", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		
		return "etc/faq";
	}
}
