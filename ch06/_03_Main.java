package ch06;

public class _03_Main {
	public static void main(String[] args) {
		ShinhanBank sb = new ShinhanBank("신한은행","계좌",1,2,3,4,"금리인상");
		sb.printInfo();
		System.out.println("==========");
		WooriBank wb = new WooriBank();
		wb.setVipMember("김태희");
		wb.setBankName("우리은행");
		wb.setAccount("계좌");
		wb.setDeposit(4);
		wb.setWithdraw(3);
		wb.setBalance(2);
		wb.setRate(1);
		
		wb.printInfo();
	}
}
