package javaPJ_choims_view;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import javaPJ_choims_domain.Furniture;
import javaPJ_choims_domain.Cart;
import javaPJ_choims_domain.Code;
import javaPJ_choims_service.GuestImpl;
import javaPJ_choims_service.HostImpl;
import javaPJ_choims_service.Host;
 

public class MenuImpl implements Menu, Code {  //코드도 임플해서 if 체크하는데 상수를 써라 상수가 호스트 메뉴일때 호스트메뉴 호출하라
	
	HashMap<String,Integer> idHashMap = new HashMap<String,Integer>();
	Scanner sc = new Scanner(System.in);
	private static MenuImpl instance = new MenuImpl();
	String ID;
	int PW;
	int choice;
	
	@Override
	public void loginMenu() {
		while(true) {
			System.out.println("─────────────로그인────────────");
			System.out.println("  1.고객      2.관리자     3.회원가입    4.종료");
			System.out.println("─────────────────────────────");
			while(true) {
				try {
					System.out.print("메뉴 번호를 입력하세요. : ");
					choice = sc.nextInt();
					if(choice <1 || choice>4) {
						while(choice<1 || choice >4) {
							System.out.print("1~4까지의 번호를 입력해주세요 : ");
							choice = sc.nextInt();
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			switch(choice*100) {
			case Code.HOST_MENU: 
				do {
					System.out.print(" 고객 ID : ");
					ID = sc.next();
					if(idHashMap.containsKey(ID)) {
						while(true) {
							try {
								System.out.println(" 고객 PW : ");
								PW = sc.nextInt();
								break;
							}catch(Exception e) {
								sc = new Scanner(System.in);
								System.out.println("숫자로 입력해주세요");
							}
						}
						if(PW == idHashMap.get(ID)) {
							System.out.println("============================================");
							System.out.println("                 로그인 되었습니다.");
							System.out.println("============================================");
							guestMenu();
							break;
						}else System.out.println("비밀번호가 잘못되었습니다");
					}else System.out.println("아이디가 잘못됬습니다.");
				}while(true);
				break;
			case Code.GUEST_MENU:
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
							break;
						}else System.out.println("비밀번호가 잘못되었습니다");
					}else System.out.println("아이디가 잘못됬습니다.");
				}while(true);
				break;
			case 300: 
				System.out.println("============================================");
				System.out.println("                 회원가입");
				System.out.println("============================================");
				System.out.print(" 고객 ID : ");
				ID = sc.next();
				while(true) {
					try {
						System.out.print(" 고객 PW : ");
						PW = sc.nextInt();
						break;
					}catch(Exception e) {
						sc = new Scanner(System.in);
						System.out.println("숫자로 입력해주세요");
					}
				}
				idHashMap.put(ID, PW);
				System.out.println("============================================");
				System.out.println("                 회원가입완료");
				System.out.println("============================================");
				break;
			case 400: System.out.println("실행종료");
						 break;
			}
			if(choice*100 == 400) {
				break;
			}
		}
	}

	@Override
	public void hostMenu() {
		while(true) {
			System.out.println("────────────관리자메뉴─────────");
			System.out.println("  1.재고관리      2.주문관리     3.로그아웃 ");
			System.out.println("──────────────────────────");
			while(true) {
				try {
					System.out.print("메뉴 번호를 입력하세요. : ");
					choice = sc.nextInt();
					if(choice <1 || choice>3) {
						while(choice<1 || choice >3) {
							System.out.print("1~3까지의 번호를 입력해주세요 : ");
							choice = sc.nextInt();
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			switch((choice*10)+100) {
			case Code.HOST_STOCK_MENU: hostStockMenu();
						 break;
			case Code.HOST_ORDER_MENU: hostOrderMenu();
					     break;
			case 130: 
				System.out.println("로그아웃되었습니다");
				break;
			}
			if((choice*10)+100 == 130) {
				break;
			}
		}
	}

	@Override
	public void hostStockMenu() {
		while(true) {
			System.out.println("────────────재고관리────────────");
			System.out.println("  1.목록   2.추가   3.수정    4.삭제    5.이전   ");
			System.out.println("─────────────────────────────");
			while(true) {
				try {
					System.out.print("메뉴 번호를 입력하세요. : ");
					choice = sc.nextInt();
					if(choice <1 || choice>5) {
						while(choice<1 || choice >5) {
							System.out.print("1~5까지의 번호를 입력해주세요 : ");
							choice = sc.nextInt();
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			switch(choice+110) {
			case Code.HOST_FURNITURE_LIST:
				HostImpl.getInstance().furnitureList();
					break;
			case Code.HOST_FURNITURE_ADD: 
				HostImpl.getInstance().furnitureAdd();
					break;
			case Code.HOST_FURNITURE_UPDATE:
				HostImpl.getInstance().furnitureUpdate();
					break;
			case Code.HOST_FURNITURE_DEL:
				HostImpl.getInstance().furnitureDel();
					break;
			case 115: break;
			}//switch
			 if(choice+110 == 115) {
				 break;
			 }
		}//while
	}
	
	@Override
	public void hostOrderMenu() {
		while(true) {
			System.out.println("────────────주문관리────────────");
			System.out.println("  1.목록   2.결제   3.환불    4.결산    5.이전   ");
			System.out.println("─────────────────────────────");
			while(true) {
				try {
					System.out.print("메뉴 번호를 입력하세요. : ");
					choice = sc.nextInt();
					if(choice <1 || choice>5) {
						while(choice<1 || choice >5) {
							System.out.print("1~5까지의 번호를 입력해주세요 : ");
							choice = sc.nextInt();
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			switch(choice+120) {
			case Code.HOST_ORDER_LIST:
				HostImpl.getInstance().orderList();
					break;
			case Code.HOST_ORDER_CONFIRM: 
				HostImpl.getInstance().orderConfirm();
					break;
			case Code.HOST_ORDER_CANCEL:
				HostImpl.getInstance().orderCancel();
					break;
			case Code.HOST_SALE_TOTAL:
				HostImpl.getInstance().saleTotal();
					break;
			case 125: break;
			}//switch
			if(choice+120 == 125) {
				break;
			}
		}//while
	}

	@Override
	public void guestMenu() {
		while(true) {
			System.out.println("─────────────고객메뉴────────────");
			System.out.println("  1.장바구니      2.구매     3.환불    4.로그아웃");
			System.out.println("─────────────────────────────");
			while(true) {
				try {
					System.out.print("메뉴 번호를 입력하세요. : ");
					choice = sc.nextInt();
					if(choice <1 || choice>4) {
						while(choice<1 || choice >4) {
							System.out.print("1~4까지의 번호를 입력해주세요 : ");
							choice = sc.nextInt();
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			switch((choice*10)+210) {
			case Code.GUEST_CART_LIST: 
					GuestImpl.getInstance().cartList();
					guestCartMenu();
					break;
			case Code.GUEST_MONEY:
					GuestImpl.getInstance().nowBuy();
					break;
			case Code.GUEST_REFUND:
					GuestImpl.getInstance().refund();
					break;
			case 250:
					System.out.println("로그아웃 되었습니다.");
					break;
			}
			if((choice*10)+210 == 250) {
				break;
			}
		}
	}

	@Override
	public void guestCartMenu() {
		while(true) {
			GuestImpl.getInstance().cartList();
			System.out.println("─────────────장바구니────────────");
			System.out.println("  1.추가      2.삭제     3.구매    4.이전");
			System.out.println("─────────────────────────────");
			while(true) {
				try {
					System.out.print("메뉴 번호를 입력하세요. : ");
					choice = sc.nextInt();
					if(choice <1 || choice>4) {
						while(choice<1 || choice >4) {
							System.out.print("1~4까지의 번호를 입력해주세요 : ");
							choice = sc.nextInt();
						}
					}
					break;
				}catch(Exception e) {
					sc = new Scanner(System.in);
					System.out.println("숫자로 입력해주세요");
				}
			}
			switch(choice+220) {
			case Code.GUEST_CART_ADD:
				HostImpl.getInstance().furnitureList();
				GuestImpl.getInstance().cartAdd();
				break;
			case Code.GUEST_CART_DEL:
				GuestImpl.getInstance().cartDel();
				break;   
			case Code.GUEST_CART_BUY:
				GuestImpl.getInstance().cartBuy();
				break;
			case 224: break;
			}
			if(choice+220 == 224) {
				break;
			}
		}
	}
	
	
	public static MenuImpl getInstance() {
		return instance;
	}
}



