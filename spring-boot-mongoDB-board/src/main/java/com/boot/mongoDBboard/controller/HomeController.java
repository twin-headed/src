package com.boot.mongoDBboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/") // 시작페이지
	public String home() {
		return "hello";	// hello.jsp
	}
	
}
