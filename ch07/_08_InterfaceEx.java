package ch07;

public class _08_InterfaceEx {
	public static void main(String[] args) {
		M1 m1 = new M1();
		m1.methodM1(new M2());
		
	}
}

class M1 {
	public void methodM1(M2 m2) {
		System.out.println("M1클래스 - methodM1()");
		
	}
}

class M2 {
	public void methodM2(M3 m3) {
		System.out.println("M2클래스 - methodM2()");
		
	}
}
	
class M3 {
	public void methodM3() {
		System.out.println("M3클래스 - methodM3()");
	}
}
