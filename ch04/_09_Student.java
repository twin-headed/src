package ch04;

public class _09_Student {
	
	private int money;
	private String studentName;
	
	public _09_Student(String studentName, int money) {
		this.studentName = studentName;
		this.money = money;
	}
	
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	
	public void showInfo() {
		System.out.println("소지금 : "+money);
		System.out.println("이름 : "+studentName);
	}
	
}
