package test;

public class _17_ManualCar implements _17_Car {
	
	@Override
	public void drive() {
		System.out.println("차가 움직입니다.");
	}

	@Override
	public void stop() {
		System.out.println("차가 멈춥니다.");
	}
	
	@Override
	public void startCar() {
		System.out.println("차가 시동걸립니다.");
	}
	
	@Override
	public void turnOff() {
		System.out.println("차의 시동이 꺼집니다.");
	}

}