package com.ezen.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/Etc/")
public class EtcController {
	
	@RequestMapping(value="about.do", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		
		return "etc/about";
	}
	
	@RequestMapping(value="faq.do", method = RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		
		return "etc/faq";
	}
	
}
