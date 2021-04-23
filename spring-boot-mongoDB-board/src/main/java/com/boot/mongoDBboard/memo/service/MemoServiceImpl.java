package com.boot.mongoDBboard.memo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.mongoDBboard.memo.dao.MemoDAO;
import com.boot.mongoDBboard.memo.vo.MemoVO;

@Service
public class MemoServiceImpl implements MemoService{
	
	
	@Autowired
	private MemoDAO memoDAO;
	
	public MemoDAO getMemoDAO() {
		return memoDAO;
	}
	
	@Override
	public List<MemoVO> getMemoList() {
		return memoDAO.getMemoList();
	}

	@Override
	public void memoInsert(MemoVO vo) {
		memoDAO.memoInsert(vo);
	}

	@Override
	public MemoVO getMemoDetail(String _id) {
		return memoDAO.getMemoDetail(_id);
	}

	@Override
	public void memoUpdate(MemoVO vo) {
		memoDAO.memoUpdate(vo);
	}

	@Override
	public void memoDelete(String _id) {
		memoDAO.memoDelete(_id);
	}

}
