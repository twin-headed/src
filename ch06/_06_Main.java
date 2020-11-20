package ch06;

public class _06_Main {
			public static void main(String[] args) {
					_06_Main main = new _06_Main();
												//오버로딩
					main.moveAnimal(new _06_Human());
					main.moveAnimal(new _06_Tiger());
					main.moveAnimal(new _06_Eagle());
	}
	public void moveAnimal(_06_Animal animal) {	// _06_Animal animal = new Human();
				animal.move(); 	 	//		사람이 움직입니다. 	// 오버라이드된 메서드를 호출
				if(animal instanceof _06_Tiger) {
					_06_Tiger tiger = (_06_Tiger)animal;
					tiger.hunting();
				}
				if(animal instanceof _06_Eagle) {
					_06_Eagle eagle = (_06_Eagle)animal;
					eagle.fly();
				}
	}
//	public void moveAnimal_tiger(_06_Tiger tiger) {
//				tiger.move(); 		//호랑이가 네발로 뜁니다.
//	}		이런식으로 자식클래스의 멤버를 호출해야할때마다 메서드를 만들필요가 없다.
	
	
				//		자식클래스 참조변수명 = new 자식클래스();
//				_06_Human human = new _06_Human();
//				human.move();		//			오버라이드 메서드이므로 자식 메소드 호출
//				human.readBook();
				
				//
				//		다형성적용 : 부모클래스 참조변수명 = new 자식클래스();
				//		메서드 갯수는 자식이 많으나 타입은 부모타입이 크다.
				//		부모클래스 메서드는 1개(설계도에 1개) = 자식클래스 메서드는 2개(힙메모리에 2개)
//				_06_Animal human2 = new _06_Human();
//				human2.move();
//				human2.readBook();			//자식클래스에만 존재하는 메서드
}