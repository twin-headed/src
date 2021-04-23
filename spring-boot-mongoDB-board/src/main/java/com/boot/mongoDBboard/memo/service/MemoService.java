package com.boot.mongoDBboard.memo.service;

import java.util.List;

import com.boot.mongoDBboard.memo.vo.MemoVO;

public interface MemoService {

	List<MemoVO> getMemoList();			// 메모 목록
	void memoInsert(MemoVO vo);			// 메모 저장
	MemoVO getMemoDetail(String _id);	// 메모 상세조회
	void memoUpdate(MemoVO vo);			// 메모 수정
	void memoDelete(String _id);		// 메모 삭제
	
}
