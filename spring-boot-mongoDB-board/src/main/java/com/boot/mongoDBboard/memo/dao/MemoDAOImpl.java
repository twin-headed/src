package com.boot.mongoDBboard.memo.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.boot.mongoDBboard.memo.vo.MemoVO;

@Repository
public class MemoDAOImpl implements MemoDAO{
	
	@Autowired
	private MongoTemplate mongoTemplate;	// 몽고DB를 호출하기 위해 주입받음
	
	static String COLLECTION_NAME = "memo"; // 테이블명
	
	// 메모 목록
	@Override
	public List<MemoVO> getMemoList() {
		
		// import org.springframework.data.mongodb.core.query.Query;
		Query query = new Query();
		
		// 작성날짜 기준 내림차순 정렬
		query.with(new Sort(Sort.DEFAULT_DIRECTION.DESC, "post_date"));
		return mongoTemplate.find(query, MemoVO.class, COLLECTION_NAME);	//find(query, entityClass, collectionName);
	}
	
	// 메모 저장
	@Override
	public void memoInsert(MemoVO vo) {
		
		// 날짜는 화면에서 입력받지 않으므로 setter로 주입
		// import.java.util.Date;
		vo.setPost_date(new Date());
		mongoTemplate.insert(vo, COLLECTION_NAME);
		
	}
	
	// 메모 상세페이지
	// findById() - 1건	|  find() - 리스트
	@Override
	public MemoVO getMemoDetail(String _id) {
		return mongoTemplate.findById(_id, MemoVO.class, COLLECTION_NAME);
	}

	// 메모 수정
	@Override
	public void memoUpdate(MemoVO vo) {
		
		// where 조건절 : _id와 테이블의 id가 같으면 update
		Query query = new Query(new Criteria("_id").is(vo.get_id()));
		
		// 수정
		Update update = new Update();
		update.set("writer", vo.getWriter());	// set(key, value)
		update.set("memo", vo.getMemo());
		update.set("post_date", new Date());	// new Date()는 수정일자
		
		// upsert : update or insert : 없으면 insert, 있으면 update
		mongoTemplate.upsert(query, update, MemoVO.class, COLLECTION_NAME);
		
		
	}
	
	// 메모 삭제
	@Override
	public void memoDelete(String _id) {
		
		// where 조건절
		Query query = new Query(new Criteria("_id").is(_id));
		mongoTemplate.findAllAndRemove(query,  COLLECTION_NAME);
		
	}

}
