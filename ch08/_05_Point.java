package ch08;

public class _05_Point {
	int x;
	int y;
	
	_05_Point () {} 
	_05_Point(int x, int y) {
		this.x = x;
		this.y = y;
	}
	
	@Override
	public String toString() {
		return "x = " + x + " y = " + y;
	}
	
}
