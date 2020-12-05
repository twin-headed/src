package javaPJ_choims_service;

import java.util.HashMap;

public class GuestImpl implements Guest{
	
	private static GuestImpl instance = new GuestImpl();
	
	private GuestImpl() {}
	
	@Override
	public void cartList() {
		
	}

	@Override
	public void cartAdd() {
		
	}

	@Override
	public void cartDel() {
		
	}

	@Override
	public void cartBuy() {
		
	}

	@Override
	public void nowBuy() {
		
	}

	@Override
	public void refund() {
		
	}
	
	public static GuestImpl getInstance() {
		return instance;
	}
		// 싱글톤
		// 인터페이스 재정의
		
	
}
