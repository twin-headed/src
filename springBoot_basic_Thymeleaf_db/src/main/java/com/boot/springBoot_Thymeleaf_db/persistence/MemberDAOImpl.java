package com.boot.springBoot_Thymeleaf_db.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.boot.springBoot_Thymeleaf_db.vo.MemberVO;

public class MemberDAOImpl implements MemberDAO{

	@Inject
	SqlSession sqlSession;	
	
	@Override
	public List<MemberVO> list() {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		return dao.list();
	}
}
