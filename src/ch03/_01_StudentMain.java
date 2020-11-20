package ch03;

public class _01_StudentMain {
	public static void main(String[] args) {
	/*
	 *  인스턴스 생성 : 클래스명 참조변수명 = new 클래스명();	// new 생성자;
	 *  		  접근: 참조변수명.멤버변수
	 *  				 참조변수명.멤버메서드;
	 *  - 참조변수명에는 생성한 인스턴스의 힙메모리공간 주소값이 들어있다. 스택메모리에 생성
	 *  	앞의 클래스명은 데이터타입이고, 참조변수로 접근할 때 사용한다.
	 *  	뒤의 클래스명은 힙메모리에 인스턴스 생성시 사용되는 생성자이다.
	 */
		
	//	인스턴스 생성	
		_01_StudentInfo info1 = new _01_StudentInfo(); 
		_01_StudentInfo info2 = new _01_StudentInfo();
	//	변수에 값 할당
	//	참조변수명.멤버변수
		info1.studentID = 100;
		info1.studentName = "최문수";
		info2.studentID = 200;
		info2.studentName = "김태희";
		info2.age = 35;
		info2.email = "kim@naver.com";
	//	출력(메서드 호출)
		info1.printInfo();
		info2.printInfo();
		
	}
}
