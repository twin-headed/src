package ch06;

public class _11_Bank {

	private String bankName;
	private String account;	
	private int deposit;	
	private int withdraw; 
	private int balance;		
	private int rate;		
		
	public _11_Bank () {}
	
	public _11_Bank (String bankName, String account, int deposit, int withdraw, int balance, int rate) {
		this.bankName = bankName;
		this.account = account;
		this.deposit = deposit;
		this.withdraw = withdraw;
		this.balance = balance;
		this.rate = rate;
	}
	//get set
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankName() {
		return bankName;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	public String getAccount() {
		return account;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getDeposit() {
		return deposit;
	}

	public void setWithdraw(int withdraw) {
		this.withdraw = withdraw;
	}
	public int getWithdraw() {
		return withdraw;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	public int getBalance() {
		return balance;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getRate() {
		return rate;
	}
	
	//출력함수
	public void printInfo() {
		System.out.println(bankName);
		System.out.println(account);
		System.out.println(rate);
		System.out.println(balance);
		System.out.println(withdraw);
		System.out.println(deposit);
	}

}