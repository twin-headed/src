package ch06;

public class ShinhanBank extends _11_Bank {
	
	private String event;		

	public ShinhanBank() {
		this.event = "금리인하";
	}
	
	public ShinhanBank(String bankName, String account, int deposit, int withdraw, int balance, int rate, String event) {
		super(bankName, account, deposit, withdraw, balance, rate);
		this.event = event;
	}

	public void setEvent(String event) {
		this.event = event;
	}
	public String getEvent() {
		return event;
	}
	
	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println(event);
	}

}
	