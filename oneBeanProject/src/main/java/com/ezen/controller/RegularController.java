package com.ezen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/Regular/")
public class RegularController {
	
	@RequestMapping(value="regularList.do")
	public String regularList() {
		return "regular/regularList";
	}
}
