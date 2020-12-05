package javaPJ_choims_service;

public interface Guest {
	
	// 손님 - 장바구니
	public void cartList();	// 장바구니 리스트
	public void cartAdd(); 	// 장바구니 담기
	public void cartDel();	// 장바구니 삭제
	public void cartBuy();	// 장바구니 구매
	
	// 손님 - 바로구매
	public void nowBuy(); 	// 바로구매
	
	// 손님 - 환불
	public void refund();	// 환불
	
}
