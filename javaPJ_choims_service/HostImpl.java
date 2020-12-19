package javaPJ_choims_service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

import javaPJ_choims_domain.Buy;
import javaPJ_choims_domain.Cart;
import javaPJ_choims_domain.Furniture;
import javaPJ_choims_domain.Refund;
import javaPJ_choims_domain.Stock;
import javaPJ_choims_view.MenuImpl;

public class HostImpl implements Host{
	
	Scanner sc = new Scanner(System.in);
	
	private static HostImpl instance = new HostImpl();
	
	private HostImpl() {}
	
	int sum = 0;
	String fModel;
	String fBrand;
	int fPrice;
	int fCount;
	int goodsNum;
	
	@Override  // 가구리스트
	public void furnitureList() {
		System.out.println("==============가구목록==============");
		System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
		Iterator<Integer> ir = Stock.getStock().keySet().iterator();
		while(ir.hasNext()) {
			int key = ir.next();
			Furniture furniture = Stock.getStock().get(key);
			System.out.println(furniture);
		}
		System.out.println();
	}

	@Override // 가구등록
	public void furnitureAdd() {
		System.out.println("=======가구등록========");
		System.out.print("가구명  : " );
		fModel = sc.next();
		System.out.print("가구 브랜드 : ");
		fBrand = sc.next();
		while(true) {
			try {
				System.out.print(" 가구 가격 : ");
				fPrice = sc.nextInt();
				break;
			}catch(Exception e) {
				sc = new Scanner(System.in);
				System.out.println("숫자로 입력해주세요");
			}
		}
		while(true) {
			try {
				System.out.print(" 가구 수량 : ");
				fCount = sc.nextInt();
				break;
			}catch(Exception e) {
				sc = new Scanner(System.in);
				System.out.println("숫자로 입력해주세요");
			}
		}
		goodsNum = (int)(Math.random()*1000)+1000;
		Stock.getStock().put(goodsNum,new Furniture(fModel,fBrand,fPrice,fCount,goodsNum));
	}

	@Override  // 가구수정
	public void furnitureUpdate() {
		 int fEdit;
		while(true) {
			try {
				System.out.print("수정하려는 가구번호를 입력하세요 [이전0] : ");
				fEdit = sc.nextInt();
				break;
			}catch(Exception e) {
				sc = new Scanner(System.in);
				System.out.println("숫자로 입력해주세요");
			}
		}
		if(fEdit == 0) {
			return;
		}else if(Stock.getStock().containsKey(fEdit)) {
			Stock.getStock().remove(fEdit);
			System.out.println("================가구 수정================");
			System.out.print("가구명  : " );
			fModel = sc.next();
			System.out.print("가구 브랜드 : ");
			fBrand = sc.next();
			while(true) {
				try {
					System.out.print("가구 가격 : ");
					fPrice = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			while(true) {
				try {
					System.out.print("가구 수량 : ");
					fCount = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			Stock.getStock().put(fEdit,new Furniture(fModel,fBrand,fPrice,fCount,fEdit));
			System.out.println("==================가구수정완료==================");
		}
	}

	@Override //가구 삭제
	public void furnitureDel() {
		int fDel;
		while(true) {
			try {
				System.out.print("삭제하려는 가구번호를 입력하세요 [이전0] : ");
				fDel = sc.nextInt();
				break;
			}catch(Exception e) {
				sc = new Scanner(System.in);
				System.out.println("숫자로 입력해주세요");
			}
		}
		if(fDel == 0) {
			return;
		}else if(Stock.getStock().containsKey(fDel)) {
			Stock.getStock().remove(fDel);
		}else {
			System.out.println("삭제하려는 가구가 없습니다.");
			return;
		}
		System.out.println("=============가구 삭제 완료==============");
	}

	@Override  // 주문리스트
	public void orderList() {
		System.out.println("============주문가구목록==============");
		System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
		Iterator<Integer> ir = Buy.getBuy().keySet().iterator();
		while(ir.hasNext()) {
			int key = ir.next();
			Furniture furniture = Buy.getBuy().get(key);
			System.out.println(furniture);
		}
		MenuImpl.getInstance().hostOrderMenu();
	}
	
	@Override  // 구매승인
	public void orderConfirm() {
		int num;
		while(true) {
			try {
				System.out.print("구매 승인 할 번호를 입력해주세요  [이전 0] : ");
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
			sum += Buy.getBuy().get(num).getFurniturePrice() * Buy.getBuy().get(num).getFurnitureCount();
			System.out.println("결제 승인 되었습니다");
		}else {
			System.out.println("잘못된 번호입니다.");
		}
	}

	@Override // 환불승인
	public void orderCancel() {
			int num;
			System.out.println("============환불 요청 목록==============");
			System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
			Iterator<Integer> ir = Refund.getRefund().keySet().iterator();
			while(ir.hasNext()) {
				int key = ir.next();
				Furniture furniture = Refund.getRefund().get(key);
				System.out.println(furniture);
			}
			while(true) {
				try {
					System.out.print("환불 승인할 가구의 번호를 입력하세요 [이전 :0] : ");
					num = sc.nextInt();
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			if(num == 0) {
				return;
			}else if(Refund.getRefund().containsKey(num)) {
				try {
					Furniture clone = (Furniture) Refund.getRefund().get(num).clone();
					Stock.getStock().put(num, clone);
				} catch (CloneNotSupportedException e) {
					e.printStackTrace();
				}
				sum -= Refund.getRefund().get(num).getFurniturePrice()*Refund.getRefund().get(num).getFurnitureCount();
				Refund.getRefund().remove(num);
				Buy.getBuy().remove(num);
				System.out.println("환불 처리 되었습니다.");
			}else {
				System.out.println("잘못된 번호입니다.");
			}
	}

	@Override // 총매출액
	public void saleTotal() {
		System.out.println("결산 : " + sum + "원");
		MenuImpl.getInstance().hostOrderMenu();
	}
	
	public static HostImpl getInstance() {
		return instance;
	}
	
	
}
