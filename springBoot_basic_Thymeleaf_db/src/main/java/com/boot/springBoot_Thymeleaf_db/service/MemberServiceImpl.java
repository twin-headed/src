package com.boot.springBoot_Thymeleaf_db.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.boot.springBoot_Thymeleaf_db.persistence.MemberDAO;
import com.boot.springBoot_Thymeleaf_db.persistence.MemberDAOImpl;
import com.boot.springBoot_Thymeleaf_db.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO dao;
	
	@Override
	public List<MemberVO> list() {
		return dao.list();
	}
}
