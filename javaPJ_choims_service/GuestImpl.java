package javaPJ_choims_service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

import javaPJ_choims_domain.Cart;
import javaPJ_choims_domain.Furniture;
import javaPJ_choims_domain.Stock;
import javaPJ_choims_view.MenuImpl;

public class GuestImpl implements Guest{
	
	Scanner sc = new Scanner(System.in);
	
	private static GuestImpl instance = new GuestImpl();
	
	private GuestImpl() {}
	
	@Override
	public void cartList() {
		System.out.println("==============가구목록==============");
		System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
		Iterator<Integer> ir = Cart.getCart().keySet().iterator();
		while(ir.hasNext()) {
			int key = ir.next();
			Furniture furniture = Cart.getCart().get(key);
			System.out.println(furniture);
		}
		System.out.println();
	}

	@Override
	public void cartAdd() {
		System.out.print("장바구니에 담을 가구의 번호를 입력해 주세요. [이전:0]");
		int num = sc.nextInt();
		if(num == 0) {
			MenuImpl.getInstance().guestCartMenu();
		}
		System.out.print("수량을 입력해주세요");
		int quantity = sc.nextInt();
		while(quantity > Stock.getStock().get(num).getFurnitureCount()) {
			System.out.println("표기된 개수 이하의 수량을 입력해주세요");
			quantity = sc.nextInt();
		}
		try {
			Furniture clone = (Furniture) Stock.getStock().get(num).clone();
			clone.setFurnitureCount(quantity);
			Cart.getCart().put(num, clone);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		System.out.println("장바구니에 담겼습니다.");
		cartAdd();
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
