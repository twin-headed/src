package ch07;

public class _09_InterfaceEx {
	public static void main(String[] args) {
		
		new A09().autoPlay(new B09());
		new A09().autoPlay(new C09());
	}
}

class A09 {
		public void autoPlay(I09 i) {	//매개변수의 다형성..	다형성이 적용된 call by reference이면서
			i.play();	//이슨턴스의 추방에서도 매소드 play() 호출 = 
		}
}

interface I09 {
	public void play();	//추상메서드
}

class C09 implements I09 {
	@Override
	public void play() {
		System.out.println("C09클래스 - play() 호출");
	}
	
}

// I09 인터페이스 구현
class B09 implements I09 {

	@Override
	public void play() {
			System.out.println("B09클래스 -play() 호출");
	}
	
}

