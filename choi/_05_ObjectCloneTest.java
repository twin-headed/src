package choi;

public class _05_ObjectCloneTest {
	public static void main(String[] args) throws CloneNotSupportedException {
		
		_05_Circle circle = new _05_Circle(10, 20, 30);
		_05_Circle copyCircle = (_05_Circle)circle.clone();
		
		System.out.println(circle);
		System.out.println(copyCircle);
		System.out.println(System.identityHashCode(circle));
		System.out.println(System.identityHashCode(copyCircle));
		
	}
}
