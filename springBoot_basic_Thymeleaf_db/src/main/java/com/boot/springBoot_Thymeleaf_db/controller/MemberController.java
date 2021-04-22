package com.boot.springBoot_Thymeleaf_db.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.boot.springBoot_Thymeleaf_db.service.MemberService;
import com.boot.springBoot_Thymeleaf_db.vo.MemberVO;

// Controller, Service, DAO은 Spring mvc와 동일하나 view만 다르다.
@Controller
public class MemberController {

	@Inject
	MemberService memberService;
	
	// 회원목록
	@RequestMapping("/memberlist.do")
	public ModelAndView hello(ModelAndView mav) {
		mav.setViewName("memberlist"); // 뷰의 이름 : src/main/resources/templates/memberlist.html
		
		List<MemberVO> list = memberService.list();
		mav.addObject("list", list);
		return mav;
	}
}
