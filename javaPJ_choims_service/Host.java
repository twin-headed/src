package javaPJ_choims_service;

public interface Host {
	public static final String ID = "host";	 // 관리자 고유 ID 생성
	public static final String PASSWORD = "host";	 // 관리자 고유 PW 생성
	
	// 관리자 - 재고관리
	public void bookList();			// 책목록
	public void bookAdd();			// 책추가
	public void bookUpdate();	// 책수정
	public void bookDel();			// 책삭제
	
	// 관리자 - 주문관리
	public void orderList();			// 주문목록
	public void orderConfirm();	// 결제승인
	public void orderCancel();		// 결제취소
	
	// 관리자 - 결산
	public void saleTotal();		// 결산
	
	
	
}
