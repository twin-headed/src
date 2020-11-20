package ch06;

public class WooriBank extends _11_Bank {
	
	private String vipMember;		

	public WooriBank() {
		this.vipMember = "vip";
	}
	
	public WooriBank(String bankName, String account, int deposit, int withdraw, int balance, int rate, String vipMember) {
		super(bankName, account, deposit, withdraw, balance, rate);
		this.vipMember = vipMember;
	}
	
	public void setVipMember(String vipMember) {
		this.vipMember = vipMember;
	}
	public String getVipMember() {
		return vipMember;
	}
	
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println(vipMember);
	}

}
	