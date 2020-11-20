package ch06;

//자식클래스
public class _06_Tiger extends _06_Animal {
	@Override
	public void move() {
		System.out.println("호랑이가 움직입니다.");
	}
	public void hunting() {
		System.out.println("호랑이가 사냥을 합니다");
	}
}
