package javaPJ_choims_view;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

import javaPJ_choims_domain.Furniture;
import javaPJ_choims_service.GuestImpl;
import javaPJ_choims_service.Host;

public class MenuImpl implements Menu {  //코드도 임플해서 if 체크하는데 상수를 써라 상수가 호스트 메뉴일때 호스트메뉴 호출하라
	
	HashMap<String,String> idHashMap = new HashMap<String,String>();
	FurnitureHashMap fh = new FurnitureHashMap();
	
	Scanner sc = new Scanner(System.in);
	GuestImpl guest;
	
	@Override
	public void loginMenu() {
		System.out.println("─────────────로그인────────────");
		System.out.println("  1.고객      2.관리자     3.회원가입    4.종료");
		System.out.println("─────────────────────────────");
		System.out.print("메뉴번호를 입력하세요. : ");
		switch(sc.nextInt()) {
		case 1: 
			do {
				System.out.print(" 고객 ID : ");
				String ID = sc.next();
				if(idHashMap.containsKey(ID)) {
					System.out.println(" 고객 PW : ");
					String PW = sc.next();
					if(PW.equals(idHashMap.get(ID))) {
						System.out.println("============================================");
						System.out.println("                 로그인 되었습니다.");
						System.out.println("============================================");
						System.out.println("─────────────고객메뉴────────────");
						System.out.println("  1.장바구니      2.구매     3.환불    4.로그아웃");
						System.out.println("─────────────────────────────");
						switch(sc.nextInt()) {
						case 1: guestCartMenu();
							
							
						}
					}else System.out.println("비밀번호가 잘못되었습니다");
				}else System.out.println("아이디가 잘못됬습니다.");
			}while(true);		
		case 2:
			do {
				System.out.print(" 관리자 ID : ");
				String ID = sc.next();
				if(ID.equals(Host.ID)) {
					System.out.println(" 관리자 PW : ");
					String PW = sc.next();
					if(PW.equals(Host.PASSWORD)) {
						System.out.println("============================================");
						System.out.println("                 로그인 되었습니다.");
						System.out.println("============================================");
						hostMenu();
					}else System.out.println("비밀번호가 잘못되었습니다");
				}else System.out.println("아이디가 잘못됬습니다.");
			}while(true);	
		case 3: 
			System.out.println("============================================");
			System.out.println("                 회원가입");
			System.out.println("============================================");
			System.out.print(" 고객 ID : ");
			String newID = sc.next();
			System.out.print(" 고객 PW : ");
			String newPW = sc.next();
			idHashMap.put(newID, newPW);
			guest = GuestImpl.getInstance();
			System.out.println("============================================");
			System.out.println("                 회원가입완료");
			System.out.println("============================================");
			loginMenu();
		case 4: System.out.println("실행종료");break;
		}
	}

	@Override
	public void hostMenu() {
		System.out.println("────────────관리자메뉴─────────");
		System.out.println("  1.재고관리      2.주문관리     3.로그아웃 ");
		System.out.println("──────────────────────────");
		System.out.print("메뉴번호를 입력하세요. : ");
		switch(sc.nextInt()) {
		case 1: hostStockMenu();
		case 2: hostOrderMenu();
		case 3: 
		}
	}

	@Override
	public void hostStockMenu() {
		while(true) {
			System.out.println("────────────재고관리────────────");
			System.out.println("  1.목록   2.추가   3.수정    4.삭제    5.이전   ");
			System.out.println("─────────────────────────────");
			System.out.print("메뉴번호를 입력하세요. : ");
			switch(sc.nextInt()) {
			case 1:
				System.out.println("==============가구목록==============");
				System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
				fh.showAllFurniture();
				break;
			case 2: 
				System.out.println("=======가구등록======== 이전 0");
					
					System.out.print("가구명  : " );
					String fModel = sc.next();
					if(fModel.equals("0")) {
						hostStockMenu();
					}
					System.out.print("가구 브랜드 : ");
					String fBrand = sc.next();
					System.out.print("가구 가격 : ");
					int fPrice = sc.nextInt();
					System.out.print("가구 수량 : ");
					int fCount = sc.nextInt();
					int goodsNum = (int)(Math.random()*1000)+1000;
					fh.addFurniture(goodsNum, new Furniture(fModel,fBrand,fPrice,fCount,goodsNum));
					System.out.println("=======" + goodsNum + "번 가구가 등록되었습니다=====");
					break;
			case 3:
				System.out.print("수정하려는 가구번호를 입력하세요 : 이전0");
					int fEdit = sc.nextInt();
					if(fEdit == 0) {
						hostStockMenu();
					}
					if(fh.getfHashMap().containsKey(fEdit)) {
						fh.removeFurniture(fEdit);
						System.out.println("================가구 수정================");
						System.out.print("가구명  : " );
						String fModelEdit = sc.next();
						System.out.print("가구 브랜드 : ");
						String fBrandEdit = sc.next();
						System.out.print("가구 가격 : ");
						int fPriceEdit = sc.nextInt();
						System.out.print("가구 수량 : ");
						int fCountEdit = sc.nextInt();
						fh.addFurniture(fEdit,new Furniture(fModelEdit,fBrandEdit,fPriceEdit,fCountEdit,fEdit));
						System.out.println("==================가구수정완료==================");
						break;
					}	
			case 4:
					System.out.print("삭제하려는 가구번호를 입력하세요 : 이전 0");
					int fDel = sc.nextInt();
					if(fDel == 0) {
						hostStockMenu();
					}
					if(fh.getfHashMap().containsKey(fDel)) {
						fh.removeFurniture(fDel);
					}
					System.out.println("=============가구 삭제 완료==============");
					break;
			case 5: hostMenu();
			}//switch
		}//while
	}
	@Override
	public void hostOrderMenu() {
		
	}

	@Override
	public void guestMenu() {
		
	}

	@Override
	public void guestCartMenu() {
		System.out.println("─────────────장바구니────────────");
		System.out.println("  1.추가      2.삭제     3.구매    4.이전");
		System.out.println("─────────────────────────────");
		switch(sc.nextInt()) {
		case 1:
			System.out.println("==============가구목록==============");
			System.out.println("번호        가구명       가구브랜드      가구가격         가구수량	");
			fh.showAllFurniture();
			System.out.println("장바구니에 담을 가구 번호를 입력하세요");
			
			
		}
	}
}

class FurnitureHashMap {
	private HashMap<Integer,Furniture> fHashMap;
	
	public HashMap<Integer, Furniture> getfHashMap() {
		return fHashMap;
	}
	
	public FurnitureHashMap() {
		fHashMap = new HashMap<Integer, Furniture>();
	}
	
	public void addFurniture(int goodsNum,Furniture furniture) {
		fHashMap.put(goodsNum, furniture);
	}
	
	public boolean removeFurniture(int goodsNum) {
		fHashMap.remove(goodsNum);
		return true;
	}
	
	public void showAllFurniture() {
		Iterator<Integer> ir = fHashMap.keySet().iterator();
		while(ir.hasNext()) {
			int key = ir.next();
			Furniture furniture = fHashMap.get(key);
			System.out.println(furniture);
		}
		System.out.println();
	}
}


