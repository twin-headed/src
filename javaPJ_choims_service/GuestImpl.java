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
	
	int num;
	int quantity;
	
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
		while(true) {
			HostImpl.getInstance().furnitureList();
			while(true) {
				try {
					System.out.print("장바구니에 담을 가구의 번호를 입력해 주세요. [이전:0] : ");
					num = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			if(num == 0) {
				return;
			}
			while(true) {
				try {
					System.out.print("수량을 입력해주세요");
					quantity = sc.nextInt();
					while(quantity > Stock.getStock().get(num).getFurnitureCount()) {
						while(true) {
							try {
								System.out.println("표기된 개수 이하의 수량을 입력해주세요 : ");
								quantity = sc.nextInt();
								break;
							}catch(Exception e) {
								sc = new Scanner(System.in);
								System.out.println("숫자로 입력해주세요");
							}
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			try {
				Furniture clone = (Furniture) Stock.getStock().get(num).clone();
				clone.setFurnitureCount(quantity);
				Cart.getCart().put(num, clone);
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
			System.out.println("장바구니에 담겼습니다.");
		}
	}

	@Override
	public void cartDel() {
		while(true) {
			while(true) {
				try {
					System.out.print("삭제하려는 가구번호를 입력하세요 [이전0] : ");
					num = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			if(num == 0) {
				return;
			}else if(Cart.getCart().containsKey(num)) {
				Cart.getCart().remove(num);
				System.out.println("목록에서 삭제되었습니다.");
			}else {
				System.out.println("가구번호가 존재하지 않습니다.");
			}
		}
	}

	@Override
	public void cartBuy() {
		while(true) {
			while(true) {
				try {
					System.out.print("구매할 가구의 번호를 입력하세요 [이전0] : ");
					num = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			if(num == 0) {
				return;
			}
			try {
				Furniture clone = (Furniture) Cart.getCart().get(num).clone();
				Buy.getBuy().put(num, clone);
			} catch (CloneNotSupportedException e) {
				e.printStackTrace();
			}
			Stock.getStock().get(num).setFurnitureCount(Stock.getStock().get(num).getFurnitureCount() - Cart.getCart().get(num).getFurnitureCount());
			Cart.getCart().remove(num);
			System.out.println("구매 요청 되었습니다.");
		}
	}

	@Override
	public void nowBuy() {
		while(true) {
			HostImpl.getInstance().furnitureList();
			while(true) {
				try {
					System.out.print("구매할 가구의 번호를 입력하세요 [이전0] : ");
					num = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			if(num == 0) {
				return;
			}
			while(true) {
				try {
					System.out.print("수량을 입력해주세요");
					quantity = sc.nextInt();
					while(quantity > Stock.getStock().get(num).getFurnitureCount()) {
						while(true) {
							try {
								System.out.println("표기된 개수 이하의 수량을 입력해주세요 : ");
								quantity = sc.nextInt();
								break;
							}catch(Exception e) {
								sc = new Scanner(System.in);
								System.out.println("숫자로 입력해주세요");
							}
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
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
		}
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
			while(true) {
				try {
					System.out.print("환불 요청할 가구의 번호를 입력하세요 [이전 :0] : ");
					num = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			if(num == 0) {
				return;
			}else if(Buy.getBuy().containsKey(num)) {
				try {
					Furniture clone = (Furniture) Buy.getBuy().get(num).clone();
					Refund.getRefund().put(num, clone);
				} catch (CloneNotSupportedException e) {
					e.printStackTrace();
				}
				System.out.println("환불요청되었습니다.");
			}else {
				System.out.println("잘못된 번호입니다.");
				return;
			}
		}
	}
	
	public static GuestImpl getInstance() {
		return instance;
	}
		// 싱글톤
		// 인터페이스 재정의
		
	
}
