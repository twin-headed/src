package javaPJ_choims_view;

import java.util.HashMap;

import java.util.Iterator;
import java.util.Scanner;
import javaPJ_choims_domain.Furniture;
import javaPJ_choims_domain.Cart;
import javaPJ_choims_service.GuestImpl;
import javaPJ_choims_service.HostImpl;
import javaPJ_choims_service.Host;
 

public class MenuImpl implements Menu {  //코드도 임플해서 if 체크하는데 상수를 써라 상수가 호스트 메뉴일때 호스트메뉴 호출하라
	
	HashMap<String,String> idHashMap = new HashMap<String,String>();
	Scanner sc = new Scanner(System.in);
	
	private static MenuImpl instance = new MenuImpl();
	
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
						guestMenu();
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
			System.out.println("로그아웃되었습니다");
			loginMenu();
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
				HostImpl.getInstance().furnitureList();
					break;
			case 2: 
				HostImpl.getInstance().furnitureAdd();
					break;
			case 3:
				HostImpl.getInstance().furnitureUpdate();
					break;
			case 4:
				HostImpl.getInstance().furnitureDel();
					break;
			case 5: hostMenu();
			}//switch
		}//while
	}
	@Override
	public void hostOrderMenu() {
		while(true) {
			System.out.println("────────────주문관리────────────");
			System.out.println("  1.목록   2.승인   3.취소    4.결산    5.이전   ");
			System.out.println("─────────────────────────────");
			System.out.print("메뉴번호를 입력하세요. : ");
			switch(sc.nextInt()) {
			case 1:
				HostImpl.getInstance().orderList();
					break;
			case 2: 
				HostImpl.getInstance().orderConfirm();
					break;
			case 3:
				HostImpl.getInstance().furnitureUpdate();
					break;
			case 4:
				HostImpl.getInstance().saleTotal();
					break;
			case 5: hostMenu();
			}//switch
		}//while
	}

	@Override
	public void guestMenu() {
		System.out.println("─────────────고객메뉴────────────");
		System.out.println("  1.장바구니      2.구매     3.환불    4.로그아웃");
		System.out.println("─────────────────────────────");
		System.out.print("메뉴번호를 입력하세요. : ");
		switch(sc.nextInt()) {
		case 1: 
				GuestImpl.getInstance().cartList();
				guestCartMenu();
				break;
		case 2:
				GuestImpl.getInstance().nowBuy();
				break;
		case 3:
				GuestImpl.getInstance().refund();
				break;
		case 4:
				System.out.println("로그아웃 되었습니다.");
				loginMenu();
				break;
		}
	}

	@Override
	public void guestCartMenu() {
		System.out.println("─────────────장바구니────────────");
		System.out.println("  1.추가      2.삭제     3.구매    4.이전");
		System.out.println("─────────────────────────────");
		System.out.print("메뉴 번호를 입력하세요. : ");
		switch(sc.nextInt()) {
		case 1:
			HostImpl.getInstance().furnitureList();
			GuestImpl.getInstance().cartAdd();
			break;
		case 2:
			GuestImpl.getInstance().cartDel();
			break;   
		case 3:
			GuestImpl.getInstance().cartBuy();
			break;
		case 4:
			guestMenu();
			break;
		}
	}
	
	public static MenuImpl getInstance() {
		return instance;
	}
}



