package com.boot.springBoot_Thymeleaf_db.service;

import java.util.List;

import com.boot.springBoot_Thymeleaf_db.vo.MemberVO;

public interface MemberService {

	List<MemberVO> list();
}
