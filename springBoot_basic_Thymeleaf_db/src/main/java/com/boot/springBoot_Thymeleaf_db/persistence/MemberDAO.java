package com.boot.springBoot_Thymeleaf_db.persistence;

import java.util.List;

import com.boot.springBoot_Thymeleaf_db.vo.MemberVO;

public interface MemberDAO {
	
	public List<MemberVO> list();
	
}
