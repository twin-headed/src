package ch03;

public class _02_MemberMain {
	// static이 붙으면 바로 힙메모리에 올라가기에 객체 생성하지 않고 바로 메소드 사용가능
	// main() 함수는 자바가상머신(JVM)이 프로그램을 시작하기 위해 호출하는 함수
	// main함수는 클래스 내부에 만들지만, 클래스의 메소드는 아니다.
	public static void main(String[] args) {
		
	_02_MemberInfo info = new _02_MemberInfo();
	_02_MemberInfo info2 = new _02_MemberInfo();	
		// info.birthDay = "1992년 6월 17일";
		info.setBirthDay("19920617");
		//1 값의 전달
		
		//	info.name = "최문수";
		info.setName("최문수");
		//	info.address = "동작구";
		info.setAddress("동작구");
//		info.age = 29;
		info.setAge(29);
		
		
		info.showInfo();
		info2.showInfo();
	
	}
}
