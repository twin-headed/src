package ch04;

public class _09_Main {
	public static void main(String[] args) {
		_09_Student person1 = new _09_Student("me",10000);
		_09_Student person2 = new _09_Student("you",5000);
		_09_Bus bus1234 = new _09_Bus(1234);
		_09_Bus bus4321 = new _09_Bus(4321);
		
		bus1234.takeBus(person1);
		person1.showInfo();
		System.out.println("=====================");
		bus1234.showInfo();
		System.out.println("=====================");
		bus1234.takeBus(person1);
		person1.showInfo();
		System.out.println("=====================");
		bus1234.showInfo();
		System.out.println("=====================");

		
	}
}
