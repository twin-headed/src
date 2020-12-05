package javaPJ_choims_view;

import java.util.HashMap;
import java.util.Scanner;

import javaPJ_choims_service.GuestImpl;
import javaPJ_choims_service.Host;

public class MenuImpl implements Menu{
	
	HashMap<String,String> hashMap = new HashMap<String,String>();
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
				if(hashMap.containsKey(ID)) {
					System.out.println(" 고객 PW : ");
					String PW = sc.next();
					if(PW.equals(hashMap.get(ID))) {
						System.out.println("======================");
						System.out.println("                 로그인 되었습니다.");
						System.out.println("======================");
						System.out.println("─────────────고객메뉴────────────");
						System.out.println("  1.장바구니      2.구매     3.환불    4.로그아웃");
						System.out.println("─────────────────────────────");
					}else System.out.println("비밀번호가 잘못되었습니다");
				}else System.out.println("아이디가 잘못됬습니다.");
			}while(true);		
		case 2:
			do {
				System.out.print(" 관리자 ID : ");
				String ID = sc.next();
				if(ID == Host.ID) {
					System.out.println(" 관리자 PW : ");
					String PW = sc.next();
					if(PW.equals(Host.PASSWORD)) {
						System.out.println("======================");
						System.out.println("                 로그인 되었습니다.");
						System.out.println("======================");
						hostMenu();
					}else System.out.println("비밀번호가 잘못되었습니다");
				}else System.out.println("아이디가 잘못됬습니다.");
			}while(true);	
		case 3: 
			System.out.println("======================");
			System.out.println("                 회원가입");
			System.out.println("======================");
			System.out.print(" 고객 ID : ");
			String newID = sc.next();
			System.out.print(" 고객 PW : ");
			String newPW = sc.next();
			hashMap.put(newID, newPW);
			guest = GuestImpl.getInstance();
			System.out.println("======================");
			System.out.println("                 회원가입완료");
			System.out.println("======================");
			
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
		}
	}

	@Override
	public void hostStockMenu() {
		System.out.println("────────────재고관리────────────");
		System.out.println("  1.목록   2.추가   3.수정    4.삭제    5.이전   ");
		System.out.println("─────────────────────────────");
		System.out.print("메뉴번호를 입력하세요. : ");
		switch(sc.nextInt()) {
		case 2: 
			System.out.println("=======가구등록========");
			System.out.print("가구명  : " );
			String furnitureModel = sc.next();
			System.out.print("가구 브랜드 : ");
			String furnitureBrand = sc.next();
			System.out.print("가구 가격 : ");
			int furniturePrice = sc.nextInt();
			System.out.print("가구 수량 : ");
			int furnitureCount = sc.nextInt();
			
		}
		
	}

	@Override
	public void hostOrderMenu() {
		
	}

	@Override
	public void guestMenu() {
		
	}

	@Override
	public void guestCartMenu() {
		
	}
}


