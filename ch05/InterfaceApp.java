package ch05;

interface Calculable{
	double PI = 3.14;
	int sum(int v1, int v2);
}

interface Printable{			//인터페이스의 이름은 대문자 그리고 형용사로 이루어진다.
	void print();					//메소드를 인터페이스에 정의할때는 내용이 들어가지않는다. 단 변수는 내용이 들어가야한다.
}

class RealCal implements Calculable, Printable{	// 하나의 클래스는 여러개의 인터페이스를 구현할수있다.
	public int sum(int v1, int v2) {
		return v1+v2;
	}
	public void print() {
		System.out.println("This is RealCal!!");
	}
}

class AdvancedPrint implements Printable{	
	public void print() {
		System.out.println("This is RealCal!!");
	}
}


class DummyCal implements Calculable{
		public int sum(int v1, int v2){
			return 3;
		}
}

public class InterfaceApp {
	public static void main(String[] args) {		// new 다음에 오는 클래스의 종류를 인터페이스를 통해 지정하면 똑같은 인터페이스를 구현하는 클래스라면 어떤것이든 호환가능하다!
		Printable c = new AdvancedPrint();			// 다형성 자료형은 클래스를 지정할수도 클래스가 구현하고있는 인터페이스를 지정할수도 있다.
		System.out.println(c.sum(2, 1));
		c.print();
		System.out.println(c.PI);
	}
}
