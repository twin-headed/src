package ch13;

public class _01_InnerTest {
	
	public static void main(String[] args) {
		_01_OutClass outClass = new _01_OutClass();
		System.out.println("외부 클래스 이용하여 내부 클래스 기능 호출");
		outClass.usingClass();
		
	}
}
