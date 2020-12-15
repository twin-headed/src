package javaPJ_choims_service;

import java.util.HashMap;

import java.util.Iterator;
import java.util.Scanner;

import javaPJ_choims_domain.Refund;
import javaPJ_choims_domain.Buy;
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
		System.out.print("장바구니에 담을 가구의 번호를 입력해 주세요. [이전:0] : ");
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
		System.out.print("삭제하려는 가구번호를 입력하세요 [이전0] : ");
		int fDel = sc.nextInt();
		if(fDel == 0) {
			MenuImpl.getInstance().guestCartMenu();
		}else if(Cart.getCart().containsKey(fDel)) {
			Cart.getCart().remove(fDel);
		}
		System.out.println("목록에서 삭제되었습니다.");
		MenuImpl.getInstance().guestCartMenu();
	}

	@Override
	public void cartBuy() {
		System.out.print("구매할 가구의 번호를 입력하세요 [이전0] : ");
		int fBuy = sc.nextInt();
		if(fBuy == 0) {
			MenuImpl.getInstance().guestCartMenu();
		}
		try {
			Furniture clone = (Furniture) Cart.getCart().get(fBuy).clone();
			Buy.getBuy().put(fBuy, clone);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		Stock.getStock().get(fBuy).setFurnitureCount(Stock.getStock().get(fBuy).getFurnitureCount() - Cart.getCart().get(fBuy).getFurnitureCount());
		Cart.getCart().remove(fBuy);
		System.out.println("구매 요청 되었습니다.");
		cartBuy();
	}

	@Override
	public void nowBuy() {
		HostImpl.getInstance().furnitureList();
		System.out.print("구매할 가구의 번호를 입력하세요 [이전0] : ");
		int num = sc.nextInt();
		if(num == 0) {
			MenuImpl.getInstance().guestMenu();
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
			Buy.getBuy().put(num, clone);
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		Stock.getStock().get(num).setFurnitureCount(Stock.getStock().get(num).getFurnitureCount() - quantity);
		System.out.println("구매 요청 되었습니다.");
		nowBuy();
	}

	@Override
	public void refund() {
		System.out.println("============주문가구목록==============");
		System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
		Iterator<Integer> ir = Buy.getBuy().keySet().iterator();
		while(ir.hasNext()) {
			int key = ir.next();
			Furniture furniture = Buy.getBuy().get(key);
			System.out.println(furniture);
		}
		while(true) {
			System.out.print("환불 요청할 가구의 번호를 입력하세요 [이전 :0] : ");
			int num = sc.nextInt();
			if(num == 0) {
				MenuImpl.getInstance().guestMenu();
			}
			try {
				Furniture clone = (Furniture) Buy.getBuy().get(num).clone();
				Refund.getRefund().put(num, clone);
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
			System.out.println("환불요청되었습니다.");
		}
	}
	
	public static GuestImpl getInstance() {
		return instance;
	}
		// 싱글톤
		// 인터페이스 재정의
		
	
}
