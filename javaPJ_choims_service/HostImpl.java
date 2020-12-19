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
		System.out.print("수정하려는 가구번호를 입력하세요 [이전0] : ");
		int fEdit = sc.nextInt();
		if(fEdit == 0) {
			return;
		}else if(Stock.getStock().containsKey(fEdit)) {
			Stock.getStock().remove(fEdit);
			System.out.println("================가구 수정================");
			System.out.print("가구명  : " );
			String fModelEdit = sc.next();
			System.out.print("가구 브랜드 : ");
			String fBrandEdit = sc.next();
			System.out.print("가구 가격 : ");
			int fPriceEdit = sc.nextInt();
			System.out.print("가구 수량 : ");
			int fCountEdit = sc.nextInt();
			Stock.getStock().put(fEdit,new Furniture(fModelEdit,fBrandEdit,fPriceEdit,fCountEdit,fEdit));
			System.out.println("==================가구수정완료==================");
		}
	}

	@Override //가구 삭제
	public void furnitureDel() {
		System.out.print("삭제하려는 가구번호를 입력하세요 [이전0] : ");
		int fDel = sc.nextInt();
		if(fDel == 0) {
			return;
		}else if(Stock.getStock().containsKey(fDel)) {
			Stock.getStock().remove(fDel);
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
	

	@Override  // 
	public void orderConfirm() {
		System.out.print("구매 승인 할 번호를 입력해주세요  [이전 0] : ");
		int num = sc.nextInt();
		if(num == 0) {
			MenuImpl.getInstance().hostOrderMenu();
		}else if(Buy.getBuy().containsKey(num)) {
			sum += Buy.getBuy().get(num).getFurniturePrice() * Buy.getBuy().get(num).getFurnitureCount();
			System.out.println("결제 승인 되었습니다");
		}else {
			System.out.println("잘못된 번호입니다.");
			orderConfirm();
		}
	}

	@Override
	public void orderCancel() {
			System.out.println("============환불 요청 목록==============");
			System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
			Iterator<Integer> ir = Refund.getRefund().keySet().iterator();
			while(ir.hasNext()) {
				int key = ir.next();
				Furniture furniture = Refund.getRefund().get(key);
				System.out.println(furniture);
			}
			System.out.print("환불 요청할 가구의 번호를 입력하세요 [이전 :0] : ");
			int num = sc.nextInt();
			if(num == 0) {
				MenuImpl.getInstance().hostOrderMenu();
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
			}
	}

	@Override
	public void saleTotal() {
		System.out.println("결산 : " + sum + "원");
		MenuImpl.getInstance().hostOrderMenu();
	}
	
	public static HostImpl getInstance() {
		return instance;
	}
	
	
}
