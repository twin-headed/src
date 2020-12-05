package javaPJ_choims_domain;

public interface Code {
	// 상수
	static final int SHOP_LOGIN = 999;	//	로그인
	
	// 관리자
	static final int HOST_MENU = 100;	// 관리자
	
	// 관리자 - 재고관리
	static final int HOST_STOCK_MENU = 110;		// 재고관리
	static final int HOST_FURNITURE_LIST = 111;			// 책목록
	static final int HOST_FURNITURE_ADD = 112;			// 책추가
	static final int HOST_FURNITURE_UPDATE = 113;		// 책수정
	static final int HOST_FURNITURE_DEL = 114;			// 책삭제

	// 관리자 - 주문관리
	static final int HOST_ORDER_MENU = 120;		// 주문관리
	static final int HOST_ORDER_LIST = 121;		// 주문목록
	
	// 관리자 - 결제기능
	static final int HOST_ORDER_CONFIRM = 122;	// 결제승인
	static final int HOST_ORDER_CANCEL = 123;	// 결제취소
	
	// 관리자 - 결산
	static final int HOST_SALE_TOTAL = 130;		// 결산
	
	// ---------------------------------------------------
	
	// 고객
	static final int GUEST_MENU = 200;					// 관리자
	// 고객 - 상품목록
	static final int GUEST_GOODS = 210;				// 상품리스트
	
	static final int GUEST_CART_LIST = 220;			// 장바구니 리스트
	static final int GUEST_CART_ADD = 221;			// 장바구니 담기
	static final int GUEST_CART_DEL = 222;			// 장바구니 삭제
	static final int GUEST_CART_BUY = 223;			// 장바구니 구매
	
	// 손님 - 바로구매
	static final int GUEST_MONEY = 230;				// 바로구매
	
	static final int GUEST_REFUND =  240;				//환불
	
}
