package ch08;

public class _05_ObjectCloneTest {
	public static void main(String[] args) throws CloneNotSupportedException {
		
		_05_Circle circle = new _05_Circle(10, 20, 30);
		_05_Circle copyCircle = (_05_Circle)circle.clone();		// 복제 메서드로 반환형이 Object
		
		
		System.out.println(circle);		// circle.toString()
		System.out.println(copyCircle);	// copyCircle.toString()
		System.out.println(System.identityHashCode(circle));		// 실제 주소 출력
		System.out.println(System.identityHashCode(copyCircle));		// 실제 주소 출력
		
		/*
		 * 원점은 x = 10 y = 20이고,반지름은30입니다.
			원점은 x = 10 y = 20이고,반지름은30입니다.
			366712642
			1829164700
		 * 
		 * 
		 */
		
	}
}
