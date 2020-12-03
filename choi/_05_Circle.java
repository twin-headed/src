package choi;

public class _05_Circle implements Cloneable{

	_05_Point point;		// 참조변수
	int radius;
	
	public _05_Circle() {}
	
	public _05_Circle(int x, int y, int radius) {
		this.radius = radius;
		point = new _05_Point(x, y);
	}
	
	@Override
	public String toString() {
		return "원점은 "+ point + "이고, 반지름은 " + radius + " 입니다 ";
	}
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
	
}
