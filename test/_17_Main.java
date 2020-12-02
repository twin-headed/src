package test;

public class _17_Main {
	public static void main(String[] args) {

		_17_Car car = new _17_AICar();
		_17_Car car2 = new _17_ManualCar();	
	
		System.out.println(_17_Car.CAR_AI);
		car.drive();
		car.stop();
		car.startCar();
		car.turnOff();

		System.out.println(_17_Car.CAR2_MA);
		car2.drive();
		car2.stop();
		car2.startCar();
		car2.turnOff();
	}
}
		