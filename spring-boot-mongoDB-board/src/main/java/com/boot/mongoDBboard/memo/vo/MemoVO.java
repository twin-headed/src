package com.boot.mongoDBboard.memo.vo;

import java.util.Date;

public class MemoVO {
	
	// 몽고DB는 비정형데이터이므로 미리 테이블을 사전에 안만들어도 되고, mogod, mogo 쉘 창에서 유연하게 만들면 된다.
	// 컬럼명과 일치해야 하나, pk는 항상 _id
	private String _id;		// 몽고DB는 pk가 항상 _id
	private String writer; 	// 작성자
	private String memo;	// 메모내용
	private Date post_date;	// 작성일
	
	
	public String get_id() {
		return _id;
	}
	public void set_id(String _id) {
		this._id = _id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
	
	
	
}
