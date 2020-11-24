package ch04;

public class _09_Bus {
	
	private static int passangerCount;
	private static int money;
	private int busNumber;
	
	public _09_Bus (int busNumber) {
		this.busNumber = busNumber;
	}
	
	
	public void takeBus(_09_Student student) {
		student.setMoney(student.getMoney()-1000);
		money += 1000;
		passangerCount++;
	}
	
	public void showInfo() {
		System.out.println("버스번호 : "+busNumber);
		System.out.println("총 승객수 : "+passangerCount);
		System.out.println("버스비 집계 : "+money);
	}
	
}
