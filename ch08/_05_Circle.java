package ch08;

/*
 *	마커인터페이스 : 구현할 메서드가 없는 인터페이스 
 *	예) Cloneable : 객체를 복제할 때 사용하는 인터페이스로서, Cloneable 인터페이스에서 구현할 메서드는 없다.
 *	하지만 clone()을 하지 않으면 복제되지 않는다.
 *	clone()시 implements Cloneable을 하지 않으면 CloneNotSupportedException 예외가 발생한다.
 */

public class _05_Circle implements Cloneable {
	
	_05_Point point;	//	참조변수
	int radius;
	
	public _05_Circle() {}
	
	_05_Circle(int x, int y, int radius) {
		this.radius = radius;
		point = new _05_Point(x, y);
	}
	
	@Override
	public String toString() {
		return "원점은 " + point + "이고," + "반지름은" + radius + "입니다.";
	}
	
	// 복제
	//	CloneNotSuppotedException : 클래스의 clone() 메서드가 지원되지 않았을 경우의 예외클래스
	@Override
	public Object clone() throws CloneNotSupportedException { 	//	상위메서드에게 예외를 떠넘긴다.
		return super.clone();
	}
}
