package com.boot.springBoot_basic_controller;

import org.springframework.stereotype.Controller;

// Controller, Service, DAO은 Spring mvc와 동일하나 view만 다르다.
@Controller
public class TestController {

	@RequestMapping("/test.do")
	public ModelAndView hello(ModelAndView mav) {
		mav.setViewName("test"); // 뷰의 이름 : src/main/resources/templates/test.html
		mav.addObject("message", "스프링부트 애플리케이션 - test"); // test.html에서 {message} el태그로 받는다.
		return mav;
	}
}
