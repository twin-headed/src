package ch06;

public class _07_Main {
		//		다형성
	public static void main(String[] args) {
			// 		자식클래스 참조변수 = new 자식클래스();
		
			/*
			 * 다형성 : 상속이 전제조건이다.
			 * 									하나의 참조변수(부모)로부터 여러타입의 객체(자식)을 참조할 수 있는것.	
			 * 									즉 부모타입의 참조변수로 자식타입의 객체를 다룰수 있는것이 다형성
			 * 									매개변수에 다형성을 적용
			 * 
			 * -문법 : 부모클래스 참조변수 = new 자식클래스();
			 * 											큰 타입			= 			작은 타입
			 * 
			 * 									부모타입의 갯수가 자식타입의 갯수보다 적으므로 왼쪽에 부모타입이 와야한다
			 * 									다형성을 적용했을지라도 오버라이딩시 자식메서드가 호출된다.
			 * 									(@Override		어노테이션을 생략해도 마찬가지다.)
			 * 
			 * -부모 참조변수로 접근시, 부모타입 클래스의 멤버가 힙메모리에 생성된 객체에 존재해야 한다.
			 * 				만약 존재하지 않으면 에러가 발생(예. readBook() )
			 * 				따라서 자식객체에 접근하기 위해서 다운캐스팅(다운형변환)한다.
			 * 				상위클래스로는 묵시적으로 형변환이 되지만, 하위클래스로 형변환 할 때는 명시적으로 형변환한다.
			 * 				즉 상위클래스로 형 변환되었던 하위클래스를 다시 원래 자료형으로 형변환 하는것을 다운캐스팅이라고 한다.
			 * 
			 * -가상에서도 원리에 따라 move() 메서드(오버라이딩메소드)는 힙메모리에 존재하는 +실제 인스턴스의 메서드이다.
			 * 					오버라이딩시 자식메서드가 호출된다
			 * -장점 : 모든 클래스를 부모 자료형 하나로 쉽게 관리한다.		코드가 간결해진다.
			 * 									특히 매개변수를 부모 자료형 하나로 관리하면 코드가 간결해진다.
			 * 									상위 클래스에서 공통부분의 메서드를 제공하고 , 하위클래스에서 추가메서드를 구현하면 코드양도 줄어들고 유지보수도 간편하다.
			 * 
			 * -if(부모참조변수 instanceof 자식클래스) {
			 * 						자식클래스 참조변수 = (자식클래스) 부모 참조변수;
			 * }
			 * 
			 * Animal hAnimal = new Human();
			 * if(hAnimal instanceof Human) {
			 * 				Human human = (Human)hAnimal;
			 * 				human.readbook();
			 * - 다운캐스팅 : 작은타입 = (작은타입)큰타입; 	// 부모가 큰 타입 , 자식이 작은 타입
			 */
		

			_07_Animal tiger = new _07_Tiger();
			tiger.move();
			if(tiger instanceof _07_Tiger) {
				_07_Tiger tiger2 = (_07_Tiger) tiger;
				tiger2.hunting();
			}
			((_07_Tiger) tiger).hunting();
			
			_07_Animal eagle = new _07_Eagle();
			eagle.move();
			if(eagle instanceof _07_Eagle) {
				_07_Eagle eagle2 = (_07_Eagle) eagle;
				eagle2.fly();
			}
			((_07_Eagle)eagle).fly();
			System.out.println("================");
			
			_07_Main main = new _07_Main();
			main.animal_move(new _07_Eagle());
		}
	
		public void animal_move(_07_Animal animal) {
					animal.move();
		}
	
		
			
			
		
}
