package ch03;

public class _02_MemberInfo {

	// 멤버변수
	// private를 붙이는걸 캡슐화라고 한다.
	//3 setter로 전달받은 값을 멤버변수에 저장
	private String birthDay;
	private String name;
	private int age;
	private String address;
	
	
	// setter
	//2 매개변수값을 멤버변수로 전달
	public void setBirthDay(String birthDay) { // 매개변수,로컬변수
		this.birthDay = birthDay; //this의 의미는 현재 클래스의 멤버요소
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	
	
	// getter
	
	// 멤버메서드
	
	//4 멤버변수의 값 출력
	public void showInfo() {
		System.out.println(this.birthDay);
		System.out.println(name);
		System.out.println(age);
		System.out.println(address);
	}
	
}
