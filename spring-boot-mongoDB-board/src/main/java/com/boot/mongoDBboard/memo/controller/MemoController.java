package com.boot.mongoDBboard.memo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.boot.mongoDBboard.memo.service.MemoService;
import com.boot.mongoDBboard.memo.vo.MemoVO;

@Controller
public class MemoController {

	@Autowired
	MemoService memoService;
	
	
	@RequestMapping("/memo.do")
	public ModelAndView memo() {
		
		System.out.println("url ==> /memo.do");
		return new ModelAndView("memo/memo");	// memo.jsp 로 이동
	}
	
	@RequestMapping("/memo_list.do")
	public ModelAndView memo_list() {
		
		System.out.println("url ==> /memo_list.do");
		
		Map<String, Object> map = new HashMap();
		List<MemoVO> list = memoService.getMemoList();
		map.put("items", list);
		
		return new ModelAndView("memo/memo_list", "map", map);	// 이동페이지, map으로 목록보냄
	}
	
	
	
}
