package javaPJ_choims_service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import javaPJ_choims_domain.Furniture;
import javaPJ_choims_domain.Stock;

public class HostImpl implements Host{
	
	Scanner sc = new Scanner(System.in);
	
	private static HostImpl instance = new HostImpl();
	
	private HostImpl() {}
	
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
		String fModel = sc.next();
		System.out.print("가구 브랜드 : ");
		String fBrand = sc.next();
		System.out.print("가구 가격 : ");
		int fPrice = sc.nextInt();
		System.out.print("가구 수량 : ");
		int fCount = sc.nextInt();
		int goodsNum = (int)(Math.random()*1000)+1000;
		Stock.getStock().put(goodsNum,new Furniture(fModel,fBrand,fPrice,fCount,goodsNum));
	}

	@Override  // 가구수정
	public void furnitureUpdate() {
		System.out.print("수정하려는 가구번호를 입력하세요 : 이전0");
		int fEdit = sc.nextInt();
		if(Stock.getStock().containsKey(fEdit)) {
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
		System.out.print("삭제하려는 가구번호를 입력하세요");
		int fDel = sc.nextInt();
		if(Stock.getStock().containsKey(fDel)) {
			Stock.getStock().remove(fDel);
		}
		System.out.println("=============가구 삭제 완료==============");
	}

	@Override  // 주문리스트
	public void orderList() {
		
	}

	@Override  // 
	public void orderConfirm() {
		
	}

	@Override
	public void orderCancel() {
		
	}

	@Override
	public void saleTotal() {
		
	}
	
	public static HostImpl getInstance() {
		return instance;
	}
	
	
}
